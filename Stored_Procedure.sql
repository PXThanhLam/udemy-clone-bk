USE DBS_Assignment;
DROP PROCEDURE IF EXISTS insertUser;
DROP PROCEDURE IF EXISTS insertCategory;
DROP PROCEDURE IF EXISTS insertCourse;
DELIMITER $$
CREATE PROCEDURE insertUser(
	IN em VARCHAR(256),
    IN pw VARCHAR(256),
    IN fname VARCHAR(128),
    in lname VARCHAR(128)
)
BEGIN
	IF (pw REGEXP '.*[0-9].*'  and pw REGEXP '.*[A-Za-z].*' and pw REGEXP "[^ ]*[!@#$%^&'][^ ]*" and CHAR_LENGTH(pw) >= 8)  THEN
		INSERT INTO tbl_USER(email, password, first_name, last_name)
		VALUES (em, SHA2(pw, 256), fname, lname);
	ELSE SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Password must contains at least a number, an alphabetical character and a special character';
    END IF;
END
$$
CREATE PROCEDURE insertCategory(
	IN category_name VARCHAR(256),
    IN sub_category_name VARCHAR(256)
)
BEGIN
	DECLARE arg_category_id INT UNSIGNED;
	INSERT INTO tbl_CATEGORY(name)
    VALUES (category_name);
    SELECT id INTO arg_category_id
    FROM tbl_CATEGORY
    WHERE name=category_name;
    INSERT INTO tbl_SUBCATEGORY(name, category_id)
    VALUES (sub_category_name, arg_category_id);
END
$$
CREATE PROCEDURE insertCourse(
	IN arg_main_title VARCHAR(256),
    IN arg_sub_title VARCHAR(256),
    IN arg_description TEXT,
    IN arg_promotional_video VARCHAR(256),
	IN arg_image VARCHAR(256),
    IN arg_course_language VARCHAR(64),
    IN arg_course_level ENUM('Beginner', 'Intermidate', 'Expert', 'All Levels'),
    IN arg_price DECIMAL(10,2),
    IN arg_welcome_message TEXT,
    IN owner_email VARCHAR(256),
    IN sub_category_name VARCHAR(256)
)
BEGIN
	DECLARE arg_owner_id, arg_sub_category_id INT UNSIGNED;
    SELECT id INTO arg_owner_id
    FROM tbl_USER
    WHERE email=owner_email;
    SELECT id INTO arg_sub_category_id
    FROM tbl_SUBCATEGORY
    WHERE name=sub_category_name;
	INSERT INTO tbl_COURSE(main_title, sub_title, description, promotional_video, image, 
		course_language, course_level, price, welcome_message, owner_id, sub_category_id)
	VALUES (arg_main_title, arg_sub_title, arg_description, arg_promotional_video, arg_image,
		IFNULL(arg_course_language,DEFAULT(course_language)), IFNULL(arg_course_level,DEFAULT(course_level)), IFNULL(arg_price,DEFAULT(price)), arg_welcome_message, arg_owner_id, 
        arg_sub_category_id);
END
$$
