CREATE DATABASE IF NOT EXISTS eval_bdd
CHARACTER SET utf8 COLLATE utf8_general_ci;

use eval_bdd;

--   ADMINCINE  --------------------------------------------------
-- Création de la table admincine
CREATE TABLE admincine (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  prenom VARCHAR(255) NOT NULL,
  role_type VARCHAR(255) NOT NULL
) ENGINE = InnoDB;

ALTER TABLE admincine
  ADD nom VARCHAR(255) NOT NULL
  AFTER id,
  ADD mypassword VARCHAR(50)
  AFTER role_type;


 --   FILM  ----------------------------------------------------------------------
--  Création de la table film
CREATE TABLE film (
  id INT(11) NOT NULL AUTO_INCREMENT primary key,
  titre VARCHAR(200) NOT NULL,
  duree TIME
) ENGINE = InnoDB;


--   TARIFS  -----------------------------------------------------------
-- Création de la table tarifs
CREATE TABLE tarifs (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  formule VARCHAR(100) NOT NULL,
  prix DECIMAL(10,2) NOT NULL
)  ENGINE = InnoDB;


--  CINEMA  ---------------------------------------------------------------
-- Création de la table cinéma
CREATE TABLE cinema (
  id INT(11) NOT NULL AUTO_INCREMENT primary key,
  nom VARCHAR(100) NOT NULL,
  nb_salles INT(11) NOT NULL,
  localisation VARCHAR(255),
  adminId INT(11) NOT NULL,
  FOREIGN KEY (adminId) REFERENCES admincine(id)
) ENGINE = InnoDB;


--    SALLE  ----------------------------------------------------------------
-- Création de la table salle
CREATE TABLE salle (
  id INT(11) NOT NULL AUTO_INCREMENT primary key,
  numero_salle INT(11) NOT NULL,
  nb_places INT(100),
  IdCinema INT(11) NOT NULL,
  FOREIGN KEY (IdCinema) REFERENCES cinema (id) 
  ON DELETE CASCADE
  ON UPDATE RESTRICT
)  ENGINE = InnoDB;


--   SEANCE  -----------------------------------------------------------------
-- Création de la table séance
CREATE TABLE seance (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  horaire DATETIME,
  nb_places_dispo INT(100) NOT NULL,
  IdSalle INT(11),
  FOREIGN KEY (IdSalle) REFERENCES salle (id),
  IdFilm INT(11) NOT NULL,
  FOREIGN KEY (IdFilm) REFERENCES film (id)
) ENGINE = InnoDB;



-- Création de la table billet  -----------------------------------------------------
CREATE TABLE billet (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nb_billet INT(100) NOT NULL,
  IdTarifs INT(11) NOT NULL,
  FOREIGN KEY (IdTarifs) REFERENCES tarifs(id),
  IdSeance INT(11),
  FOREIGN KEY (IdSeance) REFERENCES seance (id)
) ENGINE = InnoDB;



/*//////////// LIGNES DE COMMANDES SUPPLEMENTAIRES ////////////*/
/* commande sauvegarde bdd--------------------------------------------------------------------------------
mysqldump -u root -p --databases eval_bdd > dump_eval_.sql
 */

 /* commande restauration bdd--------------------------------------------------------------------------------
mysql -u root -p eval_BDD < dump_eval_bdd.sql
 */


/* parametrer les privilieges utilisateurs------------------------------------------------------------
   -----------------tous les droits (lecture/ecriture) pour l'admin------------------------------------
   GRANT ALL PRIVILEGES ON eval_bdd.* TO 'admin'@'localhost';
   FLUSH PRIVILEGES
 */