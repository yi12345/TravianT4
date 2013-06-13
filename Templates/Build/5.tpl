<h1 class="titleInHeader">Sawmill <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid5">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(5,4);" class="build_logo">
	<img class="building big white g5" src="img/x.gif" alt="Sawmill" title="Sawmill" />
</a>
The wood produced by the woodcutter is turned into boards in the sawmill. Depending on level, it can raise wood production by up to 25 percent.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Increased production at current levels: </th>
			<td><b><?php echo $bid5[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Increase in production at level<?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo $bid5[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>