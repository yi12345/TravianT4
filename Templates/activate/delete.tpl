<h4>Nem kaptad meg az emailt?</h4>
<div class="activation">
			To be able to play Travian a valid email address that will be sent an activation code that you need. Possible in very special circumstances do not receive the registration email.
			<br>
			<br>
			The reason can be one of the following:

			<ul>
				<li>Typographical error in the address.</li>
				<li>Address space filling.</li>
				<li>Second mistake: for example the email address .ir But your mistake is .com Typed.</li>
				<li>Your email address is sending spam email folder by mistake.</li>
			</ul>
			You can cancel your registration and <u> again with another email address </ u> sign. We will send you a new activation code.
			<p>(This side have been translated with GoogleTranslator...)</p>
		</div>
        <hr>
        <h4>Delete this account</h4>
        <form action="activate.php" method="post">
        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>" />
		<input type="hidden" name="ft" value="a3" />
			<div class="boxes activation boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
				<table cellpadding="1" cellspacing="1" class="transparent">
					<tbody><tr class="top">
						<th>Név:</th>
						<td class="name"><?php echo $database->getActivateField($_GET['id'],"username",0); ?></td>
					</tr>
					<tr class="btm">
						<th>Jelszó:</th>
						<td><input class="text" type="password" name="pw" maxlength="20"></td>
					</tr>
				</tbody></table>
				</div>
				</div>
			<div class="clear"></div><button type="submit" value="Törlés" name="delreports" id="btn_delete" onclick="document.snd.w.value=screen.width+':'+screen.height;"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Törlés</div></div></button>
		</form>