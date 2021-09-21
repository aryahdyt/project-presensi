-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Sep 2021 pada 09.53
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi_ajam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absen_darings`
--

CREATE TABLE `absen_darings` (
  `id` int(10) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `pembahasan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kehadiran` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bukti` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jadwal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absen_darings`
--

INSERT INTO `absen_darings` (`id`, `siswa_id`, `kelas_id`, `pembahasan`, `kehadiran`, `bukti`, `created_at`, `updated_at`, `jadwal_id`) VALUES
(7, 5, 9, 'Belajar MVC', 'Hadir', NULL, '2021-09-01 05:12:27', '2021-09-05 02:44:48', 6),
(15, 5, 9, 'belajar ERD', 'Hadir', NULL, '2021-09-05 03:58:41', '2021-09-05 03:58:41', 8),
(16, 6, 9, 'Membuat ERD', 'Hadir', NULL, '2021-09-05 04:11:10', '2021-09-05 04:11:10', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `absen_harians`
--

CREATE TABLE `absen_harians` (
  `id` int(10) UNSIGNED NOT NULL,
  `ruangan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absen_harians`
--

INSERT INTO `absen_harians` (`id`, `ruangan_id`, `created_at`, `updated_at`) VALUES
(1, 4, '2021-08-29 19:06:00', '2021-08-29 19:07:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `absen_harian_siswa`
--

CREATE TABLE `absen_harian_siswa` (
  `absen_harian_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absen_harian_siswa`
--

INSERT INTO `absen_harian_siswa` (`absen_harian_id`, `siswa_id`) VALUES
(1, 4),
(2, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-08-23 06:00:56', '2021-08-23 06:00:56'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-08-23 06:00:57', '2021-08-23 06:00:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'nama', 'text', 'Nama', 0, 1, 1, 1, 1, 1, '{}', 3),
(58, 7, 'kelas', 'text', 'Kelas', 1, 1, 1, 1, 1, 1, '{}', 5),
(59, 7, 'pembahasan', 'text_area', 'Pembahasan', 0, 1, 1, 1, 1, 1, '{}', 6),
(60, 7, 'kehadiran', 'radio_btn', 'Kehadiran', 0, 1, 1, 1, 1, 1, '{\"default\":\"\",\"options\":{\"HADIR\":\"HADIR\",\"IZIN\":\"IZIN\",\"SAKIT\":\"SAKIT\"}}', 7),
(61, 7, 'bukti', 'image', 'Bukti', 0, 1, 1, 1, 1, 1, '{}', 8),
(62, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 9),
(63, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(64, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 9, 'NISN', 'number', 'NISN', 0, 0, 1, 1, 1, 1, '{}', 2),
(67, 9, 'nama_lengkap', 'text', 'Nama Lengkap', 0, 1, 1, 1, 1, 1, '{}', 4),
(68, 9, 'alamat', 'text', 'Alamat', 0, 1, 1, 1, 1, 1, '{}', 5),
(69, 9, 'agama', 'select_dropdown', 'Agama', 0, 1, 1, 1, 1, 1, '{\"default\":\"none\",\"options\":{\"Atheis\":\"Atheis\",\"Islam\":\"Islam\",\"Kristen\":\"Kristen\",\"Katolik\":\"Katolik\",\"Hindu\":\"Hindu\",\"Budha\":\"Budha\",\"Konghucu\":\"Konghucu\"}}', 6),
(70, 9, 'jenis_kelamin', 'radio_btn', 'Jenis Kelamin', 0, 1, 1, 1, 1, 1, '{\"default\":\"\",\"options\":{\"Laki-Laki\":\"Laki-Laki\",\"Perempuan\":\"Perempuan\"}}', 7),
(71, 9, 'tempat_lahir', 'text', 'Tempat Lahir', 0, 0, 1, 1, 1, 1, '{}', 8),
(72, 9, 'tanggal_lahir', 'date', 'Tanggal Lahir', 0, 0, 1, 1, 1, 1, '{}', 9),
(74, 9, 'no_hp', 'number', 'No Hp', 0, 1, 1, 1, 1, 1, '{}', 13),
(75, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 14),
(76, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(78, 7, 'absen_belongsto_siswa_relationship', 'relationship', 'kelas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Kelas\",\"table\":\"kelas\",\"type\":\"belongsTo\",\"column\":\"kelas\",\"key\":\"id\",\"label\":\"kelas\",\"pivot_table\":\"absens\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(80, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 15, 'jurusan', 'text', 'Jurusan', 0, 1, 1, 1, 1, 1, '{}', 3),
(83, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 4),
(84, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(85, 7, 'absen_belongsto_siswa_relationship_1', 'relationship', 'siswas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Siswa\",\"table\":\"siswas\",\"type\":\"belongsTo\",\"column\":\"nama\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"absens\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(94, 15, 'kelas', 'text', 'Kelas', 0, 1, 1, 1, 1, 1, '{}', 2),
(95, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(96, 18, 'mapel', 'text', 'Nama Mapel', 1, 1, 1, 1, 1, 1, '{}', 3),
(98, 18, 'created_at', 'timestamp', 'Created At', 1, 0, 1, 0, 0, 1, '{}', 6),
(99, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(111, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(119, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 11),
(120, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(121, 20, 'jadwal_belongsto_kela_relationship', 'relationship', 'kelas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Kelas\",\"table\":\"kelas\",\"type\":\"belongsTo\",\"column\":\"kelas_id\",\"key\":\"id\",\"label\":\"kelas\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(123, 9, 'siswa_belongsto_user_relationship', 'relationship', 'Email Siswa', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(124, 9, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(125, 20, 'jam_masuk', 'time', 'Jam Masuk', 0, 1, 1, 1, 1, 1, '{}', 5),
(126, 20, 'jam_keluar', 'time', 'Jam Keluar', 0, 1, 1, 1, 1, 1, '{}', 6),
(127, 9, 'siswa_belongsto_kela_relationship', 'relationship', 'kelas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Kelas\",\"table\":\"kelas\",\"type\":\"belongsTo\",\"column\":\"kelas_id\",\"key\":\"id\",\"label\":\"kelas\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(128, 9, 'kelas_id', 'text', 'Kelas Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(129, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(130, 22, 'nama_guru', 'text', 'Nama Guru', 0, 1, 1, 1, 1, 1, '{}', 2),
(131, 22, 'mapel_id', 'text', 'Mapel Id', 0, 0, 0, 0, 0, 0, '{}', 3),
(132, 22, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(133, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 7),
(134, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(136, 22, 'guru_belongsto_user_relationship', 'relationship', 'email', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(137, 20, 'jadwal_belongsto_guru_relationship', 'relationship', 'Nama Guru', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Guru\",\"table\":\"gurus\",\"type\":\"belongsTo\",\"column\":\"guru_id\",\"key\":\"id\",\"label\":\"nama_guru\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(139, 20, 'guru_id', 'text', 'Guru Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(141, 22, 'guru_belongstomany_mapel_relationship', 'relationship', 'Kode Mapel', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Mapel\",\"table\":\"mapels\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"kode_mapel\",\"pivot_table\":\"guru_mapels\",\"pivot\":\"1\",\"taggable\":\"0\"}', 6),
(142, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(143, 25, 'nama_ruangan', 'text', 'Nama Ruangan', 1, 1, 1, 1, 1, 1, '{}', 2),
(144, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(145, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(146, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(148, 27, 'ruangan_id', 'text', 'Ruangan Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(149, 27, 'created_at', 'timestamp', 'Tanggal', 0, 1, 1, 0, 0, 1, '{\"format\":\"%d-%m-%Y\"}', 6),
(150, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(151, 27, 'absen_harian_belongstomany_siswa_relationship', 'relationship', 'siswas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Siswa\",\"table\":\"siswas\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"absen_harian_siswa\",\"pivot\":\"1\",\"taggable\":\"0\"}', 3),
(152, 27, 'absen_harian_belongsto_ruangan_relationship', 'relationship', 'ruangans', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Ruangan\",\"table\":\"ruangans\",\"type\":\"belongsTo\",\"column\":\"ruangan_id\",\"key\":\"id\",\"label\":\"nama_ruangan\",\"pivot_table\":\"absen_harian_siswa\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(153, 25, 'kategori', 'checkbox', 'Kategori', 1, 1, 1, 1, 1, 1, '{\"on\":\"Ruang belajar\",\"off\":\"Bukan ruang belajar\",\"checked\":true}', 5),
(154, 25, 'deskripsi', 'text_area', 'Deskripsi', 0, 1, 1, 1, 1, 1, '{}', 6),
(155, 20, 'tanggal', 'date', 'Tanggal', 0, 1, 1, 1, 1, 1, '{\"format\":\"%d-%m-%Y\"}', 2),
(156, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(159, 32, 'pembahasan', 'text', 'Pembahasan', 1, 1, 1, 1, 1, 1, '{}', 7),
(160, 32, 'kehadiran', 'radio_btn', 'Kehadiran', 1, 1, 1, 1, 1, 1, '{\"Hadir\":\"Hadir\",\"options\":{\"Hadir\":\"Hadir\",\"Izin\":\"Izin\",\"Sakit\":\"Sakit\",\"Alpa\":\"Alpa\"}}', 8),
(161, 32, 'bukti', 'image', 'Bukti', 0, 1, 1, 1, 1, 1, '{}', 9),
(162, 32, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 11),
(163, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(164, 32, 'absen_daring_belongsto_siswa_relationship', 'relationship', 'nama siswa', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Siswa\",\"table\":\"siswas\",\"type\":\"belongsTo\",\"column\":\"siswa_id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(165, 32, 'absen_daring_belongsto_kela_relationship', 'relationship', 'kelas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Kelas\",\"table\":\"kelas\",\"type\":\"belongsTo\",\"column\":\"kelas_id\",\"key\":\"id\",\"label\":\"kelas\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(167, 32, 'kelas_id', 'text', 'Kelas Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(168, 18, 'kode_mapel', 'text', 'Kode Mapel', 0, 1, 1, 1, 1, 1, '{}', 2),
(169, 18, 'keterangan', 'text_area', 'Keterangan', 1, 1, 1, 1, 1, 1, '{}', 4),
(170, 18, 'tingkat', 'select_dropdown', 'Tingkat', 1, 1, 1, 1, 1, 1, '{\"X\":\"X\",\"options\":{\"X\":\"X\",\"XI\":\"XI\",\"XII\":\"XII\"}}', 5),
(171, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(172, 1, 'user_hasone_siswa_relationship', 'relationship', 'siswas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Siswa\",\"table\":\"siswas\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nama_lengkap\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":null}', 13),
(173, 32, 'siswa_id', 'text', 'Siswa Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(174, 20, 'kelas_id', 'text', 'Kelas Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(175, 20, 'jadwal_belongsto_mapel_relationship', 'relationship', 'mapels', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Mapel\",\"table\":\"mapels\",\"type\":\"belongsTo\",\"column\":\"mapel_id\",\"key\":\"id\",\"label\":\"mapel\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(176, 20, 'mapel_id', 'text', 'Mapel Id', 0, 1, 1, 1, 1, 1, '{}', 10),
(177, 32, 'absen_daring_belongsto_jadwal_relationship', 'relationship', 'jadwals', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Jadwal\",\"table\":\"jadwals\",\"type\":\"belongsTo\",\"column\":\"jadwal_id\",\"key\":\"id\",\"label\":\"tanggal\",\"pivot_table\":\"absen_darings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(178, 32, 'jadwal_id', 'text', 'Jadwal Id', 0, 1, 1, 1, 1, 1, '{}', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-08-23 06:00:27', '2021-08-30 04:48:49'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-08-23 06:00:28', '2021-08-23 06:00:28'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-08-23 06:00:28', '2021-08-23 06:00:28'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-08-23 06:00:53', '2021-08-23 06:00:53'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-08-23 06:00:59', '2021-08-23 06:00:59'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-08-23 06:01:07', '2021-08-23 06:01:07'),
(7, 'absens', 'absens', 'Absen', 'Absens', 'voyager-book', 'App\\Models\\Absen', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-23 06:31:10', '2021-08-27 17:28:06'),
(9, 'siswas', 'siswas', 'Siswa', 'Siswas', 'voyager-people', 'App\\Models\\Siswa', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-23 07:16:08', '2021-08-30 04:48:23'),
(15, 'kelas', 'kelas', 'Kelas', 'Kelas', 'voyager-folder', 'App\\Models\\Kelas', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-27 15:53:19', '2021-08-30 04:47:56'),
(18, 'mapels', 'mapels', 'Mapel', 'Mapels', NULL, 'App\\Models\\Mapel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-27 18:40:39', '2021-08-30 04:48:08'),
(20, 'jadwals', 'jadwals', 'Jadwal', 'Jadwal', 'voyager-book', 'App\\Models\\Jadwal', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-27 18:57:27', '2021-09-01 08:41:58'),
(22, 'gurus', 'gurus', 'Guru', 'Daftar Guru', 'voyager-github', 'App\\Models\\Guru', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-28 00:35:35', '2021-08-30 04:51:07'),
(25, 'ruangans', 'ruangans', 'Ruangan', 'Daftar Ruangan', 'voyager-home', 'App\\Models\\Ruangan', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-29 18:36:36', '2021-08-29 20:35:22'),
(27, 'absen_harians', 'absen-harians', 'Absen Harian', 'Absen Harian', 'voyager-news', 'App\\Models\\AbsenHarian', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-29 18:53:46', '2021-08-30 04:54:10'),
(31, 'absen_daring', 'absen-daring', 'Absen Daring', 'Absen Darings', 'voyager-news', 'App\\Models\\AbsenDaring', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-08-30 01:00:30', '2021-08-30 01:00:30'),
(32, 'absen_darings', 'absen-darings', 'Absen Daring', 'Absen Daring', 'voyager-news', 'App\\Models\\AbsenDaring', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-30 01:03:54', '2021-09-02 07:52:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gurus`
--

CREATE TABLE `gurus` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_guru` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gurus`
--

INSERT INTO `gurus` (`id`, `nama_guru`, `mapel_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Pa Puguh', 1, 4, '2021-08-28 00:48:00', '2021-08-30 04:29:06'),
(3, 'Bu hesti', NULL, NULL, '2021-08-28 01:15:00', '2021-08-30 04:51:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapels`
--

CREATE TABLE `guru_mapels` (
  `guru_id` int(11) DEFAULT NULL,
  `mapel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `guru_mapels`
--

INSERT INTO `guru_mapels` (`guru_id`, `mapel_id`) VALUES
(2, 1),
(1, 3),
(1, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwals`
--

CREATE TABLE `jadwals` (
  `id` int(10) UNSIGNED NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `jam_masuk` time DEFAULT '07:00:00',
  `guru_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jam_keluar` time DEFAULT '12:00:00',
  `mapel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwals`
--

INSERT INTO `jadwals` (`id`, `tanggal`, `kelas_id`, `jam_masuk`, `guru_id`, `created_at`, `updated_at`, `jam_keluar`, `mapel_id`) VALUES
(6, '2021-08-30', 9, '07:00:00', 1, '2021-08-30 00:41:55', '2021-09-01 08:42:17', '12:00:00', 4),
(7, '2021-09-03', 9, '13:00:00', 3, '2021-09-02 08:13:36', '2021-09-03 06:10:17', '17:00:00', 5),
(8, '2021-09-05', 9, '12:00:00', 3, '2021-09-05 02:25:43', '2021-09-05 02:43:28', '15:00:00', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` int(10) UNSIGNED NOT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kelas` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `jurusan`, `created_at`, `updated_at`, `kelas`) VALUES
(9, 'RPL', '2021-08-28 01:23:00', '2021-08-28 01:23:00', 'XII RPL 2'),
(10, 'RPL', '2021-09-05 02:25:03', '2021-09-05 02:25:03', 'XII RPL 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapels`
--

CREATE TABLE `mapels` (
  `id` int(10) UNSIGNED NOT NULL,
  `mapel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_mapel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mapels`
--

INSERT INTO `mapels` (`id`, `mapel`, `created_at`, `updated_at`, `kode_mapel`, `keterangan`, `tingkat`) VALUES
(3, 'PWPB', '2021-08-30 04:45:09', '2021-08-30 04:45:09', 'PWPB12', 'Pemrograman Web dan Perangkat Bergerak', 'XII'),
(4, 'PBO', '2021-08-30 04:45:39', '2021-08-30 04:45:39', 'PBO12', 'Pemrograman Berbasis Objek', 'XII'),
(5, 'DB', '2021-08-30 04:49:42', '2021-08-30 04:49:42', 'DB12', 'Database', 'XI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-08-23 06:00:33', '2021-08-23 06:00:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', '#ff00f7', NULL, 1, '2021-08-23 06:00:33', '2021-08-28 01:24:38', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 5, 1, '2021-08-23 06:00:33', '2021-08-27 23:14:47', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 27, 1, '2021-08-23 06:00:33', '2021-08-27 19:08:35', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 27, 2, '2021-08-23 06:00:34', '2021-08-27 19:08:37', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 7, '2021-08-23 06:00:34', '2021-08-30 01:04:13', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 2, '2021-08-23 06:00:34', '2021-08-27 23:14:47', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 3, '2021-08-23 06:00:34', '2021-08-29 19:09:29', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 4, '2021-08-23 06:00:34', '2021-08-29 19:09:29', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 5, '2021-08-23 06:00:34', '2021-08-30 01:04:13', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 8, '2021-08-23 06:00:35', '2021-08-30 01:04:13', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 28, 3, '2021-08-23 06:00:55', '2021-08-27 23:14:35', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 28, 1, '2021-08-23 06:01:05', '2021-08-27 23:14:29', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 28, 2, '2021-08-23 06:01:09', '2021-08-27 23:14:35', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 6, '2021-08-23 06:01:14', '2021-08-30 01:04:13', 'voyager.hooks', NULL),
(16, 1, 'Siswas', '', '_self', 'voyager-people', NULL, 27, 3, '2021-08-23 07:16:09', '2021-08-27 19:09:01', 'voyager.siswas.index', NULL),
(21, 1, 'Kelas', '', '_self', 'voyager-folder', NULL, 27, 5, '2021-08-27 15:53:20', '2021-08-29 18:37:31', 'voyager.kelas.index', NULL),
(24, 1, 'Mapels', '', '_self', 'voyager-calendar', '#000000', 27, 6, '2021-08-27 18:40:40', '2021-08-29 18:37:32', 'voyager.mapels.index', 'null'),
(26, 1, 'Jadwals', '', '_self', 'voyager-book', '#ff0000', NULL, 6, '2021-08-27 18:57:27', '2021-08-30 01:04:13', 'voyager.jadwals.index', 'null'),
(27, 1, 'Data Master', '', '_self', 'voyager-archive', '#ff6f00', NULL, 2, '2021-08-27 19:08:24', '2021-08-28 01:25:44', NULL, ''),
(28, 1, 'Blogs', '', '_self', NULL, '#000000', NULL, 9, '2021-08-27 23:14:13', '2021-08-30 01:04:13', NULL, ''),
(29, 1, 'Daftar Guru', '', '_self', 'voyager-github', NULL, 27, 4, '2021-08-28 00:35:35', '2021-08-29 18:37:31', 'voyager.gurus.index', NULL),
(30, 1, 'Daftar Ruangan', '', '_self', 'voyager-home', '#000000', 27, 7, '2021-08-29 18:36:37', '2021-08-29 19:18:53', 'voyager.ruangans.index', 'null'),
(31, 1, 'Absen Harian', '', '_self', 'voyager-news', '#c8ff00', NULL, 5, '2021-08-29 18:53:46', '2021-08-30 01:04:13', 'voyager.absen-harians.index', 'null'),
(33, 1, 'Absen Daring', '', '_self', 'voyager-news', '#0affce', NULL, 4, '2021-08-30 01:03:55', '2021-08-30 01:21:17', 'voyager.absen-darings.index', 'null');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-08-23 06:01:10', '2021-08-23 06:01:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-08-23 06:00:36', '2021-08-23 06:00:36'),
(2, 'browse_bread', NULL, '2021-08-23 06:00:36', '2021-08-23 06:00:36'),
(3, 'browse_database', NULL, '2021-08-23 06:00:36', '2021-08-23 06:00:36'),
(4, 'browse_media', NULL, '2021-08-23 06:00:36', '2021-08-23 06:00:36'),
(5, 'browse_compass', NULL, '2021-08-23 06:00:37', '2021-08-23 06:00:37'),
(6, 'browse_menus', 'menus', '2021-08-23 06:00:37', '2021-08-23 06:00:37'),
(7, 'read_menus', 'menus', '2021-08-23 06:00:37', '2021-08-23 06:00:37'),
(8, 'edit_menus', 'menus', '2021-08-23 06:00:37', '2021-08-23 06:00:37'),
(9, 'add_menus', 'menus', '2021-08-23 06:00:37', '2021-08-23 06:00:37'),
(10, 'delete_menus', 'menus', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(11, 'browse_roles', 'roles', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(12, 'read_roles', 'roles', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(13, 'edit_roles', 'roles', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(14, 'add_roles', 'roles', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(15, 'delete_roles', 'roles', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(16, 'browse_users', 'users', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(17, 'read_users', 'users', '2021-08-23 06:00:38', '2021-08-23 06:00:38'),
(18, 'edit_users', 'users', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(19, 'add_users', 'users', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(20, 'delete_users', 'users', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(21, 'browse_settings', 'settings', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(22, 'read_settings', 'settings', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(23, 'edit_settings', 'settings', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(24, 'add_settings', 'settings', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(25, 'delete_settings', 'settings', '2021-08-23 06:00:39', '2021-08-23 06:00:39'),
(26, 'browse_categories', 'categories', '2021-08-23 06:00:55', '2021-08-23 06:00:55'),
(27, 'read_categories', 'categories', '2021-08-23 06:00:55', '2021-08-23 06:00:55'),
(28, 'edit_categories', 'categories', '2021-08-23 06:00:56', '2021-08-23 06:00:56'),
(29, 'add_categories', 'categories', '2021-08-23 06:00:56', '2021-08-23 06:00:56'),
(30, 'delete_categories', 'categories', '2021-08-23 06:00:56', '2021-08-23 06:00:56'),
(31, 'browse_posts', 'posts', '2021-08-23 06:01:05', '2021-08-23 06:01:05'),
(32, 'read_posts', 'posts', '2021-08-23 06:01:05', '2021-08-23 06:01:05'),
(33, 'edit_posts', 'posts', '2021-08-23 06:01:05', '2021-08-23 06:01:05'),
(34, 'add_posts', 'posts', '2021-08-23 06:01:06', '2021-08-23 06:01:06'),
(35, 'delete_posts', 'posts', '2021-08-23 06:01:06', '2021-08-23 06:01:06'),
(36, 'browse_pages', 'pages', '2021-08-23 06:01:10', '2021-08-23 06:01:10'),
(37, 'read_pages', 'pages', '2021-08-23 06:01:10', '2021-08-23 06:01:10'),
(38, 'edit_pages', 'pages', '2021-08-23 06:01:10', '2021-08-23 06:01:10'),
(39, 'add_pages', 'pages', '2021-08-23 06:01:10', '2021-08-23 06:01:10'),
(40, 'delete_pages', 'pages', '2021-08-23 06:01:10', '2021-08-23 06:01:10'),
(41, 'browse_hooks', NULL, '2021-08-23 06:01:15', '2021-08-23 06:01:15'),
(42, 'browse_absens', 'absens', '2021-08-23 06:31:10', '2021-08-23 06:31:10'),
(43, 'read_absens', 'absens', '2021-08-23 06:31:10', '2021-08-23 06:31:10'),
(44, 'edit_absens', 'absens', '2021-08-23 06:31:10', '2021-08-23 06:31:10'),
(45, 'add_absens', 'absens', '2021-08-23 06:31:10', '2021-08-23 06:31:10'),
(46, 'delete_absens', 'absens', '2021-08-23 06:31:10', '2021-08-23 06:31:10'),
(47, 'browse_siswas', 'siswas', '2021-08-23 07:16:09', '2021-08-23 07:16:09'),
(48, 'read_siswas', 'siswas', '2021-08-23 07:16:09', '2021-08-23 07:16:09'),
(49, 'edit_siswas', 'siswas', '2021-08-23 07:16:09', '2021-08-23 07:16:09'),
(50, 'add_siswas', 'siswas', '2021-08-23 07:16:09', '2021-08-23 07:16:09'),
(51, 'delete_siswas', 'siswas', '2021-08-23 07:16:09', '2021-08-23 07:16:09'),
(72, 'browse_kelas', 'kelas', '2021-08-27 15:53:19', '2021-08-27 15:53:19'),
(73, 'read_kelas', 'kelas', '2021-08-27 15:53:19', '2021-08-27 15:53:19'),
(74, 'edit_kelas', 'kelas', '2021-08-27 15:53:19', '2021-08-27 15:53:19'),
(75, 'add_kelas', 'kelas', '2021-08-27 15:53:19', '2021-08-27 15:53:19'),
(76, 'delete_kelas', 'kelas', '2021-08-27 15:53:19', '2021-08-27 15:53:19'),
(87, 'browse_mapels', 'mapels', '2021-08-27 18:40:40', '2021-08-27 18:40:40'),
(88, 'read_mapels', 'mapels', '2021-08-27 18:40:40', '2021-08-27 18:40:40'),
(89, 'edit_mapels', 'mapels', '2021-08-27 18:40:40', '2021-08-27 18:40:40'),
(90, 'add_mapels', 'mapels', '2021-08-27 18:40:40', '2021-08-27 18:40:40'),
(91, 'delete_mapels', 'mapels', '2021-08-27 18:40:40', '2021-08-27 18:40:40'),
(97, 'browse_jadwals', 'jadwals', '2021-08-27 18:57:27', '2021-08-27 18:57:27'),
(98, 'read_jadwals', 'jadwals', '2021-08-27 18:57:27', '2021-08-27 18:57:27'),
(99, 'edit_jadwals', 'jadwals', '2021-08-27 18:57:27', '2021-08-27 18:57:27'),
(100, 'add_jadwals', 'jadwals', '2021-08-27 18:57:27', '2021-08-27 18:57:27'),
(101, 'delete_jadwals', 'jadwals', '2021-08-27 18:57:27', '2021-08-27 18:57:27'),
(102, 'browse_gurus', 'gurus', '2021-08-28 00:35:35', '2021-08-28 00:35:35'),
(103, 'read_gurus', 'gurus', '2021-08-28 00:35:35', '2021-08-28 00:35:35'),
(104, 'edit_gurus', 'gurus', '2021-08-28 00:35:35', '2021-08-28 00:35:35'),
(105, 'add_gurus', 'gurus', '2021-08-28 00:35:35', '2021-08-28 00:35:35'),
(106, 'delete_gurus', 'gurus', '2021-08-28 00:35:35', '2021-08-28 00:35:35'),
(107, 'browse_ruangans', 'ruangans', '2021-08-29 18:36:36', '2021-08-29 18:36:36'),
(108, 'read_ruangans', 'ruangans', '2021-08-29 18:36:36', '2021-08-29 18:36:36'),
(109, 'edit_ruangans', 'ruangans', '2021-08-29 18:36:36', '2021-08-29 18:36:36'),
(110, 'add_ruangans', 'ruangans', '2021-08-29 18:36:36', '2021-08-29 18:36:36'),
(111, 'delete_ruangans', 'ruangans', '2021-08-29 18:36:36', '2021-08-29 18:36:36'),
(112, 'browse_absen_harians', 'absen_harians', '2021-08-29 18:53:46', '2021-08-29 18:53:46'),
(113, 'read_absen_harians', 'absen_harians', '2021-08-29 18:53:46', '2021-08-29 18:53:46'),
(114, 'edit_absen_harians', 'absen_harians', '2021-08-29 18:53:46', '2021-08-29 18:53:46'),
(115, 'add_absen_harians', 'absen_harians', '2021-08-29 18:53:46', '2021-08-29 18:53:46'),
(116, 'delete_absen_harians', 'absen_harians', '2021-08-29 18:53:46', '2021-08-29 18:53:46'),
(117, 'browse_absen_daring', 'absen_daring', '2021-08-30 01:00:30', '2021-08-30 01:00:30'),
(118, 'read_absen_daring', 'absen_daring', '2021-08-30 01:00:30', '2021-08-30 01:00:30'),
(119, 'edit_absen_daring', 'absen_daring', '2021-08-30 01:00:30', '2021-08-30 01:00:30'),
(120, 'add_absen_daring', 'absen_daring', '2021-08-30 01:00:30', '2021-08-30 01:00:30'),
(121, 'delete_absen_daring', 'absen_daring', '2021-08-30 01:00:30', '2021-08-30 01:00:30'),
(122, 'browse_absen_darings', 'absen_darings', '2021-08-30 01:03:55', '2021-08-30 01:03:55'),
(123, 'read_absen_darings', 'absen_darings', '2021-08-30 01:03:55', '2021-08-30 01:03:55'),
(124, 'edit_absen_darings', 'absen_darings', '2021-08-30 01:03:55', '2021-08-30 01:03:55'),
(125, 'add_absen_darings', 'absen_darings', '2021-08-30 01:03:55', '2021-08-30 01:03:55'),
(126, 'delete_absen_darings', 'absen_darings', '2021-08-30 01:03:55', '2021-08-30 01:03:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 4),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(42, 4),
(43, 1),
(43, 4),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(47, 4),
(48, 1),
(48, 4),
(49, 1),
(50, 1),
(51, 1),
(72, 1),
(72, 4),
(73, 1),
(73, 4),
(74, 1),
(75, 1),
(76, 1),
(87, 1),
(87, 4),
(88, 1),
(88, 4),
(89, 1),
(90, 1),
(91, 1),
(97, 1),
(97, 4),
(98, 1),
(98, 4),
(99, 1),
(99, 4),
(100, 1),
(100, 4),
(101, 1),
(101, 4),
(102, 1),
(102, 4),
(103, 1),
(103, 4),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(112, 4),
(113, 1),
(113, 4),
(114, 1),
(114, 4),
(115, 1),
(115, 4),
(116, 1),
(116, 4),
(117, 1),
(117, 4),
(118, 1),
(118, 4),
(119, 1),
(119, 4),
(120, 1),
(121, 1),
(121, 4),
(122, 1),
(122, 4),
(123, 1),
(123, 4),
(124, 1),
(124, 4),
(125, 1),
(125, 4),
(126, 1),
(126, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-23 06:01:06', '2021-08-23 06:01:06'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-23 06:01:06', '2021-08-23 06:01:06'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-23 06:01:06', '2021-08-23 06:01:06'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-23 06:01:07', '2021-08-23 06:01:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-08-23 06:00:35', '2021-08-23 06:00:35'),
(2, 'user', 'Normal User', '2021-08-23 06:00:35', '2021-08-23 06:00:35'),
(3, 'siswa', 'Siswa', '2021-08-27 23:25:03', '2021-08-27 23:25:03'),
(4, 'guru', 'Guru', '2021-08-28 01:28:40', '2021-08-28 01:28:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangans`
--

CREATE TABLE `ruangans` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kategori` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruangans`
--

INSERT INTO `ruangans` (`id`, `nama_ruangan`, `created_at`, `updated_at`, `kategori`, `deskripsi`) VALUES
(1, 'Ruang 20', '2021-08-29 19:03:00', '2021-08-29 19:56:04', '1', NULL),
(2, 'Ruang 21', '2021-08-29 19:03:00', '2021-08-29 19:56:12', '1', NULL),
(3, 'Ruang 22', '2021-08-29 19:03:00', '2021-08-29 19:55:56', '1', NULL),
(4, 'Ruang Lab ACP', '2021-08-29 19:04:02', '2021-08-29 19:04:02', '', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Presensi Smk Taruna Bhakti', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\August2021\\8EaBOlgxqLYiH7lOgk3B.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\August2021\\NY1WGfUH2AgVvE1iPi2C.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Presensi TB', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Selamat Datang Di Web Presensi SMK Taruna Bhakti', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\August2021\\tP2ZscvaYqTRrqoZ00mD.gif', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\August2021\\cMm46S6zLLIvICJ8h5sm.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswas`
--

CREATE TABLE `siswas` (
  `id` int(10) UNSIGNED NOT NULL,
  `NISN` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_lengkap` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `no_hp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswas`
--

INSERT INTO `siswas` (`id`, `NISN`, `nama_lengkap`, `kelas_id`, `alamat`, `agama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `user_id`, `no_hp`, `created_at`, `updated_at`) VALUES
(5, '24824919', 'ujang', 9, 'depok', 'Atheis', 'Laki-Laki', 'jakarta', '2001-11-11', 5, '081231637131', '2021-08-29 19:05:08', '2021-09-05 02:43:54'),
(6, '12323131213', 'Muhammad Arya Hidayat', 9, 'Depok', 'Islam', 'Laki-Laki', 'Jakarta', '2004-02-15', 7, '0813123124214', '2021-09-05 04:02:09', '2021-09-05 04:02:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-08-23 06:01:10', '2021-08-23 06:01:10'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-08-23 06:01:11', '2021-08-23 06:01:11'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-08-23 06:01:12', '2021-08-23 06:01:12'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-08-23 06:01:13', '2021-08-23 06:01:13'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-08-23 06:01:13', '2021-08-23 06:01:13'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-08-23 06:01:13', '2021-08-23 06:01:13'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-08-23 06:01:13', '2021-08-23 06:01:13'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-08-23 06:01:13', '2021-08-23 06:01:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$DaY6QXy7/AQO3UBYseXtnuX7kjLmPqROMUcs.FkF1kW.OgS/d1UfG', 'hJisRtTMS38J2aEjD7qsjJSW9uLUuVo103qPfejQ6C7ZRwjBWuCOTSacdQgK', NULL, '2021-08-23 06:00:59', '2021-08-23 06:00:59'),
(5, 3, 'siswa', 'siswa@siswa.com', 'users/default.png', NULL, '$2y$10$SdOpi1YBOWRhKSZUzvh3X.Ml0rzmeOSN8SJC871h9I7iOWyXeLoCe', NULL, '{\"locale\":\"en\"}', '2021-08-30 05:00:01', '2021-08-30 05:00:01'),
(6, 4, 'guru', 'guru@guru.com', 'users/default.png', NULL, '$2y$10$lauMdMqJ/0OELImHWoJGNekA/JTe7CrXU4vGU2cPXA7PMpdbJQGTC', NULL, '{\"locale\":\"en\"}', '2021-08-30 05:00:22', '2021-08-30 05:00:22'),
(7, 3, 'Arya Ganteng', 'arya@arya.com', 'users/default.png', NULL, '$2y$10$oa2dIveWRryw1nYgGjhGYOrQ8WTeS.h559.rRxd.cW.K3MfYjXvYS', NULL, '{\"locale\":\"id\"}', '2021-09-05 04:02:44', '2021-09-05 04:02:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absen_darings`
--
ALTER TABLE `absen_darings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `absen_harians`
--
ALTER TABLE `absen_harians`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indeks untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeks untuk tabel `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `gurus`
--
ALTER TABLE `gurus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mapels`
--
ALTER TABLE `mapels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mapels_kode_mapel_unique` (`kode_mapel`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeks untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeks untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `ruangans`
--
ALTER TABLE `ruangans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeks untuk tabel `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absen_darings`
--
ALTER TABLE `absen_darings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `absen_harians`
--
ALTER TABLE `absen_harians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT untuk tabel `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gurus`
--
ALTER TABLE `gurus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `mapels`
--
ALTER TABLE `mapels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `ruangans`
--
ALTER TABLE `ruangans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
