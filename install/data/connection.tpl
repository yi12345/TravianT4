<?php
//////////////////////////////////
//   ****  SQL SETTINGS  ****   //
//////////////////////////////////

// ***** SQL Hostname
// example. sql106.000space.com / localhost
// If you host server on own PC than this value is: localhost
// If you use online hosting, value must be written in host cpanel
if(!defined("SQL_SERVER")) define("SQL_SERVER", "%SSERVER%");

// ***** Database Username
if(!defined("SQL_USER")) define("SQL_USER", "%SUSER%");

// ***** Database Password
if(!defined("SQL_PASS")) define("SQL_PASS", "%SPASS%");

// ***** Database Name
if(!defined("SQL_DB")) define("SQL_DB", "%SDB%");

// ***** Database - Table Prefix
if(!defined("TB_PREFIX")) define("TB_PREFIX", "%PREFIX%");

// ***** Database type
// 0 = MYSQL
// 1 = MYSQLi
// default: 1
if(!defined("DB_TYPE")) define("DB_TYPE", %CONNECTT%);

?>