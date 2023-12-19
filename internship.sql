-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 19 déc. 2023 à 19:35
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `internship`
--

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, '2023-07-26 09:33:42', '2023-07-26 09:33:42'),
(3, 3, '2023-07-26 13:51:33', '2023-07-26 13:51:33');

-- --------------------------------------------------------

--
-- Structure de la table `cart_course`
--

CREATE TABLE `cart_course` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'Design', 'Le design, le stylisme ou la stylique est une activité de création souvent à vocation industrielle ou commerciale, pouvant s’orienter vers les milieux sociaux, politiques, scientifiques et environnementaux.', 2, NULL, NULL),
(6, 'Développement Informatique', 'Le développement informatique consiste à concevoir et maintenir le fonctionnement des logiciels informatiques. Cette activité recouvre les étapes d\'étude, de conception, de transformation, de mise au point et de maintenance des logiciels.', 5, NULL, NULL),
(7, 'Marketing', 'Le marketing, ou la mercatique, est un ensemble de techniques de ventes et leur mise en œuvre.', 3, NULL, NULL),
(8, 'Musique', 'La musique est un art et une activité culturelle consistant à combiner sons et silences au cours du temps', 10, NULL, NULL),
(9, 'Business', 'Business est un anglicisme qui signifie \"affaires, activités liées aux affaires commerciales et financières dans le but de générer le maximum de profits', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chapters`
--

INSERT INTO `chapters` (`id`, `Title`, `order`, `youtube_link`, `content`, `course_id`, `created_at`, `updated_at`) VALUES
(1, '1er Chapitre', 1, 'https://www.youtube.com/watch?v=ZAfAud_M_mg&list=RD9xF9iQiS2Vs&index=5', 'Pour écrire en html, on utilise des balises, elles délimitent et définissent les éléments. Par exemple, la balise <p> servira à définir et délimiter un élément paragraphe. La plupart des balises marchent par paire, la première ouvre <p> pour marquer le début, la seconde ferme </p> pour marquer la fin.', 11, NULL, NULL),
(2, '2eme chapitre', 2, 'https://www.youtube.com/watch?v=ZAfAud_M_mg&list=RD9xF9iQiS2Vs&index=5', 'Pour afficher le code HTML (également appelé \"code source\") de votre page Web, commencez par ouvrir votre navigateur Web. Ensuite, accédez à la page comportant du contenu haut de gamme sur laquelle vous souhaitez diffuser des enquêtes. dans la barre d\'outils du navigateur.', 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Contenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Course_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`id`, `Title`, `description`, `Course_level`, `duration`, `price`, `image`, `Category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(10, 'CSS', 'Les feuilles de style en cascade, généralement appelées CSS de l\'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML. Les standards définissant CSS sont publiés par le World Wide Web Consortium.', 'easy', '5h', '150 MAD', '', 6, 3, NULL, NULL),
(11, 'Html', 'Le HyperText Markup Language, généralement abrégé HTML ou, dans sa dernière version, HTML5, est le langage de balisage conçu pour représenter les pages web.', 'easy', '6h', '120 MAD', '', 6, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_24_204319_create_categories_table', 2),
(6, '2023_07_24_204752_create_courses_table', 3),
(7, '2023_07_24_205124_create_chapters_table', 4),
(8, '2023_07_26_084533_create_carts_table', 5),
(9, '2023_07_26_085521_create_cart_course_table', 6);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
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

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Cle_SECRETE', '28b98bdf2795f3c756a26926253ac61fe68d9ce97f9bfcf94b38d8907d1b4007', '[\"\"]', NULL, '2023-07-24 20:06:17', '2023-07-24 20:06:17'),
(2, 'App\\Models\\User', 2, 'Cle_SECRETE', 'c92e77152e5cbf186561bc4b33888cc356b2016f35dc1fad9499738ff0d4ba90', '[\"*\"]', NULL, '2023-07-24 20:07:02', '2023-07-24 20:07:02'),
(3, 'App\\Models\\User', 3, 'Cle_SECRETE', '97f119c6fe8f9c850e36b6cc6485f68b4e44b8422dda904eea23fffa99a9a323', '[\"*\"]', NULL, '2023-07-24 20:07:12', '2023-07-24 20:07:12'),
(6, 'App\\Models\\User', 5, 'Cle_SECRETE', 'ebff31e0a84a7d77099e8a68f060cfb661f3808ce5a398b5a3d146e0b5dc50e9', '[\"*\"]', NULL, '2023-07-24 20:09:46', '2023-07-24 20:09:46'),
(7, 'App\\Models\\User', 6, 'Cle_SECRETE', 'a27ecdae7c37feb1a397c155eedeebaad515009af3beea534ea560583dbec398', '[\"\"]', '2023-07-28 10:04:59', '2023-07-28 10:02:40', '2023-07-28 10:04:59'),
(8, 'App\\Models\\User', 7, 'Cle_SECRETE', '402e26eaf39ffe067f6c60770cd38508f3e019aff0df9f20c348bf07f6e6fd54', '[\"*\"]', '2023-07-28 10:07:33', '2023-07-28 10:07:12', '2023-07-28 10:07:33'),
(9, 'App\\Models\\User', 8, 'Cle_SECRETE', '0e55338fe01205421329856388cede2dc1d6497866c2968a8b4c8a2337b64ad8', '[\"*\"]', NULL, '2023-08-01 07:53:12', '2023-08-01 07:53:12'),
(10, 'App\\Models\\User', 9, 'Cle_SECRETE', 'e9cac37ccd4bc15f5b7196fb268d95965ed1feef788f0e55baeeb7e441178bf4', '[\"*\"]', NULL, '2023-10-05 20:07:49', '2023-10-05 20:07:49'),
(11, 'App\\Models\\User', 10, 'Cle_SECRETE', '76010a4a2596d92cd05591c174dc22978c4d1c321ce281ba10ace652692ec292', '[\"*\"]', NULL, '2023-10-05 20:09:31', '2023-10-05 20:09:31'),
(12, 'App\\Models\\User', 10, 'Cle_SECRETE', '3406380aa96def3109708fd7b053710dd8ec79ff9d128a3bfec342ffbe4e5e6a', '[\"*\"]', '2023-10-05 20:35:34', '2023-10-05 20:10:22', '2023-10-05 20:35:34'),
(13, 'App\\Models\\User', 11, 'Cle_SECRETE', '9479dc080ba8f1517f83fb72a0491648e18d0dac42bb547655eebfb548e36988', '[\"*\"]', '2023-10-07 21:32:48', '2023-10-07 20:42:21', '2023-10-07 21:32:48');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `is_admin`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 0, 'rachida', 'rachida@gmail.com', NULL, '$2y$10$C8us8AonpgMUajlqsJQXveSTIuIHpN62J9Fc2r7gbxpjmzIrS8hgG', NULL, '2023-07-24 20:07:02', '2023-07-24 20:07:02'),
(3, 0, 'karima', 'karima@gmail.com', NULL, '$2y$10$AGI6Ic.oYIl9B72qmhm1/ucqTQTgcC/bvVhBSbzgJE9cQgR9ooSsu', NULL, '2023-07-24 20:07:12', '2023-07-24 20:07:12'),
(4, 1, 'fatima', 'fatima@gmail.com', NULL, '$2y$10$76nmKwjnEMlFTuyiQDtybO9Vdz1AV1AjPHw49dA4Qr4g7ioVkuZ9W', NULL, '2023-07-24 20:07:25', '2023-07-24 20:07:25'),
(5, 1, 'karim', 'karim@gmail.com', NULL, '$2y$10$JnXSN6U7DIfR6zYzB52TjuGZeITxlHQW2K9syjxXAlisSe8IggNsC', NULL, '2023-07-24 20:09:46', '2023-07-24 20:09:46'),
(10, 0, 'Mery', 'Maryemsriti@gmail.com', NULL, '$2y$10$zzn5zxDu0HC0/cFqBF881OLzwTZgH4zzt2r.0UZjv/tqJSHFK6z/C', NULL, '2023-10-05 20:09:31', '2023-10-05 20:09:31'),
(11, 0, 'Mery', 'Maiti2002@gmail.com', NULL, '$2y$10$2gzFnapKdMvvaMdaPa1td.g7vu/cTAyTXlG2K91HvfyNTwwZZyEd6', 'x', '2023-10-07 20:42:21', '2023-10-07 20:42:21');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Index pour la table `cart_course`
--
ALTER TABLE `cart_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_course_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_course_course_id_foreign` (`course_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_title_unique` (`title`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Index pour la table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_course_id_foreign` (`course_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_id_foreign` (`Category_id`),
  ADD KEY `courses_user_id_foreign` (`user_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `cart_course`
--
ALTER TABLE `cart_course`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cart_course`
--
ALTER TABLE `cart_course`
  ADD CONSTRAINT `cart_course_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`Category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
