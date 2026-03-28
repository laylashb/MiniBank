# 1. Imports
import random
from datetime import datetime, timedelta

# 2. Données de base
comptes = [
    {
        "id" : 1,
        "numero_compte" : "FR1234567890",
        "solde" : 5.20
    },
    {
        "id": 2,
        "numero_compte": "FR0987654321",
        "solde": 50000.46
    },
    {
        "id": 3,
        "numero_compte": "FR6885548769",
        "solde": 800000.10
    },
    {
        "id": 4,
        "numero_compte": "FR1122334455",
        "solde": 100.00
    }
]

soldes = {
    c["id"]: c["solde"] for c in comptes
}

# les variables de suivi
dernier_type_par_compte = {}
dates_par_compte = {}

# on créé transactions
transactions = []

nb_transactions = 50

for i in range(nb_transactions):
    compte = random.choice(comptes) # choisir un compte aléatoire
    compte_id = compte["id"]

    # déterminer type (alternance)
    if compte_id not in dernier_type_par_compte:
        type_transaction = random.choice(["depot", "retrait"])
    else:
        dernier = dernier_type_par_compte[compte_id] # compléter logique alternance
        type_transaction = "retrait" if dernier == "depot" else "depot"

    # générer le montant de manière aléatoire
    montant = round(random.uniform(10, 1000), 2)

    # vérification du solde apres transaction (pas négatif)
    if type_transaction == "retrait":
        if soldes[compte_id] < montant:
            type_transaction = "depot"

    # gestion des dates
    if compte_id not in dates_par_compte:
        date_transaction = datetime.now() - timedelta(days=30) # Première transaction pour ce compte → date initiale
    else:
        date_transaction = dates_par_compte[compte_id] + timedelta(minutes=random.randint(30, 180)) # Ajouter un délai aléatoire (1 à 72 heures) après la dernière transaction

    # mettre à jour le solde
    if type_transaction == "depot":
        soldes[compte_id] += montant
    else:
        soldes[compte_id] -= montant

    # sauvegarder l'état du compte
    dernier_type_par_compte[compte_id] = type_transaction
    dates_par_compte[compte_id] = date_transaction

    transactions.append({ # stocker transaction
        "type": type_transaction,
        "montant": montant,
        "compte_id": compte_id,
        "date": date_transaction
    })
    pass

# Génération SQL
lignes_sql = []
for t in transactions: 
    date_str = t["date"].strftime("%Y-%m-%d %H:%M:%S") # formater date correctement

    ligne = f"('{t['type']}', {t['montant']}, {t['compte_id']}, '{date_str}')"
    lignes_sql.append(ligne)


sql_final = "INSERT INTO transactions (type, montant, compte_id, date) VALUES\n"
sql_final += ",\n".join(lignes_sql) + ";"
# boucle pour transformer transactions → SQL

# Écriture fichier
with open("transactions_generated.sql", "w") as f:
    f.write(sql_final)