

CREATE SCHEMA mrazak DEFAULT CHARACTER SET utf8;
USE mrazak;

-- If the table exists in the data folder but is broken, drop it first
DROP TABLE IF EXISTS potravina; 
DROP TABLE IF EXISTS category;

CREATE TABLE category (
  id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE potravina (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  expiration_date DATE NOT NULL DEFAULT(CURRENT_DATE),
  pieces_sum INT NOT NULL,
  category_id INT NOT NULL,
  CONSTRAINT chk_pieces_sum CHECK (pieces_sum > 0),
  FOREIGN KEY (category_id) REFERENCES category (id_category)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);



