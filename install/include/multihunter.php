<?php

        include ("../../GameEngine/Database.php");
        include ("../../GameEngine/Admin/database.php");
		
        include ("../../GameEngine/config.php");
        include ("../../GameEngine/lang/" . LANG . ".php");

        mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
        mysql_select_db(SQL_DB);
		
		$StartNatars = true;
/**
 * Functions
 */
        
        if(isset($_POST['mhpw'])) {
        	$password = $_POST['mhpw'];
        	mysql_query("UPDATE " . TB_PREFIX . "users SET password = '" . md5($password) . "' WHERE username = 'Multihunter'");
			mysql_query("UPDATE " . TB_PREFIX . "users SET password = '" . md5($password) . "' WHERE username = 'Support'");
        	$wid = $admin->getWref(1, 0);
        	$uid = 4;
        	$status = $database->getVillageState($wid);
        	if($status == 0) {
        		$database->setFieldTaken($wid);
        		$database->addVillage($wid, $uid, 'Multihunter', '1');
        		$database->addResourceFields($wid, $database->getVillageType($wid));
        		$database->addUnits($wid);
        		$database->addTech($wid);
        		$database->addABTech($wid);
        	}
        }


if($StartNatars){
		$username = "Natars";
        $password = $_POST['mhpw'];
        $email = "natars@travianx.com";
        $desc = "[#natars]";
		$uid = 2;

        mysql_query("INSERT INTO " . TB_PREFIX . "users (id,username,password,access,email,timestamp,desc2,tribe,location,act,protect,quest,fquest) VALUES ('$uid', 'Natars', '" . md5($password) . "', 2, '$email', ".time().", '$desc', 5, '', '', 0, 25, 35)");
        
        $wid = $admin->getWref(0, 0);
        $status = $database->getVillageState($wid);
        if($status == 0) {
        	$database->setFieldTaken($wid);
            $database->addVillage($wid, $uid, '1', 'Natars');
        	$database->addResourceFields($wid, $database->getVillageType($wid));
        	$database->addUnits($wid);
        	$database->addTech($wid);
        	$database->addABTech($wid);
        }
        mysql_query("UPDATE " . TB_PREFIX . "vdata SET pop = '781' WHERE owner = $uid") or die(mysql_error());
        if(SPEED > 3) {
        	$speed = 5;
        } else {
        	$speed = SPEED;
        }
        mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (94700 * $speed) . ", u42 = " . (295231 * $speed) . ", u43 = " . (180747 * $speed) . ", u44 = " . (1048 * $speed) . ", u45 = " . (364401 * $speed) . ", u46 = " . (217602 * $speed) . ", u47 = " . (2034 * $speed) . ", u48 = " . (1040 * $speed) . " , u49 = " . (1 * $speed) . ", u50 = " . (9 * $speed) . " WHERE vref = " . $wid['wref'] . "") or die(mysql_error());

	for($i=1;$i<=14;$i++){
		switch ($i) {
			case 1:
				$x=0;
				$y=-21;
				break;
			case 2:
				$x=15;
				$y=15;
				break;
			case 3:
				$x=21;
				$y=0;
				break;
			case 4:
				$x=-2;
				$y=12;
				break;
			case 5:
				$x=-12;
				$y=2;
				break;
			case 6:
				$x=-5;
				$y=-11;
				break;
			case 7:
				$x=15;
				$y=-15;
				break;
			case 8:
				$x=11;
				$y=6;
				break;
			case 9:
				$x=0;
				$y=21;
				break;
			case 10:
				$x=-15;
				$y=15;
				break;
			case 11:
				$x=-21;
				$y=0;
				break;
			case 12:
				$x=-15;
				$y=-15;
				break;
			case 13:
				$x=9;
				$y=-8;
				break;
		}
		
		$wid = $admin->getWref($x, $y);
        $status = $database->getVillageState($wid);
        if($status == 0) {
        	$database->setFieldTaken($wid);
        	$database->addVillage($wid, $uid, 'Natars', '1');
        	$database->addResourceFields($wid, $database->getVillageType($wid));
        	$database->addUnits($wid);
        	$database->addTech($wid);
        	$database->addABTech($wid);
			mysql_query("UPDATE " . TB_PREFIX . "vdata SET pop = '238' WHERE wref = '$wid'");
			mysql_query("UPDATE " . TB_PREFIX . "vdata SET name = 'WW Village' WHERE wref = '$wid'");
			mysql_query("UPDATE " . TB_PREFIX . "vdata SET capital = 0 WHERE wref = '$wid'");
			mysql_query("UPDATE " . TB_PREFIX . "vdata SET natar = 1 WHERE wref = '$wid'");
			if(SPEED > 5) {
				$speed = 5;
			} else {
				$speed = SPEED;
			}
			mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (rand(1000, 2000) * $speed) . ", u42 = " . (rand(1500, 2000) * $speed) . ", u43 = " . (rand(2300, 2800) * $speed) . ", u44 = " . (rand(235, 575) * $speed) . ", u45 = " . (rand(1200, 1900) * $speed) . ", u46 = " . (rand(1500, 2000) * $speed) . ", u47 = " . (rand(500, 900) * $speed) . ", u48 = " . (rand(100, 300) * $speed) . " , u49 = " . (rand(1, 5) * $speed) . ", u50 = " . (rand(1, 5) * $speed) . " WHERE vref = " . $wid . "");
			mysql_query("UPDATE " . TB_PREFIX . "fdata SET f22t = 27, f22 = 10, f28t = 25, f28 = 10, f19t = 23, f19 = 10, f99t = 40, f26 = 0, f26t = 0, f21 = 1, f21t = 15, f39 = 1, f39t = 16 WHERE vref = " . $wid . "");
        }
	}
}

        header("Location: ../index.php?s=5");

?>