<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       Mailer.php                                                  ##
##  Developed by:  Dixie                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

class Mailer {
	
	function sendActivate($email,$username,$pass,$act) {
		
	$subject = "خوش آمدید ".SERVER_NAME." به";
	$message = "سلام ".$username."

بخاطر عضویت شما متشکریم

----------------------------
نام: ".$username."
رمز عبور: ".$pass."
کد فعالسازی: ".$act."
----------------------------

برای فعال کردن اکانت خود لطفا روی این لینک کلیک کنید:
".HOMEPAGE."activate.php?code=".$act."

با تشکر، ".SERVER_NAME;
				
	$headers = "From: ".ADMIN_EMAIL."\n";
		
	mail($email, $subject, $message, $headers);
	}
	
	
	function sendPassword($email, $npw, $act, $username) {
		
	$subject = "رمز عبور را فراموش کردید؟";
	$message = "سلام ".$username."

این ایمیل بخاطر درخواست شما برای رمز عبور جدید ارسال شده است!
اگر شما این درخواست را کردید با دقت ادامه دهید

----------------------------
نام اکانت: ".$username."
رمز عبور جدید: ".$npw."
----------------------------

برای فعال کردن رمز جدید لطفا روی این لینک کلیک کنید:
".HOMEPAGE."password.php?user=".$username."&npw=".$npw."&code=".$act."

با تشکر، ".SERVER_NAME;
				
	$headers = "From: ".ADMIN_EMAIL."\n";
		
	mail($email, $subject, $message, $headers);
	}
	
};
$mailer = new Mailer;
?>