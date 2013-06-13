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
<h4>Expansions</h4>
<table cellpadding="1" cellspacing="1" id="expansion">
<thead>
<tr>
	<td colspan="2">Village</td>
	<td>Player</td>
	<td>Population</td>
	<td>Coordinates</td>
	<td>Date</td>
</tr></thead>
<tbody>
<?php
$slot1 = $database->getVillageField($village->wid, 'exp1');
$slot2 = $database->getVillageField($village->wid, 'exp2');
$slot3 = $database->getVillageField($village->wid, 'exp3');

if($slot1 != 0 || $slot2 != 0 || $slot3 != 0){
	for($i=1; $i <= 3; $i++){
		if (${'slot'.$i}<>0) {
			$coor = $database->getCoor(${'slot'.$i});
			$vname = $database->getVillageField(${'slot'.$i},'name');
			$owner = $database->getVillageField(${'slot'.$i},'owner');
			$pop = $database->getVillageField(${'slot'.$i},'pop');
			$vcreated = $database->getVillageField(${'slot'.$i},'created');
			$ownername = $database->getUserField($owner,'username',0);
echo '
<tr class="hover">
<td class="ra">'.$i.'.</td>
<td class="vil"><a href="karte.php?d='.${'slot'.$i}.'&c='.$generator->getMapCheck(${'slot'.$i}).'">'.$vname.'</a></td>
<td class="pla"><center><a href="spieler.php?uid='.$owner.'">'.$ownername.'</a></center></td>
<td class="ha"><center>'.$pop.'</center></td>
<td class="aligned_coords"><center><a href="karte.php?d='.${'slot'.$i}.'&c='.$generator->getMapCheck(${'slot'.$i}).'">('.$coor['y'].'|'.$coor['x'].')</center></a></td>
<td class="dat"><center>'.date('Y.m.d.',$vcreated).'</center></td>
</tr>';
		}
	}
}
else{
echo '<tr><td colspan="6" class="none">This village has not established any new villages.</td></tr>';
}
?>
</tbody></table></div>
