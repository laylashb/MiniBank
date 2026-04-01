import random
from datetime import datetime, timedelta

# Comptes existants avec leur solde initial (depuis ton data.sql)
comptes = {
    1: 5.20,
    2: 50000.46,
    3: 800000.10,
    4: 100.00
}

transactions = []

# Date de départ des transactions
date_actuelle = datetime(2024, 1, 1)

# Générer 50 transactions
for i in range(50):
    compte_id = random.choice(list(comptes.keys()))
    solde = comptes[compte_id]

    type_transaction = random.choice(['depot', 'retrait'])

    montant = round(random.uniform(10, 500), 2)

    # 🚨 Empêcher solde négatif
    if type_transaction == 'retrait' and montant > solde:
        type_transaction = 'depot'

    # Mise à jour du solde
    if type_transaction == 'depot':
        comptes[compte_id] += montant
    else:
        comptes[compte_id] -= montant

    # pour qu'on 
    date_actuelle += timedelta(days=random.randint(1, 2))

    requete = (                    # la requête SQL

        f"INSERT INTO transactions (type, montant, date, compte_id) VALUES "
        f"('{type_transaction}', {montant}, '{date_actuelle.strftime('%Y-%m-%d %H:%M:%S')}', {compte_id});"
    )

    transactions.append(requete)

# Écriture dans le fichier SQL
with open("../sql/transactions_generated.sql", "w") as f:
    for t in transactions:
        f.write(t + "\n")

print("✅ Fichier transactions_generated.sql généré avec succès !")