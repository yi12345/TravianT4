<?php
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);
$sql = mysql_query("SELECT * FROM ".TB_PREFIX."config");
$result = mysql_fetch_array($sql);

//////////////////////////////////
/////// قیمت های سکه ی طلا ///////
/////////// به تومان ///////////
///////////////////////////////
define("TALA_100","5,000");
define("TALA_250","9,000");
define("TALA_500","16,000");
define("TALA_1200","28,000");
define("TALA_3200","50,000");

//////////////////////////////////
///////// آیدی مدیر فروش ////////
/////////// Yahoo!ID ///////////
///////////////////////////////
define("SALES_ID","westehran");


//////////////////////////////////
// *****  ERROR REPORTING  *****//
//////////////////////////////////
// (E_ALL ^ E_NOTICE) = enabled
// (0) = disabled
%ERROR%

//////////////////////////////////
// *****  SERVER SETTINGS  *****//
//////////////////////////////////

// ***** Name
define("SERVER_NAME",$result['server_name']);

// ***** Started
// Defines when has server started.
define("COMMENCE","%STARTTIME%");

// ***** Language
// Choose your server language.
define("LANG",$result['lang']);

// ***** Speed
// Choose your server speed. NOTICE: Higher speed, more likely
// to have some bugs. Lower speed, most likely no major bugs.
// Values: 1 (normal), 3 (3x speed) etc...
define("SPEED", $result['speed']);

// ***** World size
// Defines world size. NOTICE: DO NOT EDIT!!
define("WORLD_MAX", "%MAX%");

// ***** Graphic Pack
// True = enabled, false = disabled
//!!!!!!!!!!!! DO NOT ENABLE !!!!!!!!!!!!
define("GP_ENABLE",false);
// Graphic pack location (default: gpack/travian_basic/)
define("GP_LOCATE", $result['gp_locate']);

// ***** Troop Speed
// Values: 1 (normal), 3 (3x speed) etc...
define("INCREASE_SPEED",$result['increase']);

// ***** Evasion Speed
// Values: 1 (normal), 3 (3x speed) etc...
define("EVASION_SPEED",$result['evasion']);

// ***** Add Adventure Speed
// Values: 1 (normal), 3 (3x speed) etc...
define("ADVENTURE_SPEED",$result['adventure']);

// ***** Trader capacity
// Values: 1 (normal), 3 (3x speed) etc...
define("TRADER_CAPACITY","%TRADERCAP%");

// ***** Cranny capacity
define("CRANNY_CAPACITY","%CRANNYCAP%");

// ***** Trapper capacity
define("TRAPPER_CAPACITY","%TRAPPERCAP%");

// ***** Village Expand
// 1 = slow village expanding - more Cultural Points needed for every new village
// 0 = fast village expanding - less Cultural Points needed for every new village
define("CP", %VILLAGE_EXPAND%);

// ***** Demolish Level Required
// Defines which level of Main building is required to be able to
// demolish. Min value = 1, max value = 20
// Default: 10
define("DEMOLISH_LEVEL_REQ", $result['demolish_lvl']);

// ***** Change storage capacity
define("STORAGE_MULTIPLIER","%STORAGE_MULTIPLIER%");
define("STORAGE_BASE",800*STORAGE_MULTIPLIER);

// ***** Quest
// Ingame quest enabled/disabled.
if($result['taskmaster']==1){ $quest = true; }else{ $quest = false; }
define("QUEST",$quest);

// ***** Beginners Protection
// 3600 = 1 hour
// 3600*12 = 12 hours
// 3600*24 = 1 day
// 3600*24*3 = 3 days
// You can choose any value you want!
define("PROTECTION",$result['protecttime']);
define("AUCTIONTIME",$result['auctiontime']);

// ***** Enable WW Statistics
if($result['ww']==1){ $ww = true; }else{ $ww = false; }
define("WW",$ww);

// ***** Activation Mail
// true = activation mail will be sent, users will have to finish registration
//        by clicking on link recieved in mail.
// false =  users can register with any mail. Not needed to be real one.
if($result['auth_email']==1){ $auth_email = true; }else{ $auth_email = false; }
define("AUTH_EMAIL",$auth_email);

// ***** PLUS
//Plus account lenght
define("PLUS_TIME",$result['plus_time']);
//+25% production lenght
define("PLUS_PRODUCTION",$result['plus_prodtime']);
// ***** Great Workshop
define("GREAT_WKS",%GREAT_WKS%);
// ***** Tourn threshold
define("TS_THRESHOLD",%TS_THRESHOLD%);  



//////////////////////////////////
//    **** LOG SETTINGS  ****   //
//////////////////////////////////
// LOG BUILDING/UPGRADING
if($result['log_build']==1){ $log_build = true; }else{ $log_build = false; }
define("LOG_BUILD",$log_build);
// LOG RESEARCHES
if($result['log_tech']==1){ $log_tech = true; }else{ $log_tech = false; }
define("LOG_TECH",$log_tech);
// LOG USER LOGIN (IP's)
if($result['log_login']==1){ $log_login = true; }else{ $log_login = false; }
define("LOG_LOGIN",$log_login);
// LOG GOLD
if($result['log_gold']==1){ $log_gold = true; }else{ $log_gold = false; }
define("LOG_GOLD_FIN",$log_gold);
// LOG ADMIN
if($result['log_admin']==1){ $log_admin = true; }else{ $log_admin = false; }
define("LOG_ADMIN",$log_admin);
// LOG ATTACK REPORTS
if($result['log_war']==1){ $log_war = true; }else{ $log_war = false; }
define("LOG_WAR",$log_war);
// LOG MARKET REPORTS
if($result['log_market']==1){ $log_market = true; }else{ $log_market = false; }
define("LOG_MARKET",$log_market);
// LOG ILLEGAL ACTIONS
if($result['log_illegal']==1){ $log_illegal = true; }else{ $log_illegal = false; }
define("LOG_ILLEGAL",$log_illegal);



//////////////////////////////////
// ****  NEWSBOX SETTINGS  **** //
//////////////////////////////////
//true = enabled
//false = disabled
if($result['newsbox1']==1){ $newsbox1 = true; }else{ $newsbox1 = false; }
if($result['newsbox2']==1){ $newsbox2 = true; }else{ $newsbox2 = false; }
if($result['newsbox3']==1){ $newsbox3 = true; }else{ $newsbox3 = false; }

define("NEWSBOX1",$newsbox1);
define("NEWSBOX2",$newsbox2);
define("NEWSBOX3",$newsbox3);


////////////////////////////////////
//   ****  EXTRA SETTINGS  ****   //
////////////////////////////////////

// ***** Censore words
//define("WORD_CENSOR", "%ACTCEN%");

// ***** Words (censore)
// Choose which words do you want to be censored
//define("CENSORED","%CENWORDS%");


// ***** Limit Mailbox
// Limits mailbox to defined number of mails. (IGM's)
define("LIMIT_MAILBOX",%LIMIT_MAILBOX%);
// If enabled, define number of maximum mails.
define("MAX_MAIL","%MAX_MAILS%");

// ***** Include administrator in statistics/rank
define("INCLUDE_ADMIN", %ARANK%);

// ***** Server Start Date / Time
define("START_DATE", "%SSTARTDATE%");
define("START_TIME", "%SSTARTTIME%");

// ***** Register Open/Close
define("REG_OPEN", %REG_OPEN%);

// ***** Peace system
// 0 = None
// 1 = Normal
// 2 = Christmas
// 3 = New Year
// 4 = Easter
define("PEACE",%PEACE%);

// ***** Limit troops
define("LIMIT_TROOPS",%LIMIT_TROOPS%);

////////////////////////////////////
//   ****  ADMIN SETTINGS  ****   //
////////////////////////////////////

// ***** Admin Email
define("ADMIN_EMAIL", $result['admin_email']);

// ***** Admin Name
define("ADMIN_NAME", "%ANAME%");



//////////////////////////////////////////
//   ****  DO NOT EDIT SETTINGS  ****   //
//////////////////////////////////////////
define("TRACK_USR","%UTRACK%");
define("USER_TIMEOUT","%UTOUT%"); 
define("ALLOW_BURST",false);
define("BASIC_MAX",1);
define("INNER_MAX",1);
define("PLUS_MAX",1);
define("ALLOW_ALL_TRIBE",false);
define("CFM_ADMIN_ACT",true);
define("SERVER_WEB_ROOT",false);
define("USRNM_SPECIAL",true);
define("USRNM_MIN_LENGTH",3);
define("PW_MIN_LENGTH",4);
define("BANNED",0);
define("AUTH",1);
define("USER",2);
define("MULTIHUNTER",8);
define("ADMIN",9);
define("COOKIE_EXPIRE", 60*60*24*7); 
define("COOKIE_PATH", "/"); 


////////////////////////////////////////////
//   ****  DOMAIN/SERVER SETTINGS  ****   //
////////////////////////////////////////////
define("DOMAIN", $result['server_url']);
define("HOMEPAGE", $result['server_url']);
define("SERVER", $result['server_url']);

?>