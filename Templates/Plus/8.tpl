<?php
    
    $golds = $database->getUserArray($session->username, 0);
    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

if($session->gold >= 10) {

	if($golds['plus'] <= time()) {
		mysql_query("UPDATE ".TB_PREFIX."users set plus = '0' where `username`='".$session->username."'") or die(mysql_error());
	}


	if($golds['plus'] == 0) {
		mysql_query("UPDATE ".TB_PREFIX."users set plus = ".time()."+".PLUS_TIME." where `username`='".$session->username."'") or die(mysql_error());
	} else {
		mysql_query("UPDATE ".TB_PREFIX."users set plus = plus + ".PLUS_TIME." where `username`='".$session->username."'") or die(mysql_error());
	}


    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-10)." where `username`='".$session->username."'") or die(mysql_error());
    
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Activate Plus+ Account')") or die(mysql_error());

}

header("Location: plus.php?id=3");

 ?>