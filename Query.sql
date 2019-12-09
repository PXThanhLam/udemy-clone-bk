USE DBS_Assignment;

# select user's name and user's course finish
SELECT first_name, main_title 
FROM tbl_USER u, tbl_COURSE c, tbl_FINISH f 
WHERE u.id = f.user_id AND c.id = f.course_id 
GROUP BY first_name;

#select user's name and user's course name and enroll date
SELECT first_name, main_title, enroll_date 
FROM tbl_ENROLL e
JOIN tbl_USER u ON e.user_id = u.id 
JOIN tbl_COURSE c ON e.course_id = c.id 
GROUP BY first_name 
ORDER BY enroll_date;

-- 																QUERIES FROM (AT LEAST) 2 TABLES
-- Liet ke nhung Course thuoc Topic co topic = "Python" va topic = "Java"
SELECT * 
FROM tbl_COURSE AS tc, tbl_COURSE_TOPIC AS tct 
WHERE tc.id = tct.course_id AND tct.topic = "Python" AND tct.topic = "Java";

-- Liet ke nhung Course co Closed Caption = "English" va "Italiano"
SELECT tc.*
FROM tbl_COURSE AS tc, tbl_CAPTION AS tcap
WHERE tcap.caption_language = "English" AND tcap.caption_language = "Italiano" AND tc.id = tcap.course_id;

-- Liet ke nhung Section trong Course co main_title = "Angular 8 - The Complete Guide"
SELECT ts.name
FROM tbl_SECTION AS ts, tbl_COURSE AS tc
WHERE ts.course_id = tc.id

-- Liet ke nhung Student da Enroll vao Course co main_title = "Learn Ethical Hacking From Scratch"
SELECT tu.*
FROM tbl_USER AS tu, tbl_ENROLL AS te, tbl_COURSE AS tc
WHERE tu.student_flag = TRUE AND te.user_id = tu.id AND te.course_id = tc.id AND tc.main_title = "Learn Ethical Hacking From Scratch";

-- Liet ke nhung 

-- Liet ke nhung Question duoc hoi boi User co first_name = "Quan", last_name = "DB" va duoc hoi trong Course co main_title = "The Web Development Bootcamp"
SELECT tq.*
FROM tbl_QUESTION AS tq, tbl_USER AS tu, tbl_COURSE AS tc
WHERE tq.student_id = tu.id AND tq.course_id = tc.id;

-- Liet ke nhung Topic duoc day boi cac Instructor co first_name = "Thanh" va last_name = "Vo Khac"
SELECT *
FROM tbl_COURSE_TOPIC
WHERE course_id IN (
	SELECT tc.id 
	FROM tbl_COURSE AS tc, tbl_USER AS tu, tbl_TEACH AS tt
	WHERE tu.first_name = "Thanh" AND tu.last_name = "Vo Khac" AND tt.course_id = tc.id AND tt.instructor_id = tu.id
);

-- 																	NESTED QUERIES
# select content message from user 'cuong' to user 'quan'
SELECT content 
FROM tbl_MESSAGE 
WHERE 
from_id in (SELECT id FROM tbl_USER WHERE email = 'cuong@udemy.com') 
AND 
to_id in (SELECT id FROM tbl_USER WHERE email = 'quan@udemy.com');

# select lecture's name in course 'Learn Database System'
SELECT name 
FROM tbl_LECTURE
WHERE item_id IN 
(SELECT item_id FROM tbl_COMPOSE WHERE course_id_item IN 
	(SELECT id AS course_id_item FROM tbl_COURSE WHERE main_title = 'Learn Database System')
);

-- Liet ke nhung Course thuoc ca 2 Subcategory co name = "Web Developer" va "Programming Languages"
SELECT * FROM tbl_COURSE WHERE sub_category_id IN (
	SELECT id FROM tbl_SUBCATEGORY WHERE name  = "Web Developer" AND name = "Programming Languages"
);

-- Liet ke nhung Course thuoc Category co name = "Development"
SELECT * FROM tbl_COURSE WHERE sub_category_id IN (
	SELECT id FROM tbl_SUBCATEGORY WHERE category_id IN (
		SELECT id FROM tbl_CATEGORY WHERE name = "Development"
	)
);

-- Liet ke nhung Announcement duoc thong bao boi Instructor co email = "vuongcuong@gmail.com" trong Course co main_title = "The Web Developer Bootcamp"
SELECT * FROM tbl_ANNOUNCEMENT 
WHERE
instructor_id IN (SELECT id FROM tbl_USER WHERE email = "vuongcuong@gmail.com")
AND 
course_id IN (SELECT id FROM tbl_COURSE WHERE main_title = "The Web Developer Bootcamp");

