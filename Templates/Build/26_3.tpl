<h1 class="titleInHeader">Palace <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid26">
<div class="build_desc">
	<a href="#" onClick="return Travian.Game.iPopup(26,4, 'gid');" class="build_logo"> 
    <img class="building big white g26" src="img/x.gif" alt="Palota" title="Palota" /> </a>
	The king of the nation lives in the palace. The higher the level, the more difficult it is for enemies to conquer the village. Only a palace may be used to set a village as the capital. A palace and residence may not be built in the same village. Only one palace is allowed per account.</div>


<?php 
include("upgrade.tpl");
include("26_menu.tpl"); 
?>
By attacking with senators, chiefs or chieftains a village's loyalty can be brought down. If it reaches zero, the village joins the realm of the attacker. This villages lotalty is:  <b><?php echo $database->getVillageField($village->wid, 'loyalty'); ?></b>%. <br></br><b>This village is Capital so it cannot be taken </b></div>