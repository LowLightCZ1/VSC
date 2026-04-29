-- Active: 1762279716247@@127.0.0.1@3306@pivovary
CREATE DATABASE IF NOT EXISTS pivovary

CREATE SCHEMA IF NOT EXISTS pivovary
DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;

USE pivovary;

CREATE TABLE pivo(
    id INT UNSIGNED AUTO_INCREMENT,
    nazev VARCHAR(20) NOT NULL,
    stupen TINYINT NOT NULL,
    znacka VARCHAR(30) NOT NULL,
    druh VARCHAR(20) NOT NULL,
    cena DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO pivo (nazev, stupen, znacka, druh, cena) 
VALUES
        ("Pilsner Urquel", 12, "Pilsner", "ležák", 39),
        ("Budvar Classic", 10, "Budvar", "výčepní", 25),
        ("Bruncvík", 10, "Kaufland", "výčepní", 7.50),
        ("Kozel", 11, "Kozel", "výčepní", 20),
        ("Radegast", 12, "Radegast", "výčepní", 25);
        
SELECT nazev, MAX(cena) AS nejdrazsi FROM pivovary.pivo GROUP BY nazev;
SELECT MIN(cena) AS splasky, nazev FROM pivovary.pivo GROUP BY nazev;
SELECT CONVERT(AVG(cena), DECIMAL(10,2)) AS prumer FROM pivovary.pivo;
SELECT COUNT(nazev) AS pocet_piv FROM pivovary.pivo;