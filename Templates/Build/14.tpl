<h1 class="titleInHeader">Tournament Square <span class="level"> level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid14">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(14,4);" class="build_logo">
<img class="building big white g14" src="img/x.gif" alt="Gyakorlótér" title="Gyakorlótér" />
</a>
At the tournament square, your troops can improve their stamina. The higher the level, the faster your troops will move when further than 20 fields away.
</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bónusz:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]]['attri']; ?></b></td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Bónusz <?php echo $village->resarray['f'.$id]+1; ?> szinten:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]+1]['attri']; ?></b></td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>