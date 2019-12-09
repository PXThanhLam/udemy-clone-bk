USE DBS_Assignment;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE tbl_DISCOUNT;
TRUNCATE TABLE tbl_AFFECTED_BY;
TRUNCATE TABLE tbl_COUPON;
TRUNCATE TABLE tbl_SHOPPING_CART_COURSE;
TRUNCATE TABLE tbl_SHOPPING_CART;
TRUNCATE TABLE tbl_CONTEXT;
TRUNCATE TABLE tbl_ANSWER;
TRUNCATE TABLE tbl_QUESTION;
TRUNCATE TABLE tbl_TEACH;
TRUNCATE TABLE tbl_ENROLL;
TRUNCATE TABLE tbl_FINISH;
TRUNCATE TABLE tbl_MESSAGE;
TRUNCATE TABLE tbl_RESOURCE;
TRUNCATE TABLE tbl_LIBRARY_ENTRY;
-- TRUNCATE TABLE tbl_ASSIGNMENT_QUIZ;
-- TRUNCATE TABLE tbl_ASSIGNMENT;
TRUNCATE TABLE tbl_CODING_EXERCISE;
TRUNCATE TABLE tbl_QUIZ_ANSWER;
TRUNCATE TABLE tbl_QUIZ;
TRUNCATE TABLE tbl_PTQ;
TRUNCATE TABLE tbl_ARTICLE;
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

TRUNCATE TABLE tbl_CARD;
TRUNCATE TABLE tbl_COUNTRY;
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

-- SELECT * FROM tbl_COURSE ORDER BY id;

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

-- 													===== ITEM =====
-- 													----- VIDEO -----
CALL insertVideo(1, "News anyone force compare.", FALSE, 30.00, "https://obrien.biz/");

CALL insertVideo(1, "Third including face picture.", FALSE, 15.00, "http://vazquez.info/");

CALL insertVideo(1, "White must able.", FALSE, 17.30, "http://harris.biz/");

CALL insertVideo(1, "Eat hold fast how heart.", FALSE, 25.00, "http://www.ramirez.com/");

CALL insertVideo(1, "So event water religious.", FALSE, 10.00, "https://www.stark.com/");

CALL insertVideo(1, "At trade often reality.", FALSE, 12.00, "https://www.anderson.com/");

CALL insertVideo(1, "This including know shoulder.", FALSE, 7.00, "https://www.ray.com/");

CALL insertVideo(1, "Former play member cold.", FALSE, 8.00, "https://chen-goodwin.com/");

CALL insertVideo(1, "News show end prevent let.", FALSE, 4.00, "https://williams.com/");

CALL insertVideo(1, "Value leg wonder idea per when.", FALSE, 16.00, "https://www.harrington.com/");

-- SELECT * FROM tbl_VIDEO ORDER BY item_id;

-- 													----- CAPTION -----
CALL addCaption(1, "News anyone force compare.", "('Togo', 'https://www.odom-jones.info/')");

CALL addCaption(1, "News anyone force compare.", "('Albania', 'https://www.crosby-walker.info/')");

CALL addCaption(1, "News anyone force compare.", "('Estonia', 'https://ortiz.net/')");

CALL addCaption(1, "News anyone force compare.", "('Gambia', 'https://burgess.com/')");

CALL addCaption(1, "News anyone force compare.", "('Congo', 'http://www.myers.biz/')");

CALL addCaption(1, "News anyone force compare.", "('Tonga', 'http://www.peters.biz/')");

CALL addCaption(1, "News anyone force compare.", "('Barbados', 'http://www.torres.com/')");

CALL addCaption(1, "News anyone force compare.", "('Netherlands', 'http://townsend-watson.com/')");

CALL addCaption(1, "News anyone force compare.", "('Germany', 'https://www.hernandez.com/')");

CALL addCaption(1, "News anyone force compare.", "('Panama', 'http://www.fowler.info/')");

-- SELECT * FROM tbl_CAPTION ORDER BY item_id;

-- 													----- VIDEO_SLIDE -----
CALL insertVideoSlide(2, "Agent she store physical.", 20.00, "https://www.sullivan-adams.net/", "https://www.brown.biz/", "http://www.garner.info/");

CALL insertVideoSlide(1, "Its heart happy major.", 15.00, "https://www.olsen.com/", "http://www.rodgers.com/", "https://whitaker.org/");

CALL insertVideoSlide(3, "Trouble Mrs state item stay.", 17.00, "https://green-murphy.com/", "http://williams-russell.com/", "http://www.bentley-marsh.com/");

CALL insertVideoSlide(4, "Mother third work.", 5.00, "http://barnett.com/", "https://rivera-burton.com/", "http://www.garcia-bowers.com/");

CALL insertVideoSlide(2, "Yeah message kid exactly.", 10.00, "http://randall.org/", "https://stevens.com/", "https://www.bennett.biz/");

CALL insertVideoSlide(2, "Commercial do doctor.", 7.00, "http://smith.com/", "http://www.mcdonald.org/", "http://www.baker.org/");

CALL insertVideoSlide(6, "Guy baby should point.", 2.00, "https://www.hoffman.org/", "http://salazar.org/", "https://www.turner.com/");

CALL insertVideoSlide(5, "Family process indeed.", 27.00, "https://www.morrow.info/", "https://www.santiago.info/", "https://benson.net/");

CALL insertVideoSlide(7, "Run them how allow.", 30.00, "http://www.gonzales-alvarez.com/", "http://www.baker.net/", "https://frazier.com/");

CALL insertVideoSlide(2, "Need represent whether hotel.", 15.00, "https://choi.com/", "http://www.brown.com/", "https://www.herman.org/");

-- SELECT * FROM tbl_VIDEO_SLIDE ORDER BY item_id;

-- 													----- ARTICLE -----
CALL insertArticle(2, "Fish station weight reduce.", "Create argue wind truth. And court best approach daughter. Who score down. Morning western reveal ground year. Left response account rise. Old anyone bed north world program. Our technology week huge floor. Sound than item. Front somebody relationship instead idea movie sort. Skin something game girl lose across decade. Administration tax house foreign side specific government commercial. Tend relationship large. Onto others much raise list news.");

CALL insertArticle(1, "Enter memory thank learn.", "Over cell none check. Total security other alone. Design chance reach establish. Son show hospital case. Use popular share a. Reduce data meeting continue suddenly economy. Purpose man choice soldier. Myself other piece summer indicate. Inside property listen message although spring. Majority evening rise ago operation. Quite quite seven view. Mother music major yes imagine attorney. Another performance show prove.");

CALL insertArticle(3, "Letter wide company what man.", "The week room appear. Good go as source heart least traditional. Teacher then stock realize. Lot occur team maybe manager do. Difficult day current those time customer. Issue candidate true agree step deep. Car tough begin hit goal I bill later. Agree stop certainly. Likely write into. Laugh tax next outside group. Fall effort before trade guy. Company company reality people site. Yard care full military. High wind above light work notice.");

CALL insertArticle(4, "Meeting network enough four.", "Whether choice doctor various. Operation plan boy finish well personal. Trouble deep practice player just wife into. Left program hotel official dog. About affect them anyone now theory least. Certainly order moment term series. Western appear style laugh. Child dark five TV meeting. Us government cell according. Class arm film he. Keep time common list if. Image account happy wall fill song. Note kind article should. Money standard letter boy they ago image.");

CALL insertArticle(7, "Loss become standard set.", "Take keep story none themselves. Together you worry field. Executive experience find also strategy describe. May amount future party prepare. Role deal example beat law discuss different attack. Another people recently stage politics instead very. Choose magazine those treatment heavy speech. Control scene the floor force base part study. Oil couple meeting. Mean hundred new heart.");

CALL insertArticle(1, "School citizen huge spend.", "Choice public mouth nice card upon their. Responsibility bring also help require. Nature child admit need. Minute international director training successful. Yeah evidence but month fear apply. Activity eye wish investment country director life. Between himself staff big here less. Produce firm paper administration door enjoy than especially. Method and fight. Bill first put. Mention together majority others dinner few. Activity purpose final. Team meeting yeah. Movement best recently accept board act.");

CALL insertArticle(8, "Activity ok street teach.", "Foreign almost even where. Exist fall body around. Explain particular street think direction inside. Suggest traditional job deal south despite best near. Catch car large culture personal card generation bar. Through fall organization note. Others by stand character contain myself wait. You affect ability. Instead level special officer industry. Computer owner man these attention. Data time word thing summer claim. Poor never tax prevent discussion score clear.");

CALL insertArticle(9, "Cold start laugh try economy.", "Force first why economy. Walk special office protect certainly also early. Without financial around draw. Continue take however research force. Technology structure present wind final. What suddenly join window. Treat as hope wind. Check parent store. Short newspaper series blood. Organization investment economy page. Prevent race across lawyer. Put because also happy effect. Do determine movie own some help voice time.");

CALL insertArticle(10, "Next town major.", "Thing consumer nice drop network. Thank between decide body. Yet ok meet agency red nor whose. Any certain us oil take under offer door. Information wear per herself view structure top. Piece design fear participant. Item create resource return soldier throughout. Happy so doctor house rest as often commercial. The sort about five foot. Foreign institution up short. Science old reveal owner meet. Professor hot environment not.");

CALL insertArticle(2, "Last remain music shake.", "Rate American TV difficult other reflect collection. International mean during special pretty kid develop. Change room both well. Deal food behavior investment measure physical throw. Claim same call recognize young own. Require do part marriage. Century instead similar. Through see glass usually. Also fill stock while let security training husband. Type so here could maintain performance such. Republican hand high example. To during remember approach why. From manager employee laugh player.");

-- SELECT * FROM tbl_ARTICLE ORDER BY item_id;

-- 													----- PTQ -----
CALL insertPTQ(1, "Save north understand fill.", 0, TRUE, "Choice share need student. Avoid light care relate improve rise like. It back fine. Shake indicate face try name able have. Number you year company factor room production. Free it turn brother board worker. One road top that.");

CALL insertPTQ(2, "Upon or pattern.", 0, TRUE, "Worker home different. Any wear hope product clear environment. Toward surface smile lawyer sea response wind. Side each for education I learn final. Machine however fill term natural national cut.");

CALL insertPTQ(3, "The clearly suffer true.", 0, TRUE, "Social there nearly floor. Take piece attorney fast office while. Among raise determine soon forward. Rock hospital discover. Alone make sport agreement treatment. Skill movie quite shoulder issue structure manage.");

CALL insertPTQ(4, "Decade office kind.", 0, TRUE, "Better among mother life glass will. Who bring fine bill radio. May hot skill again staff nice. No hard use through. History involve site offer realize figure six. Structure same part conference dog white.");

CALL insertPTQ(5, "Prepare produce card agent.", 0, TRUE, "Myself money news professor customer by either. Politics watch others knowledge. Defense herself career view near. Late teacher stock. By this low teacher him as particular. Boy movement who decide for several. Style live floor manager similar.");

CALL insertPTQ(10, "Present should exactly point.", 0, TRUE, "By with difficult decade who. And firm generation outside physical strong ahead. Eye sit soon red population want occur. End happy training add. Reality nation head yourself television nice others.");

CALL insertPTQ(9, "Art morning above among.", 0, TRUE, "Any new cause however however thus process. Herself site Republican. Event response raise consumer structure wife. Bag benefit character your turn phone during exactly. Human than get charge remember realize their.");

CALL insertPTQ(7, "Section tend the long.", 0, TRUE, "Network early election away bring word. Study behavior population memory quickly. Growth all attack military field it. Risk sit week let campaign. Evening in amount have dream week suffer.");

CALL insertPTQ(6, "Far participant fire.", 0, TRUE, "Lead prove bit soldier near ready put. A adult toward. Leader decide necessary near believe. Campaign chance decade. Go tree hot simply less feel run. Peace issue seven. Establish interesting blood second leg race trip. May force why.");

CALL insertPTQ(5, "Ago easy safe perform show bad.", 0, TRUE, "Direction step production visit meet find. Player audience charge add maybe lay. Evidence relate never Republican bag above. Environmental grow smile board suddenly. Ground black such heart yes. Never education million remember time southern short author.");

-- SELECT * FROM tbl_PTQ ORDER BY item_id;

-- 													----- QUIZ & QUIZ_ANSWER-----
CALL insertQuiz(31, 1, "Notice church cup feeling author. Situation right star include yes American. Direction allow good skill.", "", "('The half significant today. Set left end western teach marriage arrive. Second Republican night whom test fight lot.', 1)");

CALL insertQuiz(31, 1, "Everybody improve attack animal.", "", "('Response year pull nothing factor. Interview technology while discuss.', 1)");

CALL insertQuiz(31, 1, "Everyone realize board difficult. International across daughter yeah. Simply body use just often history check short.", "", "('Especially town worker. Foot great crime dog. Available sport various mean place interview.', 1)");

CALL insertQuiz(31, 1, "Win include eat husband college bit. Current remain reflect gun though care news.", "", "('Card stage two on market base trial. Recent exist character six program shake. Get ask action east nature might.', 1)");

CALL insertQuiz(31, 1, "City section natural yourself protect. Network different require fish. Free already turn among social word fish.", "", "('Discuss tree partner choose suffer ability. Above course town sport car response.', 1)");

CALL insertQuiz(31, 1, "Something method him point much book. Card opportunity far they cost media.", "", "('Little student on. Hope late event save fund stuff social under.', 1)");

CALL insertQuiz(31, 1, "Wife measure improve eat special across gun. Oil forward though. Bring carry work interest.", "", "('Various weight already gas third summer. In painting society sell together country could hotel.', 1)");

CALL insertQuiz(31, 1, "Resource contain try least. Cause sure phone conference maintain walk. Example himself son heart. Expert sit parent.", "", "('Drop around friend we as local. Past economic agreement those whole bring officer. Miss authority I former couple beyond.', 1)");

CALL insertQuiz(31, 1, "Room student dark maintain.", "", "('Those while its task. Indicate example together.', 1)");

CALL insertQuiz(31, 1, "Anyone network red dog. Hope among gas later throw. Goal machine recently yourself sister.", "", "('War describe player daughter strategy Congress physical others. Can discussion how physical less option.', 1)");

-- SELECT * FROM tbl_QUIZ ORDER BY item_id;
-- 
-- SELECT * FROM tbl_QUIZ_ANSWER ORDER BY item_id;

-- 													----- CODING_EXERCISE-----
/*
CALL insertCodingExercise(2, "Really next let these institution clear prevent all.", "https://www.wright.net/", "http://branch.biz/", "SQL");

CALL insertCodingExercise(3, "Education local first great late.", "http://www.smith.com/", "http://waters.org/", "Python");

CALL insertCodingExercise(4, "Still game possible follow for mind never.", "https://white.net/", "https://www.lane.org/", "Java");

CALL insertCodingExercise(6, "Pass scientist peace save decide such.", "https://miller.biz/", "http://www.jacobson.com/", "C#");

CALL insertCodingExercise(1, "Article often worker author federal. Stage describe form.", "https://cervantes.com/", "http://www.stevens-taylor.com/", "C++");

CALL insertCodingExercise(10, "Shoulder natural song simply human team ability.", "http://www.williams.com/", "http://perry.com/", "C");

CALL insertCodingExercise(9, "Also blue begin mention run city. Individual now to story.", "http://www.anderson-bailey.com/", "https://kirk.info/", "SQL");

CALL insertCodingExercise(2, "Method easy our long task way matter.", "https://velazquez.com/", "http://www.patel.com/", "SQL");

CALL insertCodingExercise(1, "While debate point sign sign color provide.", "http://www.higgins.com/", "https://www.hayes-howard.biz/", "JavaScript");

CALL insertCodingExercise(5, "Recognize service contain two meeting.", "http://brooks-rose.org/", "https://williams.org/", "HTML");

-- SELECT * FROM tbl_CODING_EXERCISE ORDER BY item_id;

-- SELECT * FROM tbl_ITEM ORDER BY item_id;
*/

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

-- 													===== COMPOSE =====	
/*
INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (1, 1, 1, 1, 1);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (2, 1, 1, 1, 2);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (3, 1, 1, 1, 3);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (4, 1, 2, 1, 1);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (5, 1, 2, 1, 2);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (6, 1, 3, 1, 1);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (7, 1, 3, 1, 2);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (8, 1, 3, 1, 3);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (9, 1, 3, 1, 4);

INSERT INTO tbl_COMPOSE(item_id, course_id_item, section_id, course_id_section, item_order)	VALUES (10, 1, 4, 1, 1);
*/

-- SELECT * FROM tbl_COMPOSE ORDER BY item_id;

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

-- 													===== RESOURCE =====
CALL addResource(2, "Commercial do doctor.", "('Just total standard film behavior population.', 'http://www.arias.com/')");

CALL addResource(2, "Commercial do doctor.", "('Experience matter knowledge return development military.', 'https://anderson.org/')");

CALL addResource(2, "Commercial do doctor.", "('Well single side camera.', 'http://www.sullivan.com/')");

CALL addResource(2, "Commercial do doctor.", "('Different positive recent truth. New sign expert buy rock card.', 'https://www.williams-collins.com/')");

CALL addResource(2, "Commercial do doctor.", "('Off machine appear human listen level they.', 'http://watts-hernandez.com/')");

CALL addResource(2, "Commercial do doctor.", "('Meeting fine record require take.', 'https://www.collins-gonzalez.org/')");

CALL addResource(2, "Commercial do doctor.", "('Measure figure join born specific whatever prepare.', 'https://moses.biz/')");

CALL addResource(2, "Commercial do doctor.", "('Oil spring green letter yes information audience race.', 'http://www.valdez-west.biz/')");

CALL addResource(2, "Commercial do doctor.", "('Central product official protect.', 'http://www.williams.net/')");

CALL addResource(2, "Commercial do doctor.", "('Bad last social figure often idea opportunity build.', 'http://perez.com/')");

-- SELECT * FROM tbl_RESOURCE ORDER BY item_id;

-- 													===== ENROLL =====
/*
CALL enrollCourse(2, 1, 14.99);

CALL enrollCourse(2, 2, 19.99);

CALL enrollCourse(1, 3, 9.99);

CALL enrollCourse(3, 4, 4.99);

CALL enrollCourse(4, 4, 19.99);

CALL enrollCourse(1, 6, 19.99);

CALL enrollCourse(2, 6, 19.99);

CALL enrollCourse(6, 1, 9.99);

CALL enrollCourse(7, 2, 4.99);

CALL enrollCourse(10, 9, 14.99);
*/

-- SELECT * FROM tbl_ENROLL ORDER BY user_id;

-- 													===== FINISH =====
INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(1, 1, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(1, 2, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(2, 2, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(3, 2, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(4, 1, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(6, 1, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(7, 6, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(4, 5, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(5, 2, 1);

INSERT INTO tbl_FINISH(user_id, item_id, course_id) VALUES(1, 4, 1);

-- SELECT * FROM tbl_FINISH ORDER BY user_id;

-- 													===== MESSAGE =====
-- SELECT * FROM tbl_MESSAGE ORDER BY from_id;

-- 													===== TEACH =====
-- SELECT * FROM tbl_TEACH ORDER BY instructor_id;

-- 													===== QUESTION =====
INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Cell professor his. Star candidate see question doctor reason.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (2, 1, "Race show language western here eat thus. Get development get speak speak outside.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (3, 1, "Score major whatever draw nor. Cut available sit. Increase listen despite help.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (4, 1, "Doctor evening including range gas minute important. Bit ever past form can where country.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Customer civil science while. Always so majority week laugh. Not scene send relate for.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (3, 1, "Education Republican quite degree begin father too. Second national cost ever whole style. Final since event talk.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (4, 1, "Perform seven carry theory reality spend Mr art.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (1, 1, "Than market great new life. Best push boy road. Author ground front good above truth nature quickly.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (2, 1, "Very economic interview school consumer. Behavior morning source teach above seat drive hand.");

INSERT INTO tbl_QUESTION(student_id, course_id, content) VALUES (2, 1, "Wide all campaign key be. Education chance enter at call pay.");

-- SELECT * FROM tbl_QUESTION ORDER BY id;

-- 													===== ANSWER =====
/*
INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (1, 3, "Activity body natural myself foot. Main debate if last wide service. Son lot study forward help use pretty consider.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (2, 1, "Second ok say our process tell public.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (3, 2, "Sometimes music economic play large second. Five move concern series.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (4, 6, "Where any thank. Nice interview them program change official even company. Dark field protect recently.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (5, 7, "Politics morning spend could book style popular force.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (6, 1, "Father let listen religious board yard government. Town want effort mention good. Event as second more how son.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (7, 2, "Young side event result position author. Manage main only truth trouble board. Century woman training fall but light attack.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (8, 3, "Natural glass other. Design clear hold others ball travel picture. Offer with hundred shoulder.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (9, 1, "Up responsibility political office ok top. Face surface owner put. Deal box method medical whom generation fish.");

INSERT INTO tbl_ANSWER(question_id, user_id, content) VALUES (10, 2, "Keep development party evening impact fear. Health exactly today time expect.");
*/
-- SELECT * FROM tbl_ANSWER ORDER BY id;

-- 													===== CONTEXT =====
INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (1, 1, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (2, 2, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (3, 3, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (4, 4, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (5, 5, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (6, 6, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (7, 7, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (8, 8, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (9, 9, 1);

INSERT INTO tbl_CONTEXT(question_id, item_id, course_id) VALUES (10, 10, 1);

-- SELECT * FROM tbl_CONTEXT ORDER BY question_id;

-- 													===== SHOPPING_CART =====
INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (1);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (2);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (3);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (4);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (5);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (6);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (7);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (8);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (9);

INSERT INTO tbl_SHOPPING_CART(user_id) VALUES (10);

-- SELECT * FROM tbl_SHOPPING_CART ORDER BY id;

-- 													===== SHOPPING_CART_COURSE =====
INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (1, 1);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (2, 1);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (3, 5);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (4, 2);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (5, 6);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (6, 3);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (7, 8);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (8, 8);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (9, 10);

INSERT INTO tbl_SHOPPING_CART_COURSE(shopping_cart_id, course_id) VALUES (10, 4);

-- SELECT * FROM tbl_SHOPPING_CART_COURSE ORDER BY shopping_cart_id;


-- 													===== COUPON =====
INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("%1IxZf&G(@", 50.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("s#Ccf0hZ*8", 25.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("$UsQu*pba5", 60.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("(6WlC@iT14", 80.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("3SD+2XyrE$", 20.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("^W+3mGWug(", 50.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("6k4@rV$z@d", 10.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("m(96ZPgwCh", 5.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("s9J9O4dh)6", 75.00);

INSERT INTO tbl_COUPON(coupon_code, discount_percentage) VALUES ("P0LHN3C0%i", 20.00);

-- SELECT * FROM tbl_COUPON ORDER BY coupon_code;

-- 													===== AFFECTED_BY =====
INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (1, "%1IxZf&G(@");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (2, "^W+3mGWug(");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (3, "m(96ZPgwCh");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (4, "%1IxZf&G(@");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (5, "s9J9O4dh)6");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (6, "(6WlC@iT14");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (7, "s#Ccf0hZ*8");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (8, "3SD+2XyrE$");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (9, "P0LHN3C0%i");

INSERT INTO tbl_AFFECTED_BY(shopping_cart_id, coupon_code) VALUES (10, "$UsQu*pba5");

-- SELECT * FROM tbl_AFFECTED_BY ORDER BY shopping_cart_id;

-- 													===== DISCOUNT =====
INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (1, "P0LHN3C0%i");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (2, "$UsQu*pba5");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (3, "s#Ccf0hZ*8");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (4, "s9J9O4dh)6");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (5, "m(96ZPgwCh");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (6, "^W+3mGWug(");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (7, "P0LHN3C0%i");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (8, "%1IxZf&G(@");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (9, "s9J9O4dh)6");

INSERT INTO tbl_DISCOUNT(course_id, coupon_code) VALUES (10, "3SD+2XyrE$");

-- SELECT * FROM tbl_DISCOUNT ORDER BY course_id;
INSERT INTO tbl_COUNTRY(id, country_code,name) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People''s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People''s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');
INSERT INTO tbl_CARD(expired_date,country,name_on_card,zip_code,security_code,card_number,user_id) VALUES 
('2021-01-01','VN','THANHLAM','14567','157','4077822147515479',6),
('2022-12-12','VN','THANHLAN','14568','138','4943074259019021',6),
('2020-01-01','US','CUONGVUONG','13456','123','4820164339891669',1),
('2021-02-02','VN','MINHQUAN','12456','345','4883199138845999',2),
('2022-02-02','US','ANHQUAN','12434','346','4528809928697571',3),
('2022-02-02','VN','TAMDAT','12454','347','4100198614767864',5);