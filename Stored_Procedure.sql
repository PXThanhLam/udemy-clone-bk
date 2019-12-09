USE DBS_Assignment;

DROP PROCEDURE IF EXISTS insertUser;
DROP PROCEDURE IF EXISTS insertCategory;
DROP PROCEDURE IF EXISTS insertCourse;
DROP PROCEDURE IF EXISTS message;
DROP PROCEDURE IF EXISTS insertAnnouncement;
DROP PROCEDURE IF EXISTS insertSection;
DROP PROCEDURE IF EXISTS insertItem;
DROP PROCEDURE IF EXISTS insertLecture;
DROP PROCEDURE IF EXISTS insertVideo;
DROP PROCEDURE IF EXISTS addCaption;
DROP PROCEDURE IF EXISTS insertTeacher;

DELIMITER $$
CREATE PROCEDURE insertUser(
	IN em VARCHAR(256),
    IN pw VARCHAR(256),
    IN fname VARCHAR(128),
    in lname VARCHAR(128)
)
BEGIN
	INSERT INTO tbl_USER(email, password, first_name, last_name)
	VALUES (em, sha2(pw,256), fname, lname);
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
    IN sub_category_name VARCHAR(256),
	IN arg_topic VARCHAR(256)
)
BEGIN
	DECLARE arg_owner_id, arg_sub_category_id, last_course_id INT UNSIGNED;
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
	SET last_course_id=LAST_INSERT_ID();
	IF arg_topic IS NOT NULL THEN
		INSERT INTO tbl_COURSE_TOPIC
		VALUES (last_course_id, arg_topic);
	END IF;
END
$$

CREATE PROCEDURE message(
	arg_from_id INT UNSIGNED,
    arg_to_id INT UNSIGNED,
    arg_content LONGTEXT
)
BEGIN 
	INSERT INTO tbl_MESSAGE(from_id, to_id, content)
    VALUES (arg_from_id, arg_to_id, arg_content);
END
$$
CREATE PROCEDURE insertTeacher(
	arg_instructor_id INT UNSIGNED,
    arg_course_id INT UNSIGNED,
    arg_permission BIT(8)
)
BEGIN
	INSERT INTO tbl_TEACH(instructor_id, course_id, permission)
    VALUES (arg_instructor_id, arg_course_id, arg_permssion);
END
$$
CREATE PROCEDURE insertAnnouncement(
    arg_course_id INT UNSIGNED,
	arg_instructor_id INT UNSIGNED,
    arg_content TEXT
)
BEGIN
	INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content)
    VALUES (arg_course_id, arg_instructor_id, arg_content);
END
$$

CREATE PROCEDURE insertSection(
	arg_course_id INT UNSIGNED,
    arg_section_name VARCHAR(256),
	arg_section_order INT UNSIGNED
)
BEGIN
	IF arg_section_order IS NULL THEN
		SELECT COUNT(*)+1 INTO arg_section_order
        FROM tbl_SECTION, tbl_COURSE
        WHERE id=course_id;
	END IF;
    INSERT INTO tbl_section(course_id, name, section_order)
    VALUES (arg_course_id, arg_section_name, arg_section_order);
END
$$
CREATE PROCEDURE insertItem(
	arg_course_id INT UNSIGNED,
    arg_name VARCHAR(256)
)
BEGIN
	INSERT INTO tbl_ITEM(course_id, name)
    VALUES (arg_course_id, arg_name);
END
$$
CREATE PROCEDURE insertLecture(
	arg_course_id INT UNSIGNED,
    arg_name VARCHAR(256)
)
BEGIN
	CALL insertItem(arg_course_id, arg_name);
    INSERT INTO tbl_LECTURE
    VALUES (LAST_INSERT_ID(), arg_course_id);
END
$$
CREATE PROCEDURE insertVideo(
	arg_course_id INT UNSIGNED,
    previewable BOOL,
    arg_duration DECIMAL(5,2),
    arg_url VARCHAR(256),
    arg_name VARCHAR(256)
)
BEGIN 
	CALL insertLecture(arg_course_id, arg_name);
    INSERT INTO tbl_VIDEO
    VALUES (LAST_INSERT_ID(), arg_course_id, IFNULL(previewable, DEFAULT(is_previewable)), arg_duration, arg_url);
END
$$
CREATE PROCEDURE addCaption(
	arg_course_id INT UNSIGNED,
	arg_item_name VARCHAR(256),
    list_of_captions VARCHAR(256) #"('English', 'vtt'), ('Spanish', 'another_vtt')"
)
BEGIN
	DECLARE arg_item_id INT UNSIGNED;
	SELECT item_id INTO arg_item_id	
    FROM tbl_item
    WHERE name=arg_item_name;
    SET @location = LOCATE("(", list_of_captions);
    WHILE  @location > 0 DO
		SELECT INSERT(list_of_captions, @location+1, 0, CONCAT(arg_item_id, ", ", arg_course_id, ", "));
        SET @location = LOCATE("(", list_of_captions, @location+1);
    END WHILE;
	SET @sql = CONCAT("INSERT INTO tbl_caption VALUES ", list_of_captions);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
