CREATE DATABASE IF NOT EXISTS 'eval_BDD';

CREATE TABLE 'cinema' (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  nb_salles INT(11) NOT NULL,
  localisation VARCHAR(255)
)

CREATE TABLE 'film' (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(200) NOT NULL,
  duree TIME,
  FOREIGN KEY (nom) REFERENCES salle (numero_salle)
);

CREATE TABLE 'salle' (
  id INT(11) NOT NULL AUTO_INCREMENT,
  numero_salle INT(11) NOT NULL,
  nb_places INT(100),
  FOREIGN KEY (numero_salle) REFERENCES cinema (nom)
)