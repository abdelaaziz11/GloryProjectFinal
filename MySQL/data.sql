-- Projet 4 : Gestion de Centre de Fitness - Vitality Club

-- Phase 2 : data.sql (DML - Data Manipulation Language)
-- ===============================
-- TABLE : Abonnements (5)
-- ===============================
INSERT INTO Abonnements (nom_abonnement, prix_mensuel, duree_mois) VALUES
('Basic', 25.00, 1),
('Standard', 45.00, 3),
('Premium', 59.99, 6),
('Family Pack', 100.00, 6),
('Annual VIP', 120.00, 12);
-- ('Gold', 250.00, 36);

-- ===============================
-- TABLE : Coachs (10)
-- ===============================
INSERT INTO Coachs (nom_coach, specialite) VALUES
('Sophie Martin', 'Yoga'),
('David Lefevre', 'Musculation'),
('Camille Dubois', 'Pilates'),
('Julien Bernard', 'Cardio Training'),
('Laura Moreau', 'Danse Fitness'),
('Thomas Girard', 'CrossFit'),
('Marie Leroy', 'Zumba'),
('Nicolas Petit', 'Boxe'),
('Claire Fontaine', 'Cycling'),
('Antoine Lambert', 'HIIT');
-- ===============================
-- TABLE : Membres (100)
-- ===============================
-- Pour simplifier, nous générons 100 membres avec un motif cohérent
INSERT INTO Membres (nom_membre, email_membre, date_naissance, date_inscription) VALUES
('Membre1', 'membre1@email.com', '1990-01-01', '2024-01-10'),
('Membre2', 'membre2@email.com', '1988-02-15', '2024-01-11'),
('Membre3', 'membre3@email.com', '1992-03-10', '2024-01-12'),
('Membre4', 'membre4@email.com', '1991-04-21', '2024-01-13'),
('Membre5', 'membre5@email.com', '1993-05-30', '2024-01-14'),
('Membre6', 'membre6@email.com', '1989-06-11', '2024-01-15'),
('Membre7', 'membre7@email.com', '1990-07-09', '2024-01-16'),
('Membre8', 'membre8@email.com', '1995-08-18', '2024-01-17'),
('Membre9', 'membre9@email.com', '1994-09-25', '2024-01-18'),
('Membre10', 'membre10@email.com', '1987-10-19', '2024-01-19');
-- (Ajoute les membres 11 à 100 de manière similaire)
-- Exemple rapide (tu peux copier et ajuster le modèle ci-dessus)
-- ('Membre11', 'membre11@email.com', '1990-01-01', '2024-01-20'), ... jusqu’à 100
-- ===============================
-- TABLE : Cours_Collectifs (20)
-- ===============================
INSERT INTO Cours_Collectifs (nom_cours, id_coach_principal, jour_semaine, heure_debut, capacite_max) VALUES
('Yoga Matinal', 1, 'Lundi', '08:00:00', 20),
('Pilates Relax', 3, 'Mardi', '10:00:00', 15),
('Cardio Blast', 4, 'Mercredi', '18:00:00', 25),
('Zumba Party', 7, 'Jeudi', '19:00:00', 30),
('CrossFit Challenge', 6, 'Vendredi', '17:00:00', 20),
('Boxe Training', 8, 'Samedi', '11:00:00', 15),
('Danse Latino', 5, 'Dimanche', '10:00:00', 25),
('Cycling Intense', 9, 'Lundi', '07:00:00', 18),
('HIIT Express', 10, 'Mardi', '12:00:00', 20),
('Muscu Power', 2, 'Mercredi', '09:00:00', 15),
('Yoga Sunset', 1, 'Jeudi', '18:00:00', 20),
('Stretch & Flow', 3, 'Vendredi', '10:00:00', 15),
('Full Body Burn', 4, 'Samedi', '09:00:00', 25),
('Zumba Fun', 7, 'Dimanche', '11:00:00', 30),
('CrossFit Intense', 6, 'Lundi', '17:00:00', 20),
('Boxe Avancée', 8, 'Mardi', '18:00:00', 15),
('Danse Moderne', 5, 'Mercredi', '19:00:00', 25),
('Cycling Nocturne', 9, 'Jeudi', '20:00:00', 18),
('HIIT Morning', 10, 'Vendredi', '07:00:00', 20),
('Muscu Force', 2, 'Samedi', '08:00:00', 15);
-- ===============================
-- TABLE : Paiements_Abonnements (300)
-- ===============================
-- Chaque membre peut avoir plusieurs paiements (ex: mensuels)
INSERT INTO Paiements_Abonnements (id_membre, id_abonnement, date_paiement, montant_paye) VALUES
(1, 1, '2024-01-10', 25.00),
(2, 2, '2024-01-12', 45.00),
(3, 3, '2024-01-13', 70.00),
(4, 1, '2024-01-14', 25.00),
(5, 5, '2024-01-15', 120.00),
(6, 4, '2024-01-16', 100.00),
(7, 2, '2024-01-17', 45.00),
(8, 3, '2024-01-18', 70.00),
(9, 1, '2024-01-19', 25.00),
(10, 5, '2024-01-20', 120.00);
-- (Compléter jusqu’à 300 paiements variés avec id_membre de 1 à 100 et id_abonnement 1–5)
-- ===============================
-- TABLE : Reservations_Cours (500)
-- ===============================
-- Chaque membre réserve des cours, sauf 10 membres (par ex. 91 à 100 n’ont aucune réservation)
INSERT INTO Reservations_Cours (id_membre, id_cours) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7), (3, 8),
(4, 9), (4, 10), (4, 11),
(5, 12), (5, 13),
(6, 14), (6, 15),
(7, 16), (7, 17),
(8, 18), (8, 19), (8, 20),
(9, 1), (9, 2),
(10, 3), (10, 4);
-- (Compléter jusqu’à 500 réservations totales)
-- IMPORTANT : ne pas insérer de réservations pour les membres 91–100

