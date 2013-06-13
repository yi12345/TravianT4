<?php
    
    $golds = $database->getUserArray($session->username, 0);
    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

if($session->gold >= 5) {

	if($golds['b4'] <= time()) {
		mysql_query("UPDATE ".TB_PREFIX."users set b4 = '0' where `username`='".$session->username."'") or die(mysql_error());
	}


	if($golds['b4'] == 0) {
		mysql_query("UPDATE ".TB_PREFIX."users set b4 = ".time()."+".PLUS_PRODUCTION." where `username`='".$session->username."'") or die(mysql_error());
	} else {
		mysql_query("UPDATE ".TB_PREFIX."users set b4 = b4 + ".PLUS_PRODUCTION." where `username`='".$session->username."'") or die(mysql_error());
	}


    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-5)." where `username`='".$session->username."'") or die(mysql_error());
    
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', '+25%  Production: Crop')") or die(mysql_error());

}

header("Location: plus.php?id=3");

 ?>