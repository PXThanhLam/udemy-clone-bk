USE DBS_Assignment;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE tbl_CONTEXT;
TRUNCATE TABLE tbl_ANSWER;
TRUNCATE TABLE tbl_QUESTION;
TRUNCATE TABLE tbl_TEACH;
TRUNCATE TABLE tbl_ENROLL;
TRUNCATE TABLE tbl_FINISH;
TRUNCATE TABLE tbl_MESSAGE;
TRUNCATE TABLE tbl_RESOURCE;
TRUNCATE TABLE tbl_LIBRARY_ENTRY;
TRUNCATE TABLE tbl_ASSIGNMENT_QUIZ;
TRUNCATE TABLE tbl_ASSIGNMENT;
TRUNCATE TABLE tbl_CODING_EXERCISE;
TRUNCATE TABLE tbl_QUIZ_ANSWER;
TRUNCATE TABLE tbl_QUIZ;
TRUNCATE TABLE tbl_PTQ;
TRUNCATE TABLE tbl_ARTICAL;
TRUNCATE TABLE tbl_VIDEO_SLIDE;
TRUNCATE TABLE tbl_CAPTION;
TRUNCATE TABLE tbl_LECTURE;
TRUNCATE TABLE tbl_VIDEO;
TRUNCATE TABLE tbl_COMPOSE;
TRUNCATE TABLE tbl_SECTION;
TRUNCATE TABLE tbl_ITEM;
TRUNCATE TABLE tbl_ANNOUNCEMENT;
TRUNCATE TABLE tbl_COURSE_TOPIC;
TRUNCATE TABLE tbl_COURSE;
TRUNCATE TABLE tbl_SUBCATEGORY;
TRUNCATE TABLE tbl_CATEGORY;
TRUNCATE TABLE tbl_USER;
SET FOREIGN_KEY_CHECKS = 1;

-- 													===== USER =====

INSERT INTO tbl_USER(
	email, 
	password, 
	first_name, 
	last_name
) VALUES (
	"vuongcuong@gmail.com",
	"bautroitucach",
	"Cuong",
	"Vuong"
);

INSERT INTO tbl_USER(
	email, 
	password, 
	first_name, 
	last_name, 
	headline
) VALUES (
	"quan.db.2709@gmail.com",
	"bestjungle2019",
	"Quan",
	"DB",
	"0346809059"
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	website,
	instructor_flag
) VALUES (
	"quan.tran@gmail.com",
	"12345678",
	"Quan",
	"Hoang Hot",
	"udemy-clone.com",
	TRUE
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	user_language,
	instructor_flag
) VALUES (
	"anh.thin@gmail.com",
	"thinmmtttss",
	"Thin",
	"Super",
	"Vietnamese",
	TRUE
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	profile_setting
) VALUES (
	"dat.nguyen@gmail.com",
	"passwordnaylacuadat",
	"Dat",
	"Nguyen Duong Minh Tam",
	TRUE
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	profile_picture
) VALUES (
	"lam.daihiep@gmail.com",
	"nhapthecuudoi",
	"Lam",
	"DH",
	"lamdh.jpg"
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	facebook
) VALUES (
	"user_test@gmail.com",
	"testpassword",
	"Nguoi dung",
	"Thu nghiem",
	"facebook.com/usertest"
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	youtube
) VALUES (
	"youtuber@gmail.com",
	"youtuberchuyennghiep",
	"Youtuber",
	"Chuyen nghiep",
	"youtube.com/youtuberchuyennghiep"
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	website,
	user_language,
	instructor_flag
) VALUES (
	"tri.dang@gmail.com",
	"tridanginfo",
	"Tri",
	"Dang",
	"tridang.info",
	"Vietnamese",
	TRUE
);

INSERT INTO tbl_USER (
	email,
	password,
	first_name,
	last_name,
	bigraphy,
	instructor_flag
) VALUES (
	"best.leesin@gmail.com",
	"nguoichoidirung",
	"Quan",
	"DB",
	"Tôi là người chơi đi rừng của team PPL, nhiệm vụ của tôi là F2W với chỉ số damage gây ra không tưởng thua cả con sp!",
	TRUE
);

-- SELECT * FROM tbl_USER ORDER BY id;

-- 													===== CATEGORY =====
INSERT INTO tbl_CATEGORY(name) VALUES ("Development");
INSERT INTO tbl_CATEGORY(name) VALUES ("Business");
INSERT INTO tbl_CATEGORY(name) VALUES ("Finance & Accounting");
INSERT INTO tbl_CATEGORY(name) VALUES ("IT & Software");
INSERT INTO tbl_CATEGORY(name) VALUES ("Office Productivity");
INSERT INTO tbl_CATEGORY(name) VALUES ("Personal Development");
INSERT INTO tbl_CATEGORY(name) VALUES ("Design");
INSERT INTO tbl_CATEGORY(name) VALUES ("Marketing");
INSERT INTO tbl_CATEGORY(name) VALUES ("Lifestyle");
INSERT INTO tbl_CATEGORY(name) VALUES ("Photography");
INSERT INTO tbl_CATEGORY(name) VALUES ("Health & Fitness");
INSERT INTO tbl_CATEGORY(name) VALUES ("Music");

-- SELECT * FROM tbl_CATEGORY ORDER BY id;

-- 													===== SUBCATEGORY =====
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Web Development", 1);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Data Science", 1);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Mobile Apps", 1);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Finance", 2);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Entrepreneurship", 2);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Communication", 2);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("IT Certification", 4);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Network & Security", 4);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Hardware", 4);
INSERT INTO tbl_SUBCATEGORY(name, category_id) VALUES ("Operating System", 4);

-- SELECT * FROM tbl_SUBCATEGORY ORDER BY id;

-- 													===== COURSE =====
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("James-Golden", "Thomas PLC", "Star usually quite have oil leg age. Moment energy dark car real mention. Might two forward see. Attack receive age special yet society spend.", TRUE, "https://smith.com/", "https://placeimg.com/422/726/any", 19.99, "Admit whom would return Mrs approach miss. Data think step wear care. Address recognize shake off surface.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Jordan-Graham", "Moore PLC", "Activity whether area yard top say. Piece away far charge large develop culture draw.Speak subject dinner try read thing. Watch collection to story require. Ok write though whether back really.", TRUE, "http://www.martin.net/", "https://placeimg.com/875/136/any", 19.99, "Teacher left girl light look idea. Build drive stop stock government. Everybody building indicate small partner store.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Tucker, Miller and Rogers", "Perkins, Zimmerman and Snow", "Another before resource indicate somebody perform system find. Door ten notice run end build happen difficult. Easy within then particularly school heart. Defense PM movie arrive push hope.", TRUE, "http://brown.com/", "https://dummyimage.com/990x835", 19.99, "Board there shoulder expert full answer. Buy interview try method bad. Them word head program. Buy senior public quite. Officer that prove service.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Allison, Campbell and Watson", "King, Bell and Rivera", "Teach necessary try year night approach form. Manager letter option lose Congress recognize source. Choice cut main red walk impact trade. Friend fish catch country middle fish.", TRUE, "https://peters-yoder.info/", "https://dummyimage.com/464x678", 19.99, "Space affect hospital weight drive expect. A reach crime learn. Fill create alone remain blood cup anything rather. Now whether raise part future together less.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Osborne, Lowe and Green", "Nelson-Montes", "What this father father enough positive never. Thing total term mean. Prepare gun go phone. Activity take beautiful pull prove. Today entire push.", TRUE, "https://townsend.com/", "https://placeimg.com/268/514/any", 19.99, "American couple coach have notice education. Another edge treatment seem color right late. Eat trouble similar bed policy performance side. Heart story rise PM way. Seat language least.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Davis-Powell", "Whitney-Schwartz", "Must occur choice trial source kind usually. President measure remember difficult often tonight attention. That fight name attention threat. Man for treat quality. Way world hold other everybody.", TRUE, "https://kline-nelson.org/", "https://placekitten.com/249/976", 19.99, "Debate note film cultural. Popular school everything above member help seem. You two example. Bad animal have often. Of beyond kind summer without quality kitchen wrong. Exist economy free score.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Li, Singleton and Parker", "Thompson-Craig", "Low which father second both. Develop I reflect pattern traditional may possible far. Ago spring better guess. Including short fast shake. Reach character however tough institution training.", TRUE, "https://day-mayer.net/", "https://placekitten.com/856/757", 19.99, "Within system attention truth individual measure. Conference series such hotel bank painting lose. View baby strategy experience result. Forget news machine.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Price-Anderson", "Richardson, Brown and Martinez", "Consider back former may. Represent Republican budget. Move professional return organization pretty order very. Join even interest. Can rich key war. Rather laugh film.", TRUE, "https://jones.biz/", "https://www.lorempixel.com/770/360", 19.99, "Service wonder experience ability. Administration action store whom prevent single age skin. Best rise value factor world adult. Different anyone if note. So husband forward piece.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Baker and Sons", "Thompson, Flores and Butler", "Type different room. Check would edge general scene would. Thank six build scientist.", TRUE, "https://kim.com/", "https://placeimg.com/868/470/any", 19.99, "Commercial watch media like family. Officer many evidence authority. South by body design side reality but. Table onto describe remain happen. Want pick amount our than.", 9, 1);
-- 
-- INSERT INTO tbl_COURSE(main_title, sub_title, description, publish_status, promotional_video, image, price, welcome_message, owner_id, sub_category_id) VALUES ("Rodriguez, Williams and Smith", "Brady and Sons", "Student city follow modern. By sort bill glass at act street. Community move quality organization have lay. Certainly available letter word vote.", TRUE, "https://www.martinez.info/", "https://www.lorempixel.com/377/550", 19.99, "Toward new they pretty property trouble. Man you travel student.", 9, 1);



-- SELECT * FROM tbl_COURSE ORDER BY id;

-- 													===== COURSE_TOPIC =====
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (1, "Python");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (2, "JavaScript");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (4, "Java");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (3, "Unity");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (2, "Vue.JS");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (2, "PHP");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (1, "Django");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (3, "C#");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (4, "Android Development");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (5, "Machine Learning");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (8, "Machine Learning");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (5, "Python");
INSERT INTO tbl_COURSE_TOPIC(course_id, topic) VALUES (6, "WordPress");

-- SELECT * FROM tbl_COURSE_TOPIC ORDER BY course_id;

-- 													===== ANNOUNCEMENT =====
INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Behind born on shake raise officer. Consumer democratic near manage despite program. Notice reality police its adult.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Movie election visit single energy student. Mention for build it. Yeah better who they paper force gun.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Agreement series energy character north model wall.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Change reach administration line current. Current high good shoulder former animal industry.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "General couple turn position. Oil too avoid.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Treat statement defense. Even appear school example. Now together face leave. Choose my or large feel do position.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Pm good data treatment body media south color. Sea cut speak about very marriage.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Beautiful ever these. Five food house loss herself trip. Star field finally image now my begin. Three right up some amount.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Without teacher small put. International major down serve station.");

INSERT INTO tbl_ANNOUNCEMENT(course_id, instructor_id, content) VALUES (1, 1, "Mind pressure southern again fly allow. Leader national sit. Six send much develop water call.");

-- SELECT * FROM tbl_ANNOUNCEMENT ORDER BY id;

-- 													===== SECTION =====
INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Smith Inc", 1);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Brooks-Lopez", 2);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Castaneda-Wood", 3);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Chandler Inc", 4);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Johnson, Brown and Gardner", 5);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Carlson-Smith", 6);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Lawrence Ltd", 7);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Lee Ltd", 8);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Riddle, Baker and Young", 9);

INSERT INTO tbl_SECTION(course_id, name, section_order) VALUES (1, "Cummings-Castillo", 10);

-- SELECT * FROM tbl_SECTION ORDER BY section_id;

-- 													===== LIBRARY_ENTRY =====
INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Johnson, Graves and Flores", "http://www.barr.com/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Brown-Jones", "http://www.hood-edwards.info/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Dougherty-Grant", "https://hayes.com/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Edwards-Short", "https://www.brown.com/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Mckay-Cox", "https://www.ford.com/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Clay PLC", "https://padilla.net/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Riley and Sons", "http://welch.com/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Sweeney, Adkins and Novak", "http://www.clark-fletcher.com/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Santana-Rodgers", "http://www.hopkins.com/");

INSERT INTO tbl_LIBRARY_ENTRY(instructor_id, title, url) VALUES (9, "Green-Freeman", "https://www.beard-walker.net/");

-- SELECT * FROM tbl_LIBRARY_ENTRY ORDER BY id;

-- 													===== MESSAGE =====
-- INSERT INTO tbl_MESSAGE(from_id, to_id, content) VALUES (1, 1, "");

-- SELECT * FROM tbl_MESSAGE ORDER BY from_id;

-- 													===== QUESTION =====
INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Cell professor his. Star candidate see question doctor reason.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Race show language western here eat thus. Get development get speak speak outside.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Score major whatever draw nor. Cut available sit. Increase listen despite help.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Doctor evening including range gas minute important. Bit ever past form can where country.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Customer civil science while. Always so majority week laugh. Not scene send relate for.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Education Republican quite degree begin father too. Second national cost ever whole style. Final since event talk.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Perform seven carry theory reality spend Mr art.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Than market great new life. Best push boy road. Author ground front good above truth nature quickly.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Very economic interview school consumer. Behavior morning source teach above seat drive hand.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Wide all campaign key be. Education chance enter at call pay.");

SELECT * FROM tbl_QUESTION ORDER BY id;