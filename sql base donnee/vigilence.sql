-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 23 mars 2021 à 14:41
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vigilence`
--

-- --------------------------------------------------------

--
-- Structure de la table `bien_immobilier`
--

DROP TABLE IF EXISTS `bien_immobilier`;
CREATE TABLE IF NOT EXISTS `bien_immobilier` (
  `code_bien` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_bien` varchar(100) DEFAULT NULL,
  `num_enregistrement` double DEFAULT NULL,
  `superficie` double DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `code_quartier` int(11) DEFAULT NULL,
  `date_construction` double DEFAULT NULL,
  PRIMARY KEY (`code_bien`),
  KEY `code_quartier` (`code_quartier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bien_immobilier`
--

INSERT INTO `bien_immobilier` (`code_bien`, `adresse_bien`, `num_enregistrement`, `superficie`, `type`, `code_quartier`, `date_construction`) VALUES
(1, 'RUE FEZOUANE', 21555, 90, 'IMMEUBLE', 1, 2020),
(2, 'RUE KHADIJA', 17442, 100, 'IMMEUBLE', 3, 2018),
(3, 'RUE FATIHA', 24558, 120, 'IMMEUBLE', 2, 2019);

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `nummcontrat` int(11) NOT NULL AUTO_INCREMENT,
  `prix_mensuel` double UNSIGNED DEFAULT NULL,
  `code_bien` int(11) DEFAULT NULL,
  `code_syndic` int(11) DEFAULT NULL,
  `etat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nummcontrat`),
  KEY `code_bien` (`code_bien`,`code_syndic`),
  KEY `code_syndic` (`code_syndic`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`nummcontrat`, `prix_mensuel`, `code_bien`, `code_syndic`, `etat`) VALUES
(1, 1200, 2, 3, 'BIEN'),
(3, 1000, 1, 3, 'TRES BIEN'),
(6, 800, 3, 2, 'NORMAL');

-- --------------------------------------------------------

--
-- Structure de la table `quartier`
--

DROP TABLE IF EXISTS `quartier`;
CREATE TABLE IF NOT EXISTS `quartier` (
  `code_quartier` int(11) NOT NULL AUTO_INCREMENT,
  `nom_quartier` varchar(100) DEFAULT NULL,
  `population_quartier` double DEFAULT NULL,
  `code_ville` int(11) DEFAULT NULL,
  `total_quartier` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_quartier`),
  KEY `code_ville` (`code_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `quartier`
--

INSERT INTO `quartier` (`code_quartier`, `nom_quartier`, `population_quartier`, `code_ville`, `total_quartier`) VALUES
(1, 'HAY SALAM', 100, 1, 7),
(2, 'HAY ROQYA', 100, 1, 7),
(3, 'HAY QODS', 200, 2, 15);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `code_region` int(11) NOT NULL AUTO_INCREMENT,
  `nom_region` varchar(50) DEFAULT NULL,
  `population_region` double DEFAULT NULL,
  `total_region` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_region`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`code_region`, `nom_region`, `population_region`, `total_region`) VALUES
(1, 'oriental', 400000, 30),
(2, 'nord', 122238, 45),
(3, 'casa', 27398736, 59);

-- --------------------------------------------------------

--
-- Structure de la table `syndic`
--

DROP TABLE IF EXISTS `syndic`;
CREATE TABLE IF NOT EXISTS `syndic` (
  `code_syndic` int(11) NOT NULL AUTO_INCREMENT,
  `nom_syndic` varchar(50) DEFAULT NULL,
  `prenom_syndic` varchar(50) DEFAULT NULL,
  `telephone_syndic` text,
  `mot_depasse` text,
  PRIMARY KEY (`code_syndic`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `syndic`
--

INSERT INTO `syndic` (`code_syndic`, `nom_syndic`, `prenom_syndic`, `telephone_syndic`, `mot_depasse`) VALUES
(1, 'hassan', 'housayni', '0604564712', '123123KI4p'),
(2, 'touhami', 'toufik', '0602364317', '70PaCe2B'),
(3, 'abbadi', 'mohammed', '0768459340', 'sI11Gb8u');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `code_ville` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ville` varchar(50) DEFAULT NULL,
  `code_region` int(11) DEFAULT NULL,
  `total_ville` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_ville`),
  KEY `code_region` (`code_region`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`code_ville`, `nom_ville`, `code_region`, `total_ville`) VALUES
(1, 'berkane', 1, 9),
(2, 'oujda', 1, 14),
(3, 'nador', 1, 12);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bien_immobilier`
--
ALTER TABLE `bien_immobilier`
  ADD CONSTRAINT `bien_immobilier_ibfk_1` FOREIGN KEY (`code_quartier`) REFERENCES `quartier` (`code_quartier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `contrat_ibfk_1` FOREIGN KEY (`code_bien`) REFERENCES `bien_immobilier` (`code_bien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrat_ibfk_2` FOREIGN KEY (`code_syndic`) REFERENCES `syndic` (`code_syndic`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `quartier`
--
ALTER TABLE `quartier`
  ADD CONSTRAINT `quartier_ibfk_1` FOREIGN KEY (`code_ville`) REFERENCES `ville` (`code_ville`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`code_region`) REFERENCES `region` (`code_region`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


2)
SELECT COUNT(*),ville.nom_ville 
FROM `ville` 
JOIN quartier ON quartier.code_ville=ville.code_ville 
join bien_immobilier on bien_immobilier.code_quartier=quartier.code_quartier
GROUP BY ville.nom_ville


3)
select b.code_bien , COUNT(*) 
FROM bien_immobilier b 
INNER JOIN contrat c on b.code_bien=c.code_bien
 GROUP BY b.code_bien 
HAVING COUNT(*)=(SELECT COUNT(*) 
FROM contrat c 
GROUP BY c.code_bien 
ORDER by COUNT(*) DESC 
LIMIT 1 )

4)
SELECT s.nom_syndic
 FROM syndic s 
 WHERE s.nom_syndic not in ( SELECT s.nom_syndic 
 FROM syndic s 
 INNER JOIN contrat c ON c.code_syndic=s.code_syndic 
 inner JOIN bien_immobilier b on b.code_bien=c.code_bien 
 inner JOIN quartier q on q.code_quartier= b.code_quartier 
 inner JOIN ville v on v.code_ville = q.code_ville
 inner join region r on r.code_region=v.code_region 
 WHERE r.nom_region='oriental')
 5)
 SELECT c.code_bien , SUM(c.prix_mensuel)
FROM contrat c 
group by c.code_bien 
having SUM(c.prix_mensuel) =(SELECT SUM(c.prix_mensuel)
FROM contrat c 
group by c.code_bien 
ORDER BY SUM(c.prix_mensuel) DESC 
LIMIT 1 )
6)
SELECT b.code_bien ,r.nom_region
FROM bien_immobilier b 
INNER JOIN quartier q 
on q.code_quartier=b.code_quartier
INNER JOIN ville v 
on v.code_ville=q.code_ville
INNER join region r 
on r.code_region = v.code_region
WHERE b.date_construction =(SELECT MIN(b.date_construction)
                            FROM bien_immobilier b INNER JOIN quartier q 
on q.code_quartier=b.code_quartier
INNER JOIN ville v 
on v.code_ville=q.code_ville
INNER join region r1 
on r1.code_region = v.code_region
 WHERE r1.code_region=r.code_region

 7)
 SELECT syndic.nom_syndic, region.nom_region FROM `syndic`INNER JOIN `contrat`
on contrat.code_syndic=syndic.code_syndic
inner join  `bien_immobilier`
on bien_immobilier.code_bien=contrat.code_bien
inner join `quartier`
on quartier.code_quartier=bien_immobilier.code_quartier
inner join `ville`
on ville.code_ville=quartier.code_quartier
inner join `region`
on region.code_region=ville.code_region
HAVING MAX(contrat.numcontrat)


8)
SELECT quartier.* FROM `quartier` inner join `bien_immobilier`
on bien_immobilier.code_quartier=quartier.code_quartier
inner join `contrat`
on contrat.code_bien=bien_immobilier.code_bien
HAVING COUNT(contrat.numcontrat) > 0
