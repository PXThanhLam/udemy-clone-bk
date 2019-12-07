USE DBS_Assignment;
DELIMITER $$
CREATE TRIGGER trg_insertCourse
BEFORE INSERT
ON tbl_course FOR EACH ROW
BEGIN
	IF (SELECT instructor_flag FROM tbl_user WHERE id = NEW.owner_id) IS FALSE 
		THEN SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is not a instructor';
	END IF;
	INSERT INTO tbl_TEACH
	VALUES (NEW.owner_id, NEW.id, DEFAULT, DEFAULT);
    IF (NEW.price < 0.0) THEN
		SET NEW.price = DEFAULT(tbl_course.price);
	END IF;
END
$$
CREATE TRIGGER trg_insertUser
BEFORE INSERT
ON tbl_user FOR EACH ROW
BEGIN
	DECLARE pw VARCHAR(256);
    IF (NEW.email REGEXP '^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$') IS FALSE THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Wrong email address';
	END IF;
END
$$
CREATE TRIGGER trg_teach
BEFORE INSERT
ON tbl_teach FOR EACH ROW
BEGIN
	IF (SELECT instructor_flag FROM tbl_user WHERE id = NEW.instructor_id) IS FALSE
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'User is not an instructor';
    END IF;
END
$$
CREATE TRIGGER trg_message
BEFORE INSERT
ON tbl_message FOR EACH ROW
# check to_id is in a course of from_id
BEGIN
	IF NEW.to_id IN (SELECT DISTINCT instructor_id
		FROM tbl_TEACH
		WHERE course_id IN (SELECT course_id FROM tbl_enroll WHERE user_id = from_id)) 
    OR NEW.from_id IN (SELECT DISTINCT instructor_id
		FROM tbl_TEACH
		WHERE course_id IN (SELECT course_id FROM tbl_enroll WHERE user_id = to_id))
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Student not in your course';
    END IF;
END
$$
CREATE TRIGGER trg_insertFinish
BEFORE INSERT
ON tbl_finish FOR EACH ROW
BEGIN
	IF NEW.user_id IN (SELECT user_id FROM tbl_enroll e WHERE e.course_id = NEW.course_id) IS FALSE
		THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'User hasn\'t enroll course yet';
    END IF;
END
$$
CREATE TRIGGER trg_announcement 
BEFORE INSERT 
ON tbl_announcement FOR EACH ROW
BEGIN
	IF (SELECT permission FROM tbl_teach t WHERE t.course_id = NEW.course_id AND t.instructor_id = NEW.instructor_id) & b'10000000' = b'00000000'
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'User has not permission to anounce';
    END IF;
END