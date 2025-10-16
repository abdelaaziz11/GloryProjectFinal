-- ==========================================================
-- Projet 4 : Gestion de Centre de Fitness - Vitality Club
-- Phase 3 : queries.sql (DQL - Data Query Language)

-- 1️⃣ Requête 1 :
-- Lister tous les membres inscrits après le 1er Janvier 2024,
-- triés par date d'inscription croissante.
-- ==========================================================
SELECT id_membre, nom_membre, email_membre, date_naissance, date_inscription
FROM Membres WHERE date_inscription > '2024-01-01'
ORDER BY date_inscription ASC;
-- ✅ Explication
-- SELECT : extrait les informations principales des membres.
-- WHERE date_inscription > '2024-01-01' : filtre uniquement les membres inscrits après le 1er janvier 2024.
-- ORDER BY date_inscription ASC : trie les résultats du plus ancien au plus récent.



-- ==========================================================
-- 2️⃣ Requête 2 :
-- Trouver les informations d'un membre par son adresse email.
-- Exemple : rechercher le membre ayant l'adresse 'membre10@email.com'
-- ==========================================================
SELECT id_membre, nom_membre, email_membre, date_naissance, date_inscription
FROM Membres WHERE email_membre = 'membre10@email.com';
-- 💡 Explication
-- Cette requête sélectionne toutes les informations pertinentes d’un membre.
-- Le critère de recherche est l’adresse email, supposée unique (comme défini dans le schéma de ta table Membres).
-- Tu peux bien sûr remplacer 'membre10@email.com' par n’importe quelle autre adresse email lors de l’exécution.



-- ==========================================================
-- 3️⃣ Requête 3 :
-- Lister tous les cours collectifs en affichant le nom du cours
-- et le nom de son coach principal.
-- ==========================================================
SELECT Cours_Collectifs.id_cours, Cours_Collectifs.nom_cours, coachs.nom_coach AS coach_principal
FROM Cours_Collectifs JOIN Coachs ON Cours_Collectifs.id_coach_principal = Coachs.id_coach
ORDER BY Cours_Collectifs.nom_cours ASC;

-- 💡 Explication
-- JOIN Coachs co ON Cours_Collectifs.id_coach_principal = Coachs.id_coach : relie chaque cours collectif à son coach principal.
-- AS coach_principal : permet d’afficher une colonne claire dans le résultat.
-- ORDER BY Cours_Collectifs.nom_cours ASC : trie la liste des cours par ordre alphabétique.



-- ==========================================================
-- 4️⃣ Requête 4 :
-- Lister tous les membres inscrits au cours de 'Yoga' du Lundi.
-- ==========================================================
SELECT Membres.id_membre, Membres.nom_membre, Membres.email_membre,
    Cours_Collectifs.nom_cours, Cours_Collectifs.jour_semaine
FROM Membres 
JOIN Reservations_Cours ON Membres.id_membre = Reservations_Cours.id_membre
JOIN Cours_Collectifs ON Reservations_Cours.id_cours = Cours_Collectifs.id_cours
WHERE Cours_Collectifs.nom_cours = 'Yoga Matinal' AND Cours_Collectifs.jour_semaine = 'Lundi'
ORDER BY Membres.nom_membre ASC;
-- 💡 Explication
-- JOIN Reservations_Cours → relie chaque membre à ses réservations de cours.
-- JOIN Cours_Collectifs → permet d’accéder au nom et jour du cours.
-- WHERE Cours_Collectifs.nom_cours = 'Yoga' AND Cours_Collectifs.jour_semaine = 'Lundi' → filtre uniquement les cours de Yoga le Lundi.
-- ORDER BY Membres.nom_membre ASC → trie les membres par ordre alphabétique.



-- ==========================================================
-- 5️⃣ Requête 5 :
-- Afficher l'historique complet des paiements d'un membre spécifique,
-- en montrant son nom, le nom de l'abonnement payé, le montant et la date du paiement.
-- Exemple : membre avec l'ID 10
-- ==========================================================
SELECT Membres.nom_membre, Abonnements.nom_abonnement,
    Paiements_Abonnements.montant_paye, Paiements_Abonnements.date_paiement
FROM Paiements_Abonnements
JOIN Membres ON Paiements_Abonnements.id_membre = Membres.id_membre
JOIN Abonnements ON Paiements_Abonnements.id_abonnement = Abonnements.id_abonnement
WHERE Membres.id_membre = 10 
ORDER BY Paiements_Abonnements.date_paiement ASC;
-- 💡 Explication
-- JOIN Membres → récupère le nom du membre correspondant au paiement.
-- JOIN Abonnements → récupère le nom de l’abonnement payé.
-- WHERE Membres.id_membre = 10 → filtre sur le membre spécifique.
-- ORDER BY Paiements_Abonnements.date_paiement ASC → affiche les paiements du plus ancien au plus récent.



-- ==========================================================
-- 6️⃣ Requête 6 :
-- Identifier les membres qui n'ont jamais réservé de cours collectif.
-- ==========================================================
SELECT Membres.id_membre, Membres.nom_membre, Membres.email_membre,
Membres.date_inscription
FROM Membres
LEFT JOIN Reservations_Cours ON Membres.id_membre = Reservations_Cours.id_membre
WHERE Reservations_Cours.id_reservation IS NULL
ORDER BY Membres.nom_membre ASC;
-- 💡 Explication
-- LEFT JOIN Reservations_Cours → garde tous les membres, même s’ils n’ont pas de réservation.
-- WHERE Reservations_Cours.id_reservation IS NULL → filtre uniquement les membres sans aucune réservation.
-- ORDER BY Membres.nom_membre ASC → trie la liste par ordre alphabétique.



-- ==========================================================
-- 7️⃣ Requête 7 :
-- Identifier les abonnements qui n'ont jamais été souscrits.
-- ==========================================================
SELECT Abonnements.id_abonnement, Abonnements.nom_abonnement,
       Abonnements.prix_mensuel, Abonnements.duree_mois
FROM Abonnements
LEFT JOIN Paiements_Abonnements ON Abonnements.id_abonnement = Paiements_Abonnements.id_abonnement
WHERE Paiements_Abonnements.id_paiement IS NULL
ORDER BY Abonnements.nom_abonnement ASC;
-- 💡 Explication
-- LEFT JOIN Paiements_Abonnements → garde tous les abonnements, même ceux qui n’ont aucun paiement associé.
-- WHERE Paiements_Abonnements.id_paiement IS NULL → filtre uniquement les abonnements jamais souscrits.
-- ORDER BY Abonnements.nom_abonnement ASC → trie la liste par ordre alphabétique.



-- ==========================================================
-- 8️⃣ Requête 8 :
-- Compter le nombre de cours que chaque coach enseigne.
-- ==========================================================
SELECT Coachs.id_coach, Coachs.nom_coach,
       COUNT(Cours_Collectifs.id_cours) AS nombre_cours
FROM Coachs
LEFT JOIN Cours_Collectifs ON Coachs.id_coach = Cours_Collectifs.id_coach_principal
GROUP BY Coachs.id_coach, Coachs.nom_coach
ORDER BY nombre_cours DESC;
-- 💡 Explication
-- LEFT JOIN Cours_Collectifs → permet d’inclure tous les coachs, même ceux qui n’enseignent aucun cours.
-- COUNT(Cours_Collectifs.id_cours) → compte le nombre de cours pour chaque coach.
-- GROUP BY Coachs.id_coach, Coachs.nom_coach → regroupe les résultats par coach.
-- ORDER BY nombre_cours DESC → affiche les coachs les plus occupés en premier.



    -- ==========================================================
-- 9️⃣ Requête 9 :
-- Calculer le nombre moyen de réservations de cours par membre.
-- ==========================================================
SELECT AVG(nombre_reservations) AS moyenne_reservations_par_membre
FROM (SELECT Membres.id_membre,
    COUNT(Reservations_Cours.id_reservation) AS nombre_reservations
    FROM Membres
    LEFT JOIN Reservations_Cours ON Membres.id_membre = Reservations_Cours.id_membre
    GROUP BY Membres.id_membre ) AS sous_requete;
-- 💡 Explication
-- La sous-requête :
-- LEFT JOIN Reservations_Cours → inclut tous les membres, même ceux qui n’ont aucune réservation.
-- COUNT(Reservations_Cours.id_reservation) → compte le nombre de réservations pour chaque membre.
-- GROUP BY Membres.id_membre → calcule le total par membre.
-- La requête principale :
-- AVG(nombre_reservations) → calcule la moyenne des réservations sur tous les membres.



-- ==========================================================
-- 10️⃣ Requête 10 :
-- Lister les cours collectifs qui ont plus de 15 réservations.
-- ==========================================================
SELECT Cours_Collectifs.id_cours, Cours_Collectifs.nom_cours,
    Cours_Collectifs.jour_semaine, Cours_Collectifs.heure_debut,
    COUNT(Reservations_Cours.id_reservation) AS nombre_reservations
FROM Cours_Collectifs
LEFT JOIN Reservations_Cours ON Cours_Collectifs.id_cours = Reservations_Cours.id_cours
GROUP BY Cours_Collectifs.id_cours, Cours_Collectifs.nom_cours, Cours_Collectifs.jour_semaine, Cours_Collectifs.heure_debut
HAVING COUNT(Reservations_Cours.id_reservation) > 15
ORDER BY nombre_reservations DESC;
-- Explication
-- LEFT JOIN Reservations_Cours → relie chaque cours à ses réservations, tout en incluant les cours qui peuvent avoir 0 réservation.
-- COUNT(Reservations_Cours.id_reservation) → calcule le nombre total de réservations par cours.
-- GROUP BY → regroupe les résultats par cours pour appliquer le COUNT.
-- HAVING COUNT(...) > 15 → filtre uniquement les cours avec plus de 15 réservations.
-- ORDER BY nombre_reservations DESC → affiche les cours les plus populaires en premier.



-- ==========================================================
-- 11️⃣ Requête 11 :
-- Calculer le chiffre d'affaires total généré par chaque type d'abonnement.
-- ==========================================================
SELECT Abonnements.id_abonnement, Abonnements.nom_abonnement,
       SUM(Paiements_Abonnements.montant_paye) AS chiffre_affaires_total
FROM Abonnements
LEFT JOIN Paiements_Abonnements ON Abonnements.id_abonnement = Paiements_Abonnements.id_abonnement
GROUP BY Abonnements.id_abonnement, Abonnements.nom_abonnement
ORDER BY chiffre_affaires_total DESC;
-- 💡 Explication
-- LEFT JOIN Paiements_Abonnements → relie chaque abonnement à ses paiements, tout en incluant les abonnements qui n’ont jamais été souscrits.
-- SUM(Paiements_Abonnements.montant_paye) → calcule le total des paiements pour chaque type d’abonnement.
-- GROUP BY Abonnements.id_abonnement, Abonnements.nom_abonnement → regroupe les résultats par type d’abonnement.
-- ORDER BY chiffre_affaires_total DESC → affiche en premier les abonnements qui ont généré le plus de revenus.



-- ==========================================================
-- 12️⃣ Requête 12 :
-- Trouver les 5 membres les plus actifs du mois en cours
-- (basé sur le nombre de réservations de cours).
-- ==========================================================
SELECT Membres.id_membre, Membres.nom_membre, Membres.email_membre,
    COUNT(Reservations_Cours.id_reservation) AS nombre_reservations
FROM Membres
JOIN Reservations_Cours ON Membres.id_membre = Reservations_Cours.id_membre
WHERE MONTH(Reservations_Cours.date_reservation) = MONTH(CURDATE())
AND YEAR(Reservations_Cours.date_reservation) = YEAR(CURDATE())
GROUP BY Membres.id_membre, Membres.nom_membre, Membres.email_membre
ORDER BY nombre_reservations DESC LIMIT 5;
-- 💡 Explication
-- JOIN Reservations_Cours → relie chaque membre à ses réservations.
-- WHERE MONTH(...) = MONTH(CURDATE()) AND YEAR(...) = YEAR(CURDATE()) → filtre les réservations du mois en cours.
-- COUNT(Reservations_Cours.id_reservation) → calcule le nombre de réservations par membre.
-- GROUP BY Membres.id_membre, Membres.nom_membre, Membres.email_membre → regroupe les résultats par membre.
-- ORDER BY nombre_reservations DESC LIMIT 5 → récupère les 5 membres ayant le plus de réservations ce mois-ci.