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

<p>In order to extend your empire you need culture points. These culture points increase in the course of time and do so faster as your building levels increase.</p>

<table cellpadding="1" cellspacing="1" id="build_value">
<tr>
	<th>Production of this village</th>
	<td><b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> Culture Points</td>
</tr>
<tr>
	<th>Production of all villages:	</th>
	<td><b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> Culture Points</td>
</tr>
</table><p>You need <b><?php $mode = CP; $total = count($database->getProfileVillages($session->uid)); echo ${'cp'.$mode}[$total+1]; ?></b> Culture points to settle or chieftian a new village. <br></br>You currently have <b><?php echo $database->getUserField($session->uid, 'cp',0); ?> </b> Culture Points</p>
</div>
