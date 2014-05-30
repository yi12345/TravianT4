<?php
//////////////////////////////////
//   ****  SQL SETTINGS  ****   //
//////////////////////////////////

// ***** SQL Hostname
// example. sql106.000space.com / localhost
// If you host server on own PC than this value is: localhost
// If you use online hosting, value must be written in host cpanel
if(!define("SQL_SERVER") define("SQL_SERVER", "%SSERVER%");

// ***** Database Username
if(!define("SQL_USER")) define("SQL_USER", "%SUSER%");

// ***** Database Password
if(!define("SQL_PASS")) define("SQL_PASS", "%SPASS%");

// ***** Database Name
if(!define("SQL_DB")) define("SQL_DB", "%SDB%");

// ***** Database - Table Prefix
if(!define("TB_PREFIX")) define("TB_PREFIX", "%PREFIX%");

// ***** Database type
// 0 = MYSQL
// 1 = MYSQLi
// default: 1
if(!define("DB_TYPE")) define("DB_TYPE", %CONNECTT%);

?>