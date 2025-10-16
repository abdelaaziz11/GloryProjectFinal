-- ==========================================================
-- UPDATE 1️⃣ :
-- Mettre à jour le prix mensuel de l'abonnement 'Premium'.
-- Exemple : nouveau prix = 70
-- ==========================================================
UPDATE Abonnements
SET prix_mensuel = 70
WHERE id_abonnement = 3;
-- 💡 Explication
-- UPDATE Abonnements → indique la table à modifier.
-- SET prix_mensuel = 59.99 → définit la nouvelle valeur du prix.
-- WHERE id_abonnement = 3 → cible uniquement l’abonnement Premium.
-- ⚠️ Important : Ne jamais oublier le WHERE, sinon tous les abonnements seront mis à jour.



-- ==========================================================
-- UPDATE 2️⃣ :
-- Mettre à jour le coach principal d'un cours spécifique.
-- Exemple : cours = 'Yoga Avancé', nouveau coach id = 3
-- ==========================================================
UPDATE Cours_Collectifs
SET id_coach_principal = 3
WHERE id_cours = 11;
-- 💡 Explication
-- UPDATE Cours_Collectifs → indique la table à modifier.
-- SET id_coach_principal = 3 → définit le nouveau coach principal (ici, id_coach = 3).
-- WHERE id_cours = 11 → cible uniquement le cours spécifique.
-- ⚠️ Toujours inclure le WHERE pour éviter de modifier tous les cours par erreur.



-- ==========================================================
-- DELETE 3️⃣ :
-- Supprimer la réservation d'un membre pour un cours spécifique.
-- Exemple : id_membre = 10, id_cours = 5
-- ==========================================================
DELETE FROM Reservations_Cours
WHERE id_membre = 10
  AND id_cours = 6;
-- 💡 Explication
-- DELETE FROM Reservations_Cours → indique la table dans laquelle on supprime l’enregistrement.
-- WHERE id_membre = 10 AND id_cours = 6 → cible exactement la réservation à supprimer.
-- ⚠️ Important : Toujours inclure tous les critères nécessaires dans le WHERE pour éviter de supprimer toutes les réservations du cours ou du membre.