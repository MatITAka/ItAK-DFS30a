# Définir quelques variables
PROJECT_DIR="../AD9_Linux_web"
RELEASES_DIR="$PROJECT_DIR/releases"
SHARED_DIR="$PROJECT_DIR/shared"
CURRENT_LINK="$PROJECT_DIR/current"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
NEW_RELEASE_DIR="$RELEASES_DIR/$TIMESTAMP"
KEEP_LAST_X_RELEASES=5

# Fonction pour déployer une nouvelle version
deploy() {
    # Étape 1: Créer la structure des dossiers si elle n'existe pas
    mkdir -p $RELEASES_DIR
    mkdir -p $SHARED_DIR/lib
    touch $SHARED_DIR/mysupersecretproductionconfigfile.yaml

    # Étape 2: Déployer la nouvelle version dans un répertoire daté
    mkdir -p $NEW_RELEASE_DIR

    # Copier les fichiers du projet dans le nouveau dossier de release
    # Remplace /path/to/source par le dossier source de ton projet
    cp -R AD9_Linux_web/* $NEW_RELEASE_DIR/

    # Étape 3: Lier les dossiers/fichiers partagés à la nouvelle version
    ln -s $SHARED_DIR/mysupersecretproductionconfigfile.yaml $NEW_RELEASE_DIR/config.yaml
    ln -s $SHARED_DIR/lib $NEW_RELEASE_DIR/lib

    # Étape 4: Mettre à jour le lien symbolique "current" pour pointer vers la nouvelle version
    if [ -L $CURRENT_LINK ]; then
        rm $CURRENT_LINK
    fi
    ln -s $NEW_RELEASE_DIR $CURRENT_LINK

    # Étape 5: Nettoyage (supprimer les anciennes versions, garder seulement les X dernières)
    cd $RELEASES_DIR
    ls -1t | tail -n +$((KEEP_LAST_X_RELEASES + 1)) | xargs rm -rf

    # Fin du script
    echo "Déploiement terminé. La version actuelle est $TIMESTAMP"
}

# Fonction pour rollback à la version précédente
rollback() {
    if [ ! -L $CURRENT_LINK ]; then
        echo "Aucun lien symbolique 'current' trouvé."
        exit 1
    fi

    CURRENT_RELEASE=$(readlink $CURRENT_LINK)
    PREVIOUS_RELEASE=$(ls -1t $RELEASES_DIR | grep -v $(basename $CURRENT_RELEASE) | head -n 1)

    if [ -z "$PREVIOUS_RELEASE" ]; then
        echo "Aucune version précédente trouvée."
        exit 1
    fi

    rm $CURRENT_LINK
    ln -s $RELEASES_DIR/$PREVIOUS_RELEASE $CURRENT_LINK

    echo "Rollback terminé. La version actuelle est $PREVIOUS_RELEASE"
}

# Analyse des options
while getopts ":k:" opt; do
    case $opt in
        k)
            KEEP_LAST_X_RELEASES=$OPTARG
            ;;
        \?)
            echo "Option invalide: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "L'option -$OPTARG nécessite un argument." >&2
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# Analyse des commandes
case "$1" in
    deploy)
        deploy
        ;;
    rollback)
        rollback
        ;;
    *)
        echo "Usage: $0 {deploy|rollback} [-k keep_last_x_releases]"
        exit 1
        ;;
esac