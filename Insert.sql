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
	"PPGC%ja&_8",
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
	"44LVcJaR^o",
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
	"6aDHp4Am^x",
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
	"!)e8IgsdRc",
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
	"29RFwxep!Q",
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
	"_jX!a6nf0n",
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
	"$BAFZdp*3*",
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
	"ZjTedhof!0",
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
	"At&2DL56*9",
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
	"Pq!0CCac4S",
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
-- CALL insertCourse(:arg_main_title, :arg_sub_title, :arg_description, :arg_promotional_video, :arg_image, :arg_course_language, :arg_course_level, :arg_price, :arg_welcome_message, :owner_email, :sub_category_name, :arg_topic);

CALL insertCourse("Roy LLC", "Lee-Kennedy", "Stand person certainly start no lot development training.", "http://www.hunt.net/", "https://dummyimage.com/80x787", "Aruba", "Expert", 19.99, "Easy hit forward them leave food image. Ready how what close individual goal dinner.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Bailey Ltd", "Thompson, Knapp and Fitzgerald", "Top pull fall into anyone can. True stage on professor ability continue carry. Unit identify wait war trial husband group.", "http://lang.com/", "https://dummyimage.com/371x70", "Somalia", "All Levels", 19.99, "Phone medical tend difference these development rich. By sign majority. Painting true since offer. Second because by.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Jackson, Lee and Barry", "Harrison Inc", "Fast east best plant address notice responsibility. Bar together relate effort table positive alone. Light growth to hand.", "https://brown.com/", "https://placeimg.com/500/603/any", "Monaco", "Intermidate", 19.99, "Country include record chance house let dark. Wear meet I treat. Ever these build business painting after.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Adams-Miller", "Ward, Thompson and Trevino", "Former political manage professional hope none base. Should summer reach parent. Think many interest hot treat score.", "https://kennedy.com/", "https://placeimg.com/245/673/any", "Vanuatu", "Beginner", 19.99, "Huge beyond other build federal wish try. Necessary direction prevent. Protect chair ready wind scene.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Cook, Hicks and Olson", "Clarke, Garcia and Gross", "Detail practice professional. Kid lay picture expect style watch.", "https://www.meyer.com/", "https://placeimg.com/833/94/any", "Uruguay", "Intermidate", 19.99, "Animal show successful old. Live huge police movement issue want.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Ballard, Rice and Freeman", "Lopez, Green and Downs", "Son should grow behind. Guess much majority fund author.", "https://hart.com/", "https://dummyimage.com/601x736", "Brunei Darussalam", "All Levels", 19.99, "Partner international test position. Amount house spring lose put resource crime. Authority maintain office unit buy page.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Holmes, Foley and Rhodes", "Snyder-Pope", "Your skin mention develop paper defense particularly. Candidate see relate. Tell evening she success.", "https://serrano-rush.com/", "https://placekitten.com/531/187", "Timor-Leste", "Expert", 19.99, "Second top minute people. Must doctor staff often assume treat strong. Experience important tax sea similar.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Robinson-Walker", "Garcia, Colon and Cobb", "There represent trouble good cause own economic. Later into mother ball. And others simply control great sit one.", "http://mercado.com/", "https://placekitten.com/232/87", "Sweden", "Intermidate", 19.99, "Local day full notice. Listen seat husband require.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Stevens, Clark and Sanders", "Simpson Inc", "Western across sell cultural. Actually never data change high.", "http://www.campbell-brewer.com/", "https://placekitten.com/324/568", "Greece", "Expert", 19.99, "See administration shake general population. Lot its staff network partner reach can during. Democratic stay above state.", "tri.dang@gmail.com", "Web Development", "'Python'");

CALL insertCourse("Short-Cochran", "Davenport-Graves", "Pass other four team often. Far money speak Congress. Trade piece street city such.", "http://www.chen-reed.com/", "https://placeimg.com/697/18/any", "Sri Lanka", "All Levels", 19.99, "Bill plant exist major born if. Up end official true.", "tri.dang@gmail.com", "Web Development", "'Python'");

SELECT * FROM tbl_COURSE ORDER BY id;

-- 													===== COURSE_TOPIC =====

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