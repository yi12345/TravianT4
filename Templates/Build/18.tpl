<h1 class="titleInHeader">Embassy <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid18">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(18,4);" class="build_logo">
	<img class="building big white g18" src="img/x.gif" alt="Embassy" title="Embassy" />
</a>
The embassy is the office for the diplomats. The higher the level, the more options are available to the king.</div>

<?php
include("upgrade.tpl");
if($village->resarray['f'.$id] >= 3 && $session->alliance == 0) {
include("18_create.tpl");
}
if($session->alliance != 0) {
echo "
<table cellpadding=\"1\" cellspacing=\"1\" id=\"ally_info\" class=\"transparent\"><div class=\"clear\"></div>
        <h4 class=\"round\">Alliance</h4>
	<tbody><tr>
		<th>Tag:</th>
		<td>".$alliance->allianceArray['tag']."</td>
	</tr>
	<tr>
		<th>Name:</th>
		<td>".$alliance->allianceArray['name']."</td>

	</tr>
	<tr>
		<td colspan=\"2\"><a href=\"allianz.php\" class=\"arrow\">to the alliance</a></td>
	</tr></tbody>
	</table>";
    }
    else if($village->resarray['f'.$id] >= 1) {
    ?>
    <div class="clear"></div>
    <h4 class="round">Invites</h4>
<table cellpadding="1" cellspacing="1" id="join" class="transparent">
<form method="post" action="build.php">
<input type="hidden" name="id" value="<?php echo $id ?>">
<input type="hidden" name="a" value="2">

<thead></thead>
<tbody><tr>
	<?php
    if($alliance->gotInvite) {
    	foreach($alliance->inviteArray as $invite) {
        	 echo "
             <div>
             <button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?id=".$id."&a=2&d=".$invite['id']."'; return false;\"><img class=\"del\" src=\"img/x.gif\" alt=\"Törlés\" title=\"Törlés\" /></button>
        <a href=\"allianz.php?aid=".$invite['alliance']."\">&nbsp;".$database->getAllianceName($invite['alliance'])."</a>
         <button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'build.php?id=".$id."&a=3&d=".$invite['id']."'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Accept</div></div></button></div>";
        }
        }
    else {
		echo "<td colspan=\"3\" class=\"noData\">No Invites</td>";
        }
        ?>
	</tr></tbody></table>
    <?php 
        if($alliance->gotInvite) {
        echo "<p class=\"error2\"></p>";
        } 
    }
?></form><div class="clear"></div><br />
</div>
