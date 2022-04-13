-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2022 at 09:04 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo3`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add post_ category', 7, 'add_post_category'),
(26, 'Can change post_ category', 7, 'change_post_category'),
(27, 'Can delete post_ category', 7, 'delete_post_category'),
(28, 'Can view post_ category', 7, 'view_post_category'),
(29, 'Can add post', 8, 'add_post'),
(30, 'Can change post', 8, 'change_post'),
(31, 'Can delete post', 8, 'delete_post'),
(32, 'Can view post', 8, 'view_post'),
(33, 'Can add comment', 9, 'add_comment'),
(34, 'Can change comment', 9, 'change_comment'),
(35, 'Can delete comment', 9, 'delete_comment'),
(36, 'Can view comment', 9, 'view_comment'),
(37, 'Can add profile', 10, 'add_profile'),
(38, 'Can change profile', 10, 'change_profile'),
(39, 'Can delete profile', 10, 'delete_profile'),
(40, 'Can view profile', 10, 'view_profile'),
(41, 'Can add auth token', 11, 'add_authtoken'),
(42, 'Can change auth token', 11, 'change_authtoken'),
(43, 'Can delete auth token', 11, 'delete_authtoken'),
(44, 'Can view auth token', 11, 'view_authtoken'),
(45, 'Can add techtalk', 12, 'add_techtalk'),
(46, 'Can change techtalk', 12, 'change_techtalk'),
(47, 'Can delete techtalk', 12, 'delete_techtalk'),
(48, 'Can view techtalk', 12, 'view_techtalk'),
(49, 'Can add post like', 13, 'add_postlike'),
(50, 'Can change post like', 13, 'change_postlike'),
(51, 'Can delete post like', 13, 'delete_postlike'),
(52, 'Can view post like', 13, 'view_postlike'),
(53, 'Can add learn', 14, 'add_learn'),
(54, 'Can change learn', 14, 'change_learn'),
(55, 'Can delete learn', 14, 'delete_learn'),
(56, 'Can view learn', 14, 'view_learn'),
(57, 'Can add techtalk like', 15, 'add_techtalklike'),
(58, 'Can change techtalk like', 15, 'change_techtalklike'),
(59, 'Can delete techtalk like', 15, 'delete_techtalklike'),
(60, 'Can view techtalk like', 15, 'view_techtalklike');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$7ghyoprskATr8Wg2DVMtvw$XtIjI6CLh9xJNn24OeQtd8yI+o8heTpxN9Z68kZatDQ=', '2022-04-13 02:59:18.944030', 1, 'qa', '', '', 'qa@gmail.com', 1, 1, '2022-04-13 02:59:05.423815');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` bigint(20) NOT NULL,
  `comment` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `comment`, `created_on`, `author_id`, `post_id`, `parent_id`) VALUES
(1, 'nice', '2022-04-13 03:00:54.000000', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_learn`
--

CREATE TABLE `blog_learn` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `title`, `content`, `date_posted`, `author_id`, `category_id`, `slug`) VALUES
(1, 'Test post', 'qkjakfjksjfasjfioajfojflsdfasdfvcxzxvx', '2022-04-13 03:00:22.000000', 1, 1, 'test-post');

-- --------------------------------------------------------

--
-- Table structure for table `blog_postlike`
--

CREATE TABLE `blog_postlike` (
  `id` bigint(20) NOT NULL,
  `like_posts_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_postlike_like_users`
--

CREATE TABLE `blog_postlike_like_users` (
  `id` bigint(20) NOT NULL,
  `postlike_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_category`
--

CREATE TABLE `blog_post_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_post_category`
--

INSERT INTO `blog_post_category` (`id`, `name`) VALUES
(1, 'Tiếng Nhật'),
(2, 'Lập trình');

-- --------------------------------------------------------

--
-- Table structure for table `blog_techtalk`
--

CREATE TABLE `blog_techtalk` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `start_on` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_techtalklike`
--

CREATE TABLE `blog_techtalklike` (
  `id` bigint(20) NOT NULL,
  `like_techtalks_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_techtalklike_like_users`
--

CREATE TABLE `blog_techtalklike_like_users` (
  `id` bigint(20) NOT NULL,
  `techtalklike_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-04-13 03:00:07.691458', '1', 'Tiếng Nhật', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-04-13 03:00:17.894229', '2', 'Lập trình', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-04-13 03:00:40.950517', '1', 'Test post', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-04-13 03:01:09.140182', '1', 'Comment by <bound method AbstractBaseUser.__str__ of <User: qa>> on Test post', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'blog', 'comment'),
(14, 'blog', 'learn'),
(8, 'blog', 'post'),
(13, 'blog', 'postlike'),
(7, 'blog', 'post_category'),
(12, 'blog', 'techtalk'),
(15, 'blog', 'techtalklike'),
(5, 'contenttypes', 'contenttype'),
(11, 'knox', 'authtoken'),
(6, 'sessions', 'session'),
(10, 'users', 'profile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-12 10:26:38.399229'),
(2, 'auth', '0001_initial', '2022-04-12 10:26:39.151665'),
(3, 'admin', '0001_initial', '2022-04-12 10:26:39.332190'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-12 10:26:39.352484'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-12 10:26:39.369705'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-04-12 10:26:39.466677'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-04-12 10:26:39.530925'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-04-12 10:26:39.567405'),
(9, 'auth', '0004_alter_user_username_opts', '2022-04-12 10:26:39.578933'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-04-12 10:26:39.680844'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-04-12 10:26:39.685768'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-12 10:26:39.706311'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-04-12 10:26:39.735176'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-12 10:26:39.788571'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-04-12 10:26:39.819144'),
(16, 'auth', '0011_update_proxy_permissions', '2022-04-12 10:26:39.831361'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-12 10:26:39.858364'),
(18, 'blog', '0001_initial', '2022-04-12 10:26:40.033668'),
(19, 'blog', '0002_post_trich', '2022-04-12 10:26:40.084036'),
(20, 'blog', '0003_remove_post_trich', '2022-04-12 10:26:40.114219'),
(21, 'blog', '0004_post_likes', '2022-04-12 10:26:40.317383'),
(22, 'blog', '0005_comment', '2022-04-12 10:26:40.479399'),
(23, 'blog', '0006_alter_comment_options_comment_parent', '2022-04-12 10:26:40.566259'),
(24, 'blog', '0007_post_slug', '2022-04-12 10:26:40.623498'),
(25, 'knox', '0001_initial', '2022-04-12 10:26:40.714795'),
(26, 'knox', '0002_auto_20150916_1425', '2022-04-12 10:26:40.829693'),
(27, 'knox', '0003_auto_20150916_1526', '2022-04-12 10:26:40.870572'),
(28, 'knox', '0004_authtoken_expires', '2022-04-12 10:26:40.906551'),
(29, 'knox', '0005_authtoken_token_key', '2022-04-12 10:26:40.948526'),
(30, 'knox', '0006_auto_20160818_0932', '2022-04-12 10:26:41.043520'),
(31, 'knox', '0007_auto_20190111_0542', '2022-04-12 10:26:41.083638'),
(32, 'knox', '0008_remove_authtoken_salt', '2022-04-12 10:26:41.109322'),
(33, 'sessions', '0001_initial', '2022-04-12 10:26:41.154313'),
(34, 'users', '0001_initial', '2022-04-12 10:26:41.239143'),
(35, 'blog', '0008_techtalk', '2022-04-12 10:27:15.607434'),
(36, 'blog', '0009_remove_post_likes_postlike', '2022-04-12 10:36:58.294578'),
(37, 'blog', '0010_learn_rename_created_on_techtalk_start_on_and_more', '2022-04-13 02:47:46.780009');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('73bmk1uecx1acgizrjxjeok66s2l8stc', '.eJxVjDkOwjAUBe_iGlleY0xJnzNYf7FxADlSnFSIu0OkFNC-mXkvkWBba9p6XtLE4iK0OP1uCPTIbQd8h3abJc1tXSaUuyIP2uU4c35eD_fvoEKv37oELt4PENFrW0BHDGSKsmRDsNmYs2F0RKx0BnRsCkUdPaFyanCuKPH-APRsOCA:1neTDy:8u8OgPkAT9FavWb4NcaEhjnCSme6mNxiLQ8dpT9j5-c', '2022-04-27 02:59:18.963480');

-- --------------------------------------------------------

--
-- Table structure for table `knox_authtoken`
--

CREATE TABLE `knox_authtoken` (
  `digest` varchar(128) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expiry` datetime(6) DEFAULT NULL,
  `token_key` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `image`, `created_time`, `is_admin`, `is_verified`, `user_id`) VALUES
(1, 'default.jpg', '2022-04-13 02:59:05.633628', 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_author_id_4f11e2e0_fk_auth_user_id` (`author_id`),
  ADD KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`),
  ADD KEY `blog_comment_parent_id_f2a027bb_fk_blog_comment_id` (`parent_id`);

--
-- Indexes for table `blog_learn`
--
ALTER TABLE `blog_learn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_learn_slug_225bf8ce` (`slug`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  ADD KEY `blog_post_category_id_c326dbf8_fk_blog_post_category_id` (`category_id`),
  ADD KEY `blog_post_slug_b95473f2` (`slug`);

--
-- Indexes for table `blog_postlike`
--
ALTER TABLE `blog_postlike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_postlike_like_posts_id_2abcb1d4_fk_blog_post_id` (`like_posts_id`);

--
-- Indexes for table `blog_postlike_like_users`
--
ALTER TABLE `blog_postlike_like_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_postlike_like_users_postlike_id_user_id_dfa5f490_uniq` (`postlike_id`,`user_id`),
  ADD KEY `blog_postlike_like_users_user_id_3593ca41_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `blog_post_category`
--
ALTER TABLE `blog_post_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_techtalk`
--
ALTER TABLE `blog_techtalk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_techtalk_author_id_ee957088_fk_auth_user_id` (`author_id`),
  ADD KEY `blog_techtalk_slug_8c052a9a` (`slug`);

--
-- Indexes for table `blog_techtalklike`
--
ALTER TABLE `blog_techtalklike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_techtalklike_like_techtalks_id_9cfbccc9_fk_blog_techtalk_id` (`like_techtalks_id`);

--
-- Indexes for table `blog_techtalklike_like_users`
--
ALTER TABLE `blog_techtalklike_like_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_techtalklike_like_u_techtalklike_id_user_id_8fcd3161_uniq` (`techtalklike_id`,`user_id`),
  ADD KEY `blog_techtalklike_like_users_user_id_bfb2e402_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `knox_authtoken`
--
ALTER TABLE `knox_authtoken`
  ADD PRIMARY KEY (`digest`),
  ADD KEY `knox_authtoken_user_id_e5a5d899_fk_auth_user_id` (`user_id`),
  ADD KEY `knox_authtoken_token_key_8f4f7d47` (`token_key`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_learn`
--
ALTER TABLE `blog_learn`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_postlike`
--
ALTER TABLE `blog_postlike`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_postlike_like_users`
--
ALTER TABLE `blog_postlike_like_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_category`
--
ALTER TABLE `blog_post_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_techtalk`
--
ALTER TABLE `blog_techtalk`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_techtalklike`
--
ALTER TABLE `blog_techtalklike`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_techtalklike_like_users`
--
ALTER TABLE `blog_techtalklike_like_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `blog_comment_author_id_4f11e2e0_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `blog_comment_parent_id_f2a027bb_fk_blog_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `blog_comment` (`id`),
  ADD CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`);

--
-- Constraints for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_post_category` (`id`);

--
-- Constraints for table `blog_postlike`
--
ALTER TABLE `blog_postlike`
  ADD CONSTRAINT `blog_postlike_like_posts_id_2abcb1d4_fk_blog_post_id` FOREIGN KEY (`like_posts_id`) REFERENCES `blog_post` (`id`);

--
-- Constraints for table `blog_postlike_like_users`
--
ALTER TABLE `blog_postlike_like_users`
  ADD CONSTRAINT `blog_postlike_like_u_postlike_id_407d62de_fk_blog_post` FOREIGN KEY (`postlike_id`) REFERENCES `blog_postlike` (`id`),
  ADD CONSTRAINT `blog_postlike_like_users_user_id_3593ca41_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_techtalk`
--
ALTER TABLE `blog_techtalk`
  ADD CONSTRAINT `blog_techtalk_author_id_ee957088_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_techtalklike`
--
ALTER TABLE `blog_techtalklike`
  ADD CONSTRAINT `blog_techtalklike_like_techtalks_id_9cfbccc9_fk_blog_techtalk_id` FOREIGN KEY (`like_techtalks_id`) REFERENCES `blog_techtalk` (`id`);

--
-- Constraints for table `blog_techtalklike_like_users`
--
ALTER TABLE `blog_techtalklike_like_users`
  ADD CONSTRAINT `blog_techtalklike_li_techtalklike_id_4f985b47_fk_blog_tech` FOREIGN KEY (`techtalklike_id`) REFERENCES `blog_techtalklike` (`id`),
  ADD CONSTRAINT `blog_techtalklike_like_users_user_id_bfb2e402_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `knox_authtoken`
--
ALTER TABLE `knox_authtoken`
  ADD CONSTRAINT `knox_authtoken_user_id_e5a5d899_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
