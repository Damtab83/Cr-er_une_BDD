CREATE DATABASE IF NOT EXISTS 'eval_BDD';



--  CINEMA
-- Création de la table cinéma
CREATE TABLE 'cinema' (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  nb_salles INT(11) NOT NULL,
  localisation VARCHAR(255),
  IdAdmin INT(11),
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
  IdCinema INT(11),
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
-- Création de la table admin
CREATE TABLE admin (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255) NOT NULL,
  role_type VARCHAR(255) NOT NULL;
) ENGINE = InnoDB;

--Création des données admin
INSERT INTO admin (nom, role)
VALUES
  ('Clark', 'vendeur'),
  ('Amélie', 'vendeuse'),
  ('Franck', 'assitant direction'),
  ('Fabienne', 'directrice'),

--   SEANCE
-- Création de la table séance
CREATE TABLE seance (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  horaire TIME,
  nb_places_dispo INT(100) NOT NULL,
  IdSalle INT(11),
  FOREIGN KEY (IdSalle) REFERENCES salle (id),
  IdFilm INT(11),
  FOREIGN KEY (IdFilm) REFERENCES film (id)
) ENGINE = InnoDB;

-- Création des données séance
INSERT INTO seance (horaire, nb_places_dispo)

-- Création de la table billet
CREATE TABLE billet (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nb_billet INT(100)
  IdTarifs INT(11),
  FOREIGN KEY (IdTarifs) REFERENCES tarifs(id),
  IdSeance INT(11),
  FOREIGN KEY (IdSeance) REFERENCES seance (id)
) ENGINE = InnoDB;

--  Vérification des places libres

IF (SELECT nb_places_dispo FROM seance WHERE id=billet.IdSeance) >= billet.nb_billet
  THEN


-- Pour vider la table de ses données executuer:
--     TRUNCATE TABLE MaTable
