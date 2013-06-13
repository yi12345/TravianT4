<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$playerData = $database->getAlliPermissions($_POST['a_user'], $session->alliance);
$playername = $database->getUserField($_POST['a_user'],'username',0);

$allianceinfo = $database->getAlliance($aid);
echo "<h1>Alliance - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl"); 
?>
<h4 class="round">Assign Position</h4>
<p>You can set up different permissions for each alliance member and assign positions</p>
<form method="post" action="allianz.php">
			<table cellpadding="1" cellspacing="1" id="memberAdministration">
				<thead>
					<tr>
						<th>Name</th>
						<th><img src="img/x.gif" class="allyRight allyRightPosition" alt="Assign" title="Assign"></th>
						<th><img src="img/x.gif" class="allyRight allyRightDisband" alt="Kick" title="Kick"></th>
						<th><img src="img/x.gif" class="allyRight allyRightDescription" alt="Change Description" title="Change Description"></th>
						<th><img src="img/x.gif" class="allyRight allyRightDiplomacy" alt="Alliance Diplomacy" title="Alliance Diplomacy"></th>
						<th><img src="img/x.gif" class="allyRight allyRightMessage" alt="IGMs to the whole alliance" title="IGMs to the whole alliance"></th>
						<th><img src="img/x.gif" class="allyRight allyRightInvite" alt="Invite" title="Invite"></th>
						<th><img src="img/x.gif" class="allyRight allyRightForum" alt="Forum" title="Forum"></th>
						<th>Position Name</th>
					</tr>
				</thead>
				<tbody>
	
					<tr>
						<td class="name"><?php echo $playername; ?></td>
						
						<td class="right"><input class="check" type="checkbox" name="e1" value="1" <?php if ($playerData[opt1]) { echo "checked=checked"; } ?> ></td>
						
						<td class="right"><input class="check" type="checkbox" name="e2" value="1" <?php if ($playerData[opt2]) { echo "checked=checked"; } ?> ></td>
						
						<td class="right"><input class="check" type="checkbox" name="e3" value="1" <?php if ($playerData[opt3]) { echo "checked=checked"; } ?> ></td>
						
						<td class="right"><input class="check" type="checkbox" name="e6" value="1" <?php if ($playerData[opt4]) { echo "checked=checked"; } ?> ></td>
						
						<td class="right"><input class="check" type="checkbox" name="e7" value="1" <?php if ($playerData[opt7]) { echo "checked=checked"; } ?> ></td>
						
						<td class="right"><input class="check" type="checkbox" name="e4" value="1" <?php if ($playerData[opt4]) { echo "checked=checked"; } ?> ></td>
						
						<td class="right"><input class="check" type="checkbox" name="e5" value="1" <?php if ($playerData[opt5]) { echo "checked=checked"; } ?> ></td>
						
						
						<td class="title"><input class="text" type="text" name="a_titel" value="<?php echo $playerData[rank]; ?>" maxlength="20" /></td>
					</tr>
			
				</tbody>
			</table>
			<p>
						<input type="hidden" name="a" value="1">
						<input type="hidden" name="o" value="1">
						<input type="hidden" name="s" value="5">
					  <input type="hidden" name="a_user" value="<?php echo $_POST['a_user']; ?>">
				<button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Save</div></div></button>
			</p>
		</form>
        <p class="error3"><?php echo $form->getError("error"); ?></p>