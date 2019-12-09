USE DBS_Assignment;

DROP TRIGGER IF EXISTS trg_answer;
DROP TRIGGER IF EXISTS trg_message;
DROP TRIGGER IF EXISTS trg_update_teach;
DROP TRIGGER IF EXISTS trg_insertUser;
DROP TRIGGER IF EXISTS trg_deleteCourse;
DROP TRIGGER IF EXISTS trg_insertCourse;

DELIMITER $$
CREATE TRIGGER trg_insertCourse
BEFORE INSERT
ON tbl_COURSE FOR EACH ROW
BEGIN
	IF (SELECT instructor_flag FROM tbl_USER WHERE id = NEW.owner_id) IS FALSE 
		THEN SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is not a instructor';
	END IF;
	
END
$$
CREATE TRIGGER trg_deleteCourse
BEFORE DELETE
ON tbl_COURSE FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM tbl_ENROLL WHERE course_id=OLD.id AND is_archive=FALSE) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Can not delete. Some users still enroll and has not yet archived';
	END IF;
END
$$
CREATE TRIGGER trg_insertUser
BEFORE INSERT
ON tbl_USER FOR EACH ROW
BEGIN
	DECLARE pw VARCHAR(256);
    SET pw = NEW.password;
	IF (pw REGEXP '.*[0-9].*'  and pw REGEXP '.*[A-Za-z].*' and pw REGEXP "[^ ]*[!@#$%^&'][^ ]*" and CHAR_LENGTH(pw) >= 8)  THEN
		SET NEW.password = SHA2(pw, 256);
	ELSE SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Password must contains at least a number, an alphabetical character and a special character';
    END IF;
    IF (NEW.email REGEXP '^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$') IS FALSE THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Wrong email address';
	END IF;
END
$$
CREATE TRIGGER trg_update_teach
AFTER UPDATE
ON tbl_TEACH FOR EACH ROW
BEGIN
	SET @total_share = (SELECT SUM(share) FROM tbl_TEACH WHERE course_id=NEW.course_id);
    IF @total_share > 100.00 THEN
		UPDATE tbl_TEACH
        SET share=100.00 * (share / @total_share)
        WHERE course_id = NEW.course_id;
	END IF;
    IF NEW.permission | b'01111111' = b'01111111' AND (NEW.permission & 
		b'00001000' = b'00001000' OR NEW.permission & b'00000100' = b'00000100') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Instructor not visible cant have review or qa permission';
	END IF;
    IF new.permission & b'01000000' = b'01000000'  AND NEW.permission | b'11011111' = b'11011111' THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Instructor with managed permission will have caption permission';
    END IF;
    IF NEW.share > 0.0  AND NEW.permission | b'11111110' = b'11111110' THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Instructor with share > 0 can view report';
    END IF; 
END
$$
CREATE TRIGGER trg_message
BEFORE INSERT
ON tbl_MESSAGE FOR EACH ROW
# check to_id is in a course of from_id
BEGIN
	IF NEW.to_id IN (SELECT DISTINCT instructor_id
		FROM tbl_TEACH
		WHERE course_id IN (SELECT * FROM tbl_ENROLL WHERE user_id = from_id)) 
    OR NEW.from_id IN (SELECT DISTINCT instructor_id
		FROM tbl_TEACH
		WHERE course_id IN (SELECT * FROM tbl_ENROLL WHERE user_id = to_id))
    THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Student not in your course';
    END IF;
END
$$

CREATE TRIGGER trg_answer
BEFORE INSERT
ON tbl_ANSWER FOR EACH ROW
BEGIN 
	IF NOT EXISTS (SELECT * FROM tbl_ENROLL e WHERE e.user_id = NEW.user_id) THEN
		SET @course_id = (SELECT course_id FROM tbl_QUESTION WHERE id=NEW.question_id);
		IF NOT EXISTS (SELECT * FROM tbl_TEACH WHERE course_id=@course_id AND instructor_id=NEW.user_id) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Illegal answer. This user is not a student or teacher of this course.';
        END IF;
		IF (SELECT permission FROM tbl_TEACH t WHERE t.course_id = 
		@course_id AND t.instructor_id = NEW.user_id) & b'00001000' = b'00000000' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'This instructor does not have permission';
        END IF;
    END IF;
END

