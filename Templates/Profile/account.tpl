<form action="spieler.php" method="POST">
<input type="hidden" name="ft" value="p3">
<input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
	
<h4 class="round">Change Password</h4>

<table cellpadding="1" cellspacing="1" id="change_pass" class="account transparent">
	<tbody>
		<tr>
			<th class="col1">Old Password</th>
			<td><input class="text" type="password" name="pw1" maxlength="20"></td>
		</tr>
		<tr>
			<th>New password</th>
			<td><input class="text" type="password" name="pw2" maxlength="20"></td>
		</tr>
		<tr>
			<th>New Password Again</th>
			<td><input class="text" type="password" name="pw3" maxlength="20"></td>
		</tr>

	</tbody>
</table>
<?php
if($form->getError("pw") != "") {
echo "<span class=\"error\">".$form->getError('pw')."</span>";
}
?>
	<h4 class="round spacer">Chnage Email Address</h4>
	<table id="change_mail" cellpadding="1" cellspacing="1" class="transparent">
		<tbody>
			<tr>
				<td colspan="2">
Enter the old and the new email address. Each email will give you a piece of code that will be entered here		</td>
			</tr>
			<tr>
				<th>Old email:</th>
				<td><input class="text" type="text" name="email_alt" maxlength="50" size="40"></td>
			</tr>
			<tr>
				<th>New email:</th>
				<td><input class="text" type="text" name="email_neu" maxlength="50" size="40"></td>
			</tr>
		</tbody>
	</table>
    <?php
if($form->getError("email") != "") {
echo "<span class=\"error\">".$form->getError('email')."</span>";
}
?>
<h4 class="round spacer">Sitters</h4>
<input type="hidden" name="sitter_flag_posted" value="1">

<div class="text">Add a sitter so they can view your account</div>

<script type="text/javascript">
function cloneName(obj, id)
{
	$(id).innerHTML = obj.value.stripTags();
}

</script>

<table class="sitters transparent">
				<tbody><tr>
		<th>
				<div class="boxes boxesColor lightGreen"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>Sitter 1				</span>	</div>
				</div>
		</th><td>
<?php

if($session->userinfo['sit1'] == 0) {
echo "<input class=\"text\" type=\"text\" name=\"v1\" maxlength=\"15\">";
}
if($session->userinfo['sit1'] != 0) {
	
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->userinfo['sit1']."&a=".$session->checker."&type=1'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"helyettes\"></button>";
    echo "&nbsp;".$database->getUserField($session->userinfo['sit1'],"username",0)."";

}
?></td>
	</tr>
				<tr>
		<th>
				<div class="boxes boxesColor orange"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>Sitter 2</span>	</div>
				</div>
		</th><td>
<?php
if($session->userinfo['sit2'] == 0) {
echo "<input class=\"text\" type=\"text\" name=\"v2\" maxlength=\"15\">";
}
if($session->userinfo['sit2'] != 0) {
	
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->userinfo['sit2']."&a=".$session->checker."&type=2'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"helyettes\"></button>";
    echo "&nbsp;".$database->getUserField($session->userinfo['sit2'],"username",0)."";

}
?></td>
	</tr>
			</tbody></table>
            
<h4 class="round spacer">Accounts you Sit</h4>
<input type="hidden" name="sitter_flag_posted" value="1">

<div class="text">These are the accounts you are sitting for</div>

<table class="sitters transparent">
				<tbody><tr>
		<th>
				<div class="boxes boxesColor lightGreen"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>account 1				</span>	</div>
				</div>
		</th><td>
<?php
if(!$database->getSitee1($session->uid)){
	echo '<span class="none">Not sitting</span>';
    }else{
    $getsit1 = $database->getSitee1($session->uid);
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->uid."&owner=".$getsit1[id]."&a=".$session->checker."&type=3'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"helyettes\"></button>";
    echo "&nbsp;".$getsit1['username']."";
    }
	
?>
</td>
	</tr>
				<tr>
		<th>
				<div class="boxes boxesColor orange"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>Account 2</span>	</div>
				</div>
		</th><td>
<?php
if(!$database->getSitee2($session->uid)){
	echo '<span class="none">Not sitting</span>';
    }else{
    $getsit2 = $database->getSitee2($session->uid);
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->uid."&owner=".$getsit2[id]."&a=".$session->checker."&type=3'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"helyettes\"></button>";
    echo "&nbsp;".$getsit2['username']."";
    }
	
?></td>
	</tr>
			</tbody></table>
            
<h4 class="round spacer">Delete ACCOUNT</h4>
<table cellpadding="1" cellspacing="1" id="del_acc" class="account transparent">
	<tbody>
		<tr>
			<td colspan="2">You can delete your account here. After starting the cancellation, it will take three days to complete the deletion of your account.</td>
		</tr>
        
        
<?php
$timestamp = $database->isDeleting($session->uid);
if($timestamp) {
echo "<tr><td colspan=\"2\" class=\"count\">";
if($timestamp > time()+48*3600) {
echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&id=".$session->uid."&a=1&e=4'; return false;\">
                    <img src=\"img/x.gif\" class=\"del\" alt=\"del\"></button>";
        }
		$time=$generator->getTimeFormat(($timestamp-time()));
        echo " The account will be deleted in <span id=\"timer1\">".$time."</span> .</td></tr>";
}
else {
?>
			<tr>
				<th>delete account?</th>
				<td class="del_selection">
					<label><input class="radio" type="radio" name="del" value="1"> Yes</label>
					<label><input class="radio" type="radio" name="del" value="0" checked="checked"> No</label>
				</td>
			</tr>
            <tr>
				<th>Confirm Password</th>
				<td><input class="text" type="password" name="del_pw" maxlength="20"></td>
			</tr>
            <?php 
        }
        ?>
						
                </tbody>
</table>
    <?php
if($form->getError("del") != "") {
echo "<span class=\"error\">".$form->getError("del")."</span>";
}
?>
<h4 class="round spacer">Gold</h4>
<table cellpadding="1" cellspacing="1" class="newsletter transparent">
		<tbody>
<tr>
					<td colspan="2">You currently have <img src="img/x.gif" class="gold" alt="Arany"> <b><?php echo $session->gold; ?></b> pieces of gold.</td>
				</tr>
					</tbody>
	</table>
<br />
<div class="save_button">
<button type="submit" value="Mentés"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Save</div></div></button></div>

</form>