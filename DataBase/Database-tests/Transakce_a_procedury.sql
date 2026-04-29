CREATE TABLE hockeyPlayer(
    id INT AUTOINCREMENT PRIMARY KEY
    fname VARCHAR(30) NOT NULL
    lname VARCHAR(50) NOT NULL
    team VARCHAR(50) NOT NULL
);

DELIMiTER //

CREATE PROCEDURE insert_player(
    p_fname VARCHAR(30) NOT NULL
    p_lname VARCHAR(50) NOT NULL
    p_team VARCHAR(50) NOT NULL
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET autocommit = 1;
        SELECT 'Chyba při vkládání záznamu' AS zprava;
    END;
    SET autocommit = 0;

    START TRANSACTION;

    INSERT INTO hockeyPlayer(fname,lname,team) VALUES (p_fname, p_lname, p_team);
    COMMIT;
    SET autocommit = 1;
END//

DELIMITER ;

CALL insert_player("David", "Pastrňák", "Boston Bruins") -- Vše proběhne bez problému --
CALL insert_player("Pavel", "Zacha", NULL) -- Operace se neprovede z důvodu chybného zadání parametrů --