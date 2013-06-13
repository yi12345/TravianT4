<?php
//////////////////////////////////
//   ****  SQL SETTINGS  ****   //
//////////////////////////////////

// ***** SQL Hostname
// example. sql106.000space.com / localhost
// If you host server on own PC than this value is: localhost
// If you use online hosting, value must be written in host cpanel
define("SQL_SERVER", "%SSERVER%");

// ***** Database Username
define("SQL_USER", "%SUSER%");

// ***** Database Password
define("SQL_PASS", "%SPASS%");

// ***** Database Name
define("SQL_DB", "%SDB%");

// ***** Database - Table Prefix
define("TB_PREFIX", "%PREFIX%");

// ***** Database type
// 0 = MYSQL
// 1 = MYSQLi
// default: 1
define("DB_TYPE", %CONNECTT%);

?>