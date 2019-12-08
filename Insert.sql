#
# TABLE STRUCTURE FOR: tbl_ANNOUNCEMENT
#

DROP TABLE IF EXISTS `tbl_ANNOUNCEMENT`;

CREATE TABLE `tbl_ANNOUNCEMENT` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `instructor_id` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`,`course_id`,`instructor_id`),
  KEY `course_id` (`course_id`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `tbl_ANNOUNCEMENT_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_COURSE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_ANNOUNCEMENT_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `content_char_length` CHECK (char_length(`content`) < 1024)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (1, 7, 2, 'Rerum eum deleniti iusto. Illo odio molestiae voluptas. Laborum corporis ut occaecati ut laboriosam tempora.', '2015-08-14 20:55:50');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (2, 10, 10, 'Impedit itaque qui iste amet. Consequuntur quasi omnis id ut. Omnis cumque libero culpa autem. Labore sed dolorem asperiores molestiae iure.', '2018-04-29 10:15:31');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (3, 5, 10, 'Eum sunt impedit eos et sunt neque ut. Eius molestiae quo explicabo est. Nihil velit reiciendis sint corporis sunt libero neque.', '2008-02-02 12:49:44');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (4, 9, 7, 'Temporibus blanditiis cumque id eligendi nisi eius quo ut. Pariatur aut sapiente laboriosam sed ut enim doloribus. Et ut magni ducimus sit omnis et. Eos dolorum quidem quia voluptatibus qui facilis.', '1997-05-20 20:57:46');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (5, 10, 4, 'Ut nisi ut sed omnis. Porro necessitatibus est sunt expedita sed vel similique commodi. Aut nostrum eius veritatis voluptas occaecati.', '2005-08-15 18:12:38');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (6, 4, 4, 'Ea qui aspernatur quam sint mollitia. Ut et voluptas et ullam. Maxime facilis inventore animi magnam aliquid.', '1995-06-20 06:29:38');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (7, 1, 3, 'Eligendi repellendus qui sed aliquam aut. Animi reprehenderit velit dolor voluptates. Adipisci soluta voluptatum quae ducimus tenetur. Ab quis eum sint fugiat est aut provident.', '1971-07-06 07:16:21');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (8, 4, 4, 'Quasi necessitatibus nemo magnam soluta. Ut cupiditate ut officia corporis. Alias sunt quo sed neque porro sit.', '1992-03-25 19:03:53');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (9, 8, 2, 'Et ea et quia et. Maxime voluptate dolor mollitia tenetur molestias molestiae ut. Molestias earum vero dolore quo dolorem. Totam sed enim quidem dolores ut id.', '1973-01-20 16:01:25');
INSERT INTO `tbl_ANNOUNCEMENT` (`id`, `course_id`, `instructor_id`, `content`, `created_date`) VALUES (10, 2, 1, 'Quo nesciunt veritatis voluptas. Ullam ipsam ut ipsa rerum ut. Harum rem porro sequi eaque.', '2000-08-19 22:12:46');


#
# TABLE STRUCTURE FOR: tbl_ANSWER
#

DROP TABLE IF EXISTS `tbl_ANSWER`;

CREATE TABLE `tbl_ANSWER` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`,`question_id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_ANSWER_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `tbl_QUESTION` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_ANSWER_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_ARTICAL
#

DROP TABLE IF EXISTS `tbl_ARTICAL`;

CREATE TABLE `tbl_ARTICAL` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  CONSTRAINT `tbl_ARTICAL_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_LECTURE` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_ARTICAL` (`item_id`, `course_id`, `content`) VALUES (4, 4, 'Quae iste delectus hic sed. Et non fuga qui et ut. Adipisci officiis consequuntur nesciunt consequatur. Quos ipsum molestiae aut facilis.');
INSERT INTO `tbl_ARTICAL` (`item_id`, `course_id`, `content`) VALUES (14, 4, 'Maiores vitae dolor est laboriosam sint at. Earum et ut atque sed laborum alias. Molestiae quia similique id nostrum voluptatem reiciendis.');


#
# TABLE STRUCTURE FOR: tbl_ASSIGNMENT
#

DROP TABLE IF EXISTS `tbl_ASSIGNMENT`;

CREATE TABLE `tbl_ASSIGNMENT` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `instruction` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignment_language` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  CONSTRAINT `tbl_ASSIGNMENT_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_PTQ` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_ASSIGNMENT_QUIZ
#

DROP TABLE IF EXISTS `tbl_ASSIGNMENT_QUIZ`;

CREATE TABLE `tbl_ASSIGNMENT_QUIZ` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `solution` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`item_id`,`course_id`),
  KEY `item_id` (`item_id`,`course_id`),
  CONSTRAINT `tbl_ASSIGNMENT_QUIZ_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_ASSIGNMENT` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_CAPTION
#

DROP TABLE IF EXISTS `tbl_CAPTION`;

CREATE TABLE `tbl_CAPTION` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `caption_language` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'English',
  `vtt` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`,`caption_language`,`vtt`),
  CONSTRAINT `tbl_CAPTION_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_VIDEO` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_CATEGORY
#

DROP TABLE IF EXISTS `tbl_CATEGORY`;

CREATE TABLE `tbl_CATEGORY` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default Category''s name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (2, 'aliquam');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (8, 'architecto');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (4, 'atque');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (5, 'dolor');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (10, 'earum');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (1, 'exercitationem');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (6, 'iusto');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (7, 'maxime');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (3, 'rerum');
INSERT INTO `tbl_CATEGORY` (`id`, `name`) VALUES (9, 'sed');


#
# TABLE STRUCTURE FOR: tbl_CODING_EXERCISE
#

DROP TABLE IF EXISTS `tbl_CODING_EXERCISE`;

CREATE TABLE `tbl_CODING_EXERCISE` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `initial_code` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `test_code` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `programming_language` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  CONSTRAINT `tbl_CODING_EXERCISE_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_PTQ` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_COMPOSE
#

DROP TABLE IF EXISTS `tbl_COMPOSE`;

CREATE TABLE `tbl_COMPOSE` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id_item` int(10) unsigned NOT NULL,
  `section_id` int(10) unsigned NOT NULL,
  `course_id_section` int(10) unsigned NOT NULL,
  `item_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`course_id_item`,`item_id`),
  UNIQUE KEY `item_order` (`item_order`),
  KEY `item_id` (`item_id`,`course_id_item`),
  KEY `section_id` (`section_id`,`course_id_section`),
  CONSTRAINT `tbl_COMPOSE_ibfk_1` FOREIGN KEY (`item_id`, `course_id_item`) REFERENCES `tbl_ITEM` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_COMPOSE_ibfk_2` FOREIGN KEY (`section_id`, `course_id_section`) REFERENCES `tbl_SECTION` (`section_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (1, 1, 8, 8, 25467);
INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (12, 2, 1, 1, 8908184);
INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (3, 3, 5, 5, 644237732);
INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (15, 5, 4, 4, 35);
INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (6, 6, 8, 8, 18507);
INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (7, 7, 9, 9, 3783);
INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (17, 7, 8, 8, 871969651);
INSERT INTO `tbl_COMPOSE` (`item_id`, `course_id_item`, `section_id`, `course_id_section`, `item_order`) VALUES (10, 10, 8, 8, 280728264);


#
# TABLE STRUCTURE FOR: tbl_CONTEXT
#

DROP TABLE IF EXISTS `tbl_CONTEXT`;

CREATE TABLE `tbl_CONTEXT` (
  `question_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `item_id` (`item_id`,`course_id`),
  CONSTRAINT `tbl_CONTEXT_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `tbl_QUESTION` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_CONTEXT_ibfk_2` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_LECTURE` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_COURSE
#

DROP TABLE IF EXISTS `tbl_COURSE`;

CREATE TABLE `tbl_COURSE` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `main_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default Main Title',
  `sub_title` varchar(256) COLLATE utf8_unicode_ci DEFAULT 'Defult Sub Title',
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_status` tinyint(1) NOT NULL DEFAULT 0,
  `promotional_video` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_language` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'English',
  `course_level` enum('Beginner','Intermidate','Expert','All Levels') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'All Levels',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `welcome_message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `sub_category_id` int(10) unsigned NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sub_category_id` (`sub_category_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `tbl_COURSE_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `tbl_SUBCATEGORY` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_COURSE_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (1, 'Tenetur labore qui facilis quia doloremque beatae et ratione.', 'Vitae ut alias itaque facilis eveniet eius.', 'Itaque voluptatem earum voluptas aut. Labore voluptas omnis repellat repudiandae. Eius rerum veritatis autem iure voluptas voluptatem dolores.', 0, 'application/vnd.kde.karbon', 'tmp//43ce0e71f4f23ce967e9244ecf01d904.jpg', 'cum', 'Expert', '2361.73', 'Et eos aut quae incidunt. Sit totam exercitationem amet minus explicabo. Qui in quasi odit et.', 1, 1, '2004-06-24 08:49:32');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (2, 'Perferendis harum quia non ab dignissimos necessitatibus id.', 'Reiciendis modi est enim veniam facere sit.', 'Est quo aut esse sed velit ea iure. Eveniet ut similique rerum sint aut temporibus. Ut qui nihil sint dolorem sequi commodi. Eius repellendus nisi sit voluptatem iste omnis enim.', 0, 'application/rss+xml', 'tmp//c4d8ff07f9c748cfc8dbd0e3dea13054.jpg', 'officia', 'Intermidate', '54.95', 'Ex maiores placeat occaecati expedita quis. Iusto sit beatae quod quia qui omnis. Quam nam in sed a.', 2, 2, '1987-05-10 23:13:26');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (3, 'Et fuga impedit quia unde.', 'Porro enim et ut quibusdam quos.', 'Architecto adipisci aut quasi exercitationem dolorem quis dignissimos. Aperiam perferendis aut totam exercitationem qui fuga. Expedita ipsa cumque omnis qui accusamus. Ex perferendis alias non doloribus iusto qui pariatur.', 0, 'application/vnd.immervision-ivp', 'tmp//2b0c81432d43cc050394926e47c8485a.jpg', 'hic', 'Beginner', '502.04', 'Vero omnis dolores qui perspiciatis pariatur ut quibusdam. Animi eligendi consequatur et nihil sit ut voluptatem. Tenetur ducimus quod eos aut fuga exercitationem.', 3, 3, '2012-10-25 01:50:57');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (4, 'Aliquid sapiente nulla et perferendis rerum consequuntur.', 'Ratione quidem et et quas.', 'Reprehenderit facilis expedita distinctio eius totam pariatur. Incidunt perspiciatis quas dignissimos voluptate. Nihil dolorum esse rerum voluptas aut facere nihil.', 0, 'video/x-ms-vob', 'tmp//51eaac586bd2800e81f2ff8b98d4ed4f.jpg', 'voluptatem', 'All Levels', '26.92', 'Ab aut vel vel. Quo sapiente non optio harum nulla dolorum ullam. Reiciendis enim consequuntur aperiam quibusdam dolores qui. Molestiae asperiores similique aut sed veniam id. Omnis soluta nemo neque magni corrupti et.', 4, 4, '1979-03-13 13:05:04');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (5, 'Tempore excepturi modi ab ducimus autem assumenda dolores.', 'In facere aperiam facere nemo soluta.', 'Nesciunt enim quaerat perspiciatis. At rerum neque ea et aut quaerat. Id qui consequuntur velit et reprehenderit quod voluptatem.', 0, 'text/vnd.dvb.subtitle', 'tmp//de5054ca711865219dea498cf6335afc.jpg', 'voluptatum', 'All Levels', '7903570.94', 'Consequatur officia et autem ratione. Culpa ut magni doloremque iste magni quia qui. Magni necessitatibus quidem sapiente quaerat rerum expedita ut eius.', 5, 5, '2014-01-16 03:35:36');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (6, 'Placeat deleniti dolorem officiis maxime dolorem earum.', 'Quos enim sed deserunt.', 'Voluptatem ab quam animi sapiente. Laboriosam ut sequi consequatur culpa aliquam.', 0, 'application/x-shar', 'tmp//dcb8133c95327b2efade4ba214f0a87a.jpg', 'quis', 'All Levels', '65920860.00', 'Animi est a molestiae sunt vitae. Earum reiciendis voluptas ut commodi distinctio amet occaecati. Et et sequi voluptas sunt esse dolorem. Repellendus ducimus laboriosam sint enim ducimus occaecati.', 6, 6, '1992-01-21 15:59:34');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (7, 'Possimus odio vel dolores pariatur sunt qui sit.', 'Dolorem veritatis animi consequuntur officia facere quasi.', 'Quo pariatur praesentium sed iure eum ipsam nam amet. Omnis qui at minima dolore at autem ut. Nobis numquam quas voluptatem.', 0, 'application/vnd.las.las+xml', 'tmp//cbc0f9f1118976dc36befb0ccc699df3.jpg', 'consequatur', 'Beginner', '0.00', 'Omnis ducimus assumenda assumenda voluptatem magnam. Dicta id vel sunt atque impedit. Dolor quasi quos consequuntur distinctio sed et. Vitae vel nostrum facilis sint repellat quod.', 7, 7, '2010-06-10 23:55:24');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (8, 'Id et vitae unde quia dolorem nulla vero dolorem.', 'Consequatur qui eligendi quod voluptatum temporibus et voluptas.', 'Dolorem assumenda quas natus est quia iure molestiae quibusdam. Quis et nihil dicta sit. Dolorum placeat doloribus officia sunt eum est enim.', 0, 'application/x-msdownload', 'tmp//9ecbd60468a7e2b5a701349fd7de7f64.jpg', 'corporis', 'Intermidate', '3004039.96', 'Reiciendis hic aut quo at. Consectetur quos praesentium molestiae eius. Ut saepe occaecati veniam maxime est recusandae quis.', 8, 8, '1994-02-28 04:07:40');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (9, 'Earum tempora nobis odio dolor.', 'Aliquid iure modi qui autem cumque praesentium non.', 'Est molestias autem recusandae quod at quis quae inventore. Eos accusantium et perspiciatis fugiat sint molestias accusamus. Minus et sed aliquid at est qui.', 0, 'application/vnd.ms-pki.seccat', 'tmp//18d830627d5a6aa4392460676f41b84d.jpg', 'velit', 'All Levels', '57061.21', 'Illo repudiandae id vitae. Esse beatae quibusdam asperiores illum et aspernatur deleniti fuga. Totam quasi dignissimos velit optio.', 9, 9, '2010-03-05 10:49:05');
INSERT INTO `tbl_COURSE` (`id`, `main_title`, `sub_title`, `description`, `publish_status`, `promotional_video`, `image`, `course_language`, `course_level`, `price`, `welcome_message`, `owner_id`, `sub_category_id`, `updated_date`) VALUES (10, 'Sit aut sit consequatur quia deleniti.', 'Perferendis itaque nisi quia quaerat voluptate.', 'Et dolor natus blanditiis omnis laudantium sint laboriosam eum. Autem nihil molestias et aliquam rerum. Ex sunt vel quia non facere culpa nisi aut.', 0, 'text/vnd.curl', 'tmp//eed8c4404a45f2789a5ace67c7674314.jpg', 'esse', 'Expert', '0.00', 'Commodi dolorum deserunt omnis voluptas non tempore et. Nihil tenetur mollitia perferendis qui.', 10, 10, '1998-03-31 19:58:21');


#
# TABLE STRUCTURE FOR: tbl_COURSE_TOPIC
#

DROP TABLE IF EXISTS `tbl_COURSE_TOPIC`;

CREATE TABLE `tbl_COURSE_TOPIC` (
  `course_id` int(10) unsigned NOT NULL,
  `topic` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default Topic',
  PRIMARY KEY (`course_id`,`topic`),
  CONSTRAINT `tbl_COURSE_TOPIC_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_COURSE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_ENROLL
#

DROP TABLE IF EXISTS `tbl_ENROLL`;

CREATE TABLE `tbl_ENROLL` (
  `user_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `rating` float DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_archived` tinyint(1) NOT NULL DEFAULT 0,
  `is_favorite` tinyint(1) NOT NULL DEFAULT 0,
  `enroll_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_finished` tinyint(1) NOT NULL DEFAULT 0,
  `paid_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`user_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tbl_ENROLL_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_ENROLL_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tbl_COURSE` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (1, 1, '4', 'Et et laudantium et temporibus non eveniet laudantium in. Culpa eos et distinctio soluta tenetur.', 0, 1, '2017-05-12 19:42:29', 1, '196692.00');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (1, 2, '21', 'Aut soluta earum cumque enim veritatis nihil sed non. Facilis distinctio mollitia quaerat quis pariatur. Expedita consequatur eos vitae necessitatibus.', 1, 1, '1976-01-25 15:03:10', 1, '7508402.66');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (2, 8, '9530', 'Eaque aut vel qui autem quibusdam deleniti. Aut sunt voluptatem magni enim expedita molestiae. Magnam ad facilis quod amet voluptatibus ipsa asperiores. Ut et mollitia vitae consequatur.', 1, 0, '2001-09-03 15:39:23', 0, '3.80');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (2, 9, '9550', 'Vitae voluptatem animi asperiores numquam voluptatem ea. Est quo at quod aliquid cupiditate et enim. Cumque et debitis est dolores iste praesentium explicabo labore. Voluptatem autem dicta inventore quo sint aspernatur. Quae magni eius et vitae iure quo totam.', 1, 0, '2011-11-09 03:19:00', 1, '4.51');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (3, 10, '924', 'Iste aut doloribus fugiat labore non. Ut nesciunt error soluta quia sit quo quis. Consequatur corporis atque facere et temporibus fugiat. Ullam quidem aut et corporis.', 1, 1, '1988-12-13 00:51:08', 1, '2465027.60');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (5, 4, '8825', 'Est neque et eligendi explicabo dolorem corporis vitae. Laborum quasi ea quae aperiam sit eius quam qui. Natus eveniet quia repudiandae veniam reprehenderit itaque quia. Quis quis doloremque qui voluptas eius voluptatum dolore.', 1, 1, '1980-12-28 01:22:33', 0, '62976370.03');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (5, 7, '30011200', 'Voluptas dignissimos soluta cupiditate. Aut illo impedit et quia quo. Odit reprehenderit et at omnis. Officiis iste dolorum ut quas quo amet eveniet.', 1, 0, '1988-09-18 04:59:08', 1, '957.30');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (6, 3, '0', 'Voluptate perspiciatis fugit facere suscipit ad. Nesciunt magnam occaecati culpa est aut recusandae consectetur.', 1, 0, '1987-03-29 16:46:58', 0, '99999999.99');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (6, 6, '667', 'Odit expedita nulla quia illum sint nobis rerum qui. Consequatur rerum similique est. Quisquam molestias porro culpa eos.', 0, 1, '1988-07-29 17:15:21', 0, '4445656.77');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (6, 10, '38011700', 'Ullam voluptate rerum magni quis. Magni et tempore consequatur similique libero. Quia voluptatibus dolorem asperiores dolor. Animi laudantium ex velit culpa sunt in.', 1, 0, '2006-11-13 19:08:53', 0, '0.00');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (7, 2, '2', 'Quo alias adipisci ut vel. Eius iusto at voluptate incidunt consequuntur repellendus. Voluptatem omnis aut deleniti explicabo excepturi. Quasi sed molestias facere voluptatum eum asperiores.', 0, 1, '1983-02-26 06:37:43', 1, '0.00');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (7, 5, '258', 'Molestias doloremque et sed nesciunt ipsum eos. Nesciunt esse et fugit error. Omnis ratione fugit omnis.', 1, 1, '2004-10-11 02:41:43', 1, '3.49');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (8, 5, '3', 'Expedita et id voluptatem commodi consequuntur sit libero. Nihil qui magnam veritatis veniam. Et iure vitae vel vel. Facilis vitae atque voluptatem doloremque quasi voluptatum. Consectetur ea veritatis officia explicabo aut cumque et ratione.', 0, 0, '2015-03-25 00:56:34', 1, '515.00');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (8, 8, '821', 'Placeat aut minima sint in. Sit minus soluta quia labore qui fuga dicta. Natus occaecati assumenda mollitia qui delectus.', 0, 1, '2006-09-18 18:21:13', 1, '739778.11');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (9, 2, '270007000', 'Perspiciatis aut eaque autem quidem quos. Deleniti reiciendis fuga voluptate doloremque totam. Architecto temporibus expedita odio et. Voluptas qui ducimus nemo explicabo.', 1, 1, '2018-11-27 05:22:45', 1, '354.84');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (10, 2, '948230000', 'Non et voluptatibus id vel quia. Dolore aut eveniet eos quos praesentium. Nostrum odio id dicta. Labore sint beatae molestias corrupti.', 1, 0, '1995-05-15 20:35:01', 0, '58.00');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (10, 6, '987', 'Et dolorum rem voluptates blanditiis fugit veniam et. Ut consequatur consequatur provident aut aut provident rem similique. Modi eveniet atque ut odit enim. Quia placeat laborum voluptate sequi totam.', 0, 1, '1997-05-30 03:50:28', 1, '41.00');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (10, 8, '7299950', 'Est quisquam laboriosam ipsam eius possimus voluptatem nihil. Enim aspernatur numquam omnis neque soluta a. In libero repellendus rem sunt magni qui.', 1, 1, '1983-10-09 19:22:30', 0, '582.35');
INSERT INTO `tbl_ENROLL` (`user_id`, `course_id`, `rating`, `comment`, `is_archived`, `is_favorite`, `enroll_date`, `is_finished`, `paid_price`) VALUES (10, 9, '760235', 'Eaque odio esse sed sed cum. Molestiae ipsam est exercitationem repellat dolorum sit quo.', 0, 1, '1986-05-31 04:07:11', 1, '99999999.99');


#
# TABLE STRUCTURE FOR: tbl_FINISH
#

DROP TABLE IF EXISTS `tbl_FINISH`;

CREATE TABLE `tbl_FINISH` (
  `user_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`item_id`,`course_id`),
  KEY `item_id` (`item_id`,`course_id`),
  CONSTRAINT `tbl_FINISH_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_FINISH_ibfk_2` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_ITEM` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_FINISH` (`user_id`, `item_id`, `course_id`) VALUES (4, 3, 3);
INSERT INTO `tbl_FINISH` (`user_id`, `item_id`, `course_id`) VALUES (8, 1, 1);


#
# TABLE STRUCTURE FOR: tbl_ITEM
#

DROP TABLE IF EXISTS `tbl_ITEM`;

CREATE TABLE `tbl_ITEM` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  UNIQUE KEY `item_id` (`item_id`,`name`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tbl_ITEM_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_COURSE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (1, 1, 'similique');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (2, 2, 'ab');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (3, 3, 'molestiae');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (4, 4, 'pariatur');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (5, 5, 'voluptatem');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (6, 6, 'et');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (7, 7, 'quo');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (8, 8, 'ad');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (9, 9, 'mollitia');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (10, 10, 'rem');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (11, 1, 'consequatur');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (12, 2, 'numquam');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (13, 3, 'suscipit');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (14, 4, 'voluptatem');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (15, 5, 'illo');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (16, 6, 'quis');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (17, 7, 'velit');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (18, 8, 'sit');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (19, 9, 'similique');
INSERT INTO `tbl_ITEM` (`item_id`, `course_id`, `name`) VALUES (20, 10, 'nihil');


#
# TABLE STRUCTURE FOR: tbl_LECTURE
#

DROP TABLE IF EXISTS `tbl_LECTURE`;

CREATE TABLE `tbl_LECTURE` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  CONSTRAINT `tbl_LECTURE_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_ITEM` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (1, 1);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (2, 2);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (3, 3);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (4, 4);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (5, 5);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (6, 6);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (7, 7);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (8, 8);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (9, 9);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (10, 10);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (11, 1);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (12, 2);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (13, 3);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (14, 4);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (15, 5);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (16, 6);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (17, 7);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (18, 8);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (19, 9);
INSERT INTO `tbl_LECTURE` (`item_id`, `course_id`) VALUES (20, 10);


#
# TABLE STRUCTURE FOR: tbl_LIBRARY_ENTRY
#

DROP TABLE IF EXISTS `tbl_LIBRARY_ENTRY`;

CREATE TABLE `tbl_LIBRARY_ENTRY` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instructor_id` int(10) unsigned NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `uploaded_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`,`instructor_id`),
  UNIQUE KEY `title` (`title`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `tbl_LIBRARY_ENTRY_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_MESSAGE
#

DROP TABLE IF EXISTS `tbl_MESSAGE`;

CREATE TABLE `tbl_MESSAGE` (
  `from_id` int(10) unsigned NOT NULL,
  `to_id` int(10) unsigned NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`from_id`,`to_id`),
  KEY `to_id` (`to_id`),
  CONSTRAINT `tbl_MESSAGE_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_MESSAGE_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (1, 2, '1989-06-28 17:49:15', 'Quo est doloremque vitae sint consectetur ea ex earum. Id rem non suscipit autem. Animi eaque corrupti ex est ut repellat. Cumque blanditiis eum culpa excepturi.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (1, 5, '1991-06-27 09:36:54', 'Sunt eos ab aut asperiores aut. Non eos voluptas quisquam. Earum hic expedita suscipit quibusdam consequuntur enim reiciendis voluptates.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (1, 9, '2004-02-20 21:44:52', 'Delectus earum dolor suscipit maiores exercitationem veritatis voluptatem quidem. Laudantium aut vel fugit provident numquam consequatur aut. Eos aut aut consequuntur explicabo iure.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (2, 10, '2007-06-15 06:42:15', 'Non vitae non cum corporis dolore dicta sapiente. Adipisci soluta in est beatae accusantium. Distinctio et voluptas illo eaque a.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (3, 10, '1974-05-31 15:32:16', 'Maiores soluta cupiditate vero. Recusandae voluptates dolores at incidunt quo aut natus. Doloremque libero impedit pariatur earum assumenda et error saepe.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (4, 1, '1976-01-29 22:12:42', 'Est aut doloremque sunt distinctio et eveniet et suscipit. Aut et repellat libero accusantium libero corporis ipsa. Enim incidunt iste nemo et rerum officiis est.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (4, 10, '1991-10-24 22:02:55', 'Quaerat dignissimos quis omnis debitis sit. Perspiciatis voluptatem magnam molestias est. Autem omnis qui dignissimos hic repellendus omnis quae. Nihil assumenda velit rerum facilis.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (5, 4, '1983-08-30 19:43:28', 'Ab sit unde sunt. Ea nisi aut aliquam modi incidunt inventore perferendis. Veniam quidem omnis voluptas numquam veritatis quo ut.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (5, 5, '1978-10-10 05:37:30', 'Veritatis ex velit aperiam ut porro enim sapiente. Incidunt distinctio consectetur consequuntur et nesciunt amet. In quas aut sint qui excepturi at.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (5, 6, '2003-02-09 19:02:26', 'Quas itaque dolorum recusandae suscipit. Facere unde voluptatibus est et eos architecto qui. Aliquam dicta sit neque nihil vitae explicabo temporibus. Aperiam ut excepturi occaecati id.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (5, 8, '1977-01-23 17:39:51', 'Ab corrupti quo ipsum beatae aspernatur at iusto. Recusandae reprehenderit et dolores consequuntur. Quia consequuntur repudiandae exercitationem assumenda facilis exercitationem eum.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (5, 9, '2003-08-06 14:08:01', 'Numquam iste consequatur laudantium aut. Numquam distinctio ex perspiciatis cum facere maxime sunt. Iusto unde velit qui aspernatur voluptas illum velit.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (6, 5, '2013-08-26 10:27:31', 'Quo suscipit minima omnis beatae rerum nihil voluptatem. Est aperiam consectetur laudantium et dolorum exercitationem.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (7, 8, '1991-07-25 18:55:09', 'Corporis atque eveniet consequatur fugiat neque qui. Dolorem molestiae nemo aut voluptatem libero et fugiat. Ut est sint perferendis eius eaque doloribus.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (7, 10, '1994-12-07 23:37:56', 'Vitae eos voluptas occaecati. Consequatur eligendi ut mollitia qui tempora aut quasi. Sint aut ducimus voluptatem amet est at eos. Iure quibusdam aliquam ratione quia voluptatibus ea dolores.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (9, 4, '1974-06-23 09:19:54', 'Error sit sunt voluptatum sint veritatis. At quod velit dolores voluptate omnis beatae.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (10, 1, '1988-08-03 22:05:32', 'Asperiores vel occaecati vel consectetur non eum laborum. Hic voluptatem repellendus eligendi ut eligendi recusandae ut. Ex quo perspiciatis sapiente voluptatem possimus.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (10, 3, '2011-07-07 10:44:12', 'Eligendi quae cupiditate vero illum laborum similique et. Et commodi ullam culpa. Repudiandae perspiciatis quidem quia. Libero qui reprehenderit cupiditate molestiae et eveniet rerum.');
INSERT INTO `tbl_MESSAGE` (`from_id`, `to_id`, `created_date`, `content`) VALUES (10, 10, '1997-09-28 21:45:01', 'Sed consequatur et illum eveniet voluptatem ab. Numquam velit est quia et suscipit. Dolorum dolorem facilis eum est earum.');


#
# TABLE STRUCTURE FOR: tbl_PTQ
#

DROP TABLE IF EXISTS `tbl_PTQ`;

CREATE TABLE `tbl_PTQ` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `minimum_score` float NOT NULL DEFAULT 0,
  `is_randomize` tinyint(1) NOT NULL DEFAULT 0,
  `duration` decimal(5,2) NOT NULL DEFAULT 0.00,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  CONSTRAINT `tbl_PTQ_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_ITEM` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_QUESTION
#

DROP TABLE IF EXISTS `tbl_QUESTION`;

CREATE TABLE `tbl_QUESTION` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tbl_QUESTION_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_USER` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tbl_QUESTION_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tbl_COURSE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (1, 9, 8, 'Possimus sit veniam molestiae quis. Quia cupiditate ad animi nulla mollitia. Vitae at labore velit harum voluptas. Debitis aliquam nihil nisi exercitationem alias facilis.', '2001-01-29 13:52:23');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (2, 5, 3, 'Et enim sapiente quasi placeat. Est laudantium iusto consequatur accusamus iusto reiciendis maiores. Commodi assumenda culpa qui quibusdam laborum maxime rerum. Ut expedita ducimus quas quod ut sit.', '1985-06-22 03:10:54');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (3, 9, 3, 'Ipsum ab eum aut ut. Et adipisci eveniet odit ut impedit. Similique eos quae omnis explicabo dolorem dolore perferendis et.', '1975-03-26 19:31:39');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (4, 8, 10, 'Rerum culpa ut nostrum non aut quia consequatur. Quos aut quo ipsa at officia.', '1988-01-01 12:35:49');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (5, 6, 10, 'Optio voluptatem perspiciatis vel aut vitae sunt. Voluptatem earum eligendi quia est. Et cum distinctio aut illum sit odit commodi. Est libero illum voluptatum sunt.', '2006-02-22 21:13:09');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (6, 9, 3, 'Consequatur eos aliquid fugiat enim ipsam aut. Rerum ut ipsam neque necessitatibus repellat praesentium ea a. Vel corporis necessitatibus et aliquam nihil iste. Sit eos quia sit quia.', '1977-01-11 09:15:54');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (7, 2, 9, 'Aut impedit voluptatum ad nemo. Alias eius repudiandae voluptatibus qui dolor. Iste voluptas quaerat eos quae a velit ipsa. Ut molestias voluptatem adipisci in officia fugit saepe.', '1980-02-05 03:41:51');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (8, 10, 8, 'Non ab numquam quod labore aut voluptatum deserunt. Ut consequuntur facilis optio ut. Sapiente maxime consequatur consequatur sed eaque voluptas eos.', '2019-02-18 10:56:19');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (9, 6, 10, 'Ipsam voluptates sequi excepturi dolorem. Voluptatum neque aut qui. Mollitia excepturi quo et enim.', '2006-12-04 05:02:10');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (10, 9, 3, 'Fuga praesentium facere ducimus. Consectetur at fugiat eligendi nihil.', '2002-04-26 19:13:32');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (11, 6, 10, 'Omnis sunt laborum rem rerum qui nulla. Aut eum qui sunt. Ut voluptatem sunt ut quo similique sunt eius aut. Consequatur qui repellat vel molestiae.', '1987-10-27 22:07:59');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (12, 4, 4, 'Consequuntur et ut numquam omnis doloremque. Debitis illum impedit laborum vel maiores sed. Nostrum aliquam alias eum enim tempore. Facilis asperiores non autem dolores.', '1970-11-06 23:48:57');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (13, 7, 7, 'Harum aliquid dolorem et molestias. Rerum delectus mollitia dignissimos odio velit repellat. Quo similique consequatur eum quia.', '2002-07-07 19:18:12');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (14, 8, 9, 'Eos eum velit nihil dolor earum atque quasi. Libero nostrum officia labore autem velit. Ut possimus voluptatum sint culpa libero eius.', '2019-01-15 01:35:05');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (15, 5, 3, 'Nulla architecto accusantium quae sunt est. Optio repudiandae eum quasi sint dolorum.', '2004-01-28 02:10:56');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (16, 5, 3, 'Quibusdam sit vero quasi minus. Soluta ipsum corporis ut quo cumque quas. Sit omnis dolore omnis minus deleniti. Laborum ut blanditiis et deserunt. Quaerat enim repellat in non adipisci.', '1973-11-20 08:46:25');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (17, 10, 9, 'Architecto sequi enim rerum et commodi et odio. Dolor nam enim pariatur libero. Est quisquam et sunt eum reprehenderit.', '1999-01-21 17:18:16');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (18, 6, 9, 'Id facilis ut ut vel numquam. Est sint autem fuga vel distinctio consectetur non. Sequi culpa quisquam minima itaque laboriosam quis. Rerum quae fugit nam.', '1977-02-22 08:31:54');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (19, 2, 4, 'Ut laboriosam laudantium tempora id nesciunt. Fugit quod laborum eum explicabo. Consequuntur eligendi aut et dolorem. Nihil nesciunt cumque est quia autem.', '1984-02-02 13:05:13');
INSERT INTO `tbl_QUESTION` (`id`, `student_id`, `course_id`, `content`, `created_date`) VALUES (20, 9, 8, 'Occaecati ipsa sunt quidem voluptatem. Nostrum quis fuga omnis et deserunt. Molestiae quia ab est porro nemo.', '2008-12-17 20:58:05');


#
# TABLE STRUCTURE FOR: tbl_QUIZ
#

DROP TABLE IF EXISTS `tbl_QUIZ`;

CREATE TABLE `tbl_QUIZ` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `knowledge_area` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`item_id`,`course_id`),
  KEY `item_id` (`item_id`,`course_id`),
  CONSTRAINT `tbl_QUIZ_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_PTQ` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2081 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_QUIZ_ANSWER
#

DROP TABLE IF EXISTS `tbl_QUIZ_ANSWER`;

CREATE TABLE `tbl_QUIZ_ANSWER` (
  `quiz_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `rightness` tinyint(1) NOT NULL,
  PRIMARY KEY (`quiz_id`,`item_id`,`course_id`,`content`),
  CONSTRAINT `tbl_QUIZ_ANSWER_ibfk_1` FOREIGN KEY (`quiz_id`, `item_id`, `course_id`) REFERENCES `tbl_QUIZ` (`id`, `item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_RESOURCE
#

DROP TABLE IF EXISTS `tbl_RESOURCE`;

CREATE TABLE `tbl_RESOURCE` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`,`title`,`url`),
  CONSTRAINT `tbl_RESOURCE_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_LECTURE` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_SECTION
#

DROP TABLE IF EXISTS `tbl_SECTION`;

CREATE TABLE `tbl_SECTION` (
  `section_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `section_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`section_id`,`course_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `section_order` (`section_order`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tbl_SECTION_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_COURSE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (1, 1, 'et', 91771);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (2, 2, 'inventore', 3475579);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (3, 3, 'quod', 7550);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (4, 4, 'optio', 3849509);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (5, 5, 'tempora', 553906);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (6, 6, 'ut', 1119);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (7, 7, 'non', 11254857);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (8, 8, 'quas', 8723);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (9, 9, 'architecto', 241);
INSERT INTO `tbl_SECTION` (`section_id`, `course_id`, `name`, `section_order`) VALUES (10, 10, 'sunt', 671);


#
# TABLE STRUCTURE FOR: tbl_SUBCATEGORY
#

DROP TABLE IF EXISTS `tbl_SUBCATEGORY`;

CREATE TABLE `tbl_SUBCATEGORY` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default Subcategory''s name',
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `tbl_SUBCATEGORY_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tbl_CATEGORY` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (1, 'rerum', 1);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (2, 'in', 2);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (3, 'fugit', 3);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (4, 'odio', 4);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (5, 'dignissimos', 5);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (6, 'ut', 6);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (7, 'quia', 7);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (8, 'eum', 8);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (9, 'quis', 9);
INSERT INTO `tbl_SUBCATEGORY` (`id`, `name`, `category_id`) VALUES (10, 'recusandae', 10);


#
# TABLE STRUCTURE FOR: tbl_TEACH
#

DROP TABLE IF EXISTS `tbl_TEACH`;

CREATE TABLE `tbl_TEACH` (
  `instructor_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `permission` bit(8) NOT NULL DEFAULT b'11111111',
  `share` decimal(5,2) NOT NULL DEFAULT 100.00,
  PRIMARY KEY (`instructor_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tbl_TEACH_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `tbl_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_TEACH_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tbl_COURSE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (1, 9, '3', '88.34');
INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (2, 3, '105', '63.49');
INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (2, 5, '26', '20.48');
INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (5, 2, '68', '18.97');
INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (5, 10, '89', '91.82');
INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (6, 8, '68', '92.72');
INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (7, 1, '102', '53.27');
INSERT INTO `tbl_TEACH` (`instructor_id`, `course_id`, `permission`, `share`) VALUES (10, 4, '51', '67.00');


#
# TABLE STRUCTURE FOR: tbl_USER
#

DROP TABLE IF EXISTS `tbl_USER`;

CREATE TABLE `tbl_USER` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `profile_picture` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bigraphy` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `headline` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedln` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_language` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'English',
  `profile_setting` tinyint(1) NOT NULL DEFAULT 0,
  `instructor_flag` tinyint(1) NOT NULL DEFAULT 0,
  `student_flag` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (1, 'smetz@example.net', 'c716f3d88bdba673228f7f759b7d2bb6e97e1ff82e63d9a3e5243b5aa209fcc1', 'Rose', 'Ward', 'http://lorempixel.com/640/480/', 'Queen in front of the sort,\' said the King. \'It began with the time,\' she said this, she noticed that the reason of that?\' \'In my youth,\' said the young man said, \'And your hair has become very.', 'I give you fair warning,\' shouted the Queen said severely \'Who i', 'http://www.harber.com/', 'http://www.haley.com/', 'http://howenader.net/', 'http://raynorkrajcik.com/', 'http://reilly.net/', 'exercitationem', 1, 1, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (2, 'dahlia95@example.com', 'dba3bf98ca8dcd111582f592aa6b433a9ddae153e841bd4f3f43647b02b912e4', 'Tobin', 'Davis', 'http://lorempixel.com/640/480/', 'There was exactly three inches high). \'But I\'m NOT a serpent, I tell you!\' said Alice. \'That\'s very curious!\' she thought. \'I must be Mabel after all, and I shall be punished for it was out of.', 'Miss, this here ought to be done, I wonder?\' As she said to hers', 'http://www.harvey.net/', 'http://www.dubuqueschultz.com/', 'http://marksquigley.com/', 'http://deckow.info/', 'http://www.schneiderbernhard.net/', 'incidunt', 0, 1, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (3, 'prosacco.dannie@example.net', '649b444b5c9b9a25be388d808a91be74d776e086956cc6a7f00bcb240e5e0a1c', 'Melissa', 'Larkin', 'http://lorempixel.com/640/480/', 'Alice. \'Anything you like,\' said the King said, with a large mushroom growing near her, about the temper of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that.', 'March Hare meekly replied. \'Yes, but I can\'t take LESS,\' said th', 'http://www.orn.com/', 'http://reinger.biz/', 'http://zulauf.com/', 'http://hilll.com/', 'http://www.huels.com/', 'adipisci', 0, 0, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (4, 'deckow.eldred@example.com', '581a43d6ea7e4a46c596d7f892d8e985653b68abf4dd8228cfd25eb8995c34df', 'Gregoria', 'Crist', 'http://lorempixel.com/640/480/', 'Queen said severely \'Who is it directed to?\' said one of the party went back for a minute, while Alice thought decidedly uncivil. \'But perhaps it was indeed: she was a most extraordinary noise going.', 'Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now', 'http://dickens.com/', 'http://www.pfannerstill.com/', 'http://huelsbrekke.org/', 'http://www.cormierpaucek.com/', 'http://metzosinski.com/', 'dolor', 0, 0, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (5, 'will.lon@example.org', '1ff85f2f2320a42c25f3813f3d1b6cdaca88e363a8ef23682f9dd25a76ff35d1', 'Angela', 'Leannon', 'http://lorempixel.com/640/480/', 'So they sat down with her head! Off--\' \'Nonsense!\' said Alice, \'but I haven\'t had a consultation about this, and she did not like to see a little timidly, \'why you are very dull!\' \'You ought to.', 'And he added looking angrily at the time they were gardeners, or', 'http://www.durgan.com/', 'http://hermistonpollich.info/', 'http://www.harberstamm.com/', 'http://www.kuhntorp.org/', 'http://von.com/', 'ut', 0, 1, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (6, 'mkilback@example.org', '2c32bcefacb20772503f682f1b549f9d8a5be70bd95a4aa9d75d1201fa3bf02a', 'Tina', 'Romaguera', 'http://lorempixel.com/640/480/', 'And yet I don\'t keep the same thing with you,\' said the March Hare. \'I didn\'t write it, and on both sides of it, and fortunately was just in time to begin at HIS time of life. The King\'s argument.', 'Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse ou', 'http://carroll.org/', 'http://www.leannonbauch.com/', 'http://www.braungibson.com/', 'http://www.schoen.info/', 'http://kreigerwitting.com/', 'quidem', 1, 1, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (7, 'helga.o\'conner@example.com', '77e19372c240b454f5a9aec61a8c31a42170a94a5956266874db0f76986580ba', 'Mae', 'Reilly', 'http://lorempixel.com/640/480/', 'I\'ll eat it,\' said Alice. \'It must be shutting up like telescopes: this time she had got burnt, and eaten up by wild beasts and other unpleasant things, all because they WOULD go with Edgar Atheling.', 'Alice thought to herself how this same little sister of hers wou', 'http://www.funkbernier.com/', 'http://www.wintheiser.com/', 'http://hickle.org/', 'http://www.grady.com/', 'http://binsmurray.com/', 'molestiae', 0, 1, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (8, 'yundt.jermaine@example.net', '85aead894092df48c651941a97766d6d1e48149056ca0ae1f6e4127b8c80aad5', 'Vito', 'Torphy', 'http://lorempixel.com/640/480/', 'March Hare: she thought it would,\' said the Duchess, it had grown in the last concert!\' on which the wretched Hatter trembled so, that he had taken his watch out of breath, and till the Pigeon in a.', 'Alice; not that she still held the pieces of mushroom in her lif', 'http://www.hammes.org/', 'http://www.mayert.net/', 'http://www.ebertbernhard.info/', 'http://www.kohlerstamm.com/', 'http://www.grimes.com/', 'esse', 1, 1, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (9, 'odavis@example.com', '493a876a1d9d769c796c0296e1a9bd508a4f378d48acc0fc3514ef54c1b2ecb1', 'Raquel', 'Schultz', 'http://lorempixel.com/640/480/', 'It was high time you were INSIDE, you might knock, and I had to double themselves up and throw us, with the clock. For instance, suppose it were nine o\'clock in the last few minutes it puffed away.', 'Turtle--we used to say when I was a table, with a large dish of ', 'http://corkery.com/', 'http://www.metz.com/', 'http://armstrong.info/', 'http://www.romaguera.com/', 'http://www.cremin.com/', 'ratione', 0, 0, 1);
INSERT INTO `tbl_USER` (`id`, `email`, `password`, `first_name`, `last_name`, `profile_picture`, `bigraphy`, `headline`, `website`, `facebook`, `twitter`, `linkedln`, `youtube`, `user_language`, `profile_setting`, `instructor_flag`, `student_flag`) VALUES (10, 'simonis.domenic@example.org', 'df7872795a4042437ad980398cffb41e00e4a9964e8bcf436fb21c68512db024', 'Lenna', 'Gleason', 'http://lorempixel.com/640/480/', 'I must have imitated somebody else\'s hand,\' said the Queen, but she could not swim. He sent them word I had our Dinah here, I know who I am! But I\'d better take him his fan and a piece of rudeness.', 'Alice waited till she was now the right size for ten minutes tog', 'http://www.stokesgrant.net/', 'http://dooleyward.org/', 'http://www.oconnellbrown.com/', 'http://powlowski.com/', 'http://connellylittle.com/', 'unde', 1, 1, 1);


#
# TABLE STRUCTURE FOR: tbl_VIDEO
#

DROP TABLE IF EXISTS `tbl_VIDEO`;

CREATE TABLE `tbl_VIDEO` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `is_previewable` tinyint(1) NOT NULL DEFAULT 0,
  `duration` decimal(5,2) NOT NULL DEFAULT 0.00,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  CONSTRAINT `tbl_VIDEO_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_LECTURE` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tbl_VIDEO_SLIDE
#

DROP TABLE IF EXISTS `tbl_VIDEO_SLIDE`;

CREATE TABLE `tbl_VIDEO_SLIDE` (
  `item_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `slide_url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `sync_url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`course_id`),
  CONSTRAINT `tbl_VIDEO_SLIDE_ibfk_1` FOREIGN KEY (`item_id`, `course_id`) REFERENCES `tbl_LECTURE` (`item_id`, `course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

