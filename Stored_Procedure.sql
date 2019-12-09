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
DROP PROCEDURE IF EXISTS loginUser;
DROP PROCEDURE IF EXISTS addResource;
DROP PROCEDURE IF EXISTS insertVideoSlide;
DROP PROCEDURE IF EXISTS insertPTQ;
DROP PROCEDURE IF EXISTS insertQuiz;
DROP PROCEDURE IF EXISTS checkPrimaryCoupon;
DROP PROCEDURE IF EXISTS enrollCourse;

DELIMITER $$
-- CREATE PROCEDURE insertUser(
-- 	IN em VARCHAR(256),
--     IN pw VARCHAR(256),
--     IN fname VARCHAR(128),
--     in lname VARCHAR(128)
-- )
-- BEGIN
-- 	INSERT INTO tbl_USER(email, password, first_name, last_name)
-- 	VALUES (em, pw, fname, lname);
-- END
-- $$

CREATE PROCEDURE loginUser(
	arg_email VARCHAR(256),
    arg_password VARCHAR(256)
)
BEGIN
	SELECT COUNT(*)
    FROM tbl_user
    WHERE email=arg_email AND passowrd=SHA2(arg_password,256);
END
$$
-- CREATE PROCEDURE insertCategory(
-- 	IN category_name VARCHAR(256),
--     IN sub_category_name VARCHAR(256)
-- )
-- BEGIN
-- 	DECLARE arg_category_id INT UNSIGNED;
-- 	INSERT INTO tbl_CATEGORY(name)
--     VALUES (category_name);
--     SELECT id INTO arg_category_id
--     FROM tbl_CATEGORY
--     WHERE name=category_name;
--     INSERT INTO tbl_SUBCATEGORY(name, category_id)
--     VALUES (sub_category_name, arg_category_id);
-- END
-- $$
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
	IN arg_topic VARCHAR(256) #"'topic 1', 'topic 2'"
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
    INSERT INTO tbl_TEACH
	VALUES (arg_owner_id, last_course_id, DEFAULT(tbl_teach.share), DEFAULT(tbl_teach.permission));
   
    IF arg_topic IS NOT NULL THEN
		CREATE TEMPORARY TABLE topic_value(val VARCHAR(1024));
		SET @sql = CONCAT("INSERT INTO topic_value VALUES (", arg_topic, ")");
		PREPARE stmt FROM @sql;
		EXECUTE stmt;
		INSERT INTO tbl_COURSE_TOPIC
		SELECT last_course_id, val
        FROM topic_value;
        DROP TABLE topic_value;
	END IF;
END
$$

-- CREATE PROCEDURE message(
-- 	arg_from_id INT UNSIGNED,
--     arg_to_id INT UNSIGNED,
--     arg_content LONGTEXT
-- )
-- BEGIN 
-- 	INSERT INTO tbl_MESSAGE(from_id, to_id, content)
--     VALUES (arg_from_id, arg_to_id, arg_content);
-- END
-- $$
-- CREATE PROCEDURE insertTeacher(
-- 	arg_instructor_id INT UNSIGNED,
--     arg_course_id INT UNSIGNED,
--     arg_permission BIT(8),
--     arg_share DECIMAL(5,2)
-- )
-- 	INSERT INTO tbl_TEACH(instructor_id, course_id, permission)
--     VALUES (arg_instructor_id, arg_course_id, arg_permssion);
-- END
$$
-- CREATE PROCEDURE insertAnnouncement(
--     arg_course_id INT UNSIGNED,
-- 	arg_instructor_id INT UNSIGNED,
--     arg_content TEXT
-- )
-- BEGIN
-- 	INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content)
--     VALUES (arg_course_id, arg_instructor_id, arg_content);
-- END
-- $$

-- CREATE PROCEDURE insertSection(
-- 	arg_course_id INT UNSIGNED,
--     arg_section_name VARCHAR(256)
-- )
-- BEGIN
-- 	DECLARE arg_section_order INT UNSIGNED;
-- 	SELECT COUNT(*)+1 INTO arg_section_order
-- 	FROM tbl_SECTION
-- 	WHERE course_id=arg_course_id;
-- 	INSERT INTO tbl_section(course_id, name, section_order)
-- 	VALUES (arg_course_id, arg_section_name, arg_section_order);
-- END
-- $$
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
	arg_name VARCHAR(256),
    previewable BOOL,
    arg_duration DECIMAL(5,2),
    arg_url VARCHAR(256)
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
		SET list_of_captions = INSERT(list_of_captions, @location+1, 0, CONCAT(arg_item_id, ", ", arg_course_id, ", "));
        SET @location = LOCATE("(", list_of_captions, @location+1);
    END WHILE;
	SET @sql = CONCAT("INSERT INTO tbl_caption VALUES ", list_of_captions);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
$$
CREATE PROCEDURE addResource(
	arg_course_id INT UNSIGNED,
	arg_item_name VARCHAR(256),
    list_of_resources VARCHAR(256) #"('title1', 'url'), ('title2', 'url')"
)
BEGIN
	DECLARE arg_item_id INT UNSIGNED;
	SELECT item_id INTO arg_item_id	
    FROM tbl_item
    WHERE name=arg_item_name;
    SET @location = LOCATE("(", list_of_resources);
    WHILE  @location > 0 DO
		SET list_of_resources= INSERT(list_of_captions, @location+1, 0, CONCAT(arg_item_id, ", ", arg_course_id, ", "));
        SET @location = LOCATE("(", list_of_resources, @location+1);
    END WHILE;
	SET @sql = CONCAT("INSERT INTO tbl_resource VALUES ", list_of_resources);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
$$
CREATE PROCEDURE insertVideoSlide(
	arg_course_id INT UNSIGNED,
	arg_name VARCHAR(256),
    arg_duration DECIMAL(5,2),
    arg_slide_url VARCHAR(256),
	arg_video_url VARCHAR(256),
    arg_sync_url VARCHAR(256)
)
BEGIN
	CALL insertLecture(arg_course_id, arg_name);
    INSERT INTO tbl_VIDEO_SLIDE
    VALUES (LAST_INSERT_ID(), arg_course_id, arg_slide_url, arg_sync_url, 
		arg_video_url, IFNULL(arg_duration, DEFAULT(duration)));
END
$$
CREATE PROCEDURE insertPTQ(
	arg_course_id INT UNSIGNED,
    arg_item_name VARCHAR(256),
    arg_mimimum_score INT,
    arg_is_randomize BOOL,
    arg_description LONGTEXT
)
BEGIN
	CALL insertItem(arg_course_id, arg_item_name);
    INSERT INTO tbl_PTQ
    VALUES (LAST_INSERT_ID(), arg_course_id, arg_minimum_score, arg_is_randomize, 
		arg_description);
END
$$
CREATE PROCEDURE insertQuiz(
	arg_item_id INT UNSIGNED,
    arg_course_id INT UNSIGNED,
    arg_content LONGTEXT,
    arg_knowledge_area VARCHAR(64),
    list_of_answers VARCHAR(256) #"('The frog is an animal', 1), ('The frog is a thing', 0)"
)
BEGIN
	START TRANSACTION;
		INSERT INTO tbl_quiz(item_id, course_id, content, knowledge_area)
		VALUES (arg_item_id, arg_course_id, arg_content, arg_knowledege_area);
		SET @inserted_id = LAST_INSERT_ID();
		SET @location = LOCATE("(", list_of_answers);
		WHILE  @location > 0 DO
			SET list_of_answers = INSERT(list_of_captions, @location+1, 0, CONCAT(@inserted_id, ", ", arg_item_id, 
				", ", arg_course_id, ", "));
			SET @location = LOCATE("(", list_of_answers, @location+1);
		END WHILE;
		SET @sql = CONCAT("INSERT INTO tbl_quiz_answer VALUES ", list_of_answers);
		PREPARE stmt FROM @sql;
		EXECUTE stmt;
    COMMIT;
END
$$
CREATE PROCEDURE checkPrimaryCoupon()
BEGIN
	DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_coupon_code CHAR(10);
	DECLARE cursorForCoupon CURSOR FOR 
    SELECT 
		coupon_code
	FROM
		tbl_COUPON
	WHERE 
		is_primary=TRUE AND expired_date < NOW();
	
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done=TRUE;
	OPEN cursorForCoupon;
	START TRANSACTION;
	read_loop: LOOP
		FETCH cursorForCoupon INTO v_coupon_code;
        IF v_done THEN
			LEAVE read_loop;
		END IF;
        INSERT IGNORE INTO tbl_DISCOUNT
        SELECT course_id, v_coupon_code
        FROM tbl_COURSE;
	END LOOP;
    COMMIT;
    CLOSE cursorForCoupon;
END
$$

CREATE EVENT IF NOT EXISTS expiredEvent
ON SCHEDULE
EVERY 1 HOUR
COMMENT 'Coupon expired'
DO
BEGIN
DELETE FROM tbl_COUPON WHERE expired_date > NOW();
END
$$

CREATE PROCEDURE enrollCourse(
	arg_user_id INT UNSIGNED,
    arg_course_id INT UNSIGNED,
    arg_paid_price DECIMAL(10,2)
)
BEGIN
	IF EXISTS (SELECT * FROM tbl_teach WHERE course_id=arg_course_id AND instructor_id=arg_user_id) THEN
		 SIGNAL SQLSTATE '45000'
		 SET MESSAGE_TEXT = 'Instructor cannot enroll';
    END IF;
	INSERT INTO tbl_enroll(user_id, course_id, paid_price)
    VALUES (arg_user_id, arg_course_id, arg_paid_price);
    SET @welcome_message = (SELECT welcome_message FROM tbl_course WHERE id=arg_course_id);
    IF @welcome_message IS NOT NULL THEN
		INSERT INTO tbl_message(from_id, to_id, content)
        SELECT owner_id, arg_user_id, welcome_message
        FROM tbl_course
        WHERE id=arg_course_id;
    END IF;
END