<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>Alliance - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl"); 
?>
<h4 class="round">Rename</h4>
<form method="post" action="allianz.php">
<input type="hidden" name="a" value="100">
<input type="hidden" name="o" value="100">
<input type="hidden" name="s" value="5">
	<table cellpadding="1" cellspacing="1" class="option name transparent">
		<tbody>
			<tr>
				<th>
					Tag:				</th>
				<td>
					<input class="tag text" name="ally1" value="<?php echo $allianceinfo['tag']; ?>" maxlength="8">
									</td>
			</tr>
			<tr>
				<th>
				 		Name:				</th>
				<td>
					<input class="name text" name="ally2" value="<?php echo $allianceinfo['name']; ?>" maxlength="25">
									</td>
			</tr>
		</tbody>
	</table>

	<p>
		<button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">save</div></div></button>	</p>
</form>
<p class="error3"><?php echo $form->getError("error"); ?></p>