<?php 

/** --------------------------------------------------- **\ 
| ********* DO NOT REMOVE THIS COPYRIGHT NOTICE ********* | 
+---------------------------------------------------------+ 
| Released by:   Dzoki < dzoki.travian@gmail.com >        | 
| Copyright:     TravianX Project All rights reserved     | 
\** --------------------------------------------------- **/ 


    include_once ("../../Session.php"); 

/** 
 * If user is not administrator, access is denied! 
 */ 
    if($session->access < ADMIN) 
        die("Access Denied: You are not Admin!"); 


/** 
 * $id      admin userid 
 * $kid     random position on map (++|--|+-|-+) 
 * $amt     number of villages to add 
 * $wid     village id (wref/vref) 
 * $type    needed to generate village fields 
 */ 

    $id = $_POST['id']; 
    $amt = $_POST['vill_amount']; 

    for($i = 1; $i <= $amt; $i++) { 

        $kid = rand(1, 4); 
        $wid = $database->generateBase($kid); 
        $type = $database->getVillageType($wid); 

        $database->setFieldTaken($wid); 
        mysql_query("INSERT INTO `".TB_PREFIX. 
            "vdata`(`wref`,`owner`,`name`,`capital`,`pop`,`cp`,`celebration`,`type`,`wood`,`clay`,`iron`,`maxstore`,`crop`,`maxcrop`,`lastupdate`,`loyalty`,`exp1`,`exp2`,`exp3`,`created`) values ('$wid','3','WW Village',0,200,0,0,0,80000.00,80000.00,80000.00,80000,80000.00,80000,1314974534,100,0,0,0,1314968914)") or die(mysql_error()); 
        $database->addResourceFields($wid, $type); 

        // Add residence and treasury 
        // Residence  =  25 (Level 20) 
        mysql_query("UPDATE `".TB_PREFIX."fdata` SET `f28` = '20', `f28t` = '25', `f99t` = '40', `f99` = '1', `wwname` = 'World Wonder' WHERE `vref` = $wid") or die(mysql_error()); 

        $database->addUnits($wid); 
        $database->addTech($wid); 
        $database->addABTech($wid); 

        // Random number of units 
        mysql_query("UPDATE ".TB_PREFIX."units SET u41 = ".rand(1000, 10000).", u42 = ".rand(1000, 10000).", u43 = ".rand(1000, 10000).", u44 = ".rand(1000, 10000).", u45 = ".rand(1000, 10000).", u46 = ".rand(1000, 10000).", u47 = ".rand(1000, 10000).", u48 = ".rand(1000, 10000)." , u49 = ".rand(1000, 10000).", u50 = ".rand(1000, 10000)." WHERE vref = ".$wid."") or die(mysql_error()); 

    } 


/** 
 * Insert the log into the database 
 */ 
    mysql_query("INSERT INTO ".TB_PREFIX."admin_log values (0,$id,'Generated <b>$amt</b> of WW villages',".time().")") or die(mysql_error()); 

/** 
 * Redirect 
 */ 
    header("Location: ../../../Admin/admin.php?p=natarend&g"); ?>