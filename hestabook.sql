-- Adminer 4.6.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `hestabook` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hestabook`;

DROP TABLE IF EXISTS `feed`;
CREATE TABLE `feed` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `post_id` int(6) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `email` (`email`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `feed_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `feed_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `feed` (`Id`, `post_id`, `email`) VALUES
(12,	26,	'kavi2101sh@gmail.com'),
(13,	27,	'kavi2101sh@gmail.com'),
(14,	28,	'kavi2101sh@gmail.com'),
(15,	29,	'pragyasharma.pss12@gmail.com'),
(16,	30,	'kavi2101sh@gmail.com'),
(17,	31,	'kav@qw.cd');

DROP TABLE IF EXISTS `loggedin`;
CREATE TABLE `loggedin` (
  `serial` int(6) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`serial`),
  KEY `email` (`email`),
  CONSTRAINT `loggedin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `loggedin` (`serial`, `email`) VALUES
(55,	'amanbaranwal@gmail.com'),
(41,	'fdsfgf@fvdf.co'),
(56,	'kavi2101sh@gmail.com'),
(57,	'kavi2101sh@gmail.com'),
(58,	'kavi2101sh@gmail.com'),
(59,	'kavi2101sh@gmail.com'),
(48,	'kavishbaranwal@gmail.com'),
(49,	'kavishbaranwal@gmail.com'),
(31,	'samer@gmail.ci');

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(6) NOT NULL AUTO_INCREMENT,
  `post_data` varchar(250) NOT NULL,
  `post_type` int(1) NOT NULL,
  `post_time` datetime NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `post` (`post_id`, `post_data`, `post_type`, `post_time`) VALUES
(26,	'http://goo.gl/GWtGo',	0,	'2018-03-22 18:06:30'),
(27,	'this is the first post here in text',	1,	'2018-03-22 18:07:10'),
(28,	'this is the first post here in text',	1,	'2018-03-22 18:08:03'),
(29,	'hello this is our first look post',	1,	'2018-03-23 09:31:26'),
(30,	'this one is the post in new updated file',	1,	'2018-03-26 10:28:23'),
(31,	'HELLO THERE LETS WORK TOGETHER',	1,	'2018-03-26 10:32:02');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(12) NOT NULL,
  `description` text,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`user_id`, `name`, `gender`, `mobile`, `email`, `address`, `dob`, `password`, `description`, `picture`) VALUES
(1,	'vish',	'Male',	8654865,	'kavi2101sh@gmail.com',	'haha',	'1995-01-21',	'k@vish',	'my name is kavish baranwal',	'photo/card-3.png'),
(8,	'gfds',	'male',	8965132,	'kav@qw.cd',	'gfdsa',	'1995-02-23',	'gfrdsw',	'gfdsa',	NULL),
(9,	'hgfd',	'male',	0,	'kagfd@nbv.gfd',	'',	'1970-01-01',	'abc',	'hjgfdsa',	''),
(10,	'pragya',	'female',	0,	'pragyasharma.pss12@gmail.com',	'',	'1970-01-01',	'dszpsk',	'hello its all about social site ',	''),
(11,	'sameer',	'male',	0,	'samer@gmail.co',	'hestabit',	'1970-01-01',	'sameer',	'hestabit developer',	''),
(12,	'sameer',	'male',	0,	'samer@gmail.com',	'hstabit',	'1970-01-01',	'gmail',	'hestabit developer',	''),
(13,	'sameer',	'male',	0,	'samer@gmail.ci',	'hstabit',	'1970-01-01',	'sameer',	'hestabit developer',	''),
(14,	'Kavish Baranwal',	'male',	7503770001,	'kavishbaranwal@gmail.com',	'hestabit',	'2017-01-21',	'kavish',	'nothing',	''),
(15,	'test',	'k',	33333,	'tttttt@gmail.com',	'test',	'3333-03-31',	'testkkkk',	'3333',	''),
(16,	'bhaskar',	'male',	9999999,	'bhaskar90196@gmail.com',	'delhi',	'0001-01-01',	'bhaskar',	'testing',	''),
(17,	'',	'',	0,	'',	'',	'1970-01-01',	'',	'',	''),
(19,	'rohan',	'bw',	9899,	'rohan@gmail.com',	'mv',	'0001-01-01',	'123456',	'0000',	''),
(25,	'hello',	'',	0,	'samer@gmail.cia',	'aaaaaaa',	'1970-01-01',	'aaaaaaaaa',	'',	''),
(26,	'bbbbbbbbbbbbbbbbb',	'bhbhbh',	9898,	'bhaskar90196@gmail.om',	'bhhj',	'2008-09-08',	'bbbbbbbbbbb',	'bh',	''),
(27,	'bhaskar',	'aaaaaaa',	9666,	'bhaskar901aa96@gmail.om',	'del',	'0001-01-01',	'mamammamma',	'aaaaa',	NULL),
(28,	'deepa',	'female',	894651328,	'deepa@yahoo.cm',	'hestabit',	'2001-12-21',	'deepasingh',	'network admin at hestabit',	NULL),
(29,	'samer',	'male',	852,	'fdsfgf@fvdf.co',	'jhgfbdfghjmnbvcdtyhjnbvcd',	'1995-01-21',	'sameer',	'jhgfdd',	NULL),
(30,	'aman',	'Male',	703770001,	'amanbaranwal@gmail.com',	'lucknow',	'1992-06-19',	'deepansh',	'elder brother of user',	'/var/www/html/hestabook/photo/');

-- 2018-03-27 04:46:10
