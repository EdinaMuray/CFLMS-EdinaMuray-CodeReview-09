-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Jul 2020 um 19:46
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Datenbank: `cr09_edina_muray_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_edina_muray_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_edina_muray_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `ID_Employee` int(55) NOT NULL,
  `ID_E_Position` int(55) NOT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`ID_Employee`, `ID_E_Position`, `FirstName`, `LastName`) VALUES
(3, 4, 'Big', 'Boss'),
(4, 4, 'Secretariat', 'Fee'),
(5, 3, 'Elvis', 'Hurricane'),
(6, 2, 'Eye', 'Old'),
(7, 1, 'Speedy', 'Gonzales');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_position`
--

CREATE TABLE `e_position` (
  `ID_E_Position` int(55) NOT NULL,
  `Role` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_position`
--

INSERT INTO `e_position` (`ID_E_Position`, `Role`) VALUES
(1, 'Deliver'),
(2, 'Deposit'),
(3, 'Pickup'),
(4, 'Office');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `ID_Package` int(55) NOT NULL,
  `Weight` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`ID_Package`, `Weight`) VALUES
(1, '1 kg'),
(2, '5 kg'),
(3, '14 kg'),
(4, '2 kg'),
(5, '6 kg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `postoffice`
--

CREATE TABLE `postoffice` (
  `ID_PostOffice` int(55) NOT NULL,
  `ID_PO_Adress` int(55) NOT NULL,
  `POName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `postoffice`
--

INSERT INTO `postoffice` (`ID_PostOffice`, `ID_PO_Adress`, `POName`) VALUES
(1, 1, 'Haupt Post');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `po_adress`
--

CREATE TABLE `po_adress` (
  `ID_PO_Adress` int(55) NOT NULL,
  `ZIP` int(55) NOT NULL,
  `City` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Street` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `po_adress`
--

INSERT INTO `po_adress` (`ID_PO_Adress`, `ZIP`, `City`, `Street`) VALUES
(1, 1134, 'Vienna', 'Mainstrasse 1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processingsystem`
--

CREATE TABLE `processingsystem` (
  `ID_Process` int(55) NOT NULL,
  `ID_Package` int(55) NOT NULL,
  `ID_Employee` int(55) NOT NULL,
  `ID_PostOffice` int(55) NOT NULL,
  `ID_Sender` int(55) NOT NULL,
  `ID_Recipient` int(55) NOT NULL,
  `PickedUP_Date` date NOT NULL,
  `Deposited_Date` date NOT NULL,
  `Delivered_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `processingsystem`
--

INSERT INTO `processingsystem` (`ID_Process`, `ID_Package`, `ID_Employee`, `ID_PostOffice`, `ID_Sender`, `ID_Recipient`, `PickedUP_Date`, `Deposited_Date`, `Delivered_Date`) VALUES
(6, 1, 3, 1, 3, 9, '2020-01-26', '2020-01-26', '0000-00-00'),
(7, 1, 5, 1, 4, 8, '2020-01-26', '0000-00-00', '2020-01-26'),
(8, 1, 3, 1, 5, 7, '0000-00-00', '2020-01-27', '2020-01-28'),
(9, 3, 4, 1, 6, 8, '2020-01-28', '2020-01-29', '2020-01-30'),
(10, 2, 3, 1, 7, 8, '2020-02-26', '2020-02-26', '2020-02-29'),
(11, 3, 5, 1, 9, 9, '2020-02-28', '2020-02-28', '2020-03-01'),
(12, 4, 6, 1, 4, 7, '0000-00-00', '2020-02-14', '2020-02-15'),
(13, 5, 7, 1, 6, 1, '2020-01-05', '2020-01-06', '2020-01-07');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `ID_Recipient` int(55) NOT NULL,
  `ID_R_Adress` int(55) NOT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`ID_Recipient`, `ID_R_Adress`, `FirstName`, `LastName`) VALUES
(1, 1, 'Johny', 'Cash'),
(2, 2, 'Marsian', 'Alien'),
(3, 3, 'Rocky', 'Balboa'),
(4, 4, 'Glen', 'Davis'),
(5, 5, 'Frida', 'Kaloh'),
(6, 6, 'Terminator', 'First'),
(7, 7, 'Kis', 'Kacsa'),
(8, 8, 'Bull', 'Dog'),
(9, 9, 'Eleven', 'One');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `r_adress`
--

CREATE TABLE `r_adress` (
  `ID_R_Adress` int(55) NOT NULL,
  `ZIP` int(55) NOT NULL,
  `City` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Street` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `r_adress`
--

INSERT INTO `r_adress` (`ID_R_Adress`, `ZIP`, `City`, `Street`) VALUES
(1, 4566, 'Bregenz', 'Lakeside 9'),
(2, 4523, 'Bregenz', 'Harpbour 52'),
(3, 4589, 'Bregenz', 'Festivalstrasse 84'),
(4, 8823, 'Villach', 'Crazystreet 71'),
(5, 8826, 'Villach', 'Wladstreet 47'),
(6, 8825, 'Villach', 'Bengozstreet 76'),
(7, 9354, 'Linz', 'Schokoladestrasse 78'),
(8, 9378, 'Linz', 'Bignap 100'),
(9, 9321, 'Linz', 'Holidaystrasse 5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sender`
--

CREATE TABLE `sender` (
  `ID_Sender` int(55) NOT NULL,
  `ID_S_Adress` int(55) NOT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `sender`
--

INSERT INTO `sender` (`ID_Sender`, `ID_S_Adress`, `FirstName`, `LastName`) VALUES
(3, 1, 'Maci', 'Laci'),
(4, 2, 'Micky', 'Mouse'),
(5, 3, 'Gofy', 'Gouse'),
(6, 4, 'Dasy', 'Duck'),
(7, 5, 'Donald', 'Duck'),
(8, 6, 'Minny', 'Sinny'),
(9, 7, 'Big', 'Face'),
(10, 8, 'Winny', 'Poo'),
(11, 9, 'Pork', 'Little');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `s_adress`
--

CREATE TABLE `s_adress` (
  `ID_S_Adress` int(25) NOT NULL,
  `ZIP` int(25) NOT NULL,
  `City` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Street` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `s_adress`
--

INSERT INTO `s_adress` (`ID_S_Adress`, `ZIP`, `City`, `Street`) VALUES
(1, 1190, 'Vienna', 'Heiligenstrasse 5'),
(2, 1150, 'Vienna', 'Pingpongstrasse 3'),
(3, 1110, 'Vienna', 'Simmeringerstrasse 108'),
(4, 2231, 'Graz', 'Bigpark 10'),
(5, 2289, 'Graz', 'Grund 56'),
(6, 2242, 'Graz', 'Lovelyplace 55'),
(7, 6578, 'Innsbruck', 'Highlightstrasse 34'),
(8, 6595, 'Innsbruck', 'Montainstrasse 48'),
(9, 6539, 'Innsbruck', 'Hauptplatz 2');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID_Employee`),
  ADD KEY `ID_E_Position` (`ID_E_Position`);

--
-- Indizes für die Tabelle `e_position`
--
ALTER TABLE `e_position`
  ADD PRIMARY KEY (`ID_E_Position`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`ID_Package`);

--
-- Indizes für die Tabelle `postoffice`
--
ALTER TABLE `postoffice`
  ADD PRIMARY KEY (`ID_PostOffice`),
  ADD KEY `ID_PO_Adress` (`ID_PO_Adress`);

--
-- Indizes für die Tabelle `po_adress`
--
ALTER TABLE `po_adress`
  ADD PRIMARY KEY (`ID_PO_Adress`);

--
-- Indizes für die Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  ADD PRIMARY KEY (`ID_Process`),
  ADD KEY `ID_Sender` (`ID_Sender`),
  ADD KEY `ID_Recipient` (`ID_Recipient`),
  ADD KEY `ID_Employee` (`ID_Employee`),
  ADD KEY `ID_Package` (`ID_Package`),
  ADD KEY `ID_PostOffice` (`ID_PostOffice`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`ID_Recipient`),
  ADD KEY `ID_R_Adress` (`ID_R_Adress`);

--
-- Indizes für die Tabelle `r_adress`
--
ALTER TABLE `r_adress`
  ADD PRIMARY KEY (`ID_R_Adress`);

--
-- Indizes für die Tabelle `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`ID_Sender`),
  ADD KEY `ID_S_Adress` (`ID_S_Adress`);

--
-- Indizes für die Tabelle `s_adress`
--
ALTER TABLE `s_adress`
  ADD PRIMARY KEY (`ID_S_Adress`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `ID_Employee` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `e_position`
--
ALTER TABLE `e_position`
  MODIFY `ID_E_Position` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `ID_Package` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `postoffice`
--
ALTER TABLE `postoffice`
  MODIFY `ID_PostOffice` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `po_adress`
--
ALTER TABLE `po_adress`
  MODIFY `ID_PO_Adress` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  MODIFY `ID_Process` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `recipient`
--
ALTER TABLE `recipient`
  MODIFY `ID_Recipient` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `r_adress`
--
ALTER TABLE `r_adress`
  MODIFY `ID_R_Adress` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `sender`
--
ALTER TABLE `sender`
  MODIFY `ID_Sender` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `s_adress`
--
ALTER TABLE `s_adress`
  MODIFY `ID_S_Adress` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ID_E_Position`) REFERENCES `e_position` (`ID_E_Position`);

--
-- Constraints der Tabelle `postoffice`
--
ALTER TABLE `postoffice`
  ADD CONSTRAINT `postoffice_ibfk_1` FOREIGN KEY (`ID_PO_Adress`) REFERENCES `po_adress` (`ID_PO_Adress`);

--
-- Constraints der Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  ADD CONSTRAINT `processingsystem_ibfk_1` FOREIGN KEY (`ID_Sender`) REFERENCES `sender` (`ID_Sender`),
  ADD CONSTRAINT `processingsystem_ibfk_2` FOREIGN KEY (`ID_Recipient`) REFERENCES `recipient` (`ID_Recipient`),
  ADD CONSTRAINT `processingsystem_ibfk_3` FOREIGN KEY (`ID_Employee`) REFERENCES `employee` (`ID_Employee`),
  ADD CONSTRAINT `processingsystem_ibfk_4` FOREIGN KEY (`ID_Package`) REFERENCES `package` (`ID_Package`),
  ADD CONSTRAINT `processingsystem_ibfk_5` FOREIGN KEY (`ID_PostOffice`) REFERENCES `postoffice` (`ID_PostOffice`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`ID_R_Adress`) REFERENCES `r_adress` (`ID_R_Adress`);

--
-- Constraints der Tabelle `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`ID_S_Adress`) REFERENCES `s_adress` (`ID_S_Adress`);
COMMIT;
