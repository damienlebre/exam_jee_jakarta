-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 10 sep. 2023 à 19:55
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `exam_blanc_jee_jakarta`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contenu` text NOT NULL,
  `datePublication` datetime(6) NOT NULL,
  `descriptionCourte` varchar(150) NOT NULL,
  `image` varchar(255) NOT NULL,
  `titre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id`, `contenu`, `datePublication`, `descriptionCourte`, `image`, `titre`) VALUES
(1, 'test', '2023-09-09 01:07:46.890000', 'test', 'test.jpg', 'test'),
(2, 'corp d\'annonce modifié', '2023-09-09 12:07:51.979000', 'description modifié', 'test.jpg', 'test modification'),
(3, 'Logoden biniou degemer mat an penn ar bed, nag Pornizhan penn verc’h loar planken, gwad voull levrioù esaeañ stivell lakaat.\r\n\r\nItron ne eno harzoù troad yenijenn, eured tachenn pakad kuzh c’hiz, ha e tavañjer ur lamp, c’hwi keniterv kriz rev.\r\n\r\nHervez  muzell ar istor kilpenn c’hoarvezout ruilhañ kloc’h kontrol da eizhvet, Arzhon-Rewiz ezhomm kroc’hen da vouezh stagañ kerzhout poazh sae.', '2023-09-10 11:12:52.424000', 'description courte annonce test 3 ', 'test.jpg', 'titre annonce test 3'),
(6, 'rh rhr rhsr hsr hshsrh ', '2023-09-10 13:49:20.376000', 'description courte annonce test 4', 'test2.jpg', 'titre test 4');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `firstname`, `lastname`, `password`, `username`) VALUES
(3, 'Camus', 'Albert', '$2a$10$vY4QaCgq3lC7v4aXRmD8yu4J8DtxNWxS87ojYc4yobU1k43TfEqj2', 'acamus'),
(4, 'Londres', 'Albert', '$2a$10$XDcd4x9Fjcnhcdt.0m5pZ.J.r2bronjLZDlZH0hYjDX376iEnbKVi', 'alondres');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
