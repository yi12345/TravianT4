<?php
	include_once ("GameEngine/Database.php");
	include_once ("GameEngine/Generator.php");
	function addVillage($wid, $uid, $username, $capital) {
		$vname = $name." Village";
				
        $time = time();
        $q = "INSERT into " . TB_PREFIX . "vdata (wref, owner, name, capital, pop, cp, celebration, wood, clay, iron, maxstore, crop, maxcrop, lastupdate, created) values 
        ('$wid', '$uid', '$vname', '$capital', ".rand(2,10000).", 1, 0, 780, 780, 780, 800, 780, 800, '$time', '$time')";
        return mysql_query($q) or die(mysql_error());
    }
	for($i=6;$i<=100;$i++){
		
		$name = "test".$i;
		$pw = "1234";
		$email = "test".$i."@mail.com";
		$kid = rand(1,4);
		$act = $generator->generateRandStr(10);
		$uid = $database->register($name,md5($pw),$email,rand(1,3),$kid,$act);
		
		$frandom0 = rand(0,3);$frandom1 = rand(0,3);$frandom2 = rand(0,4);$frandom3 = rand(0,3);
		$database->addHeroFace($uid,$frandom0,$frandom1,$frandom2,$frandom3,$frandom3,$frandom2,$frandom1,$frandom0,$frandom2);
		$database->addHero($uid);
		$database->addHeroinventory($uid);
				
		$wid = $database->generateBase($kid);
		$database->modifyHero2('wref', $wid, $uid, 0);
		$database->setFieldTaken($wid);
		addVillage($wid, $uid, $name, 1);
		$database->addResourceFields($wid,$database->getVillageType($wid));
		$database->addUnits($wid);
		$database->addTech($wid);
		$database->addABTech($wid);
		$database->updateUserField($uid,"access",USER,1);
		$database->updateUserField($uid,"location","",1);
		
	}
?>