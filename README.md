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

> Cours supervisé par : Mr. Touil et Mr. Duterval


## Objectifs

**MiniBank** est une application Full-Stack permettant de :

Gérer des clients, des comptes bancaires et un historique de transactions.

Simuler un environnement bancaire réaliste avec dépôts, retraits et suivi de solde.


## Technologies utilisées

Docker >>> Conteneuriser et lancer l’application en une seule commande

SQL	>>> Concevoir un schéma relationnel propre et écrire des requêtes pertinentes

PHP + CRUD	>>> Implémenter les opérations Create / Read / Update / Delete avec un modèle MCV(Model Controller View)

JavaScript	>>> Améliorer l’UX : validation, confirmation, filtre dynamique

Python	>>> Générer automatiquement un historique de transactions réalistes

Git/GitHub	>>> Travailler en branches, merger et résoudre un conflit


## Prérequis
Docker Desktop
Visual Studio Code


## Installation / Lancement


Avant de débuter, il faut s'assurer d'avoir installé Docker Desktop et Visual Studio Code.

1. Cloner le dépôt en local : dans le terminal (Git Bash) de Visual Studio Code, faire git clone https://github.com/laylashb/MiniBank.git
2. Puis faire cd MiniBank
3. Démarrer l’environnement complet :
-  Toujours dans le terminal, faire docker build .
-  Puis une fois terminé, faire docker compose up -d
4. Ouvrir Docker Desktop, vérifier que le container est bien présent et l'allumer manuellement

5. Il faut désormais initialiser la base de données :
    Dans le terminal, faire :
    - docker exec -i minibank-db mysql -u root -proot minibank < sql/schema.sql
    - docker exec -i minibank-db mysql -u root -proot minibank < sql/data.sql

  Pour vérifier que le schema et la data ont bien été enregistrés dans la base de données, il faut faire toujours dans le terminal :
  - docker exec -it minibank_db mariadb -u root -proot_password
  Une fois dans la base de données, faire toujours dans le terminal :
  - use minibank_db;
  - puis show tables;
  Vous devriez voir s'afficher les tables -> tout est Ok !
    
    ⚠️ A SAVOIR !!
    Il se peut que la commande docker exec -i minibank-db mysql -u root -proot minibank < sql/schema.sql ne permette pas d'insérer toute les tables d'un coup.
    Dans ce cas, il faudra exécuter cette commande pour chaque table en effaçant les 2 autres tables.
    Vous allez donc devoir exécuter cette commande 3 fois, avec 1 TABLE DIFFERENTE UNIQUEMENT à chaque fois.

Bravo ! Votre environnement est maintenant fonctionnel !

                            Explications des commandes :
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






##Liens utilisés

### Git
- https://docs.github.com
- https://skills.github.com


### Docker
liens : 



### Python
liens : 
- https://fr.wikibooks.org/wiki/Programmation_Python/Exemples_de_scripts 
>>>>>>>>pour construire le script

- https://realpython.com/python-random/ 
>>>>>>>>(pour générer de la data aléatoires soit les 50 transactions)
