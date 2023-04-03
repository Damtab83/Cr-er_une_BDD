CREATE DATABASE IF NOT EXISTS 'eval_BDD'CHARACTER SET utf8 COLLATE utf8_general_ci;



--  CINEMA
-- Création de la table cinéma
CREATE TABLE 'cinema' (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  nb_salles INT(11) NOT NULL,
  localisation VARCHAR(255),
  IdAdmin INT(11) NOT NULL,
  FOREIGN KEY (IdAdmin) REFERENCES admin(id)
) ENGINE = InnoDB;

-- Insertion des données cinéma
INSERT INTO cinema (nom, nb_salles, localisation)
VALUES
    ('Ciné Mars seille', 8, 'Marseille'),
    ('Cinéma du Paris', 7, 'Paris'),
    ('Ciné Bord-eaux', 3, 'Bordeaux'),
    ('Cinéma de Chamb et Ry', 6, 'Chambéry')
    ;

--   FILM
-- Création de la table film
CREATE TABLE 'film' (
  id INT(11) NOT NULL AUTO_INCREMENT,
  titre VARCHAR(200) NOT NULL,
  duree TIME
) ENGINE = InnoDB;

-- Insertion des données film
INSERT INTO film (titre, duree,)
VALUES 
    ('Dune (1984)', '137 minutes'),
    ('Pulp Fiction', '145 minnutes'),
    ('Forest Gump', '142 minutes'),
    ('Le Torrent', '102 minutes'),
    ('Le Cercle des Poètes Disparus', '128 minutes'),
    ('Invictus', '134 minutes')
    ;

--   TARIFS
-- Création de la table tarifs
CREATE TABLE tarifs (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  formule VARCHAR(100) NOT NULL,
  prix INT(11) NOT NULL
)  ENGINE = InnoDB;

-- Création des données tarifs
INSERT INTO tarifs (formule, price) 
VALUES 
    ('Plein Tarif', '9€20'),
    ('Etudiant', '7€60'),
    ('Moins de 14 ans', '5€90')
    ;

--    SALLE
-- Création de la table salle
CREATE TABLE salle (
  id INT(11) NOT NULL AUTO_INCREMENT,
  numero_salle INT(11) NOT NULL,
  nb_places INT(100),
  IdCinema INT(11) NOT NULL,
  FOREIGN KEY (IdCinema) REFERENCES cinema (id) ON DELETE CASCADE
)  ENGINE = InnoDB;

-- Création des donnnées salle
INSERT INTO salle (numero_salle, nb_places)
VALUES
  (1, 300),
  (2, 550),
  (3, 280),
  (4, 450),

--   ADMIN
-- Création de la table admincine
CREATE TABLE admincine (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  prenom VARCHAR(255) NOT NULL,
  role_type VARCHAR(255) NOT NULL;
) ENGINE = InnoDB;

ALTER TABLE admincine
  ADD nom VARCHAR(255) NOT NULL
  AFTER id;
  ADD password VARCHAR(50)
  AFTER role_type;

--Création des données admincine
INSERT INTO admincine (prenom, role)
VALUES
  ('Ken', 'Clark', 'vendeur',),
  ('Poule', 'Amélie', 'vendeuse'),
  ('Sinistre', 'Franck', 'assitant direction'),
  ('Legal', 'Fabienne', 'directrice'),



--   SEANCE
-- Création de la table séance
CREATE TABLE seance (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  horaire TIME,
  nb_places_dispo INT(100) NOT NULL,
  IdSalle INT(11),
  FOREIGN KEY (IdSalle) REFERENCES salle (id),
  IdFilm INT(11) NOT NULL,
  FOREIGN KEY (IdFilm) REFERENCES film (id)
) ENGINE = InnoDB;

-- Création des données séance
INSERT INTO seance (horaire, nb_places_dispo)

-- Création de la table billet
CREATE TABLE billet (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nb_billet INT(100) NOT NULL,
  IdTarifs DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (IdTarifs) REFERENCES tarifs(id),
  IdSeance INT(11),
  FOREIGN KEY (IdSeance) REFERENCES seance (id)
) ENGINE = InnoDB;

--  Vérification des places libres

IF (SELECT nb_places_dispo FROM seance WHERE id=billet.IdSeance) >= billet.nb_billet
  THEN


-- Pour vider la table de ses données executuer:
--     TRUNCATE TABLE MaTable


/*//////////// LIGNES DE COMMANDES SUPPLEMENTAIRES ////////////*/
/* commande sauvegarde bdd--------------------------------------------------------------------------------
mysqldump -u root -p --databases eval_BDD > dump_eval_BDD.sql
 */

 /* commande restauration bdd--------------------------------------------------------------------------------
mysql -u root -p eval_BDD < dump_eval_BDD.sql
 */

/* commande creation utilisateur--------------------------------------------------------------------------
   CREATE USER 'admin'@'localhost' IDENTIFIED BY '$2y$10$o8za0K8NDjBKP9ZJ/LHpBetB5JagFpQ3EUYyBAwFh8y03O6gH/UyW';
   
   CREATE USER 'vendeurs'@'localhost' IDENTIFIED BY '$2y$10$E3HgXokKT6xrhfY1t.7Xf.zeJm.usQre1mw01cJBo5cTUs87Dc7ze';
 */

/* parametrer les privilieges utilisateurs------------------------------------------------------------
   -----------------tous les droits (lecture/ecriture) pour l'admin------------------------------------
   GRANT ALL PRIVILEGES ON eval_BDD.* TO 'admin'@'localhost';
   FLUSH PRIVILEGES
 */