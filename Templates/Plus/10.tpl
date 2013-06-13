<?php
    
    $golds = $database->getUserArray($session->username, 0);
    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

if($session->gold >= 5) {

	if($golds['b2'] <= time()) {
		mysql_query("UPDATE ".TB_PREFIX."users set b2 = '0' where `username`='".$session->username."'") or die(mysql_error());
	}


	if($golds['b2'] == 0) {
		mysql_query("UPDATE ".TB_PREFIX."users set b2 = ".time()."+".PLUS_PRODUCTION." where `username`='".$session->username."'") or die(mysql_error());
	} else {
		mysql_query("UPDATE ".TB_PREFIX."users set b2 = b2 + ".PLUS_PRODUCTION." where `username`='".$session->username."'") or die(mysql_error());
	}


    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-5)." where `username`='".$session->username."'") or die(mysql_error());
    
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', '+25%  Production: Clay')") or die(mysql_error());

}

header("Location: plus.php?id=3");

 ?>