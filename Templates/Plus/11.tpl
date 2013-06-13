<?php
    
    $golds = $database->getUserArray($session->username, 0);
    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

if($session->gold >= 5) {

	if($golds['b3'] <= time()) {
		mysql_query("UPDATE ".TB_PREFIX."users set b3 = '0' where `username`='".$session->username."'") or die(mysql_error());
	}


	if($golds['b3'] == 0) {
		mysql_query("UPDATE ".TB_PREFIX."users set b3 = ".time()."+".PLUS_PRODUCTION." where `username`='".$session->username."'") or die(mysql_error());
	} else {
		mysql_query("UPDATE ".TB_PREFIX."users set b3 = b3 + ".PLUS_PRODUCTION." where `username`='".$session->username."'") or die(mysql_error());
	}


    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-5)." where `username`='".$session->username."'") or die(mysql_error());
    
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', '+25%  Production: Iron')") or die(mysql_error());

}

header("Location: plus.php?id=3");

 ?>