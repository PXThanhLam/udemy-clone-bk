USE DBS_Assignment;
DROP PROCEDURE IF EXISTS insertUser;
DELIMITER $$
CREATE PROCEDURE insertUser(
	IN em VARCHAR(256),
    IN pw VARCHAR(256),
    IN fname VARCHAR(128),
    in lname VARCHAR(128)
)
BEGIN
	IF (pw REGEXP '.*[0-9].*'  and pw REGEXP '.*[A-Za-z].*' and pw REGEXP '.*[!@#$%a^&*()-_+=.,;:\'"`~].*' and CHAR_LENGTH(pw) >= 8)  THEN
		INSERT INTO tbl_USER(email, password, first_name, last_name)
		VALUES (em, SHA2(pw, 256), fname, lname);
	END IF;
END
$$

