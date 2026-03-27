-- ========================
-- Clients
-- ========================
INSERT INTO clients (nom, prenom, email, ville) VALUES
('Gentil', 'Petit', 'gentil.petit@gmail.com', 'Paris'),
('Damido', 'Valerie', 'valerie@gmail.com', 'Versailles'),
('Knowles', 'Beyonce', 'Beyonce@hotmail.com', 'Los Angeles');

-- ========================
-- Comptes
-- ========================
INSERT INTO comptes (numero_compte, solde, client_id) VALUES
('FR1234567890', 5.20, 25),      -- Gentil Petit
('FR0987654321', 50000.46, 26),  -- Valerie Damido
('FR987654876321', 5000000.10, 27); -- Beyonce Knowles

-- ========================
-- Transactions
-- ========================
INSERT INTO transactions (type, montant, compte_id) VALUES
('depot', 200.00, 13),
('retrait', 50.00, 14),
('depot', 2000.00, 15);