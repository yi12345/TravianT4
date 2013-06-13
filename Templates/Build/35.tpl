<h1 class="titleInHeader">Brewery <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid35">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(35,4);" class="build_logo">
        <img class="building big white g35" src="img/x.gif" alt="Sörfőzde" title="Sörfőzde"></a>
       In the brewery, tasty drinks are brewed. These drinks make your soldiers braver and stronger when attacking others, but unfortunately, the chiefs’ power of persuasion is decreased and catapults can only do random hits. The brewery can only be built in the capital village but it will affect the whole empire.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Attack Bonus:</th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Attack Bonus at level <?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>