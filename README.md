<h1 align="center">
  MiniBank 🏦
</h1>

<p align="center">
  <img width="6912" height="3456" alt="MiniBank" src="https://github.com/user-attachments/assets/11bec4af-211b-4d70-936a-e6cdf2b2d73b" />
</p>

<h2 align="center">
  Bienvenue sur MiniBank !
</h2>

> Application web simulant une petite banque fonctionnelle

> Projet réalisé par : Layla, Sanata, Sandrine

> Dans le cadre de : Prépa Mastère IPSSI

> Cours supervisé par : Mr. Touil


## Objectifs

**MiniBank** est une application Full-Stack permettant de :

Gérer des clients, des comptes bancaires et un historique de transactions.

Simuler un environnement bancaire réaliste avec dépôts, retraits et suivi de solde.


## Technologies utilisées

Docker >>> Conteneuriser et lancer l’application en une seule commande

SQL	>>> Concevoir un schéma relationnel propre et écrire des requêtes pertinentes

PHP + CRUD	>>> Implémenter les opérations Create / Read / Update / Delete

JavaScript	>>> Améliorer l’UX : validation, confirmation, filtre dynamique

Python	>>> Générer automatiquement un historique de transactions réalistes

Git	>>> Travailler en branches, merger et résoudre un conflit


## Prérequis
Docker Compose


## Installation / Lancement


Avant de débuter, il faut s'assurer d'avoir installé Docker Compose.

1. Cloner le dépôt
2. dans le terminal, faire git clone https://github.com/laylashb/MiniBank.git
3. puis cd MiniBank
4. Démarrer l’environnement complet
5. Lancer docker compose up -d


    Cette commande crée et démarre :

le container MySQL (minibank-db)
le container PHP/Apache (minibank-web)

Dans le terminal, pour initialiser la base de données :
  docker exec -i minibank-db mysql -u root -proot minibank < sql/schema.sql
  docker exec -i minibank-db mysql -u root -proot minibank < sql/data.sql

⚠️ Important : si vous réinjectez les données, assurez-vous que les tables ne contiennent pas de doublons ou d’IDs incorrects pour éviter les erreurs de FOREIGN KEYS.


## Utilisation

L’interface web est accessible sur http://localhost:80.

Les opérations possibles :
- Ajouter un client
- Créer un compte pour un client
- Faire des dépôts/retraits (transactions)
- Vous pouvez consulter directement les tables dans MySQL :
      SELECT * FROM clients;
      SELECT * FROM comptes;
      SELECT * FROM transactions;


## Contributions
Forkez le projet et créez votre branche :
  git checkout -b ma-branche

Faites vos modifications, puis commit & push :
  git add .
  git commit -m "Description des modifications"
  git push origin ma-branche



## Structure du projet 

MiniBank/
├─ css/           # Styles CSS
├─ php/           # Pages PHP de l'application
├─ sql/
│  ├─ schema.sql  # Structure des tables
│  └─ data.sql    # Données initiales
├─ docker-compose.yml
└─ README.md






## Liens utilisés

### 
https://learnxinyminutes.com/css/

### Git
- https://docs.github.com
- https://skills.github.com


### Docker


### PHP
- https://www.youtube.com/watch?v=CQF5bf6z0jE


### Python
liens : 
- https://learnxinyminutes.com/python/


- https://fr.wikibooks.org/wiki/Programmation_Python/Exemples_de_scripts 
>>>>>>>>pour construire le script

- https://realpython.com/python-random/ 
>>>>>>>>(pour générer de la data aléatoires soit les 50 transactions)
