-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 30, 2026 kell 10:11 EL
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
-- Andmebaas: `hotellstseblokina`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `guest`
--

CREATE TABLE `guest` (
  `guestID` int(11) NOT NULL,
  `firstname` varchar(80) DEFAULT NULL,
  `lastname` varchar(80) NOT NULL,
  `membersince` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `guest`
--

INSERT INTO `guest` (`guestID`, `firstname`, `lastname`, `membersince`) VALUES
(1, 'Alisa', 'Stseblokina', '2026-04-15'),
(2, 'Olivia', 'Laid', '2026-04-10'),
(3, 'Emilia', 'Laid', '2026-04-28');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `occupied_room`
--

CREATE TABLE `occupied_room` (
  `occupied_roomID` int(11) NOT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `roomID` int(11) DEFAULT NULL,
  `reservationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `occupied_room`
--

INSERT INTO `occupied_room` (`occupied_roomID`, `check_in`, `check_out`, `roomID`, `reservationID`) VALUES
(1, '2026-04-20', '2026-05-07', 1, 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `reservation`
--

CREATE TABLE `reservation` (
  `reservationID` int(11) NOT NULL,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `made_by` varchar(20) NOT NULL,
  `guestID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `reservation`
--

INSERT INTO `reservation` (`reservationID`, `date_in`, `date_out`, `made_by`, `guestID`) VALUES
(3, '2026-04-20', '2026-04-29', 'koristaja', 1),
(5, '2026-06-10', '2026-05-20', 'Ehitaja', 3),
(6, '2026-03-11', '2026-07-02', 'õpetaja', 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `reserved_room`
--

CREATE TABLE `reserved_room` (
  `reserved_roomID` int(11) NOT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `room_typeID` int(11) DEFAULT NULL,
  `reservationID` int(11) DEFAULT NULL,
  `stetaus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `reserved_room`
--

INSERT INTO `reserved_room` (`reserved_roomID`, `number_of_rooms`, `room_typeID`, `reservationID`, `stetaus`) VALUES
(1, 1, 3, 6, 'not ready');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `room`
--

CREATE TABLE `room` (
  `roomID` int(11) NOT NULL,
  `number` varchar(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `smoke` bit(1) DEFAULT NULL,
  `room_typeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `room`
--

INSERT INTO `room` (`roomID`, `number`, `name`, `status`, `smoke`, `room_typeID`) VALUES
(1, 'C101', 'class', 'hõivatud', b'1', 2),
(2, 'A101', 'class', 'vaba', b'0', 3);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `room_type`
--

CREATE TABLE `room_type` (
  `room_typeID` int(11) NOT NULL,
  `description` varchar(80) NOT NULL,
  `max_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `room_type`
--

INSERT INTO `room_type` (`room_typeID`, `description`, `max_capacity`) VALUES
(1, 'Lux', 2),
(2, 'Vip', 1),
(3, 'Pere', 4);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guestID`);

--
-- Indeksid tabelile `occupied_room`
--
ALTER TABLE `occupied_room`
  ADD PRIMARY KEY (`occupied_roomID`),
  ADD KEY `roomID` (`roomID`),
  ADD KEY `reservationID` (`reservationID`);

--
-- Indeksid tabelile `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `guestID` (`guestID`);

--
-- Indeksid tabelile `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD PRIMARY KEY (`reserved_roomID`),
  ADD KEY `room_typeID` (`room_typeID`),
  ADD KEY `reservationID` (`reservationID`);

--
-- Indeksid tabelile `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomID`),
  ADD KEY `room_typeID` (`room_typeID`);

--
-- Indeksid tabelile `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`room_typeID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `guest`
--
ALTER TABLE `guest`
  MODIFY `guestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabelile `occupied_room`
--
ALTER TABLE `occupied_room`
  MODIFY `occupied_roomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `reserved_room`
--
ALTER TABLE `reserved_room`
  MODIFY `reserved_roomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `room`
--
ALTER TABLE `room`
  MODIFY `roomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `room_type`
--
ALTER TABLE `room_type`
  MODIFY `room_typeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `occupied_room`
--
ALTER TABLE `occupied_room`
  ADD CONSTRAINT `occupied_room_ibfk_1` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`),
  ADD CONSTRAINT `occupied_room_ibfk_2` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`);

--
-- Piirangud tabelile `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`);

--
-- Piirangud tabelile `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD CONSTRAINT `reserved_room_ibfk_1` FOREIGN KEY (`room_typeID`) REFERENCES `room_type` (`room_typeID`),
  ADD CONSTRAINT `reserved_room_ibfk_2` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`);

--
-- Piirangud tabelile `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_typeID`) REFERENCES `room_type` (`room_typeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


