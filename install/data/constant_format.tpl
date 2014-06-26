<?php
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);
$sql = mysql_query("SELECT * FROM ".TB_PREFIX."config");
$result = mysql_fetch_array($sql);

//////////////////////////////////
/////// قیمت های سکه ی طلا ///////
/////////// به تومان ///////////
///////////////////////////////
if(!defined("TALA_100")) define("TALA_100","5,000");
if(!defined("TALA_250")) define("TALA_250","9,000");
if(!defined("TALA_500")) define("TALA_500","16,000");
if(!defined("TALA_1200")) define("TALA_1200","28,000");
if(!defined("TALA_3200")) define("TALA_3200","50,000");

//////////////////////////////////
///////// آیدی مدیر فروش ////////
/////////// Yahoo!ID ///////////
///////////////////////////////
if(!defined("SALES_ID")) define("SALES_ID","westehran");


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
if(!defined("SERVER_NAME")) define("SERVER_NAME",$result['server_name']);

// ***** Started
// Defines when has server started.
if(!defined("COMMENCE")) define("COMMENCE","%STARTTIME%");

// ***** Language
// Choose your server language.
if(!defined("LANG")) define("LANG",$result['lang']);

// ***** Speed
// Choose your server speed. NOTICE: Higher speed, more likely
// to have some bugs. Lower speed, most likely no major bugs.
// Values: 1 (normal), 3 (3x speed) etc...
if(!defined("SPEED")) define("SPEED", $result['speed']);

// ***** World size
// Defines world size. NOTICE: DO NOT EDIT!!
if(!defined("WORLD_MAX")) define("WORLD_MAX", "%MAX%");

// ***** Graphic Pack
// True = enabled, false = disabled
//!!!!!!!!!!!! DO NOT ENABLE !!!!!!!!!!!!
if(!defined("GP_ENABLE")) define("GP_ENABLE",false);
// Graphic pack location (default: gpack/travian_basic/)
if(!defined("GP_LOCATE")) define("GP_LOCATE", $result['gp_locate']);

// ***** Troop Speed
// Values: 1 (normal), 3 (3x speed) etc...
if(!defined("INCREASE_SPEED")) define("INCREASE_SPEED",$result['increase']);

// ***** Evasion Speed
// Values: 1 (normal), 3 (3x speed) etc...
if(!defined("EVASION_SPEED")) define("EVASION_SPEED",$result['evasion']);

// ***** Heal Speed
// Values: 1 (normal), 3 (3x speed) etc...
if(!defined("HEAL_SPEED")) define("HEAL_SPEED",$result['heal']);

// ***** Add Adventure Speed
// Values: 1 (normal), 3 (3x speed) etc...
if(!defined("ADVENTURE_SPEED")) define("ADVENTURE_SPEED",$result['adventure']);

// ***** Trader capacity
// Values: 1 (normal), 3 (3x speed) etc...
if(!defined("TRADER_CAPACITY")) define("TRADER_CAPACITY","%TRADERCAP%");

// ***** Cranny capacity
if(!defined("CRANNY_CAPACITY")) define("CRANNY_CAPACITY","%CRANNYCAP%");

// ***** Trapper capacity
if(!defined("TRAPPER_CAPACITY")) define("TRAPPER_CAPACITY","%TRAPPERCAP%");

// ***** Village Expand
// 1 = slow village expanding - more Cultural Points needed for every new village
// 0 = fast village expanding - less Cultural Points needed for every new village
if(!defined("CP")) define("CP", %VILLAGE_EXPAND%);

// ***** Demolish Level Required
// Defines which level of Main building is required to be able to
// demolish. Min value = 1, max value = 20
// Default: 10
if(!defined("DEMOLISH_LEVEL_REQ")) define("DEMOLISH_LEVEL_REQ", $result['demolish_lvl']);

// ***** Change storage capacity
if(!defined("STORAGE_MULTIPLIER")) define("STORAGE_MULTIPLIER","%STORAGE_MULTIPLIER%");
if(!defined("STORAGE_BASE")) define("STORAGE_BASE",800*STORAGE_MULTIPLIER);

// ***** Quest
// Ingame quest enabled/disabled.
if($result['taskmaster']==1){ $quest = true; }else{ $quest = false; }
if(!defined("QUEST")) define("QUEST",$quest);

// ***** Beginners Protection
// 3600 = 1 hour
// 3600*12 = 12 hours
// 3600*24 = 1 day
// 3600*24*3 = 3 days
// You can choose any value you want!
if(!defined("PROTECTION")) define("PROTECTION",$result['protecttime']);
if(!defined("AUCTIONTIME")) define("AUCTIONTIME",$result['auctiontime']);

// ***** Enable WW Statistics
if($result['ww']==1){ $ww = true; }else{ $ww = false; }
if(!defined("WW")) define("WW",$ww);

// ***** Activation Mail
// true = activation mail will be sent, users will have to finish registration
//        by clicking on link recieved in mail.
// false =  users can register with any mail. Not needed to be real one.
if($result['auth_email']==1){ $auth_email = true; }else{ $auth_email = false; }
if(!defined("AUTH_EMAIL")) define("AUTH_EMAIL",$auth_email);

// ***** PLUS
//Plus account lenght
if(!defined("PLUS_TIME")) define("PLUS_TIME",$result['plus_time']);
//+25% production lenght
if(!defined("PLUS_PRODUCTION")) define("PLUS_PRODUCTION",$result['plus_prodtime']);
// ***** Great Workshop
if(!defined("GREAT_WKS")) define("GREAT_WKS",%GREAT_WKS%);
// ***** Tourn threshold
if(!defined("TS_THRESHOLD")) define("TS_THRESHOLD",%TS_THRESHOLD%);



//////////////////////////////////
//    **** LOG SETTINGS  ****   //
//////////////////////////////////
// LOG BUILDING/UPGRADING
if($result['log_build']==1){ $log_build = true; }else{ $log_build = false; }
if(!defined("LOG_BUILD")) define("LOG_BUILD",$log_build);
// LOG RESEARCHES
if($result['log_tech']==1){ $log_tech = true; }else{ $log_tech = false; }
if(!defined("LOG_TECH")) define("LOG_TECH",$log_tech);
// LOG USER LOGIN (IP's)
if($result['log_login']==1){ $log_login = true; }else{ $log_login = false; }
if(!defined("LOG_LOGIN")) define("LOG_LOGIN",$log_login);
// LOG GOLD
if($result['log_gold']==1){ $log_gold = true; }else{ $log_gold = false; }
if(!defined("LOG_GOLD_FIN")) define("LOG_GOLD_FIN",$log_gold);
// LOG ADMIN
if($result['log_admin']==1){ $log_admin = true; }else{ $log_admin = false; }
if(!defined("LOG_ADMIN")) define("LOG_ADMIN",$log_admin);
// LOG ATTACK REPORTS
if($result['log_war']==1){ $log_war = true; }else{ $log_war = false; }
if(!defined("LOG_WAR")) define("LOG_WAR",$log_war);
// LOG MARKET REPORTS
if($result['log_market']==1){ $log_market = true; }else{ $log_market = false; }
if(!defined("LOG_MARKET")) define("LOG_MARKET",$log_market);
// LOG ILLEGAL ACTIONS
if($result['log_illegal']==1){ $log_illegal = true; }else{ $log_illegal = false; }
if(!defined("LOG_ILLEGAL")) define("LOG_ILLEGAL",$log_illegal);



//////////////////////////////////
// ****  NEWSBOX SETTINGS  **** //
//////////////////////////////////
//true = enabled
//false = disabled
if($result['newsbox1']==1){ $newsbox1 = true; }else{ $newsbox1 = false; }
if($result['newsbox2']==1){ $newsbox2 = true; }else{ $newsbox2 = false; }
if($result['newsbox3']==1){ $newsbox3 = true; }else{ $newsbox3 = false; }
if($result['home1']==1){ $home1 = true; }else{ $home1 = false; }
if($result['home2']==1){ $home2 = true; }else{ $home2 = false; }
if($result['home3']==1){ $home3 = true; }else{ $home3 = false; }

if(!defined("NEWSBOX1")) define("NEWSBOX1",$newsbox1);
if(!defined("NEWSBOX2")) define("NEWSBOX2",$newsbox2);
if(!defined("NEWSBOX3")) define("NEWSBOX3",$newsbox3);

if(!defined("HOME1")) define("HOME1",$home1);
if(!defined("HOME2")) define("HOME2",$home2);
if(!defined("HOME3")) define("HOME3",$home3);


////////////////////////////////////
//   ****  EXTRA SETTINGS  ****   //
////////////////////////////////////

// ***** Censore words
//if(!defined("WORD_CENSOR")) define("WORD_CENSOR", "%ACTCEN%");

// ***** Words (censore)
// Choose which words do you want to be censored
//if(!defined("CENSORED")) define("CENSORED","%CENWORDS%");


// ***** Limit Mailbox
// Limits mailbox to defined number of mails. (IGM's)
if(!defined("LIMIT_MAILBOX")) define("LIMIT_MAILBOX",%LIMIT_MAILBOX%);
// If enabled, define number of maximum mails.
if(!defined("MAX_MAIL")) define("MAX_MAIL","%MAX_MAILS%");

// ***** Include administrator in statistics/rank
if(!defined("INCLUDE_ADMIN")) define("INCLUDE_ADMIN", %ARANK%);

// ***** Server Start Date / Time
if(!defined("START_DATE")) define("START_DATE", "%SSTARTDATE%");
if(!defined("START_TIME")) define("START_TIME", "%SSTARTTIME%");

// ***** Register Open/Close
if(!defined("REG_OPEN")) define("REG_OPEN", %REG_OPEN%);

// ***** Peace system
// 0 = None
// 1 = Normal
// 2 = Christmas
// 3 = New Year
// 4 = Easter
if(!defined("PEACE")) define("PEACE",%PEACE%);

// ***** Limit troops
if(!defined("LIMIT_TROOPS")) define("LIMIT_TROOPS",%LIMIT_TROOPS%);

////////////////////////////////////
//   ****  ADMIN SETTINGS  ****   //
////////////////////////////////////

// ***** Admin Email
if(!defined("ADMIN_EMAIL")) define("ADMIN_EMAIL", $result['admin_email']);

// ***** Admin Name
if(!defined("ADMIN_NAME")) define("ADMIN_NAME", "%ANAME%");



//////////////////////////////////////////
//   ****  DO NOT EDIT SETTINGS  ****   //
//////////////////////////////////////////
if(!defined("TRACK_USR"))        define("TRACK_USR","%UTRACK%");
if(!defined("USER_TIMEOUT"))     define("USER_TIMEOUT","%UTOUT%");
if(!defined("ALLOW_BURST"))      define("ALLOW_BURST",false);
if(!defined("BASIC_MAX"))        define("BASIC_MAX",1);
if(!defined("INNER_MAX"))        define("INNER_MAX",1);
if(!defined("PLUS_MAX"))         define("PLUS_MAX",1);
if(!defined("ALLOW_ALL_TRIBE"))  define("ALLOW_ALL_TRIBE",false);
if(!defined("CFM_ADMIN_ACT"))    define("CFM_ADMIN_ACT",true);
if(!defined("SERVER_WEB_ROOT"))  define("SERVER_WEB_ROOT",false);
if(!defined("USRNM_SPECIAL"))    define("USRNM_SPECIAL",true);
if(!defined("USRNM_SPECIAL"))    define("USRNM_SPECIAL",3);
if(!defined("PW_MIN_LENGTH"))    define("PW_MIN_LENGTH",4);
if(!defined("BANNED"))           define("BANNED",0);
if(!defined("AUTH"))             define("AUTH",1);
if(!defined("USER"))             define("USER",2);
if(!defined("MULTIHUNTER"))      define("MULTIHUNTER",8);
if(!defined("ADMIN"))            define("ADMIN",9);
if(!defined("COOKIE_EXPIRE"))    define("COOKIE_EXPIRE", 60*60*24*7);
if(!defined("COOKIE_PATH"))      define("COOKIE_PATH", "/");


////////////////////////////////////////////
//   ****  DOMAIN/SERVER SETTINGS  ****   //
////////////////////////////////////////////
if(!defined("DOMAIN"))   define("DOMAIN", $result['server_url']);
if(!defined("HOMEPAGE")) define("HOMEPAGE", $result['server_url']);
if(!defined("SERVER"))   define("SERVER", $result['server_url']);

?>