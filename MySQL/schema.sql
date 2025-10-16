-- Projet 4 : Gestion de Centre de Fitness - Vitality Club
-- Phase 1 : schema.sql (DDL - Data Definition Language)
-- ===============================
-- Table : Membres
-- ===============================
CREATE TABLE Membres (
    id_membre INT AUTO_INCREMENT PRIMARY KEY,
    nom_membre VARCHAR(100) NOT NULL,
    email_membre VARCHAR(100) NOT NULL UNIQUE,
    date_naissance DATE,
    date_inscription DATE NOT NULL);
-- ===============================
-- Table : Abonnements
-- ===============================
CREATE TABLE Abonnements (
    id_abonnement INT AUTO_INCREMENT PRIMARY KEY,
    nom_abonnement VARCHAR(100) NOT NULL,
    prix_mensuel DECIMAL(10,2) NOT NULL CHECK (prix_mensuel > 0),
    duree_mois INT NOT NULL CHECK (duree_mois > 0));
-- ===============================
-- Table : Coachs
-- ===============================
CREATE TABLE Coachs (
    id_coach INT AUTO_INCREMENT PRIMARY KEY,
    nom_coach VARCHAR(100) NOT NULL,
    specialite VARCHAR(100));
-- ===============================
-- Table : Cours_Collectifs
-- ===============================
CREATE TABLE Cours_Collectifs (
    id_cours INT AUTO_INCREMENT PRIMARY KEY,
    nom_cours VARCHAR(150) NOT NULL,
    id_coach_principal INT,
    jour_semaine ENUM('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'),
    heure_debut TIME,
    capacite_max INT NOT NULL CHECK (capacite_max > 0),
    FOREIGN KEY (id_coach_principal) REFERENCES Coachs(id_coach));
-- ===============================
-- Table : Paiements_Abonnements
-- ===============================
CREATE TABLE Paiements_Abonnements (
    id_paiement INT AUTO_INCREMENT PRIMARY KEY,
    id_membre INT NOT NULL,
    id_abonnement INT NOT NULL,
    date_paiement DATE NOT NULL,
    montant_paye DECIMAL(10,2) NOT NULL CHECK (montant_paye >= 0),
    FOREIGN KEY (id_membre) REFERENCES Membres(id_membre),
    FOREIGN KEY (id_abonnement) REFERENCES Abonnements(id_abonnement));
-- ===============================
-- Table : Reservations_Cours
-- ===============================
CREATE TABLE Reservations_Cours (
    id_reservation INT AUTO_INCREMENT PRIMARY KEY,
    id_membre INT NOT NULL,
    id_cours INT NOT NULL,
    date_reservation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_membre) REFERENCES Membres(id_membre),
    FOREIGN KEY (id_cours) REFERENCES Cours_Collectifs(id_cours));