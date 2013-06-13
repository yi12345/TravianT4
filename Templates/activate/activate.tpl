<?php
if(isset($_GET['id']) && isset($_GET['q'])) {
$act2 = $database->getActivateField($_GET['id'],"act2",0);
	if($act2 == $_GET['q']){
		$show = '1';
		$name = $database->getActivateField($_GET['id'],"username",0);
		$email = $database->getActivateField($_GET['id'],"email",0);
	}
}

if(isset($show)){
?>
<div class="activation">
				Helló <?php echo $name; ?>,
				<br>
				<br>
				A regisztráció sikeres volt. Pár perc múlva meg is kapod az emailt a további információkkal
<br><br>
Az emailt elküldtük a megadott címre: <span class="email"><b><?php echo $email; ?></b></span>
			</div>
            
            <div class="activation">
				Az aktivációhoz vagy az aktivációs kódhoz lépjen be az email fiókjába
			</div>
            
            <form action="activate.php" method="post">
				<div class="code"><b>
					Aktivációs kód:</b>
				</div>
				<div>
					<input class="text" type="text" name="id" maxlength="10" />
                    <button type="submit" value="Megerősít" name="s1" id="btn_send" class="sendActivation">
                    
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Megerősít</div></div></button></div>
			</form>
            <hr>
            
            <div class="no_mail">
				<a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email,5); ?>">Nem kaptad meg az emailt?</a>
				<br>
				Néha az email-t a levelező kliens spamnek érzékeli. Kattints a segítségért <a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email,5); ?>">IDE</a>!
			</div>
            
            <?php } else {
?>
			<div id="activation">
				<form action="activate.php" method="post">
						<b>Aktivációs kód:</b><br />
					<input class="text" type="text" name="id" maxlength="10" />
                        <button type="submit" value="Send" name="s1" id="btn_send" onclick="document.snd.w.value=screen.width+':'+screen.height;">
       					 <div class="button-container">
                         <div class="button-position">
                         <div class="btl">
                         <div class="btr">
                         <div class="btc"></div></div></div>
                         <div class="bml">
                         <div class="bmr">
                         <div class="bmc"></div></div></div>
                         <div class="bbl">
                         <div class="bbr">
                         <div class="bbc"></div></div></div></div>
       					 <div class="button-contents">Megerősít</div></div>
        				</button>
                        <input type="hidden" name="ft" value="a2" />
				</form>
                </div>
			
<?php }
?>