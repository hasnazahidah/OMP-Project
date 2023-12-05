-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Des 2023 pada 05.32
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omp3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `access_keys`
--

CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `announcement_settings`
--

CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `announcement_types`
--

CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `announcement_type_settings`
--

CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `authors`
--

CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `authors`
--

INSERT INTO `authors` (`author_id`, `email`, `include_in_browse`, `publication_id`, `seq`, `user_group_id`) VALUES
(1, 'zahidahasna002@gmail.com', 1, 1, 0.00, 2),
(2, 'zahidahasna002@gmail.com', 1, 2, 0.00, 2),
(3, 'zahidahasna002@gmail.com', 1, 3, 0.00, 2),
(4, 'zahidahasna002@gmail.com', 1, 4, 0.00, 2),
(5, 'zahidahasna002@gmail.com', 1, 5, 0.00, 2),
(6, 'zahidahasna002@gmail.com', 1, 6, 0.00, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `author_settings`
--

CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `author_settings`
--

INSERT INTO `author_settings` (`author_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, 'en_US', 'familyName', 'hasnaz'),
(1, 'en_US', 'givenName', 'hasnaz'),
(2, 'en_US', 'familyName', 'hasnaz'),
(2, 'en_US', 'givenName', 'hasnaz'),
(3, 'en_US', 'familyName', 'hasnaz'),
(3, 'en_US', 'givenName', 'hasnaz'),
(4, 'en_US', 'familyName', 'hasnaz'),
(4, 'en_US', 'givenName', 'hasnaz'),
(5, 'en_US', 'familyName', 'hasnaz'),
(5, 'en_US', 'givenName', 'hasnaz'),
(6, 'en_US', 'familyName', 'hasnaz'),
(6, 'en_US', 'givenName', 'hasnaz');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_sources`
--

CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`category_id`, `context_id`, `parent_id`, `seq`, `path`, `image`) VALUES
(1, 1, 0, 0, 'womens_studies', 'a:0:{}'),
(2, 1, 0, 0, 'technology', 'a:0:{}'),
(3, 1, 0, 0, 'sociology', 'a:0:{}'),
(4, 1, 0, 0, 'religion_spirituality', 'a:0:{}'),
(5, 1, 0, 0, 'Psychology', 'a:0:{}'),
(6, 1, 0, 0, 'polisci', 'a:0:{}'),
(7, 1, 0, 0, 'Philosophy', 'a:0:{}'),
(8, 1, 0, 0, 'Nature_Environment', 'a:0:{}'),
(9, 1, 0, 0, 'Medical', 'a:0:{}'),
(10, 2, 0, 0, 'paperoni', 'a:0:{}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_settings`
--

CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `category_settings`
--

INSERT INTO `category_settings` (`category_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'sortOption', 'datePublished-2', 'string'),
(1, 'en_US', 'description', '', 'string'),
(1, 'en_US', 'title', 'women\'s studies', 'string'),
(2, '', 'sortOption', 'datePublished-2', 'string'),
(2, 'en_US', 'description', '', 'string'),
(2, 'en_US', 'title', 'Technology', 'string'),
(3, '', 'sortOption', 'datePublished-2', 'string'),
(3, 'en_US', 'description', '', 'string'),
(3, 'en_US', 'title', 'Sociology', 'string'),
(4, '', 'sortOption', 'datePublished-2', 'string'),
(4, 'en_US', 'description', '', 'string'),
(4, 'en_US', 'title', 'Religion & Spirituality', 'string'),
(5, '', 'sortOption', 'datePublished-2', 'string'),
(5, 'en_US', 'description', '', 'string'),
(5, 'en_US', 'title', 'Psychology', 'string'),
(6, '', 'sortOption', 'datePublished-2', 'string'),
(6, 'en_US', 'description', '', 'string'),
(6, 'en_US', 'title', 'Political Science', 'string'),
(7, '', 'sortOption', 'datePublished-2', 'string'),
(7, 'en_US', 'description', '', 'string'),
(7, 'en_US', 'title', 'Philosophy', 'string'),
(8, '', 'sortOption', 'datePublished-2', 'string'),
(8, 'en_US', 'description', '', 'string'),
(8, 'en_US', 'title', 'Nature & Environment', 'string'),
(9, '', 'sortOption', 'datePublished-2', 'string'),
(9, 'en_US', 'description', '', 'string'),
(9, 'en_US', 'title', 'Medical', 'string'),
(10, '', 'sortOption', 'datePublished-2', 'string'),
(10, 'en_US', 'description', '', 'string'),
(10, 'en_US', 'title', 'Paperback', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `citations`
--

CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `citation_settings`
--

CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `completed_payments`
--

CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` varchar(16) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `controlled_vocabs`
--

CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(1, 'interest', 0, 0),
(6, 'submissionAgency', 1048588, 1),
(11, 'submissionAgency', 1048588, 2),
(16, 'submissionAgency', 1048588, 3),
(21, 'submissionAgency', 1048588, 4),
(26, 'submissionAgency', 1048588, 5),
(31, 'submissionAgency', 1048588, 6),
(4, 'submissionDiscipline', 1048588, 1),
(9, 'submissionDiscipline', 1048588, 2),
(14, 'submissionDiscipline', 1048588, 3),
(19, 'submissionDiscipline', 1048588, 4),
(24, 'submissionDiscipline', 1048588, 5),
(29, 'submissionDiscipline', 1048588, 6),
(2, 'submissionKeyword', 1048588, 1),
(7, 'submissionKeyword', 1048588, 2),
(12, 'submissionKeyword', 1048588, 3),
(17, 'submissionKeyword', 1048588, 4),
(22, 'submissionKeyword', 1048588, 5),
(27, 'submissionKeyword', 1048588, 6),
(5, 'submissionLanguage', 1048588, 1),
(10, 'submissionLanguage', 1048588, 2),
(15, 'submissionLanguage', 1048588, 3),
(20, 'submissionLanguage', 1048588, 4),
(25, 'submissionLanguage', 1048588, 5),
(30, 'submissionLanguage', 1048588, 6),
(3, 'submissionSubject', 1048588, 1),
(8, 'submissionSubject', 1048588, 2),
(13, 'submissionSubject', 1048588, 3),
(18, 'submissionSubject', 1048588, 4),
(23, 'submissionSubject', 1048588, 5),
(28, 'submissionSubject', 1048588, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `controlled_vocab_entries`
--

CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `controlled_vocab_entry_settings`
--

CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_object_tombstones`
--

CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_object_tombstone_oai_set_objects`
--

CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_object_tombstone_settings`
--

CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `edit_decisions`
--

CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `edit_decisions`
--

INSERT INTO `edit_decisions` (`edit_decision_id`, `submission_id`, `review_round_id`, `stage_id`, `round`, `editor_id`, `decision`, `date_decided`) VALUES
(1, 1, 0, 1, 0, 1, 2, '2023-10-19 09:47:33'),
(2, 1, 0, 4, 0, 1, 7, '2023-10-19 09:48:27'),
(3, 2, 0, 1, 0, 1, 2, '2023-10-19 10:00:42'),
(4, 2, 0, 4, 0, 1, 7, '2023-10-19 10:01:13'),
(5, 3, 0, 1, 0, 1, 2, '2023-10-19 10:10:22'),
(6, 3, 0, 4, 0, 1, 7, '2023-10-19 10:10:48'),
(7, 4, 0, 1, 0, 1, 2, '2023-10-19 10:37:57'),
(8, 4, 0, 4, 0, 1, 7, '2023-10-19 10:38:10'),
(9, 5, 0, 1, 0, 1, 2, '2023-10-20 04:39:30'),
(10, 5, 0, 4, 0, 1, 7, '2023-10-20 04:40:11'),
(11, 6, 0, 1, 0, 1, 2, '2023-10-20 09:34:36'),
(12, 6, 0, 4, 0, 1, 7, '2023-10-20 09:34:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_log`
--

CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_log_users`
--

CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_templates`
--

CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_templates_default`
--

CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT 0,
  `can_edit` smallint(6) NOT NULL DEFAULT 0,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`, `stage_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL, NULL),
(2, 'NOTIFICATION_CENTER_DEFAULT', 0, 1, NULL, NULL, NULL),
(3, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL, NULL),
(4, 'USER_REGISTER', 0, 1, NULL, NULL, NULL),
(5, 'USER_VALIDATE', 0, 1, NULL, NULL, NULL),
(6, 'REVIEWER_REGISTER', 0, 1, NULL, NULL, NULL),
(7, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL, NULL),
(8, 'SUBMISSION_ACK', 1, 1, NULL, 65536, 1),
(9, 'SUBMISSION_ACK_NOT_USER', 1, 1, NULL, 65536, 1),
(10, 'EDITOR_ASSIGN', 1, 1, 16, 16, 1),
(11, 'REVIEW_CANCEL', 1, 1, 16, 4096, 3),
(12, 'REVIEW_REINSTATE', 1, 1, 16, 4096, 3),
(13, 'REVIEW_REQUEST', 1, 1, 16, 4096, 3),
(14, 'REVIEW_REQUEST_ONECLICK', 1, 1, 16, 4096, 3),
(15, 'REVIEW_REQUEST_REMIND_AUTO', 0, 1, NULL, 4096, 3),
(16, 'REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096, 3),
(17, 'REVIEW_REQUEST_ATTACHED', 0, 1, 16, 4096, 3),
(18, 'REVIEW_CONFIRM', 1, 1, 4096, 16, 3),
(19, 'REVIEW_DECLINE', 1, 1, 4096, 16, 3),
(20, 'REVIEW_ACK', 1, 1, 16, 4096, 3),
(21, 'REVIEW_REMIND', 0, 1, 16, 4096, 3),
(22, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096, 3),
(23, 'REVIEW_REMIND_ONECLICK', 0, 1, 16, 4096, 3),
(24, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096, 3),
(25, 'EDITOR_DECISION_ACCEPT', 0, 1, 16, 65536, 3),
(26, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 0, 1, 16, 65536, 3),
(27, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 0, 1, 16, 65536, 5),
(28, 'EDITOR_DECISION_REVISIONS', 0, 1, 16, 65536, 3),
(29, 'EDITOR_DECISION_RESUBMIT', 0, 1, 16, 65536, 3),
(30, 'EDITOR_DECISION_DECLINE', 0, 1, 16, 65536, 3),
(31, 'EDITOR_DECISION_INITIAL_DECLINE', 0, 1, 16, 65536, 1),
(32, 'EDITOR_RECOMMENDATION', 0, 1, 16, 16, 3),
(33, 'COPYEDIT_REQUEST', 1, 1, 16, 4097, 4),
(34, 'LAYOUT_REQUEST', 1, 1, 16, 4097, 5),
(35, 'LAYOUT_COMPLETE', 1, 1, 4097, 16, 5),
(36, 'INDEX_REQUEST', 1, 1, 16, 4097, 5),
(37, 'INDEX_COMPLETE', 1, 1, 4097, 16, 5),
(38, 'EMAIL_LINK', 0, 1, 1048576, NULL, NULL),
(39, 'STATISTICS_REPORT_NOTIFICATION', 1, 1, 16, 17, NULL),
(40, 'ANNOUNCEMENT', 0, 1, 16, 1048576, NULL),
(41, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL, NULL),
(42, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_templates_default_data`
--

CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('ANNOUNCEMENT', 'en_US', '{$title}', '<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.', 'This email is sent when a new announcement is created.'),
('COPYEDIT_REQUEST', 'en_US', 'Copyediting Request', '{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and click on the File that appears in Step 1.<br />\n3. Consult Copyediting Instructions posted on webpage.<br />\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.<br />\n5. Save copyedited file, and upload to Step 1 of Copyediting.<br />\n6. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}', 'This email is sent by a Series Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('EDITOR_ASSIGN', 'en_US', 'Editorial Assignment', '{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,', 'This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.'),
('EDITOR_DECISION_ACCEPT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}', 'This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_DECLINE', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}', 'This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_INITIAL_DECLINE', 'en_US', 'Editor Decision', '\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\nManuscript URL: {$submissionUrl}\n		', 'This email is send to the author if the editor declines his submission initially, before the review stage'),
('EDITOR_DECISION_RESUBMIT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}', 'This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_REVISIONS', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}', 'This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}', 'This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to an external review.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nThe editing of your manuscript, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nManuscript URL: {$submissionUrl}', 'This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to production.'),
('EDITOR_RECOMMENDATION', 'en_US', 'Editor Recommendation', '{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}', 'This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),
('EMAIL_LINK', 'en_US', 'Manuscript of Possible Interest', 'Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$monographUrl}&quot;.', 'This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.'),
('INDEX_COMPLETE', 'en_US', 'Index Galleys Complete', '{$editorialContactName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}', 'This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.'),
('INDEX_REQUEST', 'en_US', 'Request Index', '{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$editorialContactSignature}', 'This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.'),
('LAYOUT_COMPLETE', 'en_US', 'Layout Galleys Complete', '{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}', 'This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.'),
('LAYOUT_REQUEST', 'en_US', 'Request Galleys', '{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Layout Version file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.', 'This email from the Series Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('MANUAL_PAYMENT_NOTIFICATION', 'en_US', 'Manual Payment Notification', 'A manual payment needs to be processed for the press {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.', 'This email template is used to notify a press manager contact that a manual payment was requested.'),
('NOTIFICATION', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$principalContactSignature}', 'The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('NOTIFICATION_CENTER_DEFAULT', 'en_US', 'A message regarding {$contextName}', 'Please enter your message.', 'The default (blank) message used in the Notification Center Message Listbuilder.'),
('PASSWORD_RESET_CONFIRM', 'en_US', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'en_US', 'Unusual PayPal Activity', 'Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n', 'This email template is used to notify the press\' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PUBLISH_NOTIFY', 'en_US', 'New Book Published', 'Readers:<br />\n<br />\n{$contextName} has just published its latest book at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review monographs and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new book and invites them to visit the press at a supplied URL.'),
('REVIEWER_REGISTER', 'en_US', 'Registration as Reviewer with {$contextName}', 'In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEW_ACK', 'en_US', 'Manuscript Review Acknowledgement', '{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.', 'This email is sent by a Series Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_CANCEL', 'en_US', 'Request for Review Cancelled', '{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CONFIRM', 'en_US', 'Able to Review', 'Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_DECLINE', 'en_US', 'Unable to Review', 'Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been declined.'),
('REVIEW_REINSTATE', 'en_US', 'Request for Review Reinstated', '{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_REMIND', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Series Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_AUTO', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_ONECLICK', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Series Editor to remind a reviewer that their review is due.'),
('REVIEW_REQUEST', 'en_US', 'Manuscript Review Request', 'Dear {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n', 'This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ATTACHED', 'en_US', 'Manuscript Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this press are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Series Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ONECLICK', 'en_US', 'Manuscript Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}', 'This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_REMIND_AUTO', 'en_US', 'Manuscript Review Request', 'Dear {$reviewerName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'en_US', 'Manuscript Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('STATISTICS_REPORT_NOTIFICATION', 'en_US', 'Editorial activity for {$month}, {$year}', '\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}', 'This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),
('SUBMISSION_ACK', 'en_US', 'Submission Acknowledgement', '{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the press. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK_NOT_USER', 'en_US', 'Submission Acknowledgement', 'Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.'),
('USER_REGISTER', 'en_US', 'Press Registration', '{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_VALIDATE', 'en_US', 'Validate Your Account', '{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_templates_settings`
--

CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `event_log`
--

CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `event_log`
--

INSERT INTO `event_log` (`log_id`, `assoc_type`, `assoc_id`, `user_id`, `date_logged`, `event_type`, `message`, `is_translated`) VALUES
(1, 1048585, 1, 1, '2023-10-19 09:43:34', 268435458, 'submission.event.general.metadataUpdated', 0),
(2, 1048585, 1, 1, '2023-10-19 09:43:34', 268435458, 'submission.event.general.metadataUpdated', 0),
(3, 515, 1, 1, '2023-10-19 09:43:54', 1342177281, 'submission.event.fileUploaded', 0),
(4, 1048585, 1, 1, '2023-10-19 09:43:54', 1342177288, 'submission.event.fileRevised', 0),
(5, 515, 1, 1, '2023-10-19 09:44:06', 1342177296, 'submission.event.fileEdited', 0),
(6, 1048585, 1, 1, '2023-10-19 09:44:06', 1342177296, 'submission.event.fileEdited', 0),
(7, 1048585, 1, 1, '2023-10-19 09:46:07', 268435458, 'submission.event.general.metadataUpdated', 0),
(8, 1048585, 1, 1, '2023-10-19 09:46:15', 268435457, 'submission.event.submissionSubmitted', 0),
(9, 1048585, 1, 1, '2023-10-19 09:47:33', 805306371, 'log.editor.decision', 0),
(10, 515, 2, 1, '2023-10-19 09:47:57', 1342177281, 'submission.event.fileUploaded', 0),
(11, 1048585, 1, 1, '2023-10-19 09:47:57', 1342177288, 'submission.event.fileRevised', 0),
(12, 515, 2, 1, '2023-10-19 09:48:11', 1342177296, 'submission.event.fileEdited', 0),
(13, 1048585, 1, 1, '2023-10-19 09:48:11', 1342177296, 'submission.event.fileEdited', 0),
(14, 1048585, 1, 1, '2023-10-19 09:48:27', 805306371, 'log.editor.decision', 0),
(15, 1048585, 2, 1, '2023-10-19 09:53:18', 268435458, 'submission.event.general.metadataUpdated', 0),
(16, 1048585, 2, 1, '2023-10-19 09:53:18', 268435458, 'submission.event.general.metadataUpdated', 0),
(17, 515, 3, 1, '2023-10-19 09:56:53', 1342177281, 'submission.event.fileUploaded', 0),
(18, 1048585, 2, 1, '2023-10-19 09:56:53', 1342177288, 'submission.event.fileRevised', 0),
(19, 515, 3, 1, '2023-10-19 09:57:22', 1342177296, 'submission.event.fileEdited', 0),
(20, 1048585, 2, 1, '2023-10-19 09:57:22', 1342177296, 'submission.event.fileEdited', 0),
(21, 1048585, 2, 1, '2023-10-19 09:59:34', 268435458, 'submission.event.general.metadataUpdated', 0),
(22, 1048585, 2, 1, '2023-10-19 09:59:42', 268435457, 'submission.event.submissionSubmitted', 0),
(23, 1048585, 2, 1, '2023-10-19 10:00:42', 805306371, 'log.editor.decision', 0),
(24, 515, 4, 1, '2023-10-19 10:00:58', 1342177281, 'submission.event.fileUploaded', 0),
(25, 1048585, 2, 1, '2023-10-19 10:00:58', 1342177288, 'submission.event.fileRevised', 0),
(26, 1048585, 2, 1, '2023-10-19 10:01:13', 805306371, 'log.editor.decision', 0),
(27, 1048585, 2, 1, '2023-10-19 10:02:37', 268435474, 'submission.event.publicationFormatCreated', 0),
(28, 1048585, 2, 1, '2023-10-19 10:02:44', 268435464, 'submission.event.publicationFormatPublished', 0),
(29, 1048585, 2, 1, '2023-10-19 10:02:59', 268435474, 'submission.event.publicationFormatCreated', 0),
(30, 1048585, 2, 1, '2023-10-19 10:03:08', 268435464, 'submission.event.publicationFormatPublished', 0),
(31, 1048585, 2, 1, '2023-10-19 10:03:20', 268435474, 'submission.event.publicationFormatCreated', 0),
(32, 1048585, 2, 1, '2023-10-19 10:03:25', 268435464, 'submission.event.publicationFormatPublished', 0),
(33, 515, 5, 1, '2023-10-19 10:03:39', 1342177281, 'submission.event.fileUploaded', 0),
(34, 1048585, 2, 1, '2023-10-19 10:03:39', 1342177288, 'submission.event.fileRevised', 0),
(35, 515, 5, 1, '2023-10-19 10:03:57', 1342177296, 'submission.event.fileEdited', 0),
(36, 1048585, 2, 1, '2023-10-19 10:03:57', 1342177296, 'submission.event.fileEdited', 0),
(37, 515, 5, 1, '2023-10-19 10:03:57', 1342177287, 'submission.event.signoffSignoff', 0),
(38, 1048585, 2, 1, '2023-10-19 10:05:49', 268435462, 'publication.event.published', 0),
(39, 1048585, 3, 1, '2023-10-19 10:07:19', 268435458, 'submission.event.general.metadataUpdated', 0),
(40, 1048585, 3, 1, '2023-10-19 10:07:19', 268435458, 'submission.event.general.metadataUpdated', 0),
(41, 515, 6, 1, '2023-10-19 10:09:06', 1342177281, 'submission.event.fileUploaded', 0),
(42, 1048585, 3, 1, '2023-10-19 10:09:06', 1342177288, 'submission.event.fileRevised', 0),
(43, 515, 6, 1, '2023-10-19 10:09:09', 1342177296, 'submission.event.fileEdited', 0),
(44, 1048585, 3, 1, '2023-10-19 10:09:09', 1342177296, 'submission.event.fileEdited', 0),
(45, 1048585, 3, 1, '2023-10-19 10:09:56', 268435458, 'submission.event.general.metadataUpdated', 0),
(46, 1048585, 3, 1, '2023-10-19 10:10:05', 268435457, 'submission.event.submissionSubmitted', 0),
(47, 1048585, 3, 1, '2023-10-19 10:10:22', 805306371, 'log.editor.decision', 0),
(48, 515, 7, 1, '2023-10-19 10:10:35', 1342177281, 'submission.event.fileUploaded', 0),
(49, 1048585, 3, 1, '2023-10-19 10:10:35', 1342177288, 'submission.event.fileRevised', 0),
(50, 1048585, 3, 1, '2023-10-19 10:10:48', 805306371, 'log.editor.decision', 0),
(51, 1048585, 3, 1, '2023-10-19 10:11:43', 268435474, 'submission.event.publicationFormatCreated', 0),
(52, 515, 8, 1, '2023-10-19 10:11:55', 1342177281, 'submission.event.fileUploaded', 0),
(53, 1048585, 3, 1, '2023-10-19 10:11:55', 1342177288, 'submission.event.fileRevised', 0),
(54, 515, 8, 1, '2023-10-19 10:12:00', 1342177296, 'submission.event.fileEdited', 0),
(55, 1048585, 3, 1, '2023-10-19 10:12:00', 1342177296, 'submission.event.fileEdited', 0),
(56, 515, 8, 1, '2023-10-19 10:12:00', 1342177287, 'submission.event.signoffSignoff', 0),
(57, 1048585, 3, 1, '2023-10-19 10:12:03', 268435464, 'submission.event.publicationFormatPublished', 0),
(58, 1048585, 3, 1, '2023-10-19 10:13:16', 268435462, 'publication.event.published', 0),
(59, 1048585, 4, 1, '2023-10-19 10:34:55', 268435458, 'submission.event.general.metadataUpdated', 0),
(60, 1048585, 4, 1, '2023-10-19 10:34:55', 268435458, 'submission.event.general.metadataUpdated', 0),
(61, 515, 10, 1, '2023-10-19 10:36:59', 1342177281, 'submission.event.fileUploaded', 0),
(62, 515, 9, 1, '2023-10-19 10:36:59', 1342177281, 'submission.event.fileUploaded', 0),
(63, 1048585, 4, 1, '2023-10-19 10:36:59', 1342177288, 'submission.event.fileRevised', 0),
(64, 1048585, 4, 1, '2023-10-19 10:36:59', 1342177288, 'submission.event.fileRevised', 0),
(65, 515, 9, 1, '2023-10-19 10:37:03', 1342177296, 'submission.event.fileEdited', 0),
(66, 1048585, 4, 1, '2023-10-19 10:37:03', 1342177296, 'submission.event.fileEdited', 0),
(67, 515, 10, 1, '2023-10-19 10:37:05', 1342177296, 'submission.event.fileEdited', 0),
(68, 1048585, 4, 1, '2023-10-19 10:37:05', 1342177296, 'submission.event.fileEdited', 0),
(69, 1048585, 4, 1, '2023-10-19 10:37:36', 268435458, 'submission.event.general.metadataUpdated', 0),
(70, 1048585, 4, 1, '2023-10-19 10:37:44', 268435457, 'submission.event.submissionSubmitted', 0),
(71, 1048585, 4, 1, '2023-10-19 10:37:57', 805306371, 'log.editor.decision', 0),
(72, 1048585, 4, 1, '2023-10-19 10:38:10', 805306371, 'log.editor.decision', 0),
(73, 1048585, 4, 1, '2023-10-19 10:41:42', 268435474, 'submission.event.publicationFormatCreated', 0),
(74, 515, 11, 1, '2023-10-19 10:41:54', 1342177281, 'submission.event.fileUploaded', 0),
(75, 1048585, 4, 1, '2023-10-19 10:41:54', 1342177288, 'submission.event.fileRevised', 0),
(76, 1048585, 4, 1, '2023-10-19 10:41:58', 268435464, 'submission.event.publicationFormatPublished', 0),
(77, 515, 11, 1, '2023-10-19 10:42:01', 1342177296, 'submission.event.fileEdited', 0),
(78, 1048585, 4, 1, '2023-10-19 10:42:01', 1342177296, 'submission.event.fileEdited', 0),
(79, 515, 11, 1, '2023-10-19 10:42:01', 1342177287, 'submission.event.signoffSignoff', 0),
(80, 1048585, 4, 1, '2023-10-19 10:42:12', 268435474, 'submission.event.publicationFormatCreated', 0),
(81, 515, 12, 1, '2023-10-19 10:42:32', 1342177281, 'submission.event.fileUploaded', 0),
(82, 1048585, 4, 1, '2023-10-19 10:42:32', 1342177288, 'submission.event.fileRevised', 0),
(83, 515, 12, 1, '2023-10-19 10:42:36', 1342177296, 'submission.event.fileEdited', 0),
(84, 1048585, 4, 1, '2023-10-19 10:42:36', 1342177296, 'submission.event.fileEdited', 0),
(85, 515, 12, 1, '2023-10-19 10:42:36', 1342177287, 'submission.event.signoffSignoff', 0),
(86, 1048585, 4, 1, '2023-10-19 10:42:40', 268435464, 'submission.event.publicationFormatPublished', 0),
(87, 1048585, 4, 1, '2023-10-19 10:43:34', 268435462, 'publication.event.published', 0),
(88, 1048585, 1, 1, '2023-10-20 04:23:45', 268435462, 'publication.event.published', 0),
(89, 1048585, 5, 1, '2023-10-20 04:36:13', 268435458, 'submission.event.general.metadataUpdated', 0),
(90, 1048585, 5, 1, '2023-10-20 04:36:13', 268435458, 'submission.event.general.metadataUpdated', 0),
(91, 515, 13, 1, '2023-10-20 04:36:21', 1342177281, 'submission.event.fileUploaded', 0),
(92, 1048585, 5, 1, '2023-10-20 04:36:21', 1342177288, 'submission.event.fileRevised', 0),
(93, 515, 13, 1, '2023-10-20 04:36:25', 1342177296, 'submission.event.fileEdited', 0),
(94, 1048585, 5, 1, '2023-10-20 04:36:25', 1342177296, 'submission.event.fileEdited', 0),
(95, 1048585, 5, 1, '2023-10-20 04:38:14', 268435458, 'submission.event.general.metadataUpdated', 0),
(96, 1048585, 5, 1, '2023-10-20 04:38:26', 268435457, 'submission.event.submissionSubmitted', 0),
(97, 1048585, 5, 1, '2023-10-20 04:39:30', 805306371, 'log.editor.decision', 0),
(98, 515, 14, 1, '2023-10-20 04:39:53', 1342177281, 'submission.event.fileUploaded', 0),
(99, 1048585, 5, 1, '2023-10-20 04:39:53', 1342177288, 'submission.event.fileRevised', 0),
(100, 1048585, 5, 1, '2023-10-20 04:40:11', 805306371, 'log.editor.decision', 0),
(101, 1048585, 4, 1, '2023-10-20 05:07:26', 268435463, 'publication.event.unpublished', 0),
(102, 1048585, 4, 1, '2023-10-20 05:07:44', 268435458, 'submission.event.general.metadataUpdated', 0),
(103, 1048585, 4, 1, '2023-10-20 05:08:40', 268435462, 'publication.event.published', 0),
(104, 1048585, 4, 1, '2023-10-20 06:14:17', 268435463, 'publication.event.unpublished', 0),
(105, 1048585, 4, 1, '2023-10-20 06:14:51', 268435458, 'submission.event.general.metadataUpdated', 0),
(106, 1048585, 4, 1, '2023-10-20 06:14:57', 268435462, 'publication.event.published', 0),
(107, 1048585, 6, 1, '2023-10-20 06:29:53', 268435458, 'submission.event.general.metadataUpdated', 0),
(108, 1048585, 6, 1, '2023-10-20 06:29:53', 268435458, 'submission.event.general.metadataUpdated', 0),
(109, 515, 15, 1, '2023-10-20 06:30:04', 1342177281, 'submission.event.fileUploaded', 0),
(110, 1048585, 6, 1, '2023-10-20 06:30:04', 1342177288, 'submission.event.fileRevised', 0),
(111, 515, 15, 1, '2023-10-20 06:30:08', 1342177296, 'submission.event.fileEdited', 0),
(112, 1048585, 6, 1, '2023-10-20 06:30:08', 1342177296, 'submission.event.fileEdited', 0),
(113, 1048585, 6, 1, '2023-10-20 06:30:41', 268435458, 'submission.event.general.metadataUpdated', 0),
(114, 1048585, 6, 1, '2023-10-20 06:30:48', 268435457, 'submission.event.submissionSubmitted', 0),
(115, 1048585, 6, 1, '2023-10-20 09:33:21', 16777217, 'informationCenter.history.messageSent', 0),
(116, 1048585, 6, 1, '2023-10-20 09:33:22', 268435459, 'submission.event.participantAdded', 0),
(117, 1048585, 6, 1, '2023-10-20 09:34:36', 805306371, 'log.editor.decision', 0),
(118, 1048585, 6, 1, '2023-10-20 09:34:59', 805306371, 'log.editor.decision', 0),
(119, 1048585, 6, 1, '2023-10-20 09:35:39', 268435462, 'publication.event.published', 0),
(120, 1048585, 6, 1, '2023-10-20 09:35:48', 268435463, 'publication.event.unpublished', 0),
(121, 1048585, 6, 1, '2023-10-20 09:38:16', 268435462, 'publication.event.published', 0),
(122, 1048585, 4, 1, '2023-12-01 07:53:51', 268435463, 'publication.event.unpublished', 0),
(123, 1048585, 4, 1, '2023-12-01 08:09:24', 268435462, 'publication.event.published', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `event_log_settings`
--

CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `event_log_settings`
--

INSERT INTO `event_log_settings` (`log_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
(3, 'fileId', '1', 'int'),
(3, 'fileStage', '2', 'int'),
(3, 'originalFileName', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(3, 'sourceSubmissionFileId', NULL, 'string'),
(3, 'submissionFileId', '1', 'int'),
(3, 'submissionId', '1', 'int'),
(3, 'username', 'hasnaz', 'string'),
(4, 'fileId', '1', 'int'),
(4, 'fileStage', '2', 'int'),
(4, 'name', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(4, 'submissionFileId', '1', 'int'),
(4, 'submissionId', '1', 'int'),
(4, 'username', 'hasnaz', 'string'),
(5, 'fileId', '1', 'int'),
(5, 'fileStage', '2', 'int'),
(5, 'originalFileName', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(5, 'sourceSubmissionFileId', NULL, 'string'),
(5, 'submissionFileId', '1', 'int'),
(5, 'submissionId', '1', 'int'),
(5, 'username', 'hasnaz', 'string'),
(6, 'fileId', '1', 'int'),
(6, 'fileStage', '2', 'int'),
(6, 'name', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(6, 'originalFileName', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(6, 'sourceSubmissionFileId', NULL, 'string'),
(6, 'submissionFileId', '1', 'int'),
(6, 'submissionId', '1', 'int'),
(6, 'username', 'hasnaz', 'string'),
(9, 'decision', 'Accept and Skip Review', 'string'),
(9, 'editorName', 'hasnaz hasnaz', 'string'),
(9, 'submissionId', '1', 'int'),
(10, 'fileId', '1', 'int'),
(10, 'fileStage', '6', 'int'),
(10, 'originalFileName', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(10, 'sourceSubmissionFileId', '1', 'int'),
(10, 'submissionFileId', '2', 'int'),
(10, 'submissionId', '1', 'int'),
(10, 'username', 'hasnaz', 'string'),
(11, 'fileId', '1', 'int'),
(11, 'fileStage', '6', 'int'),
(11, 'name', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(11, 'submissionFileId', '2', 'int'),
(11, 'submissionId', '1', 'int'),
(11, 'username', 'hasnaz', 'string'),
(12, 'fileId', '1', 'int'),
(12, 'fileStage', '6', 'int'),
(12, 'originalFileName', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(12, 'sourceSubmissionFileId', '1', 'int'),
(12, 'submissionFileId', '2', 'int'),
(12, 'submissionId', '1', 'int'),
(12, 'username', 'hasnaz', 'string'),
(13, 'fileId', '1', 'int'),
(13, 'fileStage', '6', 'int'),
(13, 'name', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(13, 'originalFileName', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(13, 'sourceSubmissionFileId', '1', 'int'),
(13, 'submissionFileId', '2', 'int'),
(13, 'submissionId', '1', 'int'),
(13, 'username', 'hasnaz', 'string'),
(14, 'decision', 'Send To Production', 'string'),
(14, 'editorName', 'hasnaz hasnaz', 'string'),
(14, 'submissionId', '1', 'int'),
(17, 'fileId', '2', 'int'),
(17, 'fileStage', '2', 'int'),
(17, 'originalFileName', 'Free+PDF+Download.pdf', 'string'),
(17, 'sourceSubmissionFileId', NULL, 'string'),
(17, 'submissionFileId', '3', 'int'),
(17, 'submissionId', '2', 'int'),
(17, 'username', 'hasnaz', 'string'),
(18, 'fileId', '2', 'int'),
(18, 'fileStage', '2', 'int'),
(18, 'name', 'Free+PDF+Download.pdf', 'string'),
(18, 'submissionFileId', '3', 'int'),
(18, 'submissionId', '2', 'int'),
(18, 'username', 'hasnaz', 'string'),
(19, 'fileId', '2', 'int'),
(19, 'fileStage', '2', 'int'),
(19, 'originalFileName', 'Free+PDF+Download.pdf', 'string'),
(19, 'sourceSubmissionFileId', NULL, 'string'),
(19, 'submissionFileId', '3', 'int'),
(19, 'submissionId', '2', 'int'),
(19, 'username', 'hasnaz', 'string'),
(20, 'fileId', '2', 'int'),
(20, 'fileStage', '2', 'int'),
(20, 'name', 'Free+PDF+Download.pdf', 'string'),
(20, 'originalFileName', 'Free+PDF+Download.pdf', 'string'),
(20, 'sourceSubmissionFileId', NULL, 'string'),
(20, 'submissionFileId', '3', 'int'),
(20, 'submissionId', '2', 'int'),
(20, 'username', 'hasnaz', 'string'),
(23, 'decision', 'Accept and Skip Review', 'string'),
(23, 'editorName', 'hasnaz hasnaz', 'string'),
(23, 'submissionId', '2', 'int'),
(24, 'fileId', '2', 'int'),
(24, 'fileStage', '6', 'int'),
(24, 'originalFileName', 'Free+PDF+Download.pdf', 'string'),
(24, 'sourceSubmissionFileId', '3', 'int'),
(24, 'submissionFileId', '4', 'int'),
(24, 'submissionId', '2', 'int'),
(24, 'username', 'hasnaz', 'string'),
(25, 'fileId', '2', 'int'),
(25, 'fileStage', '6', 'int'),
(25, 'name', 'Free+PDF+Download.pdf', 'string'),
(25, 'submissionFileId', '4', 'int'),
(25, 'submissionId', '2', 'int'),
(25, 'username', 'hasnaz', 'string'),
(26, 'decision', 'Send To Production', 'string'),
(26, 'editorName', 'hasnaz hasnaz', 'string'),
(26, 'submissionId', '2', 'int'),
(27, 'formatName', 'Free PDF', 'string'),
(28, 'publicationFormatName', 'Free PDF', 'string'),
(29, 'formatName', 'Ebook', 'string'),
(30, 'publicationFormatName', 'Ebook', 'string'),
(31, 'formatName', 'Paperback', 'string'),
(32, 'publicationFormatName', 'Paperback', 'string'),
(33, 'fileId', '2', 'int'),
(33, 'fileStage', '10', 'int'),
(33, 'originalFileName', 'Free+PDF+Download.pdf', 'string'),
(33, 'sourceSubmissionFileId', '3', 'int'),
(33, 'submissionFileId', '5', 'int'),
(33, 'submissionId', '2', 'int'),
(33, 'username', 'hasnaz', 'string'),
(34, 'fileId', '2', 'int'),
(34, 'fileStage', '10', 'int'),
(34, 'name', 'Free+PDF+Download.pdf', 'string'),
(34, 'submissionFileId', '5', 'int'),
(34, 'submissionId', '2', 'int'),
(34, 'username', 'hasnaz', 'string'),
(35, 'fileId', '2', 'int'),
(35, 'fileStage', '10', 'int'),
(35, 'originalFileName', 'Free+PDF+Download.pdf', 'string'),
(35, 'sourceSubmissionFileId', '3', 'int'),
(35, 'submissionFileId', '5', 'int'),
(35, 'submissionId', '2', 'int'),
(35, 'username', 'hasnaz', 'string'),
(36, 'fileId', '2', 'int'),
(36, 'fileStage', '10', 'int'),
(36, 'name', 'Free+PDF+Download.pdf', 'string'),
(36, 'originalFileName', 'Free+PDF+Download.pdf', 'string'),
(36, 'sourceSubmissionFileId', '3', 'int'),
(36, 'submissionFileId', '5', 'int'),
(36, 'submissionId', '2', 'int'),
(36, 'username', 'hasnaz', 'string'),
(37, 'file', 'Free+PDF+Download.pdf', 'string'),
(37, 'name', 'hasnaz hasnaz', 'string'),
(37, 'username', 'hasnaz', 'string'),
(41, 'fileId', '3', 'int'),
(41, 'fileStage', '2', 'int'),
(41, 'originalFileName', 'Free+PDF.pdf', 'string'),
(41, 'sourceSubmissionFileId', NULL, 'string'),
(41, 'submissionFileId', '6', 'int'),
(41, 'submissionId', '3', 'int'),
(41, 'username', 'hasnaz', 'string'),
(42, 'fileId', '3', 'int'),
(42, 'fileStage', '2', 'int'),
(42, 'name', 'Free+PDF.pdf', 'string'),
(42, 'submissionFileId', '6', 'int'),
(42, 'submissionId', '3', 'int'),
(42, 'username', 'hasnaz', 'string'),
(43, 'fileId', '3', 'int'),
(43, 'fileStage', '2', 'int'),
(43, 'originalFileName', 'Free+PDF.pdf', 'string'),
(43, 'sourceSubmissionFileId', NULL, 'string'),
(43, 'submissionFileId', '6', 'int'),
(43, 'submissionId', '3', 'int'),
(43, 'username', 'hasnaz', 'string'),
(44, 'fileId', '3', 'int'),
(44, 'fileStage', '2', 'int'),
(44, 'name', 'Free+PDF.pdf', 'string'),
(44, 'originalFileName', 'Free+PDF.pdf', 'string'),
(44, 'sourceSubmissionFileId', NULL, 'string'),
(44, 'submissionFileId', '6', 'int'),
(44, 'submissionId', '3', 'int'),
(44, 'username', 'hasnaz', 'string'),
(47, 'decision', 'Accept and Skip Review', 'string'),
(47, 'editorName', 'hasnaz hasnaz', 'string'),
(47, 'submissionId', '3', 'int'),
(48, 'fileId', '3', 'int'),
(48, 'fileStage', '6', 'int'),
(48, 'originalFileName', 'Free+PDF.pdf', 'string'),
(48, 'sourceSubmissionFileId', '6', 'int'),
(48, 'submissionFileId', '7', 'int'),
(48, 'submissionId', '3', 'int'),
(48, 'username', 'hasnaz', 'string'),
(49, 'fileId', '3', 'int'),
(49, 'fileStage', '6', 'int'),
(49, 'name', 'Free+PDF.pdf', 'string'),
(49, 'submissionFileId', '7', 'int'),
(49, 'submissionId', '3', 'int'),
(49, 'username', 'hasnaz', 'string'),
(50, 'decision', 'Send To Production', 'string'),
(50, 'editorName', 'hasnaz hasnaz', 'string'),
(50, 'submissionId', '3', 'int'),
(51, 'formatName', 'Free PDF', 'string'),
(52, 'fileId', '3', 'int'),
(52, 'fileStage', '10', 'int'),
(52, 'originalFileName', 'Free+PDF.pdf', 'string'),
(52, 'sourceSubmissionFileId', '6', 'int'),
(52, 'submissionFileId', '8', 'int'),
(52, 'submissionId', '3', 'int'),
(52, 'username', 'hasnaz', 'string'),
(53, 'fileId', '3', 'int'),
(53, 'fileStage', '10', 'int'),
(53, 'name', 'Free+PDF.pdf', 'string'),
(53, 'submissionFileId', '8', 'int'),
(53, 'submissionId', '3', 'int'),
(53, 'username', 'hasnaz', 'string'),
(54, 'fileId', '3', 'int'),
(54, 'fileStage', '10', 'int'),
(54, 'originalFileName', 'Free+PDF.pdf', 'string'),
(54, 'sourceSubmissionFileId', '6', 'int'),
(54, 'submissionFileId', '8', 'int'),
(54, 'submissionId', '3', 'int'),
(54, 'username', 'hasnaz', 'string'),
(55, 'fileId', '3', 'int'),
(55, 'fileStage', '10', 'int'),
(55, 'name', 'Free+PDF.pdf', 'string'),
(55, 'originalFileName', 'Free+PDF.pdf', 'string'),
(55, 'sourceSubmissionFileId', '6', 'int'),
(55, 'submissionFileId', '8', 'int'),
(55, 'submissionId', '3', 'int'),
(55, 'username', 'hasnaz', 'string'),
(56, 'file', 'Free+PDF.pdf', 'string'),
(56, 'name', 'hasnaz hasnaz', 'string'),
(56, 'username', 'hasnaz', 'string'),
(57, 'publicationFormatName', 'Free PDF', 'string'),
(61, 'fileId', '5', 'int'),
(61, 'fileStage', '2', 'int'),
(61, 'originalFileName', 'Epub.pdf', 'string'),
(61, 'sourceSubmissionFileId', NULL, 'string'),
(61, 'submissionFileId', '10', 'int'),
(61, 'submissionId', '4', 'int'),
(61, 'username', 'hasnaz', 'string'),
(62, 'fileId', '4', 'int'),
(62, 'fileStage', '2', 'int'),
(62, 'originalFileName', 'Paperback.pdf', 'string'),
(62, 'sourceSubmissionFileId', NULL, 'string'),
(62, 'submissionFileId', '9', 'int'),
(62, 'submissionId', '4', 'int'),
(62, 'username', 'hasnaz', 'string'),
(63, 'fileId', '5', 'int'),
(63, 'fileStage', '2', 'int'),
(63, 'name', 'Epub.pdf', 'string'),
(63, 'submissionFileId', '10', 'int'),
(63, 'submissionId', '4', 'int'),
(63, 'username', 'hasnaz', 'string'),
(64, 'fileId', '4', 'int'),
(64, 'fileStage', '2', 'int'),
(64, 'name', 'Paperback.pdf', 'string'),
(64, 'submissionFileId', '9', 'int'),
(64, 'submissionId', '4', 'int'),
(64, 'username', 'hasnaz', 'string'),
(65, 'fileId', '4', 'int'),
(65, 'fileStage', '2', 'int'),
(65, 'originalFileName', 'Paperback.pdf', 'string'),
(65, 'sourceSubmissionFileId', NULL, 'string'),
(65, 'submissionFileId', '9', 'int'),
(65, 'submissionId', '4', 'int'),
(65, 'username', 'hasnaz', 'string'),
(66, 'fileId', '4', 'int'),
(66, 'fileStage', '2', 'int'),
(66, 'name', 'Paperback.pdf', 'string'),
(66, 'originalFileName', 'Paperback.pdf', 'string'),
(66, 'sourceSubmissionFileId', NULL, 'string'),
(66, 'submissionFileId', '9', 'int'),
(66, 'submissionId', '4', 'int'),
(66, 'username', 'hasnaz', 'string'),
(67, 'fileId', '5', 'int'),
(67, 'fileStage', '2', 'int'),
(67, 'originalFileName', 'Epub.pdf', 'string'),
(67, 'sourceSubmissionFileId', NULL, 'string'),
(67, 'submissionFileId', '10', 'int'),
(67, 'submissionId', '4', 'int'),
(67, 'username', 'hasnaz', 'string'),
(68, 'fileId', '5', 'int'),
(68, 'fileStage', '2', 'int'),
(68, 'name', 'Epub.pdf', 'string'),
(68, 'originalFileName', 'Epub.pdf', 'string'),
(68, 'sourceSubmissionFileId', NULL, 'string'),
(68, 'submissionFileId', '10', 'int'),
(68, 'submissionId', '4', 'int'),
(68, 'username', 'hasnaz', 'string'),
(71, 'decision', 'Accept and Skip Review', 'string'),
(71, 'editorName', 'hasnaz hasnaz', 'string'),
(71, 'submissionId', '4', 'int'),
(72, 'decision', 'Send To Production', 'string'),
(72, 'editorName', 'hasnaz hasnaz', 'string'),
(72, 'submissionId', '4', 'int'),
(73, 'formatName', 'Ebook', 'string'),
(74, 'fileId', '5', 'int'),
(74, 'fileStage', '10', 'int'),
(74, 'originalFileName', 'Epub.pdf', 'string'),
(74, 'sourceSubmissionFileId', '10', 'int'),
(74, 'submissionFileId', '11', 'int'),
(74, 'submissionId', '4', 'int'),
(74, 'username', 'hasnaz', 'string'),
(75, 'fileId', '5', 'int'),
(75, 'fileStage', '10', 'int'),
(75, 'name', 'Epub.pdf', 'string'),
(75, 'submissionFileId', '11', 'int'),
(75, 'submissionId', '4', 'int'),
(75, 'username', 'hasnaz', 'string'),
(76, 'publicationFormatName', 'Ebook', 'string'),
(77, 'fileId', '5', 'int'),
(77, 'fileStage', '10', 'int'),
(77, 'originalFileName', 'Epub.pdf', 'string'),
(77, 'sourceSubmissionFileId', '10', 'int'),
(77, 'submissionFileId', '11', 'int'),
(77, 'submissionId', '4', 'int'),
(77, 'username', 'hasnaz', 'string'),
(78, 'fileId', '5', 'int'),
(78, 'fileStage', '10', 'int'),
(78, 'name', 'Epub.pdf', 'string'),
(78, 'originalFileName', 'Epub.pdf', 'string'),
(78, 'sourceSubmissionFileId', '10', 'int'),
(78, 'submissionFileId', '11', 'int'),
(78, 'submissionId', '4', 'int'),
(78, 'username', 'hasnaz', 'string'),
(79, 'file', 'Epub.pdf', 'string'),
(79, 'name', 'hasnaz hasnaz', 'string'),
(79, 'username', 'hasnaz', 'string'),
(80, 'formatName', 'Paperback', 'string'),
(81, 'fileId', '4', 'int'),
(81, 'fileStage', '10', 'int'),
(81, 'originalFileName', 'Paperback.pdf', 'string'),
(81, 'sourceSubmissionFileId', '9', 'int'),
(81, 'submissionFileId', '12', 'int'),
(81, 'submissionId', '4', 'int'),
(81, 'username', 'hasnaz', 'string'),
(82, 'fileId', '4', 'int'),
(82, 'fileStage', '10', 'int'),
(82, 'name', 'Paperback.pdf', 'string'),
(82, 'submissionFileId', '12', 'int'),
(82, 'submissionId', '4', 'int'),
(82, 'username', 'hasnaz', 'string'),
(83, 'fileId', '4', 'int'),
(83, 'fileStage', '10', 'int'),
(83, 'originalFileName', 'Paperback.pdf', 'string'),
(83, 'sourceSubmissionFileId', '9', 'int'),
(83, 'submissionFileId', '12', 'int'),
(83, 'submissionId', '4', 'int'),
(83, 'username', 'hasnaz', 'string'),
(84, 'fileId', '4', 'int'),
(84, 'fileStage', '10', 'int'),
(84, 'name', 'Paperback.pdf', 'string'),
(84, 'originalFileName', 'Paperback.pdf', 'string'),
(84, 'sourceSubmissionFileId', '9', 'int'),
(84, 'submissionFileId', '12', 'int'),
(84, 'submissionId', '4', 'int'),
(84, 'username', 'hasnaz', 'string'),
(85, 'file', 'Paperback.pdf', 'string'),
(85, 'name', 'hasnaz hasnaz', 'string'),
(85, 'username', 'hasnaz', 'string'),
(86, 'publicationFormatName', 'Paperback', 'string'),
(91, 'fileId', '6', 'int'),
(91, 'fileStage', '2', 'int'),
(91, 'originalFileName', 'Epub.pdf', 'string'),
(91, 'sourceSubmissionFileId', NULL, 'string'),
(91, 'submissionFileId', '13', 'int'),
(91, 'submissionId', '5', 'int'),
(91, 'username', 'hasnaz', 'string'),
(92, 'fileId', '6', 'int'),
(92, 'fileStage', '2', 'int'),
(92, 'name', 'Epub.pdf', 'string'),
(92, 'submissionFileId', '13', 'int'),
(92, 'submissionId', '5', 'int'),
(92, 'username', 'hasnaz', 'string'),
(93, 'fileId', '6', 'int'),
(93, 'fileStage', '2', 'int'),
(93, 'originalFileName', 'Epub.pdf', 'string'),
(93, 'sourceSubmissionFileId', NULL, 'string'),
(93, 'submissionFileId', '13', 'int'),
(93, 'submissionId', '5', 'int'),
(93, 'username', 'hasnaz', 'string'),
(94, 'fileId', '6', 'int'),
(94, 'fileStage', '2', 'int'),
(94, 'name', 'Epub.pdf', 'string'),
(94, 'originalFileName', 'Epub.pdf', 'string'),
(94, 'sourceSubmissionFileId', NULL, 'string'),
(94, 'submissionFileId', '13', 'int'),
(94, 'submissionId', '5', 'int'),
(94, 'username', 'hasnaz', 'string'),
(97, 'decision', 'Accept and Skip Review', 'string'),
(97, 'editorName', 'hasnaz hasnaz', 'string'),
(97, 'submissionId', '5', 'int'),
(98, 'fileId', '6', 'int'),
(98, 'fileStage', '6', 'int'),
(98, 'originalFileName', 'Epub.pdf', 'string'),
(98, 'sourceSubmissionFileId', '13', 'int'),
(98, 'submissionFileId', '14', 'int'),
(98, 'submissionId', '5', 'int'),
(98, 'username', 'hasnaz', 'string'),
(99, 'fileId', '6', 'int'),
(99, 'fileStage', '6', 'int'),
(99, 'name', 'Epub.pdf', 'string'),
(99, 'submissionFileId', '14', 'int'),
(99, 'submissionId', '5', 'int'),
(99, 'username', 'hasnaz', 'string'),
(100, 'decision', 'Send To Production', 'string'),
(100, 'editorName', 'hasnaz hasnaz', 'string'),
(100, 'submissionId', '5', 'int'),
(109, 'fileId', '7', 'int'),
(109, 'fileStage', '2', 'int'),
(109, 'originalFileName', 'Paperback.pdf', 'string'),
(109, 'sourceSubmissionFileId', NULL, 'string'),
(109, 'submissionFileId', '15', 'int'),
(109, 'submissionId', '6', 'int'),
(109, 'username', 'hasnaz', 'string'),
(110, 'fileId', '7', 'int'),
(110, 'fileStage', '2', 'int'),
(110, 'name', 'Paperback.pdf', 'string'),
(110, 'submissionFileId', '15', 'int'),
(110, 'submissionId', '6', 'int'),
(110, 'username', 'hasnaz', 'string'),
(111, 'fileId', '7', 'int'),
(111, 'fileStage', '2', 'int'),
(111, 'originalFileName', 'Paperback.pdf', 'string'),
(111, 'sourceSubmissionFileId', NULL, 'string'),
(111, 'submissionFileId', '15', 'int'),
(111, 'submissionId', '6', 'int'),
(111, 'username', 'hasnaz', 'string'),
(112, 'fileId', '7', 'int'),
(112, 'fileStage', '2', 'int'),
(112, 'name', 'Paperback.pdf', 'string'),
(112, 'originalFileName', 'Paperback.pdf', 'string'),
(112, 'sourceSubmissionFileId', NULL, 'string'),
(112, 'submissionFileId', '15', 'int'),
(112, 'submissionId', '6', 'int'),
(112, 'username', 'hasnaz', 'string'),
(116, 'name', 'nanaz', 'string'),
(116, 'userGroupName', 'Press editor', 'string'),
(116, 'username', 'nanaz', 'string'),
(117, 'decision', 'Accept and Skip Review', 'string'),
(117, 'editorName', 'hasnaz hasnaz', 'string'),
(117, 'submissionId', '6', 'int'),
(118, 'decision', 'Send To Production', 'string'),
(118, 'editorName', 'hasnaz hasnaz', 'string'),
(118, 'submissionId', '6', 'int');

-- --------------------------------------------------------

--
-- Struktur dari tabel `features`
--

CREATE TABLE `features` (
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `files`
--

INSERT INTO `files` (`file_id`, `path`, `mimetype`) VALUES
(1, 'presses/1/monographs/1/6530de3a8031d.pdf', 'application/pdf'),
(2, 'presses/1/monographs/2/6530e1459677a.pdf', 'application/pdf'),
(3, 'presses/1/monographs/3/6530e421ee2c7.pdf', 'application/pdf'),
(4, 'presses/1/monographs/4/6530eaabae246.pdf', 'application/pdf'),
(5, 'presses/1/monographs/4/6530eaabae23e.pdf', 'application/pdf'),
(6, 'presses/1/monographs/5/6531e7a4eb8de.pdf', 'application/pdf'),
(7, 'presses/2/monographs/6/6532024bcdf66.pdf', 'application/pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `filters`
--

CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Extract metadata from a(n) PublicationFormat', 'plugins.metadata.dc11.filter.Dc11SchemaPublicationFormatAdapter', 0, 0, 0),
(2, 2, 0, 'Native XML submission export', 'plugins.importexport.native.filter.MonographNativeXmlFilter', 0, 0, 0),
(3, 3, 0, 'Native XML submission import', 'plugins.importexport.native.filter.NativeXmlMonographFilter', 0, 0, 0),
(4, 4, 0, 'Native XML author export', 'plugins.importexport.native.filter.AuthorNativeXmlFilter', 0, 0, 0),
(5, 5, 0, 'Native XML author import', 'plugins.importexport.native.filter.NativeXmlAuthorFilter', 0, 0, 0),
(6, 6, 0, 'Native XML representation export', 'plugins.importexport.native.filter.PublicationFormatNativeXmlFilter', 0, 0, 0),
(7, 7, 0, 'Native XML representation import', 'plugins.importexport.native.filter.NativeXmlPublicationFormatFilter', 0, 0, 0),
(8, 9, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlMonographFileFilter', 0, 0, 0),
(9, 8, 0, 'Native XML submission file export', 'lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter', 0, 0, 0),
(10, 10, 0, 'ONIX 3.0 XML monograph export', 'plugins.importexport.onix30.filter.MonographONIX30XmlFilter', 0, 0, 0),
(11, 11, 0, 'Native XML Publication export', 'plugins.importexport.native.filter.PublicationNativeXmlFilter', 0, 0, 0),
(12, 12, 0, 'Native XML publication import', 'plugins.importexport.native.filter.NativeXmlPublicationFilter', 0, 0, 0),
(13, 13, 0, 'Native XML chapter export', 'plugins.importexport.native.filter.ChapterNativeXmlFilter', 0, 0, 0),
(14, 14, 0, 'Native XML Chapter import', 'plugins.importexport.native.filter.NativeXmlChapterFilter', 0, 0, 0),
(15, 15, 0, 'ONIX 3.0 XML monograph export', 'plugins.importexport.onix30.filter.MonographONIX30XmlFilter', 0, 0, 0),
(16, 16, 0, 'User XML user export', 'lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter', 0, 0, 0),
(17, 17, 0, 'User XML user import', 'lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter', 0, 0, 0),
(18, 18, 0, 'Native XML user group export', 'lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter', 0, 0, 0),
(19, 19, 0, 'Native XML user group import', 'lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `filter_groups`
--

CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'publicationFormat=>dc11', 'plugins.metadata.dc11.publicationFormatAdapter.displayName', 'plugins.metadata.dc11.publicationFormatAdapter.description', 'class::classes.publicationFormat.PublicationFormat', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)'),
(2, 'monograph=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(3, 'native-xml=>monograph', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.submission.Submission[]'),
(4, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.monograph.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(5, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.monograph.Author[]'),
(6, 'publication-format=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.publicationFormat.PublicationFormat', 'xml::schema(plugins/importexport/native/native.xsd)'),
(7, 'native-xml=>PublicationFormat', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.publicationFormat.PublicationFormat[]'),
(8, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(9, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionFile'),
(10, 'monograph=>onix30-xml', 'plugins.importexport.onix30.displayName', 'plugins.importexport.onix30.description', 'class::classes.submission.Submission', 'xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),
(11, 'publication=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.publication.Publication', 'xml::schema(plugins/importexport/native/native.xsd)'),
(12, 'native-xml=>Publication', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.publication.Publication'),
(13, 'chapter=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.monograph.Chapter[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(14, 'native-xml=>chapter', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.monograph.Chapter'),
(15, 'monographs=>onix30-xml', 'plugins.importexport.onix30.displayName', 'plugins.importexport.onix30.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),
(16, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(17, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
(18, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(19, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `filter_settings`
--

CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `genres`
--

CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `genres`
--

INSERT INTO `genres` (`genre_id`, `context_id`, `seq`, `enabled`, `category`, `dependent`, `supplementary`, `entry_key`) VALUES
(1, 1, 0, 1, 1, 0, 1, 'APPENDIX'),
(2, 1, 1, 1, 1, 0, 1, 'BIBLIOGRAPHY'),
(3, 1, 2, 1, 1, 0, 0, 'MANUSCRIPT'),
(4, 1, 3, 1, 1, 0, 0, 'CHAPTER'),
(5, 1, 4, 1, 1, 0, 1, 'GLOSSARY'),
(6, 1, 5, 1, 1, 0, 1, 'INDEX'),
(7, 1, 6, 1, 1, 0, 1, 'PREFACE'),
(8, 1, 7, 1, 3, 0, 1, 'PROSPECTUS'),
(9, 1, 8, 1, 2, 0, 1, 'TABLE'),
(10, 1, 9, 1, 2, 0, 1, 'FIGURE'),
(11, 1, 10, 1, 2, 0, 1, 'PHOTO'),
(12, 1, 11, 1, 2, 0, 1, 'ILLUSTRATION'),
(13, 1, 15, 1, 3, 0, 1, 'OTHER'),
(14, 1, 13, 1, 2, 1, 0, 'IMAGE'),
(15, 1, 14, 1, 1, 1, 0, 'STYLE'),
(16, 2, 0, 1, 1, 0, 1, 'APPENDIX'),
(17, 2, 1, 1, 1, 0, 1, 'BIBLIOGRAPHY'),
(18, 2, 2, 1, 1, 0, 0, 'MANUSCRIPT'),
(19, 2, 3, 1, 1, 0, 0, 'CHAPTER'),
(20, 2, 4, 1, 1, 0, 1, 'GLOSSARY'),
(21, 2, 5, 1, 1, 0, 1, 'INDEX'),
(22, 2, 6, 1, 1, 0, 1, 'PREFACE'),
(23, 2, 7, 1, 3, 0, 1, 'PROSPECTUS'),
(24, 2, 8, 1, 2, 0, 1, 'TABLE'),
(25, 2, 9, 1, 2, 0, 1, 'FIGURE'),
(26, 2, 10, 1, 2, 0, 1, 'PHOTO'),
(27, 2, 11, 1, 2, 0, 1, 'ILLUSTRATION'),
(28, 2, 15, 1, 3, 0, 1, 'OTHER'),
(29, 2, 13, 1, 2, 1, 0, 'IMAGE'),
(30, 2, 14, 1, 1, 1, 0, 'STYLE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `genre_settings`
--

CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `genre_settings`
--

INSERT INTO `genre_settings` (`genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Appendix', 'string'),
(1, 'id_ID', 'name', '##default.genres.appendix##', 'string'),
(2, 'en_US', 'name', 'Bibliography', 'string'),
(2, 'id_ID', 'name', '##default.genres.bibliography##', 'string'),
(3, 'en_US', 'name', 'Book Manuscript', 'string'),
(3, 'id_ID', 'name', '##default.genres.manuscript##', 'string'),
(4, 'en_US', 'name', 'Chapter Manuscript', 'string'),
(4, 'id_ID', 'name', '##default.genres.chapter##', 'string'),
(5, 'en_US', 'name', 'Glossary', 'string'),
(5, 'id_ID', 'name', '##default.genres.glossary##', 'string'),
(6, 'en_US', 'name', 'Index', 'string'),
(6, 'id_ID', 'name', '##default.genres.index##', 'string'),
(7, 'en_US', 'name', 'Preface', 'string'),
(7, 'id_ID', 'name', '##default.genres.preface##', 'string'),
(8, 'en_US', 'name', 'Prospectus', 'string'),
(8, 'id_ID', 'name', '##default.genres.prospectus##', 'string'),
(9, 'en_US', 'name', 'Table', 'string'),
(9, 'id_ID', 'name', '##default.genres.table##', 'string'),
(10, 'en_US', 'name', 'Figure', 'string'),
(10, 'id_ID', 'name', '##default.genres.figure##', 'string'),
(11, 'en_US', 'name', 'Photo', 'string'),
(11, 'id_ID', 'name', '##default.genres.photo##', 'string'),
(12, 'en_US', 'name', 'Illustration', 'string'),
(12, 'id_ID', 'name', '##default.genres.illustration##', 'string'),
(13, 'en_US', 'name', 'Other', 'string'),
(13, 'id_ID', 'name', 'Lainnya', 'string'),
(14, 'en_US', 'name', 'Image', 'string'),
(14, 'id_ID', 'name', 'Gambar', 'string'),
(15, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(15, 'id_ID', 'name', 'HTML StyleSheet', 'string'),
(16, 'en_US', 'name', 'Appendix', 'string'),
(16, 'id_ID', 'name', '##default.genres.appendix##', 'string'),
(17, 'en_US', 'name', 'Bibliography', 'string'),
(17, 'id_ID', 'name', '##default.genres.bibliography##', 'string'),
(18, 'en_US', 'name', 'Book Manuscript', 'string'),
(18, 'id_ID', 'name', '##default.genres.manuscript##', 'string'),
(19, 'en_US', 'name', 'Chapter Manuscript', 'string'),
(19, 'id_ID', 'name', '##default.genres.chapter##', 'string'),
(20, 'en_US', 'name', 'Glossary', 'string'),
(20, 'id_ID', 'name', '##default.genres.glossary##', 'string'),
(21, 'en_US', 'name', 'Index', 'string'),
(21, 'id_ID', 'name', '##default.genres.index##', 'string'),
(22, 'en_US', 'name', 'Preface', 'string'),
(22, 'id_ID', 'name', '##default.genres.preface##', 'string'),
(23, 'en_US', 'name', 'Prospectus', 'string'),
(23, 'id_ID', 'name', '##default.genres.prospectus##', 'string'),
(24, 'en_US', 'name', 'Table', 'string'),
(24, 'id_ID', 'name', '##default.genres.table##', 'string'),
(25, 'en_US', 'name', 'Figure', 'string'),
(25, 'id_ID', 'name', '##default.genres.figure##', 'string'),
(26, 'en_US', 'name', 'Photo', 'string'),
(26, 'id_ID', 'name', '##default.genres.photo##', 'string'),
(27, 'en_US', 'name', 'Illustration', 'string'),
(27, 'id_ID', 'name', '##default.genres.illustration##', 'string'),
(28, 'en_US', 'name', 'Other', 'string'),
(28, 'id_ID', 'name', 'Lainnya', 'string'),
(29, 'en_US', 'name', 'Image', 'string'),
(29, 'id_ID', 'name', 'Gambar', 'string'),
(30, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(30, 'id_ID', 'name', 'HTML StyleSheet', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identification_codes`
--

CREATE TABLE `identification_codes` (
  `identification_code_id` bigint(20) NOT NULL,
  `publication_format_id` bigint(20) NOT NULL,
  `code` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_views`
--

CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `library_files`
--

CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `library_file_settings`
--

CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `markets`
--

CREATE TABLE `markets` (
  `market_id` bigint(20) NOT NULL,
  `publication_format_id` bigint(20) NOT NULL,
  `countries_included` text DEFAULT NULL,
  `countries_excluded` text DEFAULT NULL,
  `regions_included` text DEFAULT NULL,
  `regions_excluded` text DEFAULT NULL,
  `market_date_role` varchar(40) NOT NULL,
  `market_date_format` varchar(40) NOT NULL,
  `market_date` varchar(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `price_type_code` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `tax_rate_code` varchar(255) DEFAULT NULL,
  `tax_type_code` varchar(255) DEFAULT NULL,
  `agent_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `metadata_descriptions`
--

CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `metadata_description_settings`
--

CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `metrics`
--

CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `metrics`
--

INSERT INTO `metrics` (`load_id`, `context_id`, `pkp_section_id`, `assoc_object_type`, `assoc_object_id`, `submission_id`, `representation_id`, `assoc_type`, `assoc_id`, `day`, `month`, `file_type`, `country_id`, `region`, `city`, `metric_type`, `metric`) VALUES
('usage_events_20231020.log', 1, NULL, NULL, NULL, NULL, NULL, 512, 1, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 54),
('usage_events_20231020.log', 2, NULL, NULL, NULL, NULL, NULL, 512, 2, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 5),
('usage_events_20231020.log', 1, 1, NULL, NULL, NULL, NULL, 530, 1, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 3),
('usage_events_20231020.log', 1, 2, NULL, NULL, NULL, NULL, 530, 2, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 1),
('usage_events_20231020.log', 1, 3, NULL, NULL, NULL, NULL, 530, 3, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 1),
('usage_events_20231020.log', 1, NULL, NULL, NULL, 2, NULL, 1048585, 2, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 3),
('usage_events_20231020.log', 1, 3, NULL, NULL, 4, NULL, 1048585, 4, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 2),
('usage_events_20231020.log', 2, NULL, NULL, NULL, 6, NULL, 1048585, 6, '20231020', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 1),
('usage_events_20231023.log', 1, NULL, NULL, NULL, NULL, NULL, 512, 1, '20231023', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 3),
('usage_events_20231023.log', 1, NULL, NULL, NULL, 1, NULL, 1048585, 1, '20231023', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 1),
('usage_events_20231023.log', 1, NULL, NULL, NULL, 2, NULL, 1048585, 2, '20231023', '202310', NULL, NULL, NULL, NULL, 'omp::counter', 1),
('usage_events_20231128.log', 1, NULL, NULL, NULL, NULL, NULL, 512, 1, '20231128', '202311', NULL, NULL, NULL, NULL, 'omp::counter', 3),
('usage_events_20231128.log', 1, 3, NULL, NULL, 4, NULL, 1048585, 4, '20231128', '202311', NULL, NULL, NULL, NULL, 'omp::counter', 2),
('usage_events_20231130.log', 1, NULL, NULL, NULL, NULL, NULL, 512, 1, '20231130', '202311', NULL, NULL, NULL, NULL, 'omp::counter', 5),
('usage_events_20231130.log', 1, 3, NULL, NULL, 4, NULL, 1048585, 4, '20231130', '202311', NULL, NULL, NULL, NULL, 'omp::counter', 2),
('usage_events_20231201.log', 1, NULL, NULL, NULL, NULL, NULL, 512, 1, '20231201', '202312', NULL, NULL, NULL, NULL, 'omp::counter', 1),
('usage_events_20231201.log', 1, 3, NULL, NULL, 4, NULL, 1048585, 4, '20231201', '202312', NULL, NULL, NULL, NULL, 'omp::counter', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menus`
--

CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `navigation_menus`
--

INSERT INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
(1, 0, 'user', 'User Navigation Menu'),
(2, 1, 'user', 'User Navigation Menu'),
(3, 1, 'primary', 'Primary Navigation Menu'),
(4, 2, 'user', 'User Navigation Menu'),
(5, 2, 'primary', 'Primary Navigation Menu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menu_items`
--

CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `navigation_menu_items`
--

INSERT INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `path`, `type`) VALUES
(1, 0, NULL, 'NMI_TYPE_USER_REGISTER'),
(2, 0, NULL, 'NMI_TYPE_USER_LOGIN'),
(3, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(4, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(5, 0, NULL, 'NMI_TYPE_USER_PROFILE'),
(6, 0, NULL, 'NMI_TYPE_ADMINISTRATION'),
(7, 0, NULL, 'NMI_TYPE_USER_LOGOUT'),
(8, 1, NULL, 'NMI_TYPE_USER_REGISTER'),
(9, 1, NULL, 'NMI_TYPE_USER_LOGIN'),
(10, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(11, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(12, 1, NULL, 'NMI_TYPE_USER_PROFILE'),
(13, 1, NULL, 'NMI_TYPE_ADMINISTRATION'),
(14, 1, NULL, 'NMI_TYPE_USER_LOGOUT'),
(15, 1, NULL, 'NMI_TYPE_CATALOG'),
(16, 1, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(17, 1, NULL, 'NMI_TYPE_ABOUT'),
(18, 1, NULL, 'NMI_TYPE_ABOUT'),
(19, 1, NULL, 'NMI_TYPE_SUBMISSIONS'),
(20, 1, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(21, 1, NULL, 'NMI_TYPE_PRIVACY'),
(22, 1, NULL, 'NMI_TYPE_CONTACT'),
(23, 1, NULL, 'NMI_TYPE_SEARCH'),
(24, 2, NULL, 'NMI_TYPE_USER_REGISTER'),
(25, 2, NULL, 'NMI_TYPE_USER_LOGIN'),
(26, 2, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(27, 2, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(28, 2, NULL, 'NMI_TYPE_USER_PROFILE'),
(29, 2, NULL, 'NMI_TYPE_ADMINISTRATION'),
(30, 2, NULL, 'NMI_TYPE_USER_LOGOUT'),
(31, 2, NULL, 'NMI_TYPE_CATALOG'),
(32, 2, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(33, 2, NULL, 'NMI_TYPE_ABOUT'),
(34, 2, NULL, 'NMI_TYPE_ABOUT'),
(35, 2, NULL, 'NMI_TYPE_SUBMISSIONS'),
(36, 2, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(37, 2, NULL, 'NMI_TYPE_PRIVACY'),
(38, 2, NULL, 'NMI_TYPE_CONTACT'),
(39, 2, NULL, 'NMI_TYPE_SEARCH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menu_item_assignments`
--

CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `navigation_menu_item_assignments`
--

INSERT INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 1),
(3, 1, 3, 0, 2),
(4, 1, 4, 3, 0),
(5, 1, 5, 3, 1),
(6, 1, 6, 3, 2),
(7, 1, 7, 3, 3),
(8, 2, 8, 0, 0),
(9, 2, 9, 0, 1),
(10, 2, 10, 0, 2),
(11, 2, 11, 10, 0),
(12, 2, 12, 10, 1),
(13, 2, 13, 10, 2),
(14, 2, 14, 10, 3),
(15, 3, 15, 0, 0),
(16, 3, 16, 0, 1),
(17, 3, 17, 0, 2),
(18, 3, 18, 17, 0),
(19, 3, 19, 17, 1),
(20, 3, 20, 17, 2),
(21, 3, 21, 17, 3),
(22, 3, 22, 17, 4),
(23, 4, 24, 0, 0),
(24, 4, 25, 0, 1),
(25, 4, 26, 0, 2),
(26, 4, 27, 26, 0),
(27, 4, 28, 26, 1),
(28, 4, 29, 26, 2),
(29, 4, 30, 26, 3),
(30, 5, 31, 0, 0),
(31, 5, 32, 0, 1),
(32, 5, 33, 0, 2),
(33, 5, 34, 33, 0),
(34, 5, 35, 33, 1),
(35, 5, 36, 33, 2),
(36, 5, 37, 33, 3),
(37, 5, 38, 33, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menu_item_assignment_settings`
--

CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation_menu_item_settings`
--

CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `navigation_menu_item_settings`
--

INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'titleLocaleKey', 'navigation.register', 'string'),
(2, '', 'titleLocaleKey', 'navigation.login', 'string'),
(3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(7, '', 'titleLocaleKey', 'user.logOut', 'string'),
(8, '', 'titleLocaleKey', 'navigation.register', 'string'),
(9, '', 'titleLocaleKey', 'navigation.login', 'string'),
(10, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(11, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(12, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(13, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(14, '', 'titleLocaleKey', 'user.logOut', 'string'),
(15, '', 'titleLocaleKey', 'navigation.catalog', 'string'),
(16, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(17, '', 'titleLocaleKey', 'navigation.about', 'string'),
(18, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(19, '', 'titleLocaleKey', 'about.submissions', 'string'),
(20, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(21, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(22, '', 'titleLocaleKey', 'about.contact', 'string'),
(23, '', 'titleLocaleKey', 'common.search', 'string'),
(24, '', 'titleLocaleKey', 'navigation.register', 'string'),
(25, '', 'titleLocaleKey', 'navigation.login', 'string'),
(26, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(27, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(28, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(29, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(30, '', 'titleLocaleKey', 'user.logOut', 'string'),
(31, '', 'titleLocaleKey', 'navigation.catalog', 'string'),
(32, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(33, '', 'titleLocaleKey', 'navigation.about', 'string'),
(34, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(35, '', 'titleLocaleKey', 'about.submissions', 'string'),
(36, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(37, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(38, '', 'titleLocaleKey', 'about.contact', 'string'),
(39, '', 'titleLocaleKey', 'common.search', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `new_releases`
--

CREATE TABLE `new_releases` (
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notes`
--

CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `notes`
--

INSERT INTO `notes` (`note_id`, `assoc_type`, `assoc_id`, `user_id`, `date_created`, `date_modified`, `title`, `contents`) VALUES
(1, 1048586, 1, 1, '2023-10-20 09:33:21', '2023-10-20 09:33:21', '[gwncn] Editorial Assignment', '<p>nanaz:<br><br>The submission, \"Paper,\" to gwencana has been assigned to you to see through the editorial process in your role as an Editor.<br><br>Submission URL: <a href=\'http://localhost/omp-3.3/index.php/gwencana/workflow/access/6\' class=\'submissionUrl-style-class\'>http://localhost/omp-3.3/index.php/gwencana/workflow/access/6</a><br>Username: nanaz<br><br>Thank you,</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
(2, 1, 2, 2, 16777217, '2023-10-19 09:46:11', NULL, 1048585, 1),
(4, 1, 2, 2, 16777217, '2023-10-19 09:46:13', NULL, 1048585, 1),
(10, 1, 2, 2, 16777254, '2023-10-19 09:48:27', NULL, 1048585, 1),
(12, 1, 2, 2, 16777217, '2023-10-19 09:59:37', NULL, 1048585, 2),
(14, 1, 2, 2, 16777217, '2023-10-19 09:59:40', NULL, 1048585, 2),
(20, 1, 2, 2, 16777254, '2023-10-19 10:01:14', NULL, 1048585, 2),
(21, 1, 0, 2, 16777246, '2023-10-19 10:05:49', NULL, 1048585, 2),
(22, 1, 2, 2, 16777217, '2023-10-19 10:10:01', NULL, 1048585, 3),
(24, 1, 2, 2, 16777217, '2023-10-19 10:10:03', NULL, 1048585, 3),
(30, 1, 2, 2, 16777254, '2023-10-19 10:10:48', NULL, 1048585, 3),
(31, 1, 0, 2, 16777246, '2023-10-19 10:13:16', NULL, 1048585, 3),
(33, 1, 2, 2, 16777217, '2023-10-19 10:37:40', NULL, 1048585, 4),
(35, 1, 2, 2, 16777217, '2023-10-19 10:37:42', NULL, 1048585, 4),
(41, 1, 2, 2, 16777254, '2023-10-19 10:38:10', NULL, 1048585, 4),
(42, 1, 0, 2, 16777246, '2023-10-19 10:43:35', '2023-10-20 04:34:29', 1048585, 4),
(56, 1, 0, 2, 16777246, '2023-10-20 04:23:46', '2023-10-23 10:11:18', 1048585, 1),
(58, 1, 2, 2, 16777217, '2023-10-20 04:38:21', NULL, 1048585, 5),
(60, 1, 2, 2, 16777217, '2023-10-20 04:38:24', NULL, 1048585, 5),
(62, 1, 0, 2, 16777243, '2023-10-20 04:38:26', NULL, 1048585, 5),
(63, 1, 0, 2, 16777245, '2023-10-20 04:38:26', '2023-10-20 04:40:15', 1048585, 5),
(66, 1, 2, 2, 16777254, '2023-10-20 04:40:11', NULL, 1048585, 5),
(79, 2, 3, 3, 16777255, '2023-10-20 09:33:19', NULL, 1048585, 6),
(84, 2, 3, 2, 16777254, '2023-10-20 09:34:59', NULL, 1048585, 6),
(85, 2, 0, 2, 16777246, '2023-10-20 09:35:40', '2023-10-20 09:37:28', 1048585, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification_mail_list`
--

CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification_settings`
--

CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification_subscription_settings`
--

CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oai_resumption_tokens`
--

CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('acronplugin', 0, 'crontab', '[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]', 'object'),
('acronplugin', 0, 'enabled', '1', 'bool'),
('browseblockplugin', 1, 'browseCategories', '1', 'bool'),
('browseblockplugin', 1, 'browseNewReleases', '1', 'bool'),
('browseblockplugin', 1, 'browseSeries', '1', 'bool'),
('browseblockplugin', 1, 'context', '1', 'int'),
('browseblockplugin', 1, 'enabled', '1', 'bool'),
('browseblockplugin', 1, 'seq', '1', 'int'),
('browseblockplugin', 2, 'browseCategories', '1', 'bool'),
('browseblockplugin', 2, 'browseNewReleases', '1', 'bool'),
('browseblockplugin', 2, 'browseSeries', '1', 'bool'),
('browseblockplugin', 2, 'context', '1', 'int'),
('browseblockplugin', 2, 'enabled', '1', 'bool'),
('browseblockplugin', 2, 'seq', '1', 'int'),
('defaultthemeplugin', 0, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'enabled', '1', 'bool'),
('defaultthemeplugin', 2, 'enabled', '1', 'bool'),
('developedbyblockplugin', 0, 'context', '1', 'int'),
('developedbyblockplugin', 0, 'enabled', '0', 'bool'),
('developedbyblockplugin', 0, 'seq', '0', 'int'),
('developedbyblockplugin', 1, 'context', '1', 'int'),
('developedbyblockplugin', 1, 'enabled', '1', 'bool'),
('developedbyblockplugin', 1, 'seq', '0', 'int'),
('developedbyblockplugin', 2, 'context', '1', 'int'),
('developedbyblockplugin', 2, 'enabled', '0', 'bool'),
('developedbyblockplugin', 2, 'seq', '0', 'int'),
('dublincoremetaplugin', 1, 'enabled', '1', 'bool'),
('dublincoremetaplugin', 2, 'enabled', '1', 'bool'),
('googlescholarplugin', 1, 'enabled', '1', 'bool'),
('googlescholarplugin', 2, 'enabled', '1', 'bool'),
('htmlmonographfileplugin', 1, 'enabled', '1', 'bool'),
('htmlmonographfileplugin', 2, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'context', '1', 'int'),
('informationblockplugin', 1, 'enabled', '0', 'bool'),
('informationblockplugin', 1, 'seq', '7', 'int'),
('informationblockplugin', 2, 'context', '1', 'int'),
('informationblockplugin', 2, 'enabled', '1', 'bool'),
('informationblockplugin', 2, 'seq', '7', 'int'),
('languagetoggleblockplugin', 0, 'context', '1', 'int'),
('languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 0, 'seq', '4', 'int'),
('languagetoggleblockplugin', 1, 'context', '1', 'int'),
('languagetoggleblockplugin', 1, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 1, 'seq', '4', 'int'),
('languagetoggleblockplugin', 2, 'context', '1', 'int'),
('languagetoggleblockplugin', 2, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 2, 'seq', '4', 'int'),
('pdfjsviewerplugin', 1, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 2, 'enabled', '1', 'bool'),
('tinymceplugin', 0, 'enabled', '1', 'bool'),
('tinymceplugin', 1, 'enabled', '1', 'bool'),
('tinymceplugin', 2, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'uniqueSiteId', '6531cc8a63c23', 'string'),
('usagestatsplugin', 0, 'accessLogFileParseRegex', '/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/', 'string'),
('usagestatsplugin', 0, 'chartType', 'bar', 'string'),
('usagestatsplugin', 0, 'createLogFiles', '1', 'bool'),
('usagestatsplugin', 0, 'datasetMaxCount', '4', 'string'),
('usagestatsplugin', 0, 'enabled', '1', 'bool'),
('usagestatsplugin', 0, 'optionalColumns', '[\"city\",\"region\"]', 'object'),
('webfeedplugin', 1, 'displayItems', '1', 'bool'),
('webfeedplugin', 1, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 1, 'enabled', '1', 'bool'),
('webfeedplugin', 2, 'displayItems', '1', 'bool'),
('webfeedplugin', 2, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 2, 'enabled', '1', 'bool');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presses`
--

CREATE TABLE `presses` (
  `press_id` bigint(20) NOT NULL,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `presses`
--

INSERT INTO `presses` (`press_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'OMP', 1.00, 'en_US', 1),
(2, 'gwencana', 1.00, 'en_US', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `press_settings`
--

CREATE TABLE `press_settings` (
  `press_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `press_settings`
--

INSERT INTO `press_settings` (`press_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'agencies', '0', NULL),
(1, '', 'catalogSortOption', 'datePublished-2', NULL),
(1, '', 'citations', '0', NULL),
(1, '', 'copyrightHolderType', 'author', NULL),
(1, '', 'coverage', '0', NULL),
(1, '', 'coverThumbnailsMaxHeight', '100', NULL),
(1, '', 'coverThumbnailsMaxWidth', '106', NULL),
(1, '', 'defaultReviewMode', '1', NULL),
(1, '', 'disableSubmissions', '0', NULL),
(1, '', 'disciplines', '0', NULL),
(1, '', 'displayFeaturedBooks', '0', NULL),
(1, '', 'displayInSpotlight', '1', NULL),
(1, '', 'displayNewReleases', '1', NULL),
(1, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>', NULL),
(1, '', 'enableAnnouncements', '1', NULL),
(1, '', 'enablePublisherId', '[]', NULL),
(1, '', 'itemsPerPage', '25', NULL),
(1, '', 'keywords', 'request', NULL),
(1, '', 'languages', '0', NULL),
(1, '', 'licenseUrl', 'https://creativecommons.org/licenses/by-nd/4.0', NULL),
(1, '', 'numPageLinks', '10', NULL),
(1, '', 'numWeeksPerResponse', '3', NULL),
(1, '', 'numWeeksPerReview', '4', NULL),
(1, '', 'paymentPluginName', 'ManualPayment', NULL),
(1, '', 'rights', '0', NULL),
(1, '', 'sidebar', '[\"browseblockplugin\",\"developedbyblockplugin\",\"languagetoggleblockplugin\",\"WebFeedBlockPlugin\"]', NULL),
(1, '', 'source', '0', NULL),
(1, '', 'subjects', 'request', NULL),
(1, '', 'supportedFormLocales', '[\"en_US\"]', NULL),
(1, '', 'supportedLocales', '[\"en_US\",\"id_ID\"]', NULL),
(1, '', 'supportedSubmissionLocales', '[\"en_US\"]', NULL),
(1, '', 'themePluginPath', 'default', NULL),
(1, '', 'type', '0', NULL),
(1, 'en_US', 'acronym', 'OMP3', NULL),
(1, 'en_US', 'authorInformation', 'Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/omp-3.3/index.php/OMP/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/omp-3.3/index.php/OMP/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/omp-3.3/index.php/OMP/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/omp-3.3/index.php/index/login\">log in</a> and begin the 5 step process.', NULL),
(1, 'en_US', 'dateFormatLong', '%B %e, %Y', NULL),
(1, 'en_US', 'dateFormatShort', '%Y-%m-%d', NULL),
(1, 'en_US', 'datetimeFormatLong', '%B %e, %Y - %I:%M %p', NULL),
(1, 'en_US', 'datetimeFormatShort', '%Y-%m-%d %I:%M %p', NULL),
(1, 'en_US', 'librarianInformation', 'We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).', NULL),
(1, 'en_US', 'name', 'Belajar OMP-3.3', NULL),
(1, 'en_US', 'openAccessPolicy', 'This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(1, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>', NULL),
(1, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/omp-3.3/index.php/OMP/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/omp-3.3/index.php/OMP/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.', NULL),
(1, 'en_US', 'submissionChecklist', '[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\\"http:\\/\\/localhost\\/omp-3.3\\/index.php\\/OMP\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Author Guidelines<\\/a>, which is found in About the Press.\"}]', NULL),
(1, 'en_US', 'timeFormat', '%I:%M %p', NULL),
(1, 'id_ID', 'acronym', NULL, NULL),
(1, 'id_ID', 'authorInformation', '##default.contextSettings.forAuthors##', NULL),
(1, 'id_ID', 'librarianInformation', '##default.contextSettings.forLibrarians##', NULL),
(1, 'id_ID', 'name', NULL, NULL),
(1, 'id_ID', 'openAccessPolicy', '##default.contextSettings.openAccessPolicy##', NULL),
(1, 'id_ID', 'privacyStatement', '##default.contextSettings.privacyStatement##', NULL),
(1, 'id_ID', 'readerInformation', '##default.contextSettings.forReaders##', NULL),
(1, 'id_ID', 'submissionChecklist', '[{\"order\":1,\"content\":\"##default.contextSettings.checklist.notPreviouslyPublished##\"},{\"order\":2,\"content\":\"##default.contextSettings.checklist.fileFormat##\"},{\"order\":3,\"content\":\"##default.contextSettings.checklist.addressesLinked##\"},{\"order\":4,\"content\":\"##default.contextSettings.checklist.submissionAppearance##\"},{\"order\":5,\"content\":\"##default.contextSettings.checklist.bibliographicRequirements##\"}]', NULL),
(2, '', 'catalogSortOption', 'datePublished-2', NULL),
(2, '', 'coverThumbnailsMaxHeight', '100', NULL),
(2, '', 'coverThumbnailsMaxWidth', '106', NULL),
(2, '', 'defaultReviewMode', '2', NULL),
(2, '', 'disableSubmissions', '0', NULL),
(2, '', 'displayFeaturedBooks', '1', NULL),
(2, '', 'displayInSpotlight', '1', NULL),
(2, '', 'displayNewReleases', '1', NULL),
(2, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>', NULL),
(2, '', 'itemsPerPage', '25', NULL),
(2, '', 'keywords', 'request', NULL),
(2, '', 'numPageLinks', '10', NULL),
(2, '', 'numWeeksPerResponse', '4', NULL),
(2, '', 'numWeeksPerReview', '4', NULL),
(2, '', 'paymentPluginName', 'ManualPayment', NULL),
(2, '', 'sidebar', '[\"WebFeedBlockPlugin\",\"browseblockplugin\",\"informationblockplugin\",\"languagetoggleblockplugin\"]', NULL),
(2, '', 'supportedFormLocales', '[\"en_US\"]', NULL),
(2, '', 'supportedLocales', '[\"en_US\",\"id_ID\"]', NULL),
(2, '', 'supportedSubmissionLocales', '[\"en_US\"]', NULL),
(2, '', 'themePluginPath', 'default', NULL),
(2, '', 'type', 'enable', NULL),
(2, 'en_US', 'acronym', 'gwncn', NULL),
(2, 'en_US', 'authorInformation', 'Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/omp-3.3/index.php/gwencana/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/omp-3.3/index.php/gwencana/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/omp-3.3/index.php/gwencana/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/omp-3.3/index.php/index/login\">log in</a> and begin the 5 step process.', NULL),
(2, 'en_US', 'librarianInformation', 'We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).', NULL),
(2, 'en_US', 'name', 'gwencana', NULL),
(2, 'en_US', 'openAccessPolicy', 'This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(2, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>', NULL),
(2, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/omp-3.3/index.php/gwencana/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/omp-3.3/index.php/gwencana/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.', NULL),
(2, 'en_US', 'submissionChecklist', '[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\\"http:\\/\\/localhost\\/omp-3.3\\/index.php\\/gwencana\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Author Guidelines<\\/a>, which is found in About the Press.\"}]', NULL),
(2, 'id_ID', 'acronym', NULL, NULL),
(2, 'id_ID', 'authorInformation', '##default.contextSettings.forAuthors##', NULL),
(2, 'id_ID', 'librarianInformation', '##default.contextSettings.forLibrarians##', NULL),
(2, 'id_ID', 'name', NULL, NULL),
(2, 'id_ID', 'openAccessPolicy', '##default.contextSettings.openAccessPolicy##', NULL),
(2, 'id_ID', 'privacyStatement', '##default.contextSettings.privacyStatement##', NULL),
(2, 'id_ID', 'readerInformation', '##default.contextSettings.forReaders##', NULL),
(2, 'id_ID', 'submissionChecklist', '[{\"order\":1,\"content\":\"##default.contextSettings.checklist.notPreviouslyPublished##\"},{\"order\":2,\"content\":\"##default.contextSettings.checklist.fileFormat##\"},{\"order\":3,\"content\":\"##default.contextSettings.checklist.addressesLinked##\"},{\"order\":4,\"content\":\"##default.contextSettings.checklist.submissionAppearance##\"},{\"order\":5,\"content\":\"##default.contextSettings.checklist.bibliographicRequirements##\"}]', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `publications`
--

CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_date_type` varchar(32) DEFAULT 'pub',
  `publication_type` varchar(32) DEFAULT 'publication',
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `series_id` bigint(20) DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `publications`
--

INSERT INTO `publications` (`publication_id`, `date_published`, `last_modified`, `locale`, `primary_contact_id`, `publication_date_type`, `publication_type`, `seq`, `series_id`, `series_position`, `submission_id`, `status`, `url_path`, `version`) VALUES
(1, '2023-10-20', '2023-10-20 04:23:45', NULL, 1, 'pub', 'publication', 0.00, NULL, NULL, 1, 3, NULL, 1),
(2, '2023-10-19', '2023-10-19 10:05:49', NULL, 2, 'pub', 'publication', 0.00, NULL, NULL, 2, 3, NULL, 1),
(3, '2023-10-19', '2023-10-19 10:13:16', NULL, 3, 'pub', 'publication', 0.00, NULL, NULL, 3, 3, NULL, 1),
(4, '2023-10-19', '2023-12-01 08:09:24', NULL, 4, 'pub', 'publication', 0.00, 3, NULL, 4, 3, NULL, 1),
(5, NULL, '2023-10-20 04:38:14', NULL, 5, 'pub', 'publication', 0.00, 1, NULL, 5, 1, NULL, 1),
(6, '2023-10-20', '2023-10-20 09:38:16', NULL, 6, 'pub', 'publication', 0.00, NULL, NULL, 6, 3, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `publication_categories`
--

CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publication_dates`
--

CREATE TABLE `publication_dates` (
  `publication_date_id` bigint(20) NOT NULL,
  `publication_format_id` bigint(20) NOT NULL,
  `role` varchar(40) NOT NULL,
  `date_format` varchar(40) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publication_formats`
--

CREATE TABLE `publication_formats` (
  `publication_format_id` bigint(20) NOT NULL,
  `publication_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `physical_format` smallint(6) DEFAULT 1,
  `entry_key` varchar(64) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `file_size` varchar(255) DEFAULT NULL,
  `front_matter` varchar(255) DEFAULT NULL,
  `back_matter` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `height_unit_code` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `width_unit_code` varchar(255) DEFAULT NULL,
  `thickness` varchar(255) DEFAULT NULL,
  `thickness_unit_code` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit_code` varchar(255) DEFAULT NULL,
  `product_composition_code` varchar(255) DEFAULT NULL,
  `product_form_detail_code` varchar(255) DEFAULT NULL,
  `country_manufacture_code` varchar(255) DEFAULT NULL,
  `imprint` varchar(255) DEFAULT NULL,
  `product_availability_code` varchar(255) DEFAULT NULL,
  `technical_protection_code` varchar(255) DEFAULT NULL,
  `returnable_indicator_code` varchar(255) DEFAULT NULL,
  `remote_url` varchar(2047) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `is_available` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `publication_formats`
--

INSERT INTO `publication_formats` (`publication_format_id`, `publication_id`, `submission_id`, `physical_format`, `entry_key`, `seq`, `file_size`, `front_matter`, `back_matter`, `height`, `height_unit_code`, `width`, `width_unit_code`, `thickness`, `thickness_unit_code`, `weight`, `weight_unit_code`, `product_composition_code`, `product_form_detail_code`, `country_manufacture_code`, `imprint`, `product_availability_code`, `technical_protection_code`, `returnable_indicator_code`, `remote_url`, `url_path`, `is_approved`, `is_available`) VALUES
(1, 2, NULL, 0, 'DA', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1, 0),
(2, 2, NULL, 0, 'DA', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1, 0),
(3, 2, NULL, 0, 'BC', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1, 0),
(4, 3, NULL, 0, 'DA', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1, 0),
(5, 4, NULL, 0, 'DA', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1, 0),
(6, 4, NULL, 0, 'BC', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `publication_format_settings`
--

CREATE TABLE `publication_format_settings` (
  `publication_format_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `publication_format_settings`
--

INSERT INTO `publication_format_settings` (`publication_format_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Free PDF', 'string'),
(2, 'en_US', 'name', 'Ebook', 'string'),
(3, 'en_US', 'name', 'Paperback', 'string'),
(4, 'en_US', 'name', 'Free PDF', 'string'),
(5, 'en_US', 'name', 'Ebook', 'string'),
(6, 'en_US', 'name', 'Paperback', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `publication_settings`
--

CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `publication_settings`
--

INSERT INTO `publication_settings` (`publication_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, '', 'categoryIds', '[]'),
(1, '', 'copyrightYear', '2023'),
(1, '', 'licenseUrl', 'https://creativecommons.org/licenses/by-nd/4.0'),
(1, 'en_US', 'abstract', '<p>The sound of the wind across a Prairie field, the smell of grass on the first day of spring, the vocalization of birds in the early morning woods, the silence of the lake at night interrupted by call of the loon – these are the shapes and sounds of the Prairie landscape. Katherine Koller invokes the Prairie setting as a central character in each of the four plays in&nbsp;<em>Voices of the Land</em>. Serving a supportive and, at other times, antagonistic role, the landscape acts upon the characters, driving and intensifying their transformation.</p>\r\n<p>The land and those who live in intimate terms with it are the focus of Koller\'s plays.<em>&nbsp;In The Seed Savers</em>, farmers face pressure to purchase genetically modified seed; a protagonist refuses to sell untilled land for development in&nbsp;<em>Cowboy Boots and a Corsage</em>; a dying woman sees a lake as her final resting place in&nbsp;<em>Abby\'s Place</em>; and in&nbsp;<em>The Early Worm Club</em>, Millie realizes a deep sense of belonging to the Alberta parkland and its birds while searching for her mate. Nature goes beyond mere setting and backdrop in these plays to effect transformation and resolution on the characters. Ranging from romantic comedy to drama and from one-act to full-length, the plays in&nbsp;<em>Voices of the Land</em>&nbsp;show western Canadians at the point of leaving, returning, and renewing against the backdrop of their native landscape.</p>'),
(1, 'en_US', 'copyrightHolder', 'hasnaz hasnaz'),
(1, 'en_US', 'prefix', ''),
(1, 'en_US', 'subtitle', ''),
(1, 'en_US', 'title', 'Voices of the Land'),
(2, '', 'categoryIds', '[]'),
(2, '', 'copyrightYear', '2023'),
(2, 'en_US', 'abstract', '<p>\"… aspirations to perfection awaken us to our actual imperfection.\" It is in the space between these aspirations and our inability to achieve them that Grant reflects upon imperfection. Grant argues that an awareness of imperfection, defined as both suffering and the need for justice, drives us to an unrelenting search for perfection, freedom, and selfdetermination. The twenty-one brief chapters of <em>Imperfection</em> develop this governing idea as it relates to the present situation of the God debate, modern ethnic conflicts, and the pursuit of freedom in relation to the uncertainties of personal identity and the quest for self-determination.</p>\r\n<p>Known for his exploration of the relationship between Buddhism and violent ethnic conflict in modern Sri Lanka, as well as his contribution to the study of Northern Ireland and the complex relationships among religion, literature, and ethnicity, Grant provides the reader with an analysis of the widespread rise of religious extremism across the globe. Referencing Plato, Van Gogh, Jesus, and the Buddha, he enlightens the reader with both succinct and original insights into human society. <em>Imperfection</em> is the result of an important Canadian public intellectual at work.</p>'),
(2, 'en_US', 'copyrightHolder', 'Belajar OMP-3.3'),
(2, 'en_US', 'prefix', ''),
(2, 'en_US', 'subtitle', ''),
(2, 'en_US', 'title', 'Imperfection'),
(3, '', 'categoryIds', '[]'),
(3, '', 'copyrightYear', '2023'),
(3, 'en_US', 'abstract', '<p><em>Making Game</em> is a mixed-genre composition in which the author reflects on the philosophical and ethical implications of hunting wild game. This engaging essay is informed by the author’s significant background of scholarly engagement with the phenomenological tradition in modern philosophy.</p>'),
(3, 'en_US', 'copyrightHolder', 'Belajar OMP-3.3'),
(3, 'en_US', 'prefix', ''),
(3, 'en_US', 'subtitle', 'An Essay on Hunting, Familiar Things, and the Strangeness of Being Who One Is'),
(3, 'en_US', 'title', 'Making Game'),
(4, '', 'categoryIds', '[]'),
(4, '', 'copyrightYear', '2023'),
(4, '', 'licenseUrl', 'https://creativecommons.org/licenses/by-nd/4.0'),
(4, 'en_US', 'abstract', '<p>In <em>Hot Thespian Action!</em> Robin Whittaker argues that new plays can thrive in amateur theatres, which have freedoms unavailable to professionalized companies. And he proves it with 10 relevant, engaging playscripts originally produced by one of Canada’s longest-running theatres, Edmonton’s acclaimed Walterdale Theatre Associates. <br><br></p>\r\n<p>This collection challenges notions that amateur theatre is solely a phenomenon of the pre-professional past. Whittaker makes an important contribution to Canadian theatre studies with the first North American anthology in 80 years to collect plays first produced by a nonprofessionalized theatre company.</p>\r\n<p>Plays by • Brad Fraser • Mary Glenfield • Warren Graves • Gordon Pengilly • Barbara Sapergia &amp; Geoffrey Ursell • Trevor Schmidt • Jonathan Seinen • Scott Sharplin • Mark Stubbings • Wilfred Watson</p>\r\n<p>&nbsp;</p>'),
(4, 'en_US', 'copyrightHolder', 'Belajar OMP-3.3'),
(4, 'en_US', 'prefix', ''),
(4, 'en_US', 'subtitle', 'Ten Premiere Plays from Walterdale Playhouse'),
(4, 'en_US', 'title', 'Hot Thespian Action!'),
(5, '', 'categoryIds', '[]'),
(5, 'en_US', 'abstract', '<p>In&nbsp;<em>Hot Thespian Action!</em>&nbsp;Robin Whittaker argues that new plays can thrive in amateur theatres, which have freedoms unavailable to professionalized companies. And he proves it with 10 relevant, engaging playscripts originally produced by one of Canada’s longest-running theatres, Edmonton’s acclaimed Walterdale Theatre Associates.<br><br></p>\r\n<p>This collection challenges notions that amateur theatre is solely a phenomenon of the pre-professional past. Whittaker makes an important contribution to Canadian theatre studies with the first North American anthology in 80 years to collect plays first produced by a nonprofessionalized theatre company.</p>\r\n<p>Plays by • Brad Fraser • Mary Glenfield • Warren Graves • Gordon Pengilly • Barbara Sapergia &amp; Geoffrey Ursell • Trevor Schmidt • Jonathan Seinen • Scott Sharplin • Mark Stubbings • Wilfred Watson</p>'),
(5, 'en_US', 'prefix', ''),
(5, 'en_US', 'subtitle', 'An Essay on Hunting, Familiar Things, and the Strangeness of Being Who One Is'),
(5, 'en_US', 'title', 'I\'ll Try'),
(6, '', 'categoryIds', '[]'),
(6, '', 'copyrightYear', '2023'),
(6, 'en_US', 'abstract', '<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>'),
(6, 'en_US', 'copyrightHolder', 'gwencana'),
(6, 'en_US', 'prefix', ''),
(6, 'en_US', 'subtitle', ''),
(6, 'en_US', 'title', 'Paper');

-- --------------------------------------------------------

--
-- Struktur dari tabel `queries`
--

CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `queries`
--

INSERT INTO `queries` (`query_id`, `assoc_type`, `assoc_id`, `stage_id`, `seq`, `date_posted`, `date_modified`, `closed`) VALUES
(1, 1048585, 6, 1, 1.00, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `query_participants`
--

CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `query_participants`
--

INSERT INTO `query_participants` (`query_id`, `user_id`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `queued_payments`
--

CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `representatives`
--

CREATE TABLE `representatives` (
  `representative_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `role` varchar(40) NOT NULL,
  `representative_id_type` varchar(255) DEFAULT NULL,
  `representative_id_value` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `is_supplier` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_assignments`
--

CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_files`
--

CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_forms`
--

CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `review_forms`
--

INSERT INTO `review_forms` (`review_form_id`, `assoc_type`, `assoc_id`, `seq`, `is_active`) VALUES
(1, 512, 1, 1.00, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_form_elements`
--

CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_form_element_settings`
--

CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_form_responses`
--

CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_form_settings`
--

CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `review_form_settings`
--

INSERT INTO `review_form_settings` (`review_form_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'description', '', 'string'),
(1, 'en_US', 'title', 'Peer Review Form', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_rounds`
--

CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_round_files`
--

CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_rights`
--

CREATE TABLE `sales_rights` (
  `sales_rights_id` bigint(20) NOT NULL,
  `publication_format_id` bigint(20) NOT NULL,
  `type` varchar(40) NOT NULL,
  `row_setting` smallint(6) NOT NULL DEFAULT 0,
  `countries_included` text DEFAULT NULL,
  `countries_excluded` text DEFAULT NULL,
  `regions_included` text DEFAULT NULL,
  `regions_excluded` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `scheduled_tasks`
--

CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
('lib.pkp.classes.task.PublishSubmissions', '2023-12-04 01:30:56'),
('lib.pkp.classes.task.ReviewReminder', '2023-12-04 01:30:56'),
('lib.pkp.classes.task.StatisticsReport', '2023-12-01 07:38:13'),
('plugins.generic.usageStats.UsageStatsLoader', '2023-12-04 01:30:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `series`
--

CREATE TABLE `series` (
  `series_id` bigint(20) NOT NULL,
  `press_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) DEFAULT 0.00,
  `featured` smallint(6) NOT NULL DEFAULT 0,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `series`
--

INSERT INTO `series` (`series_id`, `press_id`, `review_form_id`, `seq`, `featured`, `editor_restricted`, `path`, `image`, `is_inactive`) VALUES
(1, 1, NULL, 0.00, 0, 0, 'distance_ed', 'a:0:{}', 0),
(2, 1, NULL, 0.00, 0, 0, 'working_canadians', 'a:0:{}', 0),
(3, 1, NULL, 0.00, 0, 0, 'voices', 'a:0:{}', 0),
(4, 2, NULL, 0.00, 0, 0, 'paperoni', 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `series_categories`
--

CREATE TABLE `series_categories` (
  `series_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `series_settings`
--

CREATE TABLE `series_settings` (
  `series_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `series_settings`
--

INSERT INTO `series_settings` (`series_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'onlineIssn', '', 'string'),
(1, '', 'printIssn', '', 'string'),
(1, '', 'sortOption', 'title-1', 'string'),
(1, 'en_US', 'description', '<p>1919-4382 Issues in Distance Education series (print)<br>1919-4390 Issues in Distance Education series (electronic)</p>\r\n<p>Series Editor(s): Terry Anderson and David Wiley</p>\r\n<p>Editor, International Review of Research on Open and Distance Learning <br><a href=\"mailto:terrya@athabascau.ca\">terrya@athabascau.ca</a></p>\r\n<p>Associate Professor at Brigham Young University <br><a href=\"mailto:david.wiley@gmail.com\">david.wiley@gmail.com</a></p>\r\n<p>Distance education is the fastest growing mode of both formal and informal teaching, training and learning. It has many variants that include e-learning, mobile learning and immersive learning environments. This series offers informative and accessible overviews, research results, discussions and explorations of current issues, technologies and services used in distance education. Each volume focuses on critical issues and emerging trends, while noting the evolutionary history and roots of this specialized mode of education and training. The series is targeted at a wide group of readers including distance education teachers, trainers, administrators, researchers and students.</p>', 'string'),
(1, 'en_US', 'prefix', '', 'string'),
(1, 'en_US', 'subtitle', '', 'string'),
(1, 'en_US', 'title', 'Issues in Distance Education', 'string'),
(2, '', 'onlineIssn', '', 'string'),
(2, '', 'printIssn', '', 'string'),
(2, '', 'sortOption', 'title-1', 'string'),
(2, 'en_US', 'description', '<p>1925-1831 Working Canadians: Books from the CCLH series (print)<br>1925-184X Working Canadians: Books from the CCLH series (electronic)</p>\r\n<p>Series Editor(s): Alvin Finkel and Greg Kealey</p>\r\n<p>The Canadian Committee on Labour History is Canada’s organization of historians and other scholars interested in the study of the lives and struggles of working people throughout Canada’s past. Since 1976, the CCLH has published <em>Labour/Le travail</em>, Canada’s pre-eminent scholarly journal of labour studies. It also publishes books, now in conjunction with AU Press, that focus on the history of Canada’s working people and their organizations. The emphasis in this series is on materials that are accessible to labour audiences as well as university audiences rather than simply on scholarly studies in the labour area. This includes documentary collections, oral histories, autobiographies, biographies, and provincial and local labour movement histories with a popular bent.</p>', 'string'),
(2, 'en_US', 'prefix', '', 'string'),
(2, 'en_US', 'subtitle', 'Books from the CCLH', 'string'),
(2, 'en_US', 'title', 'Working Canadians', 'string'),
(3, '', 'onlineIssn', '', 'string'),
(3, '', 'printIssn', '', 'string'),
(3, '', 'sortOption', 'datePublished-2', 'string'),
(3, 'en_US', 'description', '<p>1917-9405 Mingling Voices series (print)<br>1917-9413 Mingling Voices series (electronic)</p>\r\n<p>Series Editor(s): Manijeh Mannani</p>\r\n<p>Manijeh Mannani is Associate Professor of English and Comparative Literature.<br><a href=\"mailto:manijehm@athabascau.ca\">manijehm@athabascau.ca</a></p>\r\n<blockquote>“Give us wholeness, for we are broken <br>But who are we asking, and why do we ask“<br><span style=\"padding-left: 220px;\">— Phyllis Webb</span></blockquote>\r\n<p>National in scope, <em>Mingling Voices</em> draws on the work of both new and established novelists, short story tellers, and poets. The series especially, but not exclusively, aims to promote authors who challenge traditions and cultural stereotypes. It is designed to reach a wide variety of readers, both generalists and specialists. <em>Mingling Voices</em> is also open to literary works that delineate the immigrant experience in Canada.</p>', 'string'),
(3, 'en_US', 'prefix', '', 'string'),
(3, 'en_US', 'subtitle', '', 'string'),
(3, 'en_US', 'title', 'Mingling Voices', 'string'),
(4, '', 'onlineIssn', '', 'string'),
(4, '', 'printIssn', '', 'string'),
(4, '', 'sortOption', 'datePublished-2', 'string'),
(4, 'en_US', 'description', '', 'string'),
(4, 'en_US', 'prefix', '', 'string'),
(4, 'en_US', 'subtitle', '', 'string'),
(4, 'en_US', 'title', 'Paperoni', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('aavbo7kr59hdu6oujj017g0od4', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1697699230, 1698151496, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1698151496;s:5:\"token\";s:32:\"a6c74fe05f3bd99ecd53cc96830ef88c\";}userId|i:1;username|s:6:\"hasnaz\";', 'localhost'),
('bjlf4kujggudhb9d0juifg96s2', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 1701312617, 1701312627, 0, '', 'localhost'),
('btn5c5kg3ohlj5id9b2m2qbbe4', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.57', 1697773430, 1697773442, 0, '', 'localhost'),
('nseupq55k1kpsnom6s6uvdddcq', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 1701138475, 1701650720, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1701650718;s:5:\"token\";s:32:\"7b1f55cff83468dfff4fc192172f6164\";}userId|i:1;username|s:6:\"hasnaz\";', 'localhost');

-- --------------------------------------------------------

--
-- Struktur dari tabel `site`
--

CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(0, 'en_US', 6, '[\"en_US\",\"id_ID\"]', '[\"en_US\",\"id_ID\"]', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`) VALUES
('contactEmail', 'en_US', 'zahidahasna002@gmail.com'),
('contactName', 'en_US', 'Open Monograph Press'),
('contactName', 'id_ID', '##common.software##'),
('themePluginPath', '', 'default');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spotlights`
--

CREATE TABLE `spotlights` (
  `spotlight_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` smallint(6) NOT NULL,
  `press_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `spotlights`
--

INSERT INTO `spotlights` (`spotlight_id`, `assoc_type`, `assoc_id`, `press_id`) VALUES
(1, 3, 2, 1),
(2, 4, 4, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spotlight_settings`
--

CREATE TABLE `spotlight_settings` (
  `spotlight_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `spotlight_settings`
--

INSERT INTO `spotlight_settings` (`spotlight_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'description', '', 'string'),
(1, 'en_US', 'title', 'Most Read This Month', 'string'),
(2, 'en_US', 'description', '', 'string'),
(2, 'en_US', 'title', 'Imperfection', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stage_assignments`
--

CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `stage_assignments`
--

INSERT INTO `stage_assignments` (`stage_assignment_id`, `submission_id`, `user_group_id`, `user_id`, `date_assigned`, `recommend_only`, `can_change_metadata`) VALUES
(1, 1, 2, 1, '2023-10-19 09:43:34', 0, 1),
(2, 1, 3, 2, '2023-10-19 09:46:11', 0, 1),
(3, 1, 8, 2, '2023-10-19 09:46:11', 0, 0),
(4, 2, 2, 1, '2023-10-19 09:53:18', 0, 1),
(5, 2, 3, 2, '2023-10-19 09:59:37', 0, 1),
(6, 2, 8, 2, '2023-10-19 09:59:37', 0, 0),
(7, 3, 2, 1, '2023-10-19 10:07:19', 0, 1),
(8, 3, 3, 2, '2023-10-19 10:10:01', 0, 1),
(9, 3, 8, 2, '2023-10-19 10:10:01', 0, 0),
(10, 4, 2, 1, '2023-10-19 10:34:55', 0, 1),
(11, 4, 3, 2, '2023-10-19 10:37:40', 0, 1),
(12, 4, 8, 2, '2023-10-19 10:37:40', 0, 0),
(13, 5, 2, 1, '2023-10-20 04:36:13', 0, 1),
(14, 5, 3, 2, '2023-10-20 04:38:21', 0, 1),
(15, 5, 8, 2, '2023-10-20 04:38:21', 0, 0),
(16, 6, 20, 1, '2023-10-20 06:29:53', 0, 1),
(17, 6, 21, 3, '2023-10-20 09:33:17', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `static_pages`
--

CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `static_page_settings`
--

CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subeditor_submission_group`
--

CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `subeditor_submission_group`
--

INSERT INTO `subeditor_submission_group` (`context_id`, `assoc_id`, `assoc_type`, `user_id`) VALUES
(2, 0, 530, 3),
(2, 4, 530, 3),
(2, 10, 525, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` smallint(6) NOT NULL DEFAULT 1,
  `work_type` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `submissions`
--

INSERT INTO `submissions` (`submission_id`, `context_id`, `current_publication_id`, `date_last_activity`, `date_submitted`, `last_modified`, `stage_id`, `locale`, `status`, `submission_progress`, `work_type`) VALUES
(1, 1, 1, '2023-10-20 04:23:45', '2023-10-19 09:46:11', '2023-10-19 09:46:11', 5, 'en_US', 3, 0, 2),
(2, 1, 2, '2023-10-19 10:05:49', '2023-10-19 09:59:37', '2023-10-19 09:59:37', 5, 'en_US', 3, 0, 2),
(3, 1, 3, '2023-10-19 10:13:16', '2023-10-19 10:10:00', '2023-10-19 10:10:00', 5, 'en_US', 3, 0, 2),
(4, 1, 4, '2023-12-01 08:09:24', '2023-10-19 10:37:40', '2023-10-19 10:37:40', 5, 'en_US', 3, 0, 2),
(5, 1, 5, '2023-10-20 04:40:11', '2023-10-20 04:38:21', '2023-10-20 04:38:21', 5, 'en_US', 1, 0, 2),
(6, 2, 6, '2023-10-20 09:38:16', '2023-10-20 06:30:45', '2023-10-20 06:30:45', 5, 'en_US', 3, 0, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_chapters`
--

CREATE TABLE `submission_chapters` (
  `chapter_id` bigint(20) NOT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_chapter_authors`
--

CREATE TABLE `submission_chapter_authors` (
  `author_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) NOT NULL,
  `primary_contact` smallint(6) NOT NULL DEFAULT 0,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_chapter_settings`
--

CREATE TABLE `submission_chapter_settings` (
  `chapter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_comments`
--

CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_files`
--

CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `source_submission_file_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `submission_files`
--

INSERT INTO `submission_files` (`submission_file_id`, `submission_id`, `file_id`, `source_submission_file_id`, `genre_id`, `file_stage`, `direct_sales_price`, `sales_type`, `viewable`, `created_at`, `updated_at`, `uploader_user_id`, `assoc_type`, `assoc_id`) VALUES
(1, 1, 1, NULL, 3, 2, NULL, NULL, NULL, '2023-10-19 09:43:54', '2023-10-19 09:44:06', 1, NULL, NULL),
(2, 1, 1, 1, 3, 6, NULL, NULL, 1, '2023-10-19 09:47:57', '2023-10-19 09:48:11', 1, NULL, NULL),
(3, 2, 2, NULL, 3, 2, NULL, NULL, NULL, '2023-10-19 09:56:53', '2023-10-19 09:57:22', 1, NULL, NULL),
(4, 2, 2, 3, 3, 6, NULL, NULL, NULL, '2023-10-19 10:00:58', '2023-10-19 10:00:58', 1, NULL, NULL),
(5, 2, 2, 3, 3, 10, NULL, NULL, 1, '2023-10-19 10:03:39', '2023-10-19 10:03:57', 1, 521, 1),
(6, 3, 3, NULL, 3, 2, NULL, NULL, NULL, '2023-10-19 10:09:06', '2023-10-19 10:09:09', 1, NULL, NULL),
(7, 3, 3, 6, 3, 6, NULL, NULL, NULL, '2023-10-19 10:10:35', '2023-10-19 10:10:35', 1, NULL, NULL),
(8, 3, 3, 6, 3, 10, NULL, NULL, 1, '2023-10-19 10:11:55', '2023-10-19 10:12:00', 1, 521, 4),
(9, 4, 4, NULL, 3, 2, NULL, NULL, NULL, '2023-10-19 10:36:59', '2023-10-19 10:37:03', 1, NULL, NULL),
(10, 4, 5, NULL, 3, 2, NULL, NULL, NULL, '2023-10-19 10:36:59', '2023-10-19 10:37:05', 1, NULL, NULL),
(11, 4, 5, 10, 3, 10, NULL, NULL, 1, '2023-10-19 10:41:54', '2023-10-19 10:42:01', 1, 521, 5),
(12, 4, 4, 9, 3, 10, NULL, NULL, 1, '2023-10-19 10:42:32', '2023-10-19 10:42:36', 1, 521, 6),
(13, 5, 6, NULL, 3, 2, NULL, NULL, NULL, '2023-10-20 04:36:21', '2023-10-20 04:36:25', 1, NULL, NULL),
(14, 5, 6, 13, 3, 6, NULL, NULL, NULL, '2023-10-20 04:39:53', '2023-10-20 04:39:53', 1, NULL, NULL),
(15, 6, 7, NULL, 18, 2, NULL, NULL, NULL, '2023-10-20 06:30:03', '2023-10-20 06:30:08', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_file_revisions`
--

CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) UNSIGNED NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `submission_file_revisions`
--

INSERT INTO `submission_file_revisions` (`revision_id`, `submission_file_id`, `file_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 3),
(7, 7, 3),
(8, 8, 3),
(9, 10, 5),
(10, 9, 4),
(11, 11, 5),
(12, 12, 4),
(13, 13, 6),
(14, 14, 6),
(15, 15, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_file_settings`
--

CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `submission_file_settings`
--

INSERT INTO `submission_file_settings` (`submission_file_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(2, 'en_US', 'name', 'Book+Manuscript,+Voices+of+the+Land.pdf', 'string'),
(3, 'en_US', 'name', 'Free+PDF+Download.pdf', 'string'),
(4, 'en_US', 'name', 'Free+PDF+Download.pdf', 'string'),
(5, 'en_US', 'name', 'Free+PDF+Download.pdf', 'string'),
(6, 'en_US', 'name', 'Free+PDF.pdf', 'string'),
(7, 'en_US', 'name', 'Free+PDF.pdf', 'string'),
(8, 'en_US', 'name', 'Free+PDF.pdf', 'string'),
(9, 'en_US', 'name', 'Paperback.pdf', 'string'),
(10, 'en_US', 'name', 'Epub.pdf', 'string'),
(11, 'en_US', 'name', 'Epub.pdf', 'string'),
(12, 'en_US', 'name', 'Paperback.pdf', 'string'),
(13, 'en_US', 'name', 'Epub.pdf', 'string'),
(14, 'en_US', 'name', 'Epub.pdf', 'string'),
(15, 'en_US', 'name', 'Paperback.pdf', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_search_keyword_list`
--

CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword_text` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `submission_search_keyword_list`
--

INSERT INTO `submission_search_keyword_list` (`keyword_id`, `keyword_text`) VALUES
(236, 'abbys'),
(274, 'abound'),
(125, 'acclaimed'),
(9, 'achieve'),
(106, 'action'),
(204, 'acts'),
(6, 'actual'),
(285, 'adapted'),
(244, 'alberta'),
(111, 'amateur'),
(139, 'american'),
(155, 'amp'),
(59, 'analysis'),
(202, 'antagonistic'),
(140, 'anthology'),
(12, 'argues'),
(269, 'articles'),
(3, 'aspirations'),
(128, 'associates'),
(87, 'author'),
(96, 'author’s'),
(5, 'awaken'),
(13, 'awareness'),
(250, 'backdrop'),
(98, 'background'),
(153, 'barbara'),
(243, 'belonging'),
(180, 'birds'),
(268, 'books'),
(228, 'boots'),
(145, 'brad'),
(70, 'buddha'),
(44, 'buddhism'),
(188, 'call'),
(122, 'canada’s'),
(79, 'canadian'),
(261, 'canadians'),
(197, 'central'),
(130, 'challenges'),
(23, 'chapters'),
(198, 'character'),
(205, 'characters'),
(238, 'club'),
(142, 'collect'),
(129, 'collection'),
(255, 'comedy'),
(116, 'companies'),
(144, 'company'),
(53, 'complex'),
(86, 'composition'),
(276, 'comprehensive'),
(46, 'conflict'),
(34, 'conflicts'),
(49, 'contribution'),
(229, 'corsage'),
(288, 'courses'),
(227, 'cowboy'),
(177, 'day'),
(31, 'debate'),
(241, 'deep'),
(14, 'defined'),
(271, 'design'),
(278, 'designers'),
(292, 'designer’s'),
(24, 'develop'),
(226, 'development'),
(283, 'documents'),
(256, 'drama'),
(17, 'drives'),
(206, 'driving'),
(290, 'dual-mode'),
(230, 'dying'),
(181, 'early'),
(124, 'edmonton’s'),
(251, 'effect'),
(295, 'eld'),
(284, 'emergence'),
(100, 'engagement'),
(93, 'engaging'),
(71, 'enlightens'),
(94, 'essay'),
(89, 'ethical'),
(33, 'ethnic'),
(57, 'ethnicity'),
(42, 'exploration'),
(63, 'extremism'),
(217, 'face'),
(216, 'farmers'),
(174, 'field'),
(233, 'final'),
(212, 'focus'),
(146, 'fraser'),
(20, 'freedom'),
(113, 'freedoms'),
(258, 'full-length'),
(84, 'game'),
(220, 'genetically'),
(156, 'geoffrey'),
(148, 'glenfield'),
(64, 'globe'),
(30, 'god'),
(68, 'gogh'),
(151, 'gordon'),
(25, 'governing'),
(10, 'grant'),
(176, 'grass'),
(150, 'graves'),
(1, 'hasnaz'),
(104, 'hot'),
(75, 'human'),
(91, 'hunting'),
(26, 'idea'),
(39, 'identity'),
(2, 'imperfection'),
(90, 'implications'),
(78, 'important'),
(8, 'inability'),
(95, 'informed'),
(74, 'insights'),
(291, 'instruction'),
(270, 'instructional'),
(81, 'intellectual'),
(207, 'intensifying'),
(187, 'interrupted'),
(210, 'intimate'),
(195, 'invokes'),
(52, 'ireland'),
(69, 'jesus'),
(160, 'jonathan'),
(16, 'justice'),
(193, 'katherine'),
(194, 'koller'),
(213, 'kollers'),
(185, 'lake'),
(170, 'land'),
(192, 'landscape'),
(48, 'lanka'),
(273, 'learning'),
(263, 'leaving'),
(56, 'literature'),
(209, 'live'),
(293, 'log'),
(123, 'longest-running'),
(189, 'loon'),
(136, 'makes'),
(83, 'making'),
(164, 'mark'),
(147, 'mary'),
(247, 'mate'),
(249, 'mere'),
(239, 'millie'),
(85, 'mixed-genre'),
(286, 'model'),
(32, 'modern'),
(221, 'modified'),
(182, 'morning'),
(266, 'native'),
(248, 'nature'),
(168, 'nbsp'),
(186, 'night'),
(143, 'nonprofessionalized'),
(138, 'north'),
(51, 'northern'),
(131, 'notions'),
(257, 'one-act'),
(272, 'online'),
(73, 'original'),
(120, 'originally'),
(267, 'paper'),
(245, 'parkland'),
(135, 'past'),
(152, 'pengilly'),
(4, 'perfection'),
(38, 'personal'),
(101, 'phenomenological'),
(133, 'phenomenon'),
(88, 'philosophical'),
(103, 'philosophy'),
(277, 'picture'),
(235, 'place'),
(66, 'plato'),
(109, 'plays'),
(119, 'playscripts'),
(262, 'point'),
(282, 'power'),
(173, 'prairie'),
(134, 'pre-professional'),
(28, 'present'),
(218, 'pressure'),
(279, 'problems'),
(121, 'produced'),
(115, 'professionalized'),
(222, 'protagonist'),
(117, 'proves'),
(80, 'public'),
(219, 'purchase'),
(35, 'pursuit'),
(40, 'quest'),
(253, 'ranging'),
(275, 'rarely'),
(58, 'reader'),
(240, 'realizes'),
(65, 'referencing'),
(11, 'reflects'),
(223, 'refuses'),
(27, 'relates'),
(36, 'relation'),
(43, 'relationship'),
(54, 'relationships'),
(118, 'relevant'),
(55, 'religion'),
(62, 'religious'),
(265, 'renewing'),
(252, 'resolution'),
(234, 'resting'),
(77, 'result'),
(264, 'returning'),
(61, 'rise'),
(107, 'robin'),
(203, 'role'),
(254, 'romantic'),
(154, 'sapergia'),
(215, 'savers'),
(159, 'schmidt'),
(99, 'scholarly'),
(162, 'scott'),
(19, 'search'),
(246, 'searching'),
(214, 'seed'),
(232, 'sees'),
(161, 'seinen'),
(41, 'self-determination'),
(21, 'selfdetermination'),
(224, 'sell'),
(242, 'sense'),
(199, 'serving'),
(196, 'setting'),
(190, 'shapes'),
(163, 'sharplin'),
(259, 'show'),
(97, 'significant'),
(184, 'silence'),
(289, 'single-mode'),
(29, 'situation'),
(175, 'smell'),
(76, 'society'),
(132, 'solely'),
(280, 'solve'),
(171, 'sound'),
(191, 'sounds'),
(7, 'space'),
(178, 'spring'),
(47, 'sri'),
(165, 'stubbings'),
(137, 'studies'),
(50, 'study'),
(72, 'succinct'),
(15, 'suffering'),
(200, 'supportive'),
(211, 'terms'),
(127, 'theatre'),
(112, 'theatres'),
(105, 'thespian'),
(110, 'thrive'),
(201, 'times'),
(102, 'tradition'),
(208, 'transformation'),
(287, 'transforming'),
(158, 'trevor'),
(22, 'twenty-one'),
(114, 'unavailable'),
(37, 'uncertainties'),
(294, 'unique'),
(281, 'university'),
(18, 'unrelenting'),
(225, 'untilled'),
(157, 'ursell'),
(67, 'van'),
(45, 'violent'),
(179, 'vocalization'),
(169, 'voices'),
(126, 'walterdale'),
(149, 'warren'),
(167, 'watson'),
(260, 'western'),
(108, 'whittaker'),
(60, 'widespread'),
(92, 'wild'),
(166, 'wilfred'),
(172, 'wind'),
(231, 'woman'),
(183, 'woods'),
(82, 'work'),
(237, 'worm'),
(141, 'years');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_search_objects`
--

CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `submission_search_objects`
--

INSERT INTO `submission_search_objects` (`object_id`, `submission_id`, `type`, `assoc_id`) VALUES
(1, 2, 1, 0),
(2, 2, 2, 0),
(3, 2, 4, 0),
(4, 2, 16, 0),
(5, 2, 17, 0),
(6, 2, 8, 0),
(7, 2, 32, 0),
(8, 2, 64, 0),
(9, 3, 1, 0),
(10, 3, 2, 0),
(11, 3, 4, 0),
(12, 3, 16, 0),
(13, 3, 17, 0),
(14, 3, 8, 0),
(15, 3, 32, 0),
(16, 3, 64, 0),
(25, 1, 1, 0),
(26, 1, 2, 0),
(27, 1, 4, 0),
(28, 1, 16, 0),
(29, 1, 17, 0),
(30, 1, 8, 0),
(31, 1, 32, 0),
(32, 1, 64, 0),
(57, 6, 1, 0),
(58, 6, 2, 0),
(59, 6, 4, 0),
(60, 6, 16, 0),
(61, 6, 17, 0),
(62, 6, 8, 0),
(63, 6, 32, 0),
(64, 6, 64, 0),
(65, 4, 1, 0),
(66, 4, 2, 0),
(67, 4, 4, 0),
(68, 4, 16, 0),
(69, 4, 17, 0),
(70, 4, 8, 0),
(71, 4, 32, 0),
(72, 4, 64, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_search_object_keywords`
--

CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `submission_search_object_keywords`
--

INSERT INTO `submission_search_object_keywords` (`object_id`, `keyword_id`, `pos`) VALUES
(1, 1, 0),
(1, 1, 1),
(9, 1, 0),
(9, 1, 1),
(25, 1, 0),
(25, 1, 1),
(57, 1, 0),
(57, 1, 1),
(65, 1, 0),
(65, 1, 1),
(2, 2, 0),
(3, 2, 4),
(3, 2, 11),
(3, 2, 15),
(3, 2, 27),
(3, 2, 86),
(3, 3, 0),
(3, 3, 6),
(3, 4, 1),
(3, 4, 22),
(3, 5, 2),
(3, 6, 3),
(3, 7, 5),
(3, 8, 7),
(3, 9, 8),
(3, 10, 9),
(3, 10, 12),
(3, 10, 65),
(3, 11, 10),
(11, 11, 5),
(3, 12, 13),
(67, 12, 5),
(3, 13, 14),
(3, 14, 16),
(3, 15, 17),
(3, 16, 18),
(3, 17, 19),
(3, 18, 20),
(3, 19, 21),
(3, 20, 23),
(3, 20, 40),
(3, 21, 24),
(3, 22, 25),
(3, 23, 26),
(3, 24, 28),
(3, 25, 29),
(3, 26, 30),
(3, 27, 31),
(3, 28, 32),
(3, 29, 33),
(3, 30, 34),
(3, 31, 35),
(3, 32, 36),
(3, 32, 53),
(11, 32, 22),
(3, 33, 37),
(3, 33, 51),
(3, 34, 38),
(3, 35, 39),
(3, 36, 41),
(3, 37, 42),
(3, 38, 43),
(3, 39, 44),
(3, 40, 45),
(3, 41, 46),
(3, 42, 47),
(3, 43, 48),
(3, 44, 49),
(3, 45, 50),
(3, 46, 52),
(3, 47, 54),
(3, 48, 55),
(3, 49, 56),
(59, 49, 31),
(67, 49, 40),
(3, 50, 57),
(3, 51, 58),
(3, 52, 59),
(3, 53, 60),
(3, 54, 61),
(3, 55, 62),
(3, 56, 63),
(3, 57, 64),
(3, 58, 66),
(3, 58, 80),
(3, 59, 67),
(3, 60, 68),
(3, 61, 69),
(3, 62, 70),
(3, 63, 71),
(3, 64, 72),
(3, 65, 73),
(3, 66, 74),
(3, 67, 75),
(3, 68, 76),
(3, 69, 77),
(3, 70, 78),
(3, 71, 79),
(3, 72, 81),
(3, 73, 82),
(3, 74, 83),
(3, 75, 84),
(3, 76, 85),
(3, 77, 87),
(3, 78, 88),
(67, 78, 39),
(3, 79, 89),
(67, 79, 41),
(3, 80, 90),
(3, 81, 91),
(3, 82, 92),
(10, 83, 0),
(11, 83, 0),
(59, 83, 27),
(10, 84, 1),
(11, 84, 1),
(11, 84, 11),
(11, 85, 2),
(11, 86, 3),
(11, 87, 4),
(11, 88, 6),
(11, 89, 7),
(11, 90, 8),
(11, 91, 9),
(11, 92, 10),
(11, 93, 12),
(67, 93, 16),
(11, 94, 13),
(11, 95, 14),
(11, 96, 15),
(11, 97, 16),
(11, 98, 17),
(11, 99, 18),
(11, 100, 19),
(11, 101, 20),
(11, 102, 21),
(11, 103, 23),
(66, 104, 0),
(67, 104, 0),
(66, 105, 1),
(67, 105, 1),
(66, 106, 2),
(67, 106, 2),
(67, 107, 3),
(67, 108, 4),
(67, 108, 37),
(27, 109, 30),
(27, 109, 51),
(27, 109, 100),
(27, 109, 111),
(67, 109, 6),
(67, 109, 49),
(67, 109, 54),
(67, 110, 7),
(67, 111, 8),
(67, 111, 31),
(67, 112, 9),
(67, 112, 22),
(67, 113, 10),
(67, 114, 11),
(67, 115, 12),
(67, 116, 13),
(67, 117, 14),
(67, 118, 15),
(67, 119, 17),
(67, 120, 18),
(67, 121, 19),
(67, 121, 50),
(67, 122, 20),
(67, 123, 21),
(67, 124, 23),
(67, 125, 24),
(67, 126, 25),
(67, 127, 26),
(67, 127, 32),
(67, 127, 42),
(67, 127, 52),
(67, 128, 27),
(67, 129, 28),
(67, 130, 29),
(67, 131, 30),
(67, 132, 33),
(67, 133, 34),
(67, 134, 35),
(67, 135, 36),
(67, 136, 38),
(67, 137, 43),
(67, 138, 44),
(67, 139, 45),
(67, 140, 46),
(67, 141, 47),
(67, 142, 48),
(67, 143, 51),
(67, 144, 53),
(67, 145, 55),
(67, 146, 56),
(67, 147, 57),
(67, 148, 58),
(67, 149, 59),
(67, 150, 60),
(67, 151, 61),
(67, 152, 62),
(67, 153, 63),
(67, 154, 64),
(67, 155, 65),
(67, 156, 66),
(67, 157, 67),
(67, 158, 68),
(67, 159, 69),
(67, 160, 70),
(67, 161, 71),
(67, 162, 72),
(67, 163, 73),
(67, 164, 74),
(67, 165, 75),
(67, 166, 76),
(67, 167, 77),
(27, 168, 31),
(27, 168, 52),
(27, 168, 68),
(27, 168, 79),
(27, 168, 82),
(27, 168, 112),
(27, 168, 115),
(67, 168, 78),
(26, 169, 0),
(27, 169, 32),
(27, 169, 113),
(26, 170, 1),
(27, 170, 33),
(27, 170, 45),
(27, 170, 66),
(27, 170, 114),
(27, 171, 0),
(27, 172, 1),
(27, 173, 2),
(27, 173, 21),
(27, 173, 26),
(27, 174, 3),
(27, 175, 4),
(27, 176, 5),
(27, 177, 6),
(27, 178, 7),
(27, 179, 8),
(27, 180, 9),
(27, 180, 93),
(27, 181, 10),
(27, 181, 83),
(27, 182, 11),
(27, 183, 12),
(27, 184, 13),
(27, 185, 14),
(27, 185, 75),
(27, 186, 15),
(27, 187, 16),
(27, 188, 17),
(27, 189, 18),
(27, 190, 19),
(27, 191, 20),
(27, 192, 22),
(27, 192, 39),
(27, 192, 125),
(27, 193, 23),
(27, 194, 24),
(27, 195, 25),
(27, 196, 27),
(27, 196, 98),
(27, 197, 28),
(27, 198, 29),
(27, 199, 34),
(27, 200, 35),
(27, 201, 36),
(27, 202, 37),
(27, 203, 38),
(27, 204, 40),
(27, 205, 41),
(27, 205, 104),
(27, 206, 42),
(27, 207, 43),
(27, 208, 44),
(27, 208, 102),
(27, 209, 46),
(27, 210, 47),
(27, 211, 48),
(27, 212, 49),
(27, 213, 50),
(27, 214, 53),
(27, 214, 61),
(27, 215, 54),
(27, 216, 55),
(27, 217, 56),
(27, 218, 57),
(27, 219, 58),
(27, 220, 59),
(27, 221, 60),
(27, 222, 62),
(27, 223, 63),
(27, 224, 64),
(27, 225, 65),
(27, 226, 67),
(27, 227, 69),
(27, 228, 70),
(27, 229, 71),
(27, 230, 72),
(27, 231, 73),
(27, 232, 74),
(27, 233, 76),
(27, 234, 77),
(27, 235, 78),
(27, 235, 81),
(27, 236, 80),
(27, 237, 84),
(27, 238, 85),
(27, 239, 86),
(27, 240, 87),
(27, 241, 88),
(27, 242, 89),
(27, 243, 90),
(27, 244, 91),
(27, 245, 92),
(27, 246, 94),
(27, 247, 95),
(27, 248, 96),
(27, 249, 97),
(27, 250, 99),
(27, 250, 123),
(27, 251, 101),
(27, 252, 103),
(27, 253, 105),
(27, 254, 106),
(27, 255, 107),
(27, 256, 108),
(27, 257, 109),
(27, 258, 110),
(27, 259, 116),
(27, 260, 117),
(27, 261, 118),
(27, 262, 119),
(27, 263, 120),
(27, 264, 121),
(27, 265, 122),
(27, 266, 124),
(58, 267, 0),
(59, 268, 0),
(59, 269, 1),
(59, 270, 2),
(59, 270, 10),
(59, 270, 19),
(59, 271, 3),
(59, 271, 20),
(59, 272, 4),
(59, 272, 33),
(59, 273, 5),
(59, 273, 34),
(59, 274, 6),
(59, 275, 7),
(59, 276, 8),
(59, 277, 9),
(59, 278, 11),
(59, 279, 12),
(59, 280, 13),
(59, 281, 14),
(59, 282, 15),
(59, 283, 16),
(59, 284, 17),
(59, 285, 18),
(59, 286, 21),
(59, 287, 22),
(59, 288, 23),
(59, 289, 24),
(59, 290, 25),
(59, 291, 26),
(59, 292, 28),
(59, 293, 29),
(59, 294, 30),
(59, 295, 32);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submission_settings`
--

CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `temporary_files`
--

CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `temporary_files`
--

INSERT INTO `temporary_files` (`file_id`, `user_id`, `file_name`, `file_type`, `file_size`, `original_file_name`, `date_uploaded`) VALUES
(3, 1, 'jpgF9E6.tmp', 'image/jpeg', 20640, 'submission_3_3_coverImage.jpg', '2023-10-19 10:05:43'),
(5, 1, 'jpg88BB.tmp', 'image/jpeg', 30063, 'submission_7_7_coverImage.jpg', '2023-10-19 10:43:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `usage_stats_temporary_records`
--

CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `gossip`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'hasnaz', '$2y$10$iaXZ8ft0wQ1HYa5olEYUY.vUD9VO8jHXwPzx7aXXBz2KuIijxTHgO', 'zahidahasna002@gmail.com', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-10-19 09:07:02', NULL, '2023-11-28 03:28:18', 0, NULL, NULL, 0, NULL, 1),
(2, 'nanas', '$2y$10$WJAOSE1XsjsMnqc4Qfdjpu7.SE6ydI15F6hZUCYr2V.7QYx3eA5ny', 'nanas@gmail.com', '', '', '', NULL, 'ID', '', NULL, NULL, '2023-10-19 09:30:58', NULL, '2023-10-19 09:30:58', 1, 0, NULL, 0, NULL, 1),
(3, 'nanaz', '$2y$10$m3p.JWeYogL2LuvxDzUf.Oo8V/u0dBckD7aRTA04BK56RomPgRMLS', 'nanaz@gmail.com', '', '', '', NULL, 'ID', '', NULL, NULL, '2023-10-20 09:02:39', NULL, '2023-10-20 09:02:39', 1, 0, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_groups`
--

CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`, `permit_metadata_edit`) VALUES
(1, 0, 1, 1, 0, 0, 0),
(2, 1, 16, 1, 0, 0, 1),
(3, 1, 16, 1, 0, 0, 1),
(4, 1, 16, 1, 0, 0, 1),
(5, 1, 17, 1, 0, 0, 1),
(6, 1, 4097, 1, 0, 0, 0),
(7, 1, 4097, 1, 0, 0, 0),
(8, 1, 4097, 1, 0, 0, 0),
(9, 1, 4097, 1, 0, 0, 0),
(10, 1, 4097, 1, 0, 0, 0),
(11, 1, 4097, 1, 0, 0, 0),
(12, 1, 4097, 1, 0, 0, 0),
(13, 1, 65536, 1, 0, 1, 0),
(14, 1, 65536, 1, 0, 0, 0),
(15, 1, 65536, 1, 0, 1, 0),
(16, 1, 65536, 1, 0, 0, 0),
(17, 1, 4096, 1, 0, 0, 0),
(18, 1, 4096, 1, 0, 1, 0),
(19, 1, 1048576, 1, 0, 1, 0),
(20, 2, 16, 1, 0, 0, 1),
(21, 2, 16, 1, 0, 0, 1),
(22, 2, 16, 1, 0, 0, 1),
(23, 2, 17, 1, 0, 0, 1),
(24, 2, 4097, 1, 0, 0, 0),
(25, 2, 4097, 1, 0, 0, 0),
(26, 2, 4097, 1, 0, 0, 0),
(27, 2, 4097, 1, 0, 0, 0),
(28, 2, 4097, 1, 0, 0, 0),
(29, 2, 4097, 1, 0, 0, 0),
(30, 2, 4097, 1, 0, 0, 0),
(31, 2, 65536, 1, 0, 1, 0),
(32, 2, 65536, 1, 0, 0, 0),
(33, 2, 65536, 1, 0, 1, 0),
(34, 2, 65536, 1, 0, 0, 0),
(35, 2, 4096, 1, 0, 0, 0),
(36, 2, 4096, 1, 0, 1, 0),
(37, 2, 1048576, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_group_settings`
--

CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user_group_settings`
--

INSERT INTO `user_group_settings` (`user_group_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Site Admin', 'string'),
(1, 'id_ID', 'name', '##default.groups.name.siteAdmin##', 'string'),
(2, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(2, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(2, 'en_US', 'abbrev', 'PM', 'string'),
(2, 'en_US', 'name', 'Press manager', 'string'),
(2, 'id_ID', 'abbrev', '##default.groups.abbrev.manager##', 'string'),
(2, 'id_ID', 'name', '##default.groups.name.manager##', 'string'),
(3, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(3, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(3, 'en_US', 'abbrev', 'PE', 'string'),
(3, 'en_US', 'name', 'Press editor', 'string'),
(3, 'id_ID', 'abbrev', '##default.groups.abbrev.editor##', 'string'),
(3, 'id_ID', 'name', '##default.groups.name.editor##', 'string'),
(4, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(4, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(4, 'en_US', 'abbrev', 'ProdE', 'string'),
(4, 'en_US', 'name', 'Production editor', 'string'),
(4, 'id_ID', 'abbrev', 'ProdE', 'string'),
(4, 'id_ID', 'name', 'Editor produksi', 'string'),
(5, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(5, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(5, 'en_US', 'abbrev', 'AcqE', 'string'),
(5, 'en_US', 'name', 'Series editor', 'string'),
(5, 'id_ID', 'abbrev', '##default.groups.abbrev.sectionEditor##', 'string'),
(5, 'id_ID', 'name', '##default.groups.name.sectionEditor##', 'string'),
(6, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(6, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(6, 'en_US', 'abbrev', 'CE', 'string'),
(6, 'en_US', 'name', 'Copyeditor', 'string'),
(6, 'id_ID', 'abbrev', 'CE', 'string'),
(6, 'id_ID', 'name', 'Copyeditor', 'string'),
(7, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(7, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(7, 'en_US', 'abbrev', 'Design', 'string'),
(7, 'en_US', 'name', 'Designer', 'string'),
(7, 'id_ID', 'abbrev', 'Desain', 'string'),
(7, 'id_ID', 'name', 'Desainer', 'string'),
(8, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(8, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(8, 'en_US', 'abbrev', 'FC', 'string'),
(8, 'en_US', 'name', 'Funding coordinator', 'string'),
(8, 'id_ID', 'abbrev', 'FC', 'string'),
(8, 'id_ID', 'name', 'Koordinator pendanaan', 'string'),
(9, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(9, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(9, 'en_US', 'abbrev', 'IND', 'string'),
(9, 'en_US', 'name', 'Indexer', 'string'),
(9, 'id_ID', 'abbrev', 'IND', 'string'),
(9, 'id_ID', 'name', 'Pengindeks', 'string'),
(10, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(10, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(10, 'en_US', 'abbrev', 'LE', 'string'),
(10, 'en_US', 'name', 'Layout Editor', 'string'),
(10, 'id_ID', 'abbrev', 'LE', 'string'),
(10, 'id_ID', 'name', 'Editor Tata Letak', 'string'),
(11, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(11, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(11, 'en_US', 'abbrev', 'MS', 'string'),
(11, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(11, 'id_ID', 'abbrev', 'MS', 'string'),
(11, 'id_ID', 'name', 'Koordinator penjualan dan pemasaran', 'string'),
(12, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(12, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(12, 'en_US', 'abbrev', 'PR', 'string'),
(12, 'en_US', 'name', 'Proofreader', 'string'),
(12, 'id_ID', 'abbrev', 'PR', 'string'),
(12, 'id_ID', 'name', 'Proofreader', 'string'),
(13, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(13, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(13, 'en_US', 'abbrev', 'AU', 'string'),
(13, 'en_US', 'name', 'Author', 'string'),
(13, 'id_ID', 'abbrev', 'AU', 'string'),
(13, 'id_ID', 'name', 'Penulis', 'string'),
(14, '', 'abbrevLocaleKey', 'default.groups.abbrev.volumeEditor', 'string'),
(14, '', 'nameLocaleKey', 'default.groups.name.volumeEditor', 'string'),
(14, 'en_US', 'abbrev', 'VE', 'string'),
(14, 'en_US', 'name', 'Volume editor', 'string'),
(14, 'id_ID', 'abbrev', '##default.groups.abbrev.volumeEditor##', 'string'),
(14, 'id_ID', 'name', '##default.groups.name.volumeEditor##', 'string'),
(15, '', 'abbrevLocaleKey', 'default.groups.abbrev.chapterAuthor', 'string'),
(15, '', 'nameLocaleKey', 'default.groups.name.chapterAuthor', 'string'),
(15, 'en_US', 'abbrev', 'CA', 'string'),
(15, 'en_US', 'name', 'Chapter Author', 'string'),
(15, 'id_ID', 'abbrev', '##default.groups.abbrev.chapterAuthor##', 'string'),
(15, 'id_ID', 'name', '##default.groups.name.chapterAuthor##', 'string'),
(16, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(16, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(16, 'en_US', 'abbrev', 'Trans', 'string'),
(16, 'en_US', 'name', 'Translator', 'string'),
(16, 'id_ID', 'abbrev', 'Trans', 'string'),
(16, 'id_ID', 'name', 'Penerjemah', 'string'),
(17, '', 'abbrevLocaleKey', 'default.groups.abbrev.internalReviewer', 'string'),
(17, '', 'nameLocaleKey', 'default.groups.name.internalReviewer', 'string'),
(17, 'en_US', 'abbrev', 'IR', 'string'),
(17, 'en_US', 'name', 'Internal Reviewer', 'string'),
(17, 'id_ID', 'abbrev', 'IR', 'string'),
(17, 'id_ID', 'name', 'Peninjau Internal', 'string'),
(18, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(18, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(18, 'en_US', 'abbrev', 'ER', 'string'),
(18, 'en_US', 'name', 'External Reviewer', 'string'),
(18, 'id_ID', 'abbrev', '##default.groups.abbrev.externalReviewer##', 'string'),
(18, 'id_ID', 'name', '##default.groups.name.externalReviewer##', 'string'),
(19, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(19, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(19, 'en_US', 'abbrev', 'Read', 'string'),
(19, 'en_US', 'name', 'Reader', 'string'),
(19, 'id_ID', 'abbrev', 'Baca', 'string'),
(19, 'id_ID', 'name', 'Pembaca', 'string'),
(20, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(20, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(20, 'en_US', 'abbrev', 'PM', 'string'),
(20, 'en_US', 'name', 'Press manager', 'string'),
(20, 'id_ID', 'abbrev', '##default.groups.abbrev.manager##', 'string'),
(20, 'id_ID', 'name', '##default.groups.name.manager##', 'string'),
(21, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(21, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(21, 'en_US', 'abbrev', 'PE', 'string'),
(21, 'en_US', 'name', 'Press editor', 'string'),
(21, 'id_ID', 'abbrev', '##default.groups.abbrev.editor##', 'string'),
(21, 'id_ID', 'name', '##default.groups.name.editor##', 'string'),
(22, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(22, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(22, 'en_US', 'abbrev', 'ProdE', 'string'),
(22, 'en_US', 'name', 'Production editor', 'string'),
(22, 'id_ID', 'abbrev', 'ProdE', 'string'),
(22, 'id_ID', 'name', 'Editor produksi', 'string'),
(23, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(23, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(23, 'en_US', 'abbrev', 'AcqE', 'string'),
(23, 'en_US', 'name', 'Series editor', 'string'),
(23, 'id_ID', 'abbrev', '##default.groups.abbrev.sectionEditor##', 'string'),
(23, 'id_ID', 'name', '##default.groups.name.sectionEditor##', 'string'),
(24, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(24, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(24, 'en_US', 'abbrev', 'CE', 'string'),
(24, 'en_US', 'name', 'Copyeditor', 'string'),
(24, 'id_ID', 'abbrev', 'CE', 'string'),
(24, 'id_ID', 'name', 'Copyeditor', 'string'),
(25, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(25, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(25, 'en_US', 'abbrev', 'Design', 'string'),
(25, 'en_US', 'name', 'Designer', 'string'),
(25, 'id_ID', 'abbrev', 'Desain', 'string'),
(25, 'id_ID', 'name', 'Desainer', 'string'),
(26, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(26, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(26, 'en_US', 'abbrev', 'FC', 'string'),
(26, 'en_US', 'name', 'Funding coordinator', 'string'),
(26, 'id_ID', 'abbrev', 'FC', 'string'),
(26, 'id_ID', 'name', 'Koordinator pendanaan', 'string'),
(27, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(27, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(27, 'en_US', 'abbrev', 'IND', 'string'),
(27, 'en_US', 'name', 'Indexer', 'string'),
(27, 'id_ID', 'abbrev', 'IND', 'string'),
(27, 'id_ID', 'name', 'Pengindeks', 'string'),
(28, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(28, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(28, 'en_US', 'abbrev', 'LE', 'string'),
(28, 'en_US', 'name', 'Layout Editor', 'string'),
(28, 'id_ID', 'abbrev', 'LE', 'string'),
(28, 'id_ID', 'name', 'Editor Tata Letak', 'string'),
(29, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(29, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(29, 'en_US', 'abbrev', 'MS', 'string'),
(29, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(29, 'id_ID', 'abbrev', 'MS', 'string'),
(29, 'id_ID', 'name', 'Koordinator penjualan dan pemasaran', 'string'),
(30, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(30, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(30, 'en_US', 'abbrev', 'PR', 'string'),
(30, 'en_US', 'name', 'Proofreader', 'string'),
(30, 'id_ID', 'abbrev', 'PR', 'string'),
(30, 'id_ID', 'name', 'Proofreader', 'string'),
(31, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(31, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(31, 'en_US', 'abbrev', 'AU', 'string'),
(31, 'en_US', 'name', 'Author', 'string'),
(31, 'id_ID', 'abbrev', 'AU', 'string'),
(31, 'id_ID', 'name', 'Penulis', 'string'),
(32, '', 'abbrevLocaleKey', 'default.groups.abbrev.volumeEditor', 'string'),
(32, '', 'nameLocaleKey', 'default.groups.name.volumeEditor', 'string'),
(32, 'en_US', 'abbrev', 'VE', 'string'),
(32, 'en_US', 'name', 'Volume editor', 'string'),
(32, 'id_ID', 'abbrev', '##default.groups.abbrev.volumeEditor##', 'string'),
(32, 'id_ID', 'name', '##default.groups.name.volumeEditor##', 'string'),
(33, '', 'abbrevLocaleKey', 'default.groups.abbrev.chapterAuthor', 'string'),
(33, '', 'nameLocaleKey', 'default.groups.name.chapterAuthor', 'string'),
(33, 'en_US', 'abbrev', 'CA', 'string'),
(33, 'en_US', 'name', 'Chapter Author', 'string'),
(33, 'id_ID', 'abbrev', '##default.groups.abbrev.chapterAuthor##', 'string'),
(33, 'id_ID', 'name', '##default.groups.name.chapterAuthor##', 'string'),
(34, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(34, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(34, 'en_US', 'abbrev', 'Trans', 'string'),
(34, 'en_US', 'name', 'Translator', 'string'),
(34, 'id_ID', 'abbrev', 'Trans', 'string'),
(34, 'id_ID', 'name', 'Penerjemah', 'string'),
(35, '', 'abbrevLocaleKey', 'default.groups.abbrev.internalReviewer', 'string'),
(35, '', 'nameLocaleKey', 'default.groups.name.internalReviewer', 'string'),
(35, 'en_US', 'abbrev', 'IR', 'string'),
(35, 'en_US', 'name', 'Internal Reviewer', 'string'),
(35, 'id_ID', 'abbrev', 'IR', 'string'),
(35, 'id_ID', 'name', 'Peninjau Internal', 'string'),
(36, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(36, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(36, 'en_US', 'abbrev', 'ER', 'string'),
(36, 'en_US', 'name', 'External Reviewer', 'string'),
(36, 'id_ID', 'abbrev', '##default.groups.abbrev.externalReviewer##', 'string'),
(36, 'id_ID', 'name', '##default.groups.name.externalReviewer##', 'string'),
(37, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(37, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(37, 'en_US', 'abbrev', 'Read', 'string'),
(37, 'en_US', 'name', 'Reader', 'string'),
(37, 'id_ID', 'abbrev', 'Baca', 'string'),
(37, 'id_ID', 'name', 'Pembaca', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_group_stage`
--

CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user_group_stage`
--

INSERT INTO `user_group_stage` (`context_id`, `user_group_id`, `stage_id`) VALUES
(1, 3, 1),
(1, 3, 2),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 4, 4),
(1, 4, 5),
(1, 5, 1),
(1, 5, 2),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 6, 4),
(1, 7, 5),
(1, 8, 1),
(1, 8, 2),
(1, 8, 3),
(1, 9, 5),
(1, 10, 5),
(1, 11, 4),
(1, 12, 5),
(1, 13, 1),
(1, 13, 2),
(1, 13, 3),
(1, 13, 4),
(1, 13, 5),
(1, 14, 1),
(1, 14, 2),
(1, 14, 3),
(1, 14, 4),
(1, 14, 5),
(1, 15, 4),
(1, 15, 5),
(1, 16, 1),
(1, 16, 2),
(1, 16, 3),
(1, 16, 4),
(1, 16, 5),
(1, 17, 2),
(1, 18, 3),
(2, 21, 1),
(2, 21, 2),
(2, 21, 3),
(2, 21, 4),
(2, 21, 5),
(2, 22, 4),
(2, 22, 5),
(2, 23, 1),
(2, 23, 2),
(2, 23, 3),
(2, 23, 4),
(2, 23, 5),
(2, 24, 4),
(2, 25, 5),
(2, 26, 1),
(2, 26, 2),
(2, 26, 3),
(2, 27, 5),
(2, 28, 5),
(2, 29, 4),
(2, 30, 5),
(2, 31, 1),
(2, 31, 2),
(2, 31, 3),
(2, 31, 4),
(2, 31, 5),
(2, 32, 1),
(2, 32, 2),
(2, 32, 3),
(2, 32, 4),
(2, 32, 5),
(2, 33, 4),
(2, 33, 5),
(2, 34, 1),
(2, 34, 2),
(2, 34, 3),
(2, 34, 4),
(2, 34, 5),
(2, 35, 2),
(2, 36, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_interests`
--

CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_settings`
--

CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user_settings`
--

INSERT INTO `user_settings` (`user_id`, `locale`, `setting_name`, `assoc_type`, `assoc_id`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'familyName', 0, 0, 'hasnaz', 'string'),
(1, 'en_US', 'givenName', 0, 0, 'hasnaz', 'string'),
(2, '', 'orcid', 0, 0, '', 'string'),
(2, 'en_US', 'affiliation', 0, 0, '', 'string'),
(2, 'en_US', 'biography', 0, 0, '', 'string'),
(2, 'en_US', 'familyName', 0, 0, '', 'string'),
(2, 'en_US', 'givenName', 0, 0, 'nanas', 'string'),
(2, 'en_US', 'preferredPublicName', 0, 0, '', 'string'),
(2, 'en_US', 'signature', 0, 0, '', 'string'),
(3, '', 'orcid', 0, 0, '', 'string'),
(3, 'en_US', 'affiliation', 0, 0, '', 'string'),
(3, 'en_US', 'biography', 0, 0, '', 'string'),
(3, 'en_US', 'familyName', 0, 0, '', 'string'),
(3, 'en_US', 'givenName', 0, 0, 'nanaz', 'string'),
(3, 'en_US', 'preferredPublicName', 0, 0, '', 'string'),
(3, 'en_US', 'signature', 0, 0, '', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_user_groups`
--

CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user_user_groups`
--

INSERT INTO `user_user_groups` (`user_group_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 1),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `versions`
--

CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.blocks', 'browse', 'BrowseBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'acron', '', 0, 1),
(1, 2, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'htmlMonographFile', 'HtmlMonographFilePlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
(1, 2, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'usageEvent', '', 0, 1),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'usageStats', 'UsageStatsPlugin', 0, 1),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
(1, 0, 0, 0, '2023-10-19 09:07:04', 1, 'plugins.importexport', 'csv', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.importexport', 'native', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.importexport', 'onix30', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.importexport', 'users', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(1, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.reports', 'monographReport', '', 0, 0),
(2, 0, 0, 0, '2023-10-19 09:07:05', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
(3, 3, 0, 15, '2023-10-19 09:06:47', 1, 'core', 'omp', '', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `access_keys`
--
ALTER TABLE `access_keys`
  ADD PRIMARY KEY (`access_key_id`),
  ADD KEY `access_keys_hash` (`key_hash`,`user_id`,`context`);

--
-- Indeks untuk tabel `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `announcements_assoc` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  ADD KEY `announcement_settings_announcement_id` (`announcement_id`);

--
-- Indeks untuk tabel `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `announcement_type_settings_type_id` (`type_id`);

--
-- Indeks untuk tabel `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `authors_publication_id` (`publication_id`);

--
-- Indeks untuk tabel `author_settings`
--
ALTER TABLE `author_settings`
  ADD UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  ADD KEY `author_settings_author_id` (`author_id`);

--
-- Indeks untuk tabel `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`auth_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_path` (`context_id`,`path`),
  ADD KEY `category_context_id` (`context_id`,`parent_id`);

--
-- Indeks untuk tabel `category_settings`
--
ALTER TABLE `category_settings`
  ADD UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`);

--
-- Indeks untuk tabel `citations`
--
ALTER TABLE `citations`
  ADD PRIMARY KEY (`citation_id`),
  ADD UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  ADD KEY `citations_publication` (`publication_id`);

--
-- Indeks untuk tabel `citation_settings`
--
ALTER TABLE `citation_settings`
  ADD UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  ADD KEY `citation_settings_citation_id` (`citation_id`);

--
-- Indeks untuk tabel `completed_payments`
--
ALTER TABLE `completed_payments`
  ADD PRIMARY KEY (`completed_payment_id`);

--
-- Indeks untuk tabel `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  ADD PRIMARY KEY (`controlled_vocab_id`),
  ADD UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD PRIMARY KEY (`controlled_vocab_entry_id`),
  ADD KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`);

--
-- Indeks untuk tabel `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  ADD KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`);

--
-- Indeks untuk tabel `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `data_object_tombstones_data_object_id` (`data_object_id`);

--
-- Indeks untuk tabel `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`);

--
-- Indeks untuk tabel `data_object_tombstone_settings`
--
ALTER TABLE `data_object_tombstone_settings`
  ADD UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  ADD KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`);

--
-- Indeks untuk tabel `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD PRIMARY KEY (`edit_decision_id`),
  ADD KEY `edit_decisions_submission_id` (`submission_id`),
  ADD KEY `edit_decisions_editor_id` (`editor_id`);

--
-- Indeks untuk tabel `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `email_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `email_log_users`
--
ALTER TABLE `email_log_users`
  ADD UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`);

--
-- Indeks untuk tabel `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`);

--
-- Indeks untuk tabel `email_templates_default`
--
ALTER TABLE `email_templates_default`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `email_templates_default_email_key` (`email_key`);

--
-- Indeks untuk tabel `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  ADD UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`);

--
-- Indeks untuk tabel `email_templates_settings`
--
ALTER TABLE `email_templates_settings`
  ADD UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  ADD KEY `email_settings_email_id` (`email_id`);

--
-- Indeks untuk tabel `event_log`
--
ALTER TABLE `event_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `event_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `event_log_settings`
--
ALTER TABLE `event_log_settings`
  ADD UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  ADD KEY `event_log_settings_log_id` (`log_id`),
  ADD KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indeks untuk tabel `features`
--
ALTER TABLE `features`
  ADD UNIQUE KEY `press_features_pkey` (`assoc_type`,`assoc_id`,`submission_id`);

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indeks untuk tabel `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indeks untuk tabel `filter_groups`
--
ALTER TABLE `filter_groups`
  ADD PRIMARY KEY (`filter_group_id`),
  ADD UNIQUE KEY `filter_groups_symbolic` (`symbolic`);

--
-- Indeks untuk tabel `filter_settings`
--
ALTER TABLE `filter_settings`
  ADD UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  ADD KEY `filter_settings_id` (`filter_id`);

--
-- Indeks untuk tabel `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indeks untuk tabel `genre_settings`
--
ALTER TABLE `genre_settings`
  ADD UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  ADD KEY `genre_settings_genre_id` (`genre_id`);

--
-- Indeks untuk tabel `identification_codes`
--
ALTER TABLE `identification_codes`
  ADD PRIMARY KEY (`identification_code_id`),
  ADD KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`);

--
-- Indeks untuk tabel `item_views`
--
ALTER TABLE `item_views`
  ADD UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indeks untuk tabel `library_files`
--
ALTER TABLE `library_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `library_files_context_id` (`context_id`),
  ADD KEY `library_files_submission_id` (`submission_id`);

--
-- Indeks untuk tabel `library_file_settings`
--
ALTER TABLE `library_file_settings`
  ADD UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  ADD KEY `library_file_settings_id` (`file_id`);

--
-- Indeks untuk tabel `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`market_id`),
  ADD KEY `format_markets_pkey` (`market_id`,`publication_format_id`);

--
-- Indeks untuk tabel `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  ADD PRIMARY KEY (`metadata_description_id`),
  ADD KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `metadata_description_settings`
--
ALTER TABLE `metadata_description_settings`
  ADD UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  ADD KEY `metadata_description_settings_id` (`metadata_description_id`);

--
-- Indeks untuk tabel `metrics`
--
ALTER TABLE `metrics`
  ADD KEY `metrics_load_id` (`load_id`),
  ADD KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  ADD KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  ADD KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `navigation_menus`
--
ALTER TABLE `navigation_menus`
  ADD PRIMARY KEY (`navigation_menu_id`);

--
-- Indeks untuk tabel `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  ADD PRIMARY KEY (`navigation_menu_item_id`);

--
-- Indeks untuk tabel `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  ADD PRIMARY KEY (`navigation_menu_item_assignment_id`);

--
-- Indeks untuk tabel `navigation_menu_item_assignment_settings`
--
ALTER TABLE `navigation_menu_item_assignment_settings`
  ADD UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  ADD KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`);

--
-- Indeks untuk tabel `navigation_menu_item_settings`
--
ALTER TABLE `navigation_menu_item_settings`
  ADD UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  ADD KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`);

--
-- Indeks untuk tabel `new_releases`
--
ALTER TABLE `new_releases`
  ADD UNIQUE KEY `new_releases_pkey` (`assoc_type`,`assoc_id`,`submission_id`);

--
-- Indeks untuk tabel `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `notes_assoc` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  ADD KEY `notifications_context_id` (`context_id`,`level`),
  ADD KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  ADD KEY `notifications_user_id_level` (`user_id`,`level`);

--
-- Indeks untuk tabel `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  ADD PRIMARY KEY (`notification_mail_list_id`),
  ADD UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`);

--
-- Indeks untuk tabel `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`);

--
-- Indeks untuk tabel `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indeks untuk tabel `oai_resumption_tokens`
--
ALTER TABLE `oai_resumption_tokens`
  ADD UNIQUE KEY `oai_resumption_tokens_pkey` (`token`);

--
-- Indeks untuk tabel `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  ADD KEY `plugin_settings_plugin_name` (`plugin_name`);

--
-- Indeks untuk tabel `presses`
--
ALTER TABLE `presses`
  ADD PRIMARY KEY (`press_id`),
  ADD UNIQUE KEY `press_path` (`path`);

--
-- Indeks untuk tabel `press_settings`
--
ALTER TABLE `press_settings`
  ADD UNIQUE KEY `press_settings_pkey` (`press_id`,`locale`,`setting_name`),
  ADD KEY `press_settings_press_id` (`press_id`);

--
-- Indeks untuk tabel `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `publications_submission_id` (`submission_id`),
  ADD KEY `publications_section_id` (`series_id`);

--
-- Indeks untuk tabel `publication_categories`
--
ALTER TABLE `publication_categories`
  ADD UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`);

--
-- Indeks untuk tabel `publication_dates`
--
ALTER TABLE `publication_dates`
  ADD PRIMARY KEY (`publication_date_id`),
  ADD KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`);

--
-- Indeks untuk tabel `publication_formats`
--
ALTER TABLE `publication_formats`
  ADD PRIMARY KEY (`publication_format_id`),
  ADD KEY `publication_format_submission_id` (`submission_id`);

--
-- Indeks untuk tabel `publication_format_settings`
--
ALTER TABLE `publication_format_settings`
  ADD UNIQUE KEY `publication_format_settings_pkey` (`publication_format_id`,`locale`,`setting_name`),
  ADD KEY `publication_format_id_key` (`publication_format_id`);

--
-- Indeks untuk tabel `publication_settings`
--
ALTER TABLE `publication_settings`
  ADD UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  ADD KEY `publication_settings_publication_id` (`publication_id`),
  ADD KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indeks untuk tabel `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `queries_assoc_id` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `query_participants`
--
ALTER TABLE `query_participants`
  ADD UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`);

--
-- Indeks untuk tabel `queued_payments`
--
ALTER TABLE `queued_payments`
  ADD PRIMARY KEY (`queued_payment_id`);

--
-- Indeks untuk tabel `representatives`
--
ALTER TABLE `representatives`
  ADD PRIMARY KEY (`representative_id`),
  ADD KEY `format_representatives_pkey` (`representative_id`,`submission_id`);

--
-- Indeks untuk tabel `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_assignments_submission_id` (`submission_id`),
  ADD KEY `review_assignments_reviewer_id` (`reviewer_id`),
  ADD KEY `review_assignments_form_id` (`review_form_id`),
  ADD KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`);

--
-- Indeks untuk tabel `review_files`
--
ALTER TABLE `review_files`
  ADD UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  ADD KEY `review_files_review_id` (`review_id`),
  ADD KEY `review_files_submission_file_id_foreign` (`submission_file_id`);

--
-- Indeks untuk tabel `review_forms`
--
ALTER TABLE `review_forms`
  ADD PRIMARY KEY (`review_form_id`);

--
-- Indeks untuk tabel `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD PRIMARY KEY (`review_form_element_id`),
  ADD KEY `review_form_elements_review_form_id` (`review_form_id`);

--
-- Indeks untuk tabel `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  ADD KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`);

--
-- Indeks untuk tabel `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`);

--
-- Indeks untuk tabel `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  ADD KEY `review_form_settings_review_form_id` (`review_form_id`);

--
-- Indeks untuk tabel `review_rounds`
--
ALTER TABLE `review_rounds`
  ADD PRIMARY KEY (`review_round_id`),
  ADD UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  ADD KEY `review_rounds_submission_id` (`submission_id`);

--
-- Indeks untuk tabel `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  ADD KEY `review_round_files_submission_id` (`submission_id`),
  ADD KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`);

--
-- Indeks untuk tabel `sales_rights`
--
ALTER TABLE `sales_rights`
  ADD PRIMARY KEY (`sales_rights_id`),
  ADD KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`);

--
-- Indeks untuk tabel `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  ADD UNIQUE KEY `scheduled_tasks_pkey` (`class_name`);

--
-- Indeks untuk tabel `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`series_id`),
  ADD UNIQUE KEY `series_path` (`press_id`,`path`),
  ADD KEY `series_press_id` (`press_id`);

--
-- Indeks untuk tabel `series_categories`
--
ALTER TABLE `series_categories`
  ADD UNIQUE KEY `series_categories_id` (`series_id`,`category_id`);

--
-- Indeks untuk tabel `series_settings`
--
ALTER TABLE `series_settings`
  ADD UNIQUE KEY `series_settings_pkey` (`series_id`,`locale`,`setting_name`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_pkey` (`session_id`),
  ADD KEY `sessions_user_id` (`user_id`);

--
-- Indeks untuk tabel `site_settings`
--
ALTER TABLE `site_settings`
  ADD UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`);

--
-- Indeks untuk tabel `spotlights`
--
ALTER TABLE `spotlights`
  ADD PRIMARY KEY (`spotlight_id`),
  ADD KEY `spotlights_assoc` (`assoc_type`,`assoc_id`);

--
-- Indeks untuk tabel `spotlight_settings`
--
ALTER TABLE `spotlight_settings`
  ADD UNIQUE KEY `spotlight_settings_pkey` (`spotlight_id`,`locale`,`setting_name`),
  ADD KEY `spotlight_settings_id` (`spotlight_id`);

--
-- Indeks untuk tabel `stage_assignments`
--
ALTER TABLE `stage_assignments`
  ADD PRIMARY KEY (`stage_assignment_id`),
  ADD UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  ADD KEY `stage_assignments_submission_id` (`submission_id`),
  ADD KEY `stage_assignments_user_group_id` (`user_group_id`),
  ADD KEY `stage_assignments_user_id` (`user_id`);

--
-- Indeks untuk tabel `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`static_page_id`);

--
-- Indeks untuk tabel `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  ADD KEY `static_page_settings_static_page_id` (`static_page_id`);

--
-- Indeks untuk tabel `subeditor_submission_group`
--
ALTER TABLE `subeditor_submission_group`
  ADD UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  ADD KEY `section_editors_context_id` (`context_id`),
  ADD KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  ADD KEY `subeditor_submission_group_user_id` (`user_id`);

--
-- Indeks untuk tabel `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `submissions_context_id` (`context_id`),
  ADD KEY `submissions_publication_id` (`current_publication_id`);

--
-- Indeks untuk tabel `submission_chapters`
--
ALTER TABLE `submission_chapters`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `chapters_chapter_id` (`chapter_id`),
  ADD KEY `chapters_publication_id` (`publication_id`);

--
-- Indeks untuk tabel `submission_chapter_authors`
--
ALTER TABLE `submission_chapter_authors`
  ADD UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`);

--
-- Indeks untuk tabel `submission_chapter_settings`
--
ALTER TABLE `submission_chapter_settings`
  ADD UNIQUE KEY `submission_chapter_settings_pkey` (`chapter_id`,`locale`,`setting_name`),
  ADD KEY `submission_chapter_settings_chapter_id` (`chapter_id`);

--
-- Indeks untuk tabel `submission_comments`
--
ALTER TABLE `submission_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `submission_comments_submission_id` (`submission_id`);

--
-- Indeks untuk tabel `submission_files`
--
ALTER TABLE `submission_files`
  ADD PRIMARY KEY (`submission_file_id`),
  ADD KEY `submission_files_submission_id` (`submission_id`),
  ADD KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  ADD KEY `submission_files_file_id_foreign` (`file_id`);

--
-- Indeks untuk tabel `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD PRIMARY KEY (`revision_id`),
  ADD KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  ADD KEY `submission_file_revisions_file_id_foreign` (`file_id`);

--
-- Indeks untuk tabel `submission_file_settings`
--
ALTER TABLE `submission_file_settings`
  ADD UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  ADD KEY `submission_file_settings_id` (`submission_file_id`);

--
-- Indeks untuk tabel `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `submission_search_keyword_text` (`keyword_text`);

--
-- Indeks untuk tabel `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `submission_search_object_submission` (`submission_id`);

--
-- Indeks untuk tabel `submission_search_object_keywords`
--
ALTER TABLE `submission_search_object_keywords`
  ADD UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  ADD KEY `submission_search_object_keywords_keyword_id` (`keyword_id`);

--
-- Indeks untuk tabel `submission_settings`
--
ALTER TABLE `submission_settings`
  ADD UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  ADD KEY `submission_settings_submission_id` (`submission_id`);

--
-- Indeks untuk tabel `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `temporary_files_user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username` (`username`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- Indeks untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_groups_context_id` (`context_id`),
  ADD KEY `user_groups_role_id` (`role_id`);

--
-- Indeks untuk tabel `user_group_settings`
--
ALTER TABLE `user_group_settings`
  ADD UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`);

--
-- Indeks untuk tabel `user_group_stage`
--
ALTER TABLE `user_group_stage`
  ADD UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  ADD KEY `user_group_stage_context_id` (`context_id`),
  ADD KEY `user_group_stage_user_group_id` (`user_group_id`),
  ADD KEY `user_group_stage_stage_id` (`stage_id`);

--
-- Indeks untuk tabel `user_interests`
--
ALTER TABLE `user_interests`
  ADD UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`);

--
-- Indeks untuk tabel `user_settings`
--
ALTER TABLE `user_settings`
  ADD UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  ADD KEY `user_settings_user_id` (`user_id`),
  ADD KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`);

--
-- Indeks untuk tabel `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  ADD KEY `user_user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_user_groups_user_id` (`user_id`);

--
-- Indeks untuk tabel `versions`
--
ALTER TABLE `versions`
  ADD UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `access_keys`
--
ALTER TABLE `access_keys`
  MODIFY `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `announcement_types`
--
ALTER TABLE `announcement_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `auth_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `citations`
--
ALTER TABLE `citations`
  MODIFY `citation_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `completed_payments`
--
ALTER TABLE `completed_payments`
  MODIFY `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  MODIFY `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  MODIFY `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `edit_decisions`
--
ALTER TABLE `edit_decisions`
  MODIFY `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `email_log`
--
ALTER TABLE `email_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `email_templates_default`
--
ALTER TABLE `email_templates_default`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `event_log`
--
ALTER TABLE `event_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `filters`
--
ALTER TABLE `filters`
  MODIFY `filter_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `filter_groups`
--
ALTER TABLE `filter_groups`
  MODIFY `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `identification_codes`
--
ALTER TABLE `identification_codes`
  MODIFY `identification_code_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `library_files`
--
ALTER TABLE `library_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `markets`
--
ALTER TABLE `markets`
  MODIFY `market_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  MODIFY `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `navigation_menus`
--
ALTER TABLE `navigation_menus`
  MODIFY `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  MODIFY `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  MODIFY `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT untuk tabel `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  MODIFY `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  MODIFY `setting_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presses`
--
ALTER TABLE `presses`
  MODIFY `press_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `publications`
--
ALTER TABLE `publications`
  MODIFY `publication_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `publication_dates`
--
ALTER TABLE `publication_dates`
  MODIFY `publication_date_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `publication_formats`
--
ALTER TABLE `publication_formats`
  MODIFY `publication_format_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `queries`
--
ALTER TABLE `queries`
  MODIFY `query_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `queued_payments`
--
ALTER TABLE `queued_payments`
  MODIFY `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `representatives`
--
ALTER TABLE `representatives`
  MODIFY `representative_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `review_assignments`
--
ALTER TABLE `review_assignments`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `review_forms`
--
ALTER TABLE `review_forms`
  MODIFY `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `review_form_elements`
--
ALTER TABLE `review_form_elements`
  MODIFY `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `review_rounds`
--
ALTER TABLE `review_rounds`
  MODIFY `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sales_rights`
--
ALTER TABLE `sales_rights`
  MODIFY `sales_rights_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `series`
--
ALTER TABLE `series`
  MODIFY `series_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `spotlights`
--
ALTER TABLE `spotlights`
  MODIFY `spotlight_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `stage_assignments`
--
ALTER TABLE `stage_assignments`
  MODIFY `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `submission_chapters`
--
ALTER TABLE `submission_chapters`
  MODIFY `chapter_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `submission_comments`
--
ALTER TABLE `submission_comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `submission_files`
--
ALTER TABLE `submission_files`
  MODIFY `submission_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  MODIFY `revision_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  MODIFY `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT untuk tabel `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `temporary_files`
--
ALTER TABLE `temporary_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `review_files`
--
ALTER TABLE `review_files`
  ADD CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Ketidakleluasaan untuk tabel `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Ketidakleluasaan untuk tabel `submission_files`
--
ALTER TABLE `submission_files`
  ADD CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`);

--
-- Ketidakleluasaan untuk tabel `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  ADD CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
