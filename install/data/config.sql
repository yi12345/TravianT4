-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2011 at 02:49 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `%prefix%config`
--

CREATE TABLE IF NOT EXISTS `%PREFIX%config` (
  `server_name` varchar(60) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `speed` int(4) NOT NULL,
  `gp_locate` varchar(45) NOT NULL,
  `increase` int(4) NOT NULL,
  `evasion` int(4) NOT NULL,
  `adventure` int(4) NOT NULL,
  `demolish_lvl` int(2) NOT NULL,
  `taskmaster` int(1) NOT NULL,
  `protecttime` int(6) NOT NULL,
  `auctiontime` int(6) NOT NULL,
  `ww` int(1) NOT NULL,
  `auth_email` int(1) NOT NULL,
  `plus_time` int(6) NOT NULL,
  `plus_prodtime` int(6) NOT NULL,
  `log_build` int(1) NOT NULL,
  `log_tech` int(1) NOT NULL,
  `log_login` int(1) NOT NULL,
  `log_gold` int(1) NOT NULL,
  `log_admin` int(1) NOT NULL,
  `log_war` int(1) NOT NULL,
  `log_market` int(1) NOT NULL,
  `log_illegal` int(1) NOT NULL,
  `newsbox1` int(1) NOT NULL,
  `newsbox2` int(1) NOT NULL,
  `newsbox3` int(1) NOT NULL,
  `admin_email` varchar(45) NOT NULL,
  `server_url` varchar(60) NOT NULL
  
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `%prefix%config`
--