-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2015 at 12:56 PM
-- Server version: 5.1.42-community
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `timetable`
--
CREATE DATABASE IF NOT EXISTS `timetable` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `timetable`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_tuts`(in studId integer)
begin

	declare v_finished integer default 0;
	declare subCode integer;
	declare subId integer;
	declare subCodeCursor cursor for
		select Scode from studentBacklogs,subjects 
		where studentId=studId and type="lecture+tut" and subjectId=sid;
	declare continue handler for not found
		set v_finished = 1;

	open subCodeCursor;
	
		nextCode: loop
			fetch subCodeCursor into subCode;
			if v_finished = 1 then
				leave nextCode;
			end if;
			select sid into subId from subjects
			where Scode=subCode and type="tut";
			insert into studentBacklogs values(studId,subId);
		end loop nextCode;
	
	close subCodeCursor;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `BID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Sem` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`BID`, `Name`, `Type`, `Sem`) VALUES
(1, 'b1', 'cse', 'first'),
(5, 'b3', 'cse', 'first'),
(12, 'a1', 'ece', 'first'),
(17, 'b2', 'cse', 'first'),
(18, 'b4', 'cse', 'first'),
(19, 'b5', 'cse', 'first'),
(20, 'c1', 'biotech', 'first'),
(21, 'c2', 'biotech', 'first'),
(22, 'c3', 'biotech', 'first'),
(23, 'c4', 'biotech', 'first'),
(24, 'a2', 'ece', 'first'),
(25, 'a3', 'ece', 'first'),
(26, 'a4', 'ece', 'first'),
(27, 'a5', 'ece', 'first'),
(28, 'b1', 'cse', 'second'),
(29, 'b2', 'cse', 'second'),
(30, 'b3', 'cse', 'second'),
(31, 'b4', 'cse', 'second'),
(32, 'b5', 'cse', 'second'),
(33, 'c1', 'biotech', 'second'),
(34, 'c2', 'biotech', 'second'),
(35, 'c3', 'biotech', 'second'),
(36, 'c4', 'biotech', 'second'),
(39, 'a1', 'ece', 'second'),
(40, 'a2', 'ece', 'second'),
(41, 'a3', 'ece', 'second'),
(42, 'a4', 'ece', 'second'),
(43, 'a5', 'ece', 'second'),
(44, 'b1', 'cse', 'third'),
(45, 'b2', 'cse', 'third'),
(46, 'b3', 'cse', 'third'),
(47, 'b4', 'cse', 'third'),
(48, 'b5', 'cse', 'third'),
(49, 'a1', 'ece', 'third'),
(50, 'a2', 'ece', 'third'),
(51, 'a3', 'ece', 'third'),
(52, 'a4', 'ece', 'third'),
(53, 'a5', 'ece', 'third'),
(54, 'c1', 'biotech', 'third'),
(55, 'c2', 'biotech', 'third'),
(56, 'c3', 'biotech', 'third'),
(57, 'c4', 'biotech', 'third'),
(58, 'c5', 'biotech', 'third'),
(59, 'b1', 'cse', 'fourth'),
(60, 'b2', 'cse', 'fourth'),
(61, 'b3', 'cse', 'fourth'),
(62, 'b4', 'cse', 'fourth'),
(63, 'b5', 'cse', 'fourth'),
(64, 'a1', 'ece', 'fourth'),
(65, 'a2', 'ece', 'fourth'),
(66, 'a3', 'ece', 'fourth'),
(67, 'a4', 'ece', 'fourth'),
(68, 'a5', 'ece', 'fourth'),
(69, 'c1', 'biotech', 'fourth'),
(70, 'c2', 'biotech', 'fourth'),
(71, 'c3', 'biotech', 'fourth'),
(72, 'c4', 'biotech', 'fourth'),
(73, 'c5', 'biotech', 'fourth');

-- --------------------------------------------------------

--
-- Table structure for table `batchsubjects`
--

CREATE TABLE IF NOT EXISTS `batchsubjects` (
  `batchId` int(11) DEFAULT NULL,
  `subjectId` int(11) DEFAULT NULL,
  `studentNos` int(11) DEFAULT NULL,
  KEY `subjectId` (`subjectId`),
  KEY `batchId` (`batchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batchsubjects`
--

INSERT INTO `batchsubjects` (`batchId`, `subjectId`, `studentNos`) VALUES
(1, 69, 30),
(1, 70, 30),
(1, 74, 30),
(1, 75, 30),
(1, 87, 30),
(1, 77, 30),
(1, 78, 30),
(1, 79, 30),
(1, 80, 30),
(1, 81, 30),
(1, 82, 30),
(1, 83, 30),
(1, 84, 30),
(1, 85, 30),
(1, 86, 30),
(17, 69, 30),
(17, 70, 30),
(17, 74, 30),
(17, 75, 30),
(17, 87, 30),
(17, 77, 30),
(17, 78, 30),
(17, 79, 30),
(17, 80, 30),
(17, 81, 30),
(17, 82, 30),
(17, 83, 30),
(17, 84, 30),
(17, 85, 30),
(17, 86, 30),
(5, 69, 30),
(5, 70, 30),
(5, 74, 30),
(5, 75, 30),
(5, 87, 30),
(5, 77, 30),
(5, 78, 30),
(5, 79, 30),
(5, 80, 30),
(5, 81, 30),
(5, 82, 30),
(5, 83, 30),
(5, 84, 30),
(5, 85, 30),
(5, 86, 30),
(18, 69, 30),
(18, 70, 30),
(18, 74, 30),
(18, 75, 30),
(18, 87, 30),
(18, 77, 30),
(18, 78, 30),
(18, 79, 30),
(18, 80, 30),
(18, 81, 30),
(18, 82, 30),
(18, 83, 30),
(18, 84, 30),
(18, 85, 30),
(18, 86, 30),
(19, 69, 30),
(19, 70, 30),
(19, 74, 30),
(19, 75, 30),
(19, 87, 30),
(19, 77, 30),
(19, 78, 30),
(19, 79, 30),
(19, 80, 30),
(19, 81, 30),
(19, 82, 30),
(19, 83, 30),
(19, 84, 30),
(19, 85, 30),
(19, 86, 30),
(21, 69, 30),
(21, 70, 30),
(21, 74, 30),
(21, 75, 30),
(21, 87, 30),
(21, 77, 30),
(21, 78, 30),
(21, 79, 30),
(21, 80, 30),
(21, 81, 30),
(21, 82, 30),
(21, 83, 30),
(21, 84, 30),
(21, 85, 30),
(21, 86, 30),
(20, 69, 30),
(20, 70, 30),
(20, 74, 30),
(20, 75, 30),
(20, 87, 30),
(20, 77, 30),
(20, 78, 30),
(20, 79, 30),
(20, 80, 30),
(20, 81, 30),
(20, 82, 30),
(20, 83, 30),
(20, 84, 30),
(20, 85, 30),
(20, 86, 30),
(22, 69, 30),
(22, 70, 30),
(22, 74, 30),
(22, 75, 30),
(22, 87, 30),
(22, 77, 30),
(22, 78, 30),
(22, 79, 30),
(22, 80, 30),
(22, 81, 30),
(22, 82, 30),
(22, 83, 30),
(22, 84, 30),
(22, 85, 30),
(22, 86, 30),
(23, 69, 30),
(23, 70, 30),
(23, 74, 30),
(23, 75, 30),
(23, 87, 30),
(23, 77, 30),
(23, 78, 30),
(23, 79, 30),
(23, 80, 30),
(23, 81, 30),
(23, 82, 30),
(23, 83, 30),
(23, 84, 30),
(23, 85, 30),
(23, 86, 30),
(12, 85, 30),
(12, 84, 30),
(12, 83, 30),
(12, 81, 30),
(12, 82, 30),
(12, 79, 30),
(12, 80, 30),
(12, 86, 30),
(12, 69, 30),
(12, 70, 30),
(12, 74, 30),
(12, 75, 30),
(12, 87, 30),
(12, 77, 30),
(12, 78, 30),
(24, 69, 30),
(24, 70, 30),
(24, 74, 30),
(24, 75, 30),
(24, 87, 30),
(24, 77, 30),
(24, 78, 30),
(24, 79, 30),
(24, 80, 30),
(24, 81, 30),
(24, 82, 30),
(24, 83, 30),
(24, 84, 30),
(24, 85, 30),
(24, 86, 30),
(25, 69, 30),
(25, 70, 30),
(25, 74, 30),
(25, 75, 30),
(25, 87, 30),
(25, 77, 30),
(25, 78, 30),
(25, 79, 30),
(25, 80, 30),
(25, 81, 30),
(25, 82, 30),
(25, 83, 30),
(25, 84, 30),
(25, 85, 30),
(25, 86, 30),
(26, 69, 30),
(26, 70, 30),
(26, 74, 30),
(26, 75, 30),
(26, 87, 30),
(26, 77, 30),
(26, 78, 30),
(26, 79, 30),
(26, 80, 30),
(26, 81, 30),
(26, 82, 30),
(26, 83, 30),
(26, 84, 30),
(26, 85, 30),
(26, 86, 30),
(27, 69, 30),
(27, 70, 30),
(27, 74, 30),
(27, 75, 30),
(27, 87, 30),
(27, 77, 30),
(27, 78, 30),
(27, 79, 30),
(27, 80, 30),
(27, 81, 30),
(27, 82, 30),
(27, 83, 30),
(27, 84, 30),
(27, 85, 30),
(27, 86, 30),
(28, 88, 30),
(28, 89, 30),
(28, 90, 30),
(28, 91, 30),
(28, 92, 30),
(28, 93, 30),
(28, 94, 30),
(28, 95, 30),
(28, 96, 30),
(28, 97, 30),
(28, 98, 30),
(28, 99, 30),
(28, 100, 30),
(28, 101, 30),
(29, 88, 30),
(29, 89, 30),
(29, 90, 30),
(29, 91, 30),
(29, 92, 30),
(29, 93, 30),
(29, 94, 30),
(29, 95, 30),
(29, 96, 30),
(29, 97, 30),
(29, 98, 30),
(29, 99, 30),
(29, 100, 30),
(29, 101, 30),
(30, 88, 30),
(30, 89, 30),
(30, 90, 30),
(30, 91, 30),
(30, 92, 30),
(30, 93, 30),
(30, 94, 30),
(30, 95, 30),
(30, 96, 30),
(30, 97, 30),
(30, 98, 30),
(30, 99, 30),
(30, 100, 30),
(30, 101, 30),
(31, 88, 30),
(31, 89, 30),
(31, 90, 30),
(31, 91, 30),
(31, 92, 30),
(31, 93, 30),
(31, 94, 30),
(31, 95, 30),
(31, 96, 30),
(31, 97, 30),
(31, 98, 30),
(31, 99, 30),
(31, 100, 30),
(31, 101, 30),
(32, 90, 30),
(32, 91, 30),
(32, 92, 30),
(32, 93, 30),
(32, 94, 30),
(32, 95, 30),
(32, 96, 30),
(32, 97, 30),
(32, 98, 30),
(32, 99, 30),
(32, 100, 30),
(32, 101, 30),
(32, 88, 30),
(33, 104, 30),
(33, 102, 30),
(33, 103, 30),
(33, 88, 30),
(33, 89, 30),
(33, 105, 30),
(33, 106, 30),
(33, 94, 30),
(33, 95, 30),
(33, 96, 30),
(33, 97, 30),
(33, 99, 30),
(33, 100, 30),
(34, 102, 30),
(34, 103, 30),
(34, 88, 30),
(34, 89, 30),
(34, 105, 30),
(34, 106, 30),
(34, 94, 30),
(34, 95, 30),
(34, 96, 30),
(34, 97, 30),
(34, 99, 30),
(34, 100, 30),
(34, 104, 30),
(32, 89, 30),
(35, 102, 30),
(35, 103, 30),
(35, 88, 30),
(35, 89, 30),
(35, 105, 30),
(35, 106, 30),
(35, 94, 30),
(35, 95, 30),
(35, 96, 30),
(35, 97, 30),
(35, 99, 30),
(35, 100, 30),
(36, 102, 30),
(36, 103, 30),
(36, 88, 30),
(36, 89, 30),
(36, 105, 30),
(36, 106, 30),
(36, 94, 30),
(36, 95, 30),
(36, 96, 30),
(36, 97, 30),
(36, 99, 30),
(36, 100, 30),
(5, 89, 30),
(44, 105, 30),
(44, 106, 30),
(44, 107, 30),
(44, 108, 30),
(44, 109, 30),
(44, 110, 30),
(44, 111, 30),
(44, 112, 30),
(44, 113, 30),
(44, 114, 30),
(44, 115, 30),
(44, 116, 30),
(44, 117, 30),
(44, 118, 30),
(45, 105, 30),
(45, 106, 30),
(45, 107, 30),
(45, 108, 30),
(45, 109, 30),
(45, 110, 30),
(45, 111, 30),
(45, 112, 30),
(45, 113, 30),
(45, 114, 30),
(45, 115, 30),
(45, 116, 30),
(45, 117, 30),
(45, 118, 30),
(46, 105, 30),
(46, 106, 30),
(46, 107, 30),
(46, 108, 30),
(46, 109, 30),
(46, 110, 30),
(46, 111, 30),
(46, 112, 30),
(46, 113, 30),
(46, 114, 30),
(46, 115, 30),
(46, 116, 30),
(46, 117, 30),
(46, 118, 30),
(47, 105, 30),
(47, 106, 30),
(47, 107, 30),
(47, 108, 30),
(47, 109, 30),
(47, 110, 30),
(47, 111, 30),
(47, 112, 30),
(47, 113, 30),
(47, 114, 30),
(47, 115, 30),
(47, 116, 30),
(47, 117, 30),
(47, 118, 30),
(48, 105, 30),
(48, 106, 30),
(48, 107, 30),
(48, 108, 30),
(48, 109, 30),
(48, 110, 30),
(48, 111, 30),
(48, 112, 30),
(48, 113, 30),
(48, 114, 30),
(48, 115, 30),
(48, 116, 30),
(48, 117, 30),
(48, 118, 30),
(59, 119, 30),
(59, 120, 30),
(59, 121, 30),
(59, 122, 30),
(59, 123, 30),
(59, 124, 30),
(59, 125, 30),
(59, 126, 30),
(59, 127, 30),
(59, 128, 30),
(59, 129, 30),
(59, 130, 30),
(59, 131, 30),
(59, 132, 30),
(59, 133, 30),
(59, 134, 30),
(60, 119, 30),
(60, 120, 30),
(60, 121, 30),
(60, 122, 30),
(60, 123, 30),
(60, 124, 30),
(60, 125, 30),
(60, 126, 30),
(60, 127, 30),
(60, 128, 30),
(60, 129, 30),
(60, 130, 30),
(60, 131, 30),
(60, 132, 30),
(60, 133, 30),
(60, 134, 30),
(61, 119, 30),
(61, 120, 30),
(61, 121, 30),
(61, 122, 30),
(61, 123, 30),
(61, 124, 30),
(61, 125, 30),
(61, 126, 30),
(61, 127, 30),
(61, 128, 30),
(61, 129, 30),
(61, 130, 30),
(61, 131, 30),
(61, 132, 30),
(61, 133, 30),
(61, 134, 30),
(62, 119, 30),
(62, 120, 30),
(62, 121, 30),
(62, 122, 30),
(62, 123, 30),
(62, 124, 30),
(62, 125, 30),
(62, 126, 30),
(62, 127, 30),
(62, 128, 30),
(62, 129, 30),
(62, 130, 30),
(62, 131, 30),
(62, 132, 30),
(62, 133, 30),
(62, 134, 30),
(63, 119, 30),
(63, 120, 30),
(63, 121, 30),
(63, 122, 30),
(63, 123, 30),
(63, 124, 30),
(63, 125, 30),
(63, 126, 30),
(63, 127, 30),
(63, 128, 30),
(63, 129, 30),
(63, 130, 30),
(63, 131, 30),
(63, 132, 30),
(63, 133, 30),
(63, 134, 30),
(39, 88, 30),
(39, 89, 30),
(39, 90, 30),
(39, 91, 30),
(39, 92, 30),
(39, 93, 30),
(39, 94, 30),
(39, 95, 30),
(39, 96, 30),
(39, 97, 30),
(39, 98, 30),
(39, 99, 30),
(39, 100, 30),
(33, 135, 30),
(34, 135, 30),
(35, 135, 30),
(36, 135, 30),
(39, 136, 30),
(40, 88, 30),
(40, 89, 30),
(40, 90, 30),
(40, 91, 30),
(40, 92, 30),
(40, 93, 30),
(40, 94, 30),
(40, 95, 30),
(40, 96, 30),
(40, 97, 30),
(40, 98, 30),
(40, 99, 30),
(40, 100, 30),
(40, 136, 30),
(41, 88, 30),
(41, 89, 30),
(41, 90, 30),
(41, 91, 30),
(41, 92, 30),
(41, 93, 30),
(41, 94, 30),
(41, 95, 30),
(41, 96, 30),
(41, 97, 30),
(41, 98, 30),
(41, 99, 30),
(41, 100, 30),
(41, 136, 30),
(42, 88, 30),
(42, 89, 30),
(42, 90, 30),
(42, 91, 30),
(42, 92, 30),
(42, 93, 30),
(42, 94, 30),
(42, 95, 30),
(42, 96, 30),
(42, 97, 30),
(42, 98, 30),
(42, 99, 30),
(42, 100, 30),
(42, 136, 30),
(43, 88, 30),
(43, 89, 30),
(43, 90, 30),
(43, 91, 30),
(43, 92, 30),
(43, 93, 30),
(43, 94, 30),
(43, 95, 30),
(43, 96, 30),
(43, 97, 30),
(43, 98, 30),
(43, 99, 30),
(43, 100, 30),
(43, 136, 30),
(49, 107, 30),
(49, 108, 30),
(49, 105, 30),
(49, 106, 30),
(49, 123, 30),
(49, 124, 30),
(49, 131, 30),
(49, 134, 30),
(49, 137, 30),
(49, 138, 30),
(49, 139, 30),
(49, 140, 30),
(49, 141, 30),
(49, 142, 30),
(50, 107, 30),
(50, 108, 30),
(50, 105, 30),
(50, 106, 30),
(50, 123, 30),
(50, 124, 30),
(50, 131, 30),
(50, 134, 30),
(50, 137, 30),
(50, 138, 30),
(50, 139, 30),
(50, 140, 30),
(50, 141, 30),
(50, 142, 30),
(51, 107, 30),
(51, 108, 30),
(51, 105, 30),
(51, 106, 30),
(51, 123, 30),
(51, 124, 30),
(51, 131, 30),
(51, 134, 30),
(51, 137, 30),
(51, 138, 30),
(51, 139, 30),
(51, 140, 30),
(51, 141, 30),
(51, 142, 30),
(52, 107, 30),
(52, 108, 30),
(52, 105, 30),
(52, 106, 30),
(52, 123, 30),
(52, 124, 30),
(52, 131, 30),
(52, 134, 30),
(52, 137, 30),
(52, 138, 30),
(52, 139, 30),
(52, 140, 30),
(52, 141, 30),
(52, 142, 30),
(53, 107, 30),
(53, 108, 30),
(53, 105, 30),
(53, 106, 30),
(53, 123, 30),
(53, 124, 30),
(53, 131, 30),
(53, 134, 30),
(53, 137, 30),
(53, 138, 30),
(53, 139, 30),
(53, 140, 30),
(53, 141, 30),
(53, 142, 30),
(54, 107, 30),
(54, 108, 30),
(54, 143, 30),
(54, 144, 30),
(54, 145, 30),
(54, 146, 30),
(54, 147, 30),
(54, 152, 30),
(54, 148, 30),
(54, 149, 30),
(54, 150, 30),
(54, 151, 30),
(54, 154, 30),
(55, 107, 30),
(55, 108, 30),
(55, 143, 30),
(55, 144, 30),
(55, 145, 30),
(55, 146, 30),
(55, 147, 30),
(55, 152, 30),
(55, 148, 30),
(55, 149, 30),
(55, 150, 30),
(55, 151, 30),
(55, 154, 30),
(56, 107, 30),
(56, 108, 30),
(56, 143, 30),
(56, 144, 30),
(56, 145, 30),
(56, 146, 30),
(56, 147, 30),
(56, 152, 30),
(56, 148, 30),
(56, 149, 30),
(56, 150, 30),
(56, 151, 30),
(56, 154, 30),
(57, 107, 30),
(57, 108, 30),
(57, 143, 30),
(57, 144, 30),
(57, 145, 30),
(57, 146, 30),
(57, 147, 30),
(57, 152, 30),
(57, 148, 30),
(57, 149, 30),
(57, 150, 30),
(57, 151, 30),
(57, 154, 30),
(58, 107, 30),
(58, 108, 30),
(58, 143, 30),
(58, 144, 30),
(58, 145, 30),
(58, 146, 30),
(58, 147, 30),
(58, 152, 30),
(58, 148, 30),
(58, 149, 30),
(58, 150, 30),
(58, 151, 30),
(58, 154, 30),
(64, 119, 30),
(64, 120, 30),
(64, 121, 30),
(64, 122, 30),
(64, 156, 30),
(64, 157, 30),
(64, 109, 30),
(64, 110, 30),
(64, 158, 30),
(64, 159, 30),
(64, 115, 30),
(64, 118, 30),
(64, 129, 30),
(64, 130, 30),
(64, 160, 30),
(64, 161, 30),
(69, 119, 30),
(69, 120, 30),
(69, 162, 30),
(69, 163, 30),
(69, 170, 30),
(69, 164, 30),
(69, 165, 30),
(69, 166, 30),
(69, 167, 30),
(69, 168, 30),
(69, 169, 30),
(69, 129, 30),
(69, 130, 30),
(69, 171, 30),
(69, 172, 30),
(69, 173, 30),
(65, 119, 30),
(65, 120, 30),
(65, 121, 30),
(65, 122, 30),
(65, 156, 30),
(65, 157, 30),
(65, 109, 30),
(65, 110, 30),
(65, 158, 30),
(65, 159, 30),
(65, 115, 30),
(65, 118, 30),
(65, 129, 30),
(65, 130, 30),
(65, 160, 30),
(65, 161, 30),
(66, 119, 30),
(66, 120, 30),
(66, 121, 30),
(66, 122, 30),
(66, 156, 30),
(66, 157, 30),
(66, 109, 30),
(66, 110, 30),
(66, 158, 30),
(66, 159, 30),
(66, 115, 30),
(66, 118, 30),
(66, 129, 30),
(66, 130, 30),
(66, 160, 30),
(66, 161, 30),
(67, 119, 30),
(67, 120, 30),
(67, 121, 30),
(67, 122, 30),
(67, 156, 30),
(67, 157, 30),
(67, 109, 30),
(67, 110, 30),
(67, 158, 30),
(67, 159, 30),
(67, 115, 30),
(67, 118, 30),
(67, 129, 30),
(67, 130, 30),
(67, 160, 30),
(67, 161, 30),
(68, 119, 30),
(68, 120, 30),
(68, 121, 30),
(68, 122, 30),
(68, 156, 30),
(68, 157, 30),
(68, 109, 30),
(68, 110, 30),
(68, 158, 30),
(68, 159, 30),
(68, 115, 30),
(68, 118, 30),
(68, 129, 30),
(68, 130, 30),
(68, 160, 30),
(68, 161, 30),
(70, 119, 30),
(70, 120, 30),
(70, 162, 30),
(70, 163, 30),
(70, 170, 30),
(70, 164, 30),
(70, 165, 30),
(70, 166, 30),
(70, 167, 30),
(70, 168, 30),
(70, 169, 30),
(70, 129, 30),
(70, 130, 30),
(70, 171, 30),
(70, 172, 30),
(70, 173, 30),
(71, 119, 30),
(71, 120, 30),
(71, 162, 30),
(71, 163, 30),
(71, 170, 30),
(71, 164, 30),
(71, 165, 30),
(71, 166, 30),
(71, 167, 30),
(71, 168, 30),
(71, 169, 30),
(71, 129, 30),
(71, 130, 30),
(71, 171, 30),
(71, 172, 30),
(71, 173, 30),
(72, 119, 30),
(72, 120, 30),
(72, 162, 30),
(72, 163, 30),
(72, 170, 30),
(72, 164, 30),
(72, 165, 30),
(72, 166, 30),
(72, 167, 30),
(72, 168, 30),
(72, 169, 30),
(72, 129, 30),
(72, 130, 30),
(72, 171, 30),
(72, 172, 30),
(72, 173, 30),
(73, 119, 30),
(73, 120, 30),
(73, 162, 30),
(73, 163, 30),
(73, 170, 30),
(73, 164, 30),
(73, 165, 30),
(73, 166, 30),
(73, 167, 30),
(73, 168, 30),
(73, 169, 30),
(73, 129, 30),
(73, 130, 30),
(73, 171, 30),
(73, 172, 30),
(73, 173, 30);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `RID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Capacity` int(10) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RID`, `Name`, `Capacity`, `Type`, `Location`) VALUES
(1, 'g13', 2, 'lecture', 'Academic'),
(2, 'TS1', 2, 'tut', 'Academic'),
(4, 'g1', 3, 'lecture', 'Academic'),
(5, 'g2', 3, 'lecture', 'Academic'),
(6, 'g3', 4, 'lecture', 'Academic'),
(8, 'g5', 4, 'lecture', 'Academic'),
(9, 'g6', 4, 'lecture', 'Academic'),
(10, 'g7', 4, 'lecture', 'Academic'),
(11, 'cl1', 1, 'lab', 'Academic'),
(12, 'cl2', 1, 'lab', 'Academic'),
(13, 'MML', 1, 'lab', 'Academic'),
(14, 'ts1', 2, 'tut', 'Academic'),
(15, 'ts2', 1, 'tut', 'Academic'),
(16, 'ts3', 1, 'tut', 'Academic'),
(17, 'ts4', 1, 'tut', 'Academic'),
(18, 'ts5', 1, 'tut', 'Academic'),
(19, 'ts6', 1, 'tut', 'Academic'),
(20, 'ts7', 1, 'tut', 'Academic'),
(21, 'ts8', 1, 'tut', 'Academic'),
(34, 'qwe', 2, 'tut', 'wer'),
(35, 'asd23', 2, 'tut', 'asdd'),
(36, 'lt6', 3, 'lecture', 'Academic');

-- --------------------------------------------------------

--
-- Table structure for table `studentbacklogs`
--

CREATE TABLE IF NOT EXISTS `studentbacklogs` (
  `studentId` int(11) DEFAULT NULL,
  `subjectId` int(11) DEFAULT NULL,
  KEY `sb_fk_1` (`studentId`),
  KEY `sb_fk_2` (`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentbacklogs`
--

INSERT INTO `studentbacklogs` (`studentId`, `subjectId`) VALUES
(1, 69),
(1, 77),
(1, 83),
(1, 86),
(1, 70),
(1, 78),
(6, 86),
(6, 83),
(6, 84),
(6, 77),
(6, 78),
(8, 69),
(8, 86),
(8, 79),
(8, 70),
(8, 80),
(9, 79),
(9, 81),
(9, 85),
(9, 80),
(9, 82),
(10, 75),
(10, 77),
(10, 87),
(10, 78),
(11, 83),
(11, 84),
(11, 86),
(12, 113),
(12, 109),
(12, 116),
(12, 84),
(12, 85),
(12, 114),
(12, 110),
(13, 74),
(13, 84),
(13, 116),
(13, 111),
(13, 96),
(13, 112),
(13, 97),
(14, 147),
(14, 148),
(14, 84),
(14, 86),
(14, 96),
(14, 152),
(14, 149),
(14, 97),
(15, 74),
(15, 75),
(15, 83),
(15, 102),
(15, 104),
(15, 145),
(15, 148),
(15, 87),
(15, 103),
(15, 146),
(15, 149);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `branch` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batchId` (`batchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `batchId`, `semester`, `branch`) VALUES
(1, 'stu1', 28, 2, 'cse'),
(6, 'stu6', 30, 2, 'cse'),
(8, 'stu8', 41, 2, 'ece'),
(9, 'stu9', 34, 2, 'biotech'),
(10, 'stu10', 35, 2, 'biotech'),
(11, 'stu11', 35, 2, 'biotech'),
(12, 'stu12', 59, 4, 'cse'),
(13, 'stu13', 59, 4, 'cse'),
(14, 'stu14', 70, 4, 'biotech'),
(15, 'stu15', 70, 4, 'biotech');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `Sname` varchar(100) DEFAULT NULL,
  `Type` varchar(20) NOT NULL,
  `Scode` varchar(20) DEFAULT NULL,
  `Sem` varchar(10) DEFAULT NULL,
  `Hours` int(10) NOT NULL,
  `Branch` varchar(30) NOT NULL,
  PRIMARY KEY (`SID`),
  UNIQUE KEY `Type` (`Type`,`Scode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=174 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SID`, `Sname`, `Type`, `Scode`, `Sem`, `Hours`, `Branch`) VALUES
(69, 'presentation skills', 'lecture+tut', '120', 'first', 2, 'pd'),
(70, 'presentation skills', 'tut', '120', 'first', 1, 'pd'),
(74, 'english', 'lecture', '121', 'first', 2, 'pd'),
(75, 'maths 1', 'lecture+tut', '122', 'first', 3, 'maths'),
(77, 'physics 1', 'lecture+tut', '124', 'first', 4, 'physics'),
(78, 'physics 1', 'tut', '124', 'first', 4, 'physics'),
(79, 'electrical circuits', 'lecture+tut', '125', 'first', 3, 'ece'),
(80, 'electrical circuits', 'tut', '125', 'first', 1, 'ece'),
(81, 'icp', 'lecture+tut', '126', 'first', 3, 'cse'),
(82, 'icp', 'tut', '126', 'first', 1, 'cse'),
(83, 'physics lab 1', 'lab', '127', 'first', 2, 'physics'),
(84, 'e circuits lab', 'lab', '128', 'first', 2, 'ece'),
(85, 'computer programming lab', 'lab', '129', 'first', 2, 'cse'),
(86, 'institutional orientation', 'lecture', '130', 'first', 2, 'cse'),
(87, 'maths 1', 'tut', '122', 'first', 3, 'maths'),
(88, 'group and cooperative process', 'lecture+tut', '201', 'second', 2, 'pd'),
(89, 'group and cooperative process', 'tut', '201', 'second', 2, 'pd'),
(90, 'discrete maths', 'lecture+tut', '202', 'second', 3, 'maths'),
(91, 'discrete maths', 'tut', '202', 'second', 3, 'maths'),
(92, 'physics 2', 'lecture+tut', '203', 'second', 3, 'physics'),
(93, 'physics 2', 'tut', '203', 'second', 3, 'physics'),
(94, 'basic electronic devices and circuits', 'lecture+tut', '204', 'second', 3, 'ece'),
(95, 'basic electronic devices and circuits', 'tut', '204', 'second', 3, 'ece'),
(96, 'data structures', 'lecture+tut', '205', 'second', 3, 'cse'),
(97, 'data structures', 'tut', '205', 'second', 1, 'cse'),
(98, 'physics lab 2', 'lab', '206', 'second', 2, 'physics'),
(99, 'basic electronics lab', 'lab', '207', 'second', 2, 'ece'),
(100, 'data structures and computer programming lab', 'lab', '208', 'second', 4, 'cse'),
(101, 'departmental orientation', 'lecture', '209', 'second', 2, 'cse'),
(102, 'biophysical techniques', 'lecture+tut', '210', 'second', 3, 'biotech'),
(103, 'biophysical techniques', 'tut', '210', 'second', 1, 'biotech'),
(104, 'basic bio science lab', 'lab', '211', 'second', 2, 'biotech'),
(105, 'maths 2', 'lecture+tut', '301', 'third', 3, 'maths'),
(106, 'maths 2', 'tut', '301', 'third', 1, 'maths'),
(107, 'economics', 'lecture+tut', '302', 'third', 2, 'pd'),
(108, 'economics', 'tut', '302', 'third', 1, 'pd'),
(109, 'digital electronics', 'lecture+tut', '303', 'third', 3, 'ece'),
(110, 'digital electronics', 'tut', '303', 'third', 1, 'ece'),
(111, 'oops', 'lecture+tut', '304', 'third', 3, 'cse'),
(112, 'oops', 'tut', '304', 'third', 1, 'cse'),
(113, 'database systems', 'lecture+tut', '305', 'third', 3, 'cse'),
(114, 'database systems', 'tut', '305', 'third', 1, 'cse'),
(115, 'digital electronics lab', 'lab', '306', 'third', 2, 'ece'),
(116, 'oops lab', 'lab', '307', 'third', 2, 'cse'),
(117, 'database systems lab', 'lab', '308', 'third', 2, 'cse'),
(118, 'unix programming lab', 'lab', '309', 'third', 2, 'cse'),
(119, 'financial management', 'lecture+tut', '401', 'fourth', 2, 'pd'),
(120, 'financial management', 'tut', '401', 'fourth', 1, 'pd'),
(121, 'probability theory', 'lecture+tut', '402', 'fourth', 3, 'maths'),
(122, 'probability theory', 'tut', '402', 'fourth', 1, 'maths'),
(123, 'signals and systems', 'lecture+tut', '403', 'fourth', 3, 'ece'),
(124, 'signals and systems', 'tut', '403', 'fourth', 1, 'ece'),
(125, 'microprocessors and controllers', 'lecture+tut', '404', 'fourth', 3, 'cse'),
(126, 'microprocessors and controllers', 'tut', '404', 'fourth', 1, 'cse'),
(127, 'fundamental of algorithms', 'lecture+tut', '405', 'fourth', 3, 'cse'),
(128, 'fundamental of algorithms', 'tut', '405', 'fourth', 1, 'cse'),
(129, 'environmental studies', 'lecture+tut', '406', 'fourth', 2, 'pd'),
(130, 'environmental studies', 'tut', '406', 'fourth', 1, 'pd'),
(131, 'signals and systems  lab', 'lab', '407', 'fourth', 2, 'ece'),
(132, 'microprocessors and controllers lab', 'lab', '408', 'fourth', 2, 'cse'),
(133, 'algorithms lab', 'lab', '409', 'fourth', 2, 'cse'),
(134, 'multimedia development lab 1', 'lab', '410', 'fourth', 2, 'cse'),
(135, 'departmental orientation', 'lecture', '212', 'second', 2, 'biotech'),
(136, 'departmental orientation', 'lecture', '213', 'second', 2, 'ece'),
(137, 'electrical machines and instruments', 'lecture+tut', '310', 'third', 3, 'ece'),
(138, 'electrical machines and instruments', 'tut', '310', 'third', 1, 'ece'),
(139, 'analogue electronics', 'lecture+tut', '311', 'third', 3, 'ece'),
(140, 'analogue electronics', 'tut', '311', 'third', 1, 'ece'),
(141, 'electrical machines and instruments lab', 'lab', '312', 'third', 2, 'ece'),
(142, 'analogue electronics lab', 'lab', '313', 'third', 2, 'ece'),
(143, 'probability and statistics', 'lecture+tut', '314', 'third', 3, 'maths'),
(144, 'probability and statistics', 'tut', '314', 'third', 1, 'maths'),
(145, 'thermodynamics and chemical processes', 'lecture+tut', '315', 'third', 3, 'biotech'),
(146, 'thermodynamics and chemical processes', 'tut', '315', 'third', 1, 'biotech'),
(147, 'biochemistry', 'lecture+tut', '316', 'third', 3, 'biotech'),
(148, 'microbiology', 'lecture+tut', '317', 'third', 3, 'biotech'),
(149, 'microbiology', 'tut', '317', 'third', 1, 'biotech'),
(150, 'thermodynamics and chemical processes lab', 'lab', '318', 'third', 2, 'biotech'),
(151, 'microbiology lab', 'lab', '319', 'third', 4, 'biotech'),
(152, 'biochemistry', 'tut', '316', 'third', 1, 'biotech'),
(154, 'biochemistry lab', 'lab', '320', 'third', 2, 'biotech'),
(156, 'control system', 'lecture+tut', '411', 'fourth', 3, 'ece'),
(157, 'control system', 'tut', '411', 'fourth', 1, 'ece'),
(158, 'analogue communications', 'lecture+tut', '412', 'fourth', 3, 'ece'),
(159, 'analogue communications', 'tut', '412', 'fourth', 1, 'ece'),
(160, 'devices and circuit simulation lab', 'lab', '413', 'fourth', 2, 'ece'),
(161, 'analogue communications lab', 'lab', '414', 'fourth', 2, 'ece'),
(162, 'genetics', 'lecture+tut', '415', 'fourth', 3, 'biotech'),
(163, 'genetics', 'tut', '415', 'fourth', 1, 'biotech'),
(164, 'biomaterial science', 'lecture+tut', '416', 'fourth', 3, 'biotech'),
(165, 'biomaterial science', 'tut', '416', 'fourth', 1, 'biotech'),
(166, 'cell culture technology', 'lecture+tut', '417', 'fourth', 3, 'biotech'),
(167, 'cell culture technology', 'tut', '417', 'fourth', 1, 'biotech'),
(168, 'molecular biology', 'lecture+tut', '418', 'fourth', 3, 'biotech'),
(169, 'molecular biology', 'tut', '418', 'fourth', 1, 'biotech'),
(170, 'genetics lab', 'lab', '419', 'fourth', 2, 'biotech'),
(171, 'animal tissue culture lab', 'lab', '420', 'fourth', 2, 'biotech'),
(172, 'plant tissue culture lab', 'lab', '421', 'fourth', 2, 'biotech'),
(173, 'molecular biology lab', 'lab', '422', 'fourth', 2, 'biotech');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `dept` varchar(40) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `dept`, `userId`) VALUES
(1, 'teacher1', 'cse', 15),
(2, 'teacher2', 'cse', 16),
(3, 'teacher3', 'cse', 17),
(4, 'teacher4', 'ece', 18),
(5, 'teacher5', 'ece', 19),
(6, 'teacher6', 'ece', 20),
(7, 'teacher7', 'pd', 21),
(8, 'Utkarsh Siwach', 'cse', 1),
(9, 'asd', 'cse', 0),
(10, 'Sangeeta Singh', 'biotech', 2),
(11, 'teacher11', 'biotech', 22),
(12, 'teacher12', 'biotech', 23),
(13, 'teacher13', 'maths', 24),
(14, 'teacher14', 'maths', 25),
(15, 'teacher15', 'maths', 4),
(16, 'teacher16', 'maths', 26),
(17, 'teacher17', 'physics', 27),
(18, 'teacher18', 'physics', 28),
(19, 'teacher19', 'physics', 29),
(20, 'teacher20', 'physics', 30),
(21, 'aaaa aaaa', 'cse', 3),
(24, 'teacher24', 'maths', 31),
(25, 'teacher25', 'maths', 32),
(26, 'teacher26', 'maths', 33),
(27, 'teacher27', 'ece', 34),
(28, 'teacher28', 'ece', 35),
(29, 'teacher29', 'ece', 36),
(30, 'teacher30', 'ece', 37),
(31, 'teacher31', 'biotech', 38),
(32, 'teacher32', 'biotech', 39),
(33, 'teacher33', 'biotech', 40),
(34, 'teacher34', 'biotech', 41),
(35, 'teacher35', 'physics', 42),
(36, 'teacher36', 'physics', 43),
(37, 'teacher37', 'physics', 44),
(38, 'teacher38', 'pd', 45),
(39, 'teacher39', 'pd', 46),
(40, 'teacher40', 'pd', 47),
(41, 'teacher41', 'pd', 48),
(42, 'teacher42', 'pd', 49),
(43, 'teacher43', 'physics', 50),
(44, 'teacher44', 'physics', 51);

-- --------------------------------------------------------

--
-- Table structure for table `teachersubjects`
--

CREATE TABLE IF NOT EXISTS `teachersubjects` (
  `teacherId` int(11) DEFAULT NULL,
  `preference` int(11) DEFAULT NULL,
  `subjectId` int(11) DEFAULT NULL,
  KEY `teacherId` (`teacherId`),
  KEY `subjectId` (`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachersubjects`
--

INSERT INTO `teachersubjects` (`teacherId`, `preference`, `subjectId`) VALUES
(10, 1, 104),
(10, 2, 102),
(8, 1, 96),
(8, 2, 81),
(8, 3, 85),
(8, 4, 101),
(8, 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(10) NOT NULL AUTO_INCREMENT,
  `FName` varchar(30) NOT NULL,
  `LName` varchar(30) NOT NULL,
  `Email` varchar(100) NOT NULL DEFAULT '',
  `Phone` varchar(20) NOT NULL DEFAULT '',
  `Password` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Department` varchar(30) DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedIP` varchar(100) DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedIP` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Email`,`Phone`,`UserID`),
  UNIQUE KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FName`, `LName`, `Email`, `Phone`, `Password`, `Gender`, `Department`, `CreatedBy`, `CreatedDate`, `CreatedIP`, `ModifiedBy`, `ModifiedDate`, `ModifiedIP`) VALUES
(3, 'aaaa', 'aaaa', 'aa@aa.com', '', '74b87337454200d4d33f80c4663dc5e5', 'm', 'cse', NULL, '2015-02-28 14:20:55', '127.0.0.1', NULL, '2015-02-28 08:50:55', NULL),
(2, 'Sangeeta', 'Singh', 'sangeeta2063@gmail.com', '', '7809b2a5b4dae0abe348aca4da22b1d8', 'f', 'biotech', NULL, '2014-12-27 01:16:36', '127.0.0.1', NULL, '2014-12-26 19:46:36', NULL),
(1, 'Utkarsh', 'Siwach', 'utkarsh.siwach@gmail.com', '', '7809b2a5b4dae0abe348aca4da22b1d8', 'm', 'cse', NULL, '2014-12-12 18:22:40', '127.0.0.1', NULL, '2014-12-12 07:22:40', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batchsubjects`
--
ALTER TABLE `batchsubjects`
  ADD CONSTRAINT `batchsubjects_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`SID`) ON DELETE CASCADE,
  ADD CONSTRAINT `batchsubjects_ibfk_2` FOREIGN KEY (`batchId`) REFERENCES `batch` (`BID`) ON DELETE CASCADE;

--
-- Constraints for table `studentbacklogs`
--
ALTER TABLE `studentbacklogs`
  ADD CONSTRAINT `sb_fk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sb_fk_2` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`SID`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`batchId`) REFERENCES `batch` (`BID`);

--
-- Constraints for table `teachersubjects`
--
ALTER TABLE `teachersubjects`
  ADD CONSTRAINT `teachersubjects_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teachers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachersubjects_ibfk_2` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`SID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
