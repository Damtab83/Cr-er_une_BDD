use eval_bdd;


  --  Création des données admincine
INSERT INTO admincine (nom, prenom, role_type, mypassword)
VALUES
  ('Ken', 'Clark', 'vendeur', '$2y$10$E3HgXokKT6xrhfY1t.7Xf.zeJm.usQre1mw01cJBo5cTUs87Dc7ze'),
  ('Poule', 'Amélie', 'vendeuse', '$2y$10$E3HgXokKT6xrhfY1t.7Xf.zeJm.usQre1mw01cJBo5cTUs87Dc7ze'),
  ('Sinistre', 'Franck', 'assitant direction', '$2y$10$o8za0K8NDjBKP9ZJ/LHpBetB5JagFpQ3EUYyBAwFh8y03O6gH/UyW'),
  ('Legal', 'Fabienne', 'directrice', '$2y$10$o8za0K8NDjBKP9ZJ/LHpBetB5JagFpQ3EUYyBAwFh8y03O6gH/UyW');

  -- Insertion des données film
INSERT INTO film (titre, duree)
VALUES 
    ('Dune', '2:17'),
    ('Pulp Fiction', '2:25'),
    ('Forest Gump', '2:22'),
    ('Le Torrent', '1:42'),
    ('Le Cercle des Poètes Disparus', '2:08'),
    ('Invictus', '2:14')
    ;

  -- Création des données tarifs
INSERT INTO tarifs (formule, prix) 
VALUES 
    ('Plein Tarif', '9.20'),
    ('Etudiant', '7.60'),
    ('Moins de 14 ans', '5.90')
    ;

-- Insertion des données cinéma
INSERT INTO cinema (nom, nb_salles, localisation, adminId)
VALUES
    ('Ciné Mars seille', 8, 'Marseille', 1),
    ('Cinéma du Paris', 7, 'Paris', 3),
    ('Ciné Bord-eaux', 3, 'Bordeaux', 2),
    ('Cinéma de Chamb et Ry', 6, 'Chambéry', 4)
    ;

--     /*
--     INSERT INTO cinema (nom, nb_salles, localisation)
--     VALUES ('Cine du port',2)   ==> retournera une erreur car le cinéma n'est pas localisé
--     */

-- Création des donnnées salle
INSERT INTO salle (numero_salle, nb_places, IdCinema)
VALUES
  (1, 300, 2),
  (2, 550, 3),
  (3, 280, 1),
  (4, 450, 4);


--  Vérification des places libres
-- Fonction pour définir le nombre de places libre
DELIMITER $$

CREATE FUNCTION salle_place_dispo (IdSalle INT)
RETURN INT;

BEGIN
  SELECT nb_places into places_libres FROM eval_bdd.salle
  RETURN places_libres;
END;
$$ 
DELIMITER;


-- Création des données séance
INSERT INTO seance (horaire, IdSalle, IdFilm, nb_places_dispo)
VALUES
  ('2023-01-23 18:52:00', 3, 1, salle_place_dispo(IdSalle)),
  ('2023-02-01 20:03:00', 1, 6, salle_place_dispo(IdSalle)),
  ('2023-03-20 18:52:00', 4, 1, salle_place_dispo(IdSalle)),
  ('2022-12-30 11:52:00', 2, 5, salle_place_dispo(IdSalle));



-- Pour vider la table de ses données executuer:
--     TRUNCATE TABLE MaTable

/* commande creation utilisateur--------------------------------------------------------------------------
   CREATE USER 'directrice'@'localhost' IDENTIFIED BY '$2y$10$o8za0K8NDjBKP9ZJ/LHpBetB5JagFpQ3EUYyBAwFh8y03O6gH/UyW';
   CREATE USER 'assistantdirection'@'localhost' IDENTIFIED BY '$2y$10$o8za0K8NDjBKP9ZJ/LHpBetB5JagFpQ3EUYyBAwFh8y03O6gH/UyW';
   
   CREATE USER 'vendeur'@'localhost' IDENTIFIED BY '$2y$10$E3HgXokKT6xrhfY1t.7Xf.zeJm.usQre1mw01cJBo5cTUs87Dc7ze';
   CREATE USER 'vendeuse'@'localhost' IDENTIFIED BY '$2y$10$E3HgXokKT6xrhfY1t.7Xf.zeJm.usQre1mw01cJBo5cTUs87Dc7ze';
 */
