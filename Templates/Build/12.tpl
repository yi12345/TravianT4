<h1 class="titleInHeader">Smithy <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid13">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(12,4);" class="build_logo">
<img class="building big white g13" src="img/x.gif" alt="Kovács" title="Kovács" />
</a>
The smithy improves the weapons and armour of your troops. By increasing its level, you can order the fabrication of even better weapons and armour.<?php
include("upgrade.tpl");
	if ($building->getTypeLevel(12) > 0) {
		include("12_upgrades.tpl");
	} else {
		echo "<p><b>The last level is possible.</b><br>\n";
	}
?>
</div>
</div>
