-- Active: 1762279716247@@127.0.0.1@3306@test

CREATE TABLE IF NOT EXISTS kategorie (
  id_kategorie INT AUTO_INCREMENT PRIMARY KEY,
  nazev VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS vyrobce (
  id_vyrobce INT AUTO_INCREMENT PRIMARY KEY,
  nazev VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS sportovni_potreby (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nazev VARCHAR(100) NOT NULL,
  cena DECIMAL(10,2) NOT NULL,
  id_kategorie INT NOT NULL,
  id_vyrobce INT NOT NULL,
  FOREIGN KEY (id_kategorie) REFERENCES kategorie (id_kategorie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (id_vyrobce) REFERENCES vyrobce (id_vyrobce)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS pridat_potreby (
  p_nazev VARCHAR(100),
  p_cena DECIMAL(10,2),
  p_id_kategorie INT,
  p_id_vyrobce INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Chyba při vkládání záznamu' AS zprava;
    SET autocommit = 1;
  END;
  SET autocommit = 0;

  START TRANSACTION;

  INSERT sportovni_potreby(nazev, cena, id_kategorie, id_vyrobce) VALUES(p_nazev, p_cena, p_id_kategorie, p_id_vyrobce);

  COMMIT;
END$$

DELIMITER ;

INSERT INTO kategorie(nazev) VALUES ("obleceni");
INSERT INTO vyrobce(nazev) VALUES ("adidas");

CALL pridat_potreby("sportovni boty", 1599.00, 1, 1);
CALL pridat_potreby("kolo", 1000, 999, 1)