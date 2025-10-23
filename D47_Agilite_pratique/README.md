# D47 Agilité - Scrum - Cas pratiques

## Votre Job ?

-> Robots pour thune
    -> Input (triggers / controller) : boutons, commande écrite (email / chat) ou vocal, capteurs
    -> Cerveau (programme / model): logique, main.{truc} 
    -> Mémoire (stockage / persistence) : base de données, persistences, se rappeler des actions précédentes
    -> Output (affichage / vue) : comment le robot informe son utilisateur du résultat CLI, Page Web, Json/Csv/Xml, bouton qui clignote, Chat

## Why gestion de projet ?
Cadre / Vision technique / Découper les tâches > concret / Référents / Reporting

### Rapport CHAOS

| Année  |   Succès   |   Challengés  |    Echec    |  Taux de burnout   | 
|--------|------------|---------------|-------------|--------------------|
| 1994   |    16%     |      53%      |     31%     |         --         |
| 2000   |    28%     |      49%      |     23%     |         --         | 
| 2009   |    32%     |      44%      |     24%     |         15%        |
| 2015   |    29%     |      52%      |     19%     |         38%        | 
| 2020   |    31%     |      50%      |     19%     |         44%        |    
| 2024   |    --      |      --       |     --      |         43%        |    

## User stories

En tant que {User}, <--- type ? Utilisateur non authentifié / admin / VIP / x% de fidélité / email ss compte
je peux : cliquer sur {un truc} dans la page {bidule}
afin de :
    - voir un message de confirmation
    - si j'accepte, l'application effectue l'action de : {supprimer / archiver / random process métier}
    - et m'affiche la page {.......} avec un message de confirmation
impact/ROI (delta de KPI):
    - -X€ de conso de token IA
    - -xx ms de lattence
    - +x€ par user
    - nombre de clics gagnés

à produire :
    1/ décrire les US de création d'un mannequin (CRUD) (liste + create)
    2/ cycle de création de shooting : liste shooting / création / sélection produit par taille / commande de pièces
    3/ création d'un ghost à partir des photos produit

### Exercice sur les US :

*Page source :* En tant qu'utilisateur back office authentifié, sur la page de sélection des articles d'un Shooting préalablement créé,
*Trigger :* Je peux filtrer la liste des produits disponibles à la sélection par :
- niveau de stock (tous, avec, sans)
- tous / avec / sans photos
- fournisseurs
- saison
- etc...
*Objectif :* afin de n'afficher que les produits correspondants dans la liste,
*Enjeu business :* et pouvoir constituer plus efficacement une sélection de produits adaptés aux mannequins présents (enjeu de productivité)

*Page source :* En tant qu'utilisateur back office authentifié, sur la page de sélection des articles d'un Shooting préalablement créé,
*Trigger :* Je peux sélectionner un produit par taille 
*Objectif :* afin de l'ajouter à la liste à photographier pour cette session de shooting, cette liste est visible à l'écran dans la colonne de droite de l'interface
*Enjeu business :* avoir une référence unique de la liste des produits à amener au studio pour la session de shoot et pouvoir la partager efficacement (enjeu de productivité)
