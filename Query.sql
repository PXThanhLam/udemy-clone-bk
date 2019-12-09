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

-- 																	AGGREATE QUERY

-- Liet ke 10 course co rating cao nhat sap xep theo rating
SELECT c.id, AVG(rating) as average_rating
FROM tbl_COURSE c, tbl_ENROLL e
WHERE c.id = e.course_id
GROUP BY c.id
ORDER BY average_rating
LIMIT 10;

-- Liet ke 10 topic thinh hanh nhat trong 1 subcategory "Math" sap xep theo do thinh hanh
SELECT t.topic, COUNT(*) AS popularity
FROM tbl_COURSE_TOPIC t, tbl_ENROLL e
WHERE t.course_id = e.course_id AND t.course_id IN (SELECT c.id FROM tbl_COURSE c, tbl_SUBCATEGORY s WHERE c.sub_category_id = s.id AND c.name="Math")
GROUP BY t.topic
ORDER BY popularity
LIMIT 10;

-- find the total number of distinct course student in each category
SELECT cate.name, COUNT(DISTINCT e.user_id)
FROM tbl_COURSE c, tbl_SUBCATEGORY s, tbl_ENROLL e, tbl_CATEGORY cate
WHERE s.category_id=cate.id AND c.sub_category_id=s.id AND e.course_id=c.id
GROUP BY cate.name;

--
-- find number of user who has no card --

SELECT COUNT(DISTINCT u.id) AS NUMBER_OF_USER_WITHOUT_CARD 
FROM tbl_USER u WHERE u.id NOT IN (
 SELECT DISTINCT user_id FROM tbl_CARD
);
-- find number of user who has more than one card --

SELECT COUNT(DISTINCT user_id) AS NUMBER_OF_USER_WITH_MORE_THAN_ONE_CARD 
FROM tbl_CARD 
GROUP BY user_id
HAVING COUNT(user_id) > 1

