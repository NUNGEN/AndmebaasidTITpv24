-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Mai 14, 2026 kell 10:40 EL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `protseduur voronin titpv`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `klientHinnang` (OUT `klientHinnang` INT)   BEGIN
	SELECT klientNimi, saldo,
    IF (saldo>1500, 'hea klient', 'tavaline klient') AS klientHinnang
    FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `klientNimi` (IN `klientNimi` VARCHAR(20))   BEGIN
	SELECT klientNimi from klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `klientOtsing` (IN `nimiTaht` CHAR(1))   BEGIN
	SELECT * FROM klient
    WHERE klientNimi LIKE Concat(nimiTaht, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutaLoom` (IN `kustutaID` INT)   BEGIN
	SELECT * FROM loomad;
	DELETE FROM loomad WHERE loomID=kustutaID;
    SELECT * FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaLoom` (IN `uusNimi` VARCHAR(20), IN `uusKaal` INT, IN `uusAasta` INT)   BEGIN
	INSERT INTO loomad(loomnimi, kaal, synniaasta)
    VALUES (uusNimi, uusKaal, uusAasta);
	SELECT * FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `loomaHinnang` (OUT `loomad` INT)   BEGIN
	SELECT loomNimi, kaal,
    IF(kaal>16, 'suur loom', 'väike loom') AS hinnang
    FROM loomad;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `minmaxKaal` (OUT `minKaal` INT, OUT `maxKaal` INT, OUT `avgKaal` DECIMAL(4,2), OUT `sumKaal` INT, OUT `countLoom` INT)   BEGIN
	SELECT MIN(kaal),MAX(kaal), AVG(kaal), SUM(kaal), COUNT(*)
    INTO minKaal, maxKaal, avgKaal, sumKaal, countLoom
    FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `naitaLoomad` (IN `naitaLoomad` INT)   BEGIN 
	SELECT loomnimi FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otsing1taht` (IN `taht` CHAR(1))   BEGIN
	SELECT * FROM loomad
  	WHERE loomNimi LIKE Concat(taht, '%');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `klient`
--

CREATE TABLE `klient` (
  `id` int(5) NOT NULL,
  `klientNimi` varchar(20) NOT NULL,
  `linn` varchar(25) NOT NULL,
  `vanus` int(3) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `klient`
--

INSERT INTO `klient` (`id`, `klientNimi`, `linn`, `vanus`, `saldo`) VALUES
(4252, 'Magnus', 'Tallinn', 20, 3000),
(0, '', '', 0, 0),
(0, 'Magnus', '', 0, 0),
(0, 'Magnus', '', 0, 0),
(92346, 'Nikita', 'Tartu', 19, 1500),
(55555, 'Kenny', 'Narva', 30, 6000);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loomad`
--

CREATE TABLE `loomad` (
  `loomId` int(11) NOT NULL,
  `loomNimi` varchar(20) NOT NULL,
  `kaal` int(11) DEFAULT NULL,
  `synniAastal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `loomad`
--

INSERT INTO `loomad` (`loomId`, `loomNimi`, `kaal`, `synniAastal`) VALUES
(1, 'koer Barbos', 15, 2024),
(2, 'koer Kusaka', 40, 2016);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `loomad`
--
ALTER TABLE `loomad`
  ADD PRIMARY KEY (`loomId`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `loomad`
--
ALTER TABLE `loomad`
  MODIFY `loomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
