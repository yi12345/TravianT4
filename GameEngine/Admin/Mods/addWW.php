<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       addArtefacts.php                                            ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################

ini_set('max_execution_time', 1000);
error_reporting(E_ALL);

include_once("../../config.php");
include_once("../../Database/db_MYSQL.php");

mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

$session = $_POST['admid'];

$sql = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id = ".$session."");
$access = mysql_fetch_array($sql);
$sessionaccess = $access['access'];

if($sessionaccess != 9) die("<h1><font color=\"red\">Access Denied: You are not Admin!</font></h1>");

$sql = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE username LIKE 'Natars'");
$result = mysql_fetch_assoc($sql);

if(count($result) > 1) ## Natar Account Exists
{
	if(SPEED > 3){ $speed = 5; }
	else { $speed = SPEED; }
    $amt = $_POST['amount']; 

    for($i = 1; $i <= $amt; $i++)
	{
		$kid = rand(1, 4); 
		$wid = $database->generateBase($kid); 
		$type = $database->getVillageType($wid); 
		$database->setFieldTaken($wid); 
        mysql_query("INSERT INTO `".TB_PREFIX."vdata`(`wref`,`owner`,`name`,`capital`,`pop`,`cp`,`celebration`,`type`,`wood`,`clay`,`iron`,`maxstore`,`crop`,`maxcrop`,`lastupdate`,`loyalty`,`exp1`,`exp2`,`exp3`,`created`) values ('$wid','3','WW Village',0,200,0,0,0,80000.00,80000.00,80000.00,80000,80000.00,80000,1314974534,100,0,0,0,1314968914)") or die(mysql_error()); 
        $database->addResourceFields($wid, $type); 
        ## Add residence and treasury: Residence  =  25 (Level 20) 
        mysql_query("UPDATE `".TB_PREFIX."fdata` SET `f28` = '20', `f28t` = '25', `f99t` = '40', `f99` = '0', `wwname` = 'World Wonder' WHERE `vref` = $wid") or die(mysql_error()); 
        $database->addUnits($wid); 
        $database->addTech($wid); 
        $database->addABTech($wid); 
        ## Random number of units 
		mysql_query("UPDATE ".TB_PREFIX."units SET u41 = ".(rand($_POST['ww1u41'], $_POST['ww2u41']) * $speed).", u42 = ".(rand($_POST['ww1u42'],  $_POST['ww2u42']) * $speed).", u43 = ".(rand($_POST['ww1u43'], $_POST['ww2u43']) * $speed).", u44 = ".(rand($_POST['ww1u44'], $_POST['ww2u44']) * $speed).", u45 = ".(rand($_POST['ww1u45'], $_POST['ww2u45']) * $speed).", u46 = ".(rand($_POST['ww1u46'],  $_POST['ww2u46']) * $speed).", u47 = ".(rand($_POST['ww1u47'],  $_POST['ww2u47']) * $speed).", u48 = ".(rand($_POST['ww1u48'], $_POST['ww2u48']) * $speed)." , u49 = ".(rand($_POST['ww1u49'], $_POST['ww2u49']) * $speed).", u50 = ".(rand($_POST['ww1u50'], $_POST['ww2u50']) * $speed)." WHERE vref = ".$wid."");
        ##mysql_query("UPDATE ".TB_PREFIX."units SET u41 = ".rand(1000, 10000).", u42 = ".rand(1000, 10000).", u43 = ".rand(1000, 10000).", u44 = ".rand(1000, 10000).", u45 = ".rand(1000, 10000).", u46 = ".rand(1000, 10000).", u47 = ".rand(1000, 10000).", u48 = ".rand(1000, 10000)." , u49 = ".rand(1000, 10000).", u50 = ".rand(1000, 10000)." WHERE vref = ".$wid."") or die(mysql_error()); 
    }
    header("Location: ../../../Admin/admin.php?p=addWW&g&amt=".$_POST['amount'].""); 
}
else
{
	header("Location: ../../../Admin/admin.php?p=npctribecreatenatar");
}?>