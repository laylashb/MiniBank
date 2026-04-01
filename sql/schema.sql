DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS comptes;
DROP TABLE IF EXISTS transactions;



CREATE TABLE clients (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL UNIQUE,
  `ville` varchar(100) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE comptes (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_compte` varchar(20) NOT NULL,
  `solde` decimal(10,2) DEFAULT '0.00',
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_compte` (`numero_compte`),
  KEY `fk_client` (`client_id`),
  CONSTRAINT `fk_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE transactions (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('depot','retrait') NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `compte_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compte` (`compte_id`),
  CONSTRAINT `fk_compte` FOREIGN KEY (`compte_id`) REFERENCES `comptes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;