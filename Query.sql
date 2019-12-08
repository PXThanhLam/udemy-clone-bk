USE dbs_assignment;
# select user's name and user's course finish
SELECT first_name, main_title 
FROM tbl_user u, tbl_course c, tbl_finish f 
WHERE u.id = f.user_id AND c.id = f.couser_id 
GROUP BY first_name;

#select user's name and user's course name and enroll date
SELECT first_name, main_title, enroll_date 
FROM tbl_enroll 
JOIN tbl_user ON user_id = id 
JOIN tbl_course ON course_id = id 
GROUP BY first_name 
ORDER BY enroll_date;

# select content message from user 'cuong' to user 'quan'
SELECT content 
FROM tbl_message 
WHERE 
from_id in (SELECT id FROM tbl_user WHERE email = 'cuong@udemy.com') 
AND 
to_id in (SELECT id FROM tbl_user WHERE email = 'quan@udemy.com');

# select lecture's name in course 'Learn Database System'
SELECT name 
FROM tbl_lecture
WHERE item_id IN 
(SELECT item_id FROM tbl_compose WHERE course_id_item IN 
	(SELECT id AS course_id_item FROM tbl_course WHERE main_title = 'Learn Database System')
);

SELECT content 
FROM tbl_announcement
WHERE instructor_id in (SELECT id FROM tbl_user WHERE email = 'instructor@udemy.com')