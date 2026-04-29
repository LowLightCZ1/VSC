-- Active: 1762279716247@@127.0.0.1@3306@mrazak
INSERT INTO category(name) VALUES ("maso"), ("ovoce"), ("zelenina"), ("hotová jídla"), ("ryby"), ("přílohy"), ("dezerty");

INSERT potravina(name, category_id, expiration_date, pieces_sum)
VALUES
    ("Kuřecí prsa", 1, '2026-03-15', 4),
    ("Hovězí guláš", 4, '2026-01-20', 2),
    ("Losos filet", 5, '2026-01-10', 3 ),
    ("Mražený špenát", 3, '2026-06-01', 5),
    ("Hranolky", 6, '2026-05-12', 2),
    ("Jahody", 2, '2026-04-30',3),
    ("Borůvky", 2, '2026-04-18', 2),
    ("Pizza Margherita", 4, '2026-02-28',	1),
    ("Vepřová panenka", 1, '2026-03-05', 2),
    ("Zeleninová směs", 3, '2026-07-10', 4),
    ("Knedlíky", 6, '2026-08-01', 2),
    ("Vanilková zmrzlina", 7, '2026-09-15', 1),
    ("Rybí prsty", 5, '2026-01-30', 3),
    ("Maliny", 2, '2026-04-25', 2),
    ("Kuřecí vývar", 4, '2026-02-05', 4)

-- BASIC COMMANDS--

SELECT p.id, p.name AS potravina, p.pieces_sum, p.expiration_date, c.name AS kategorie
FROM potravina p
JOIN category c ON p.category_id = c.id_category;

INSERT INTO potravina (name, expiration_date, pieces_sum, category_id)
VALUES ('Mražená pizza', '2026-08-20', 2, 1);

UPDATE potravina
SET pieces_sum = 10
WHERE id =31;


UPDATE potravina
SET expiration_date = '2026-12-31'
WHERE id = 40;

DELETE FROM potravina
WHERE id = 45;

-- ADVANCE COMMANDS--

SELECT p.name, p.expiration_date, c.name AS category_name
FROM potravina p
JOIN category c ON p.category_id = c.id_category
WHERE p.expiration_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY);


SELECT SUM(pieces_sum) AS celkovy_pocet_kusu
FROM potravina;

SELECT c.name AS kategorie, COUNT(p.id) AS pocet_druhu_potravin
FROM category c
LEFT JOIN potravina p ON c.id_category = p.category_id
GROUP BY c.id_category, c.name;

SELECT 
    MIN(expiration_date) AS nejblizsi_expirace,
    MAX(expiration_date) AS nejvzdalenejsi_expirace
FROM potravina;

SELECT name, expiration_date, pieces_sum, 'K expiraci' AS duvod
FROM potravina
WHERE expiration_date <= DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY)

UNION


SELECT name, expiration_date, pieces_sum, 'Dochází zásoby' AS duvod
FROM potravina
WHERE pieces_sum < 2;