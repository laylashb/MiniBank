-- Table clients
CREATE TABLE clients (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    ville VARCHAR(100) DEFAULT NULL,
    date_creation TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY email (email)
);

-- Table comptes
CREATE TABLE comptes (
    id INT NOT NULL AUTO_INCREMENT,
    numero_compte VARCHAR(20) NOT NULL,
    solde DECIMAL(10,2) DEFAULT '0.00',
    client_id INT DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY numero_compte (numero_compte),
    KEY fk_client (client_id),
    CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE CASCADE
);

-- Table transactions
CREATE TABLE transactions (
    id INT NOT NULL AUTO_INCREMENT,
    type ENUM('depot','retrait') NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    compte_id INT DEFAULT NULL,
    PRIMARY KEY (id),
    KEY fk_compte (compte_id),
    CONSTRAINT fk_compte FOREIGN KEY (compte_id) REFERENCES comptes (id) ON DELETE CASCADE
);