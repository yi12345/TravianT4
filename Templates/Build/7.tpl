<h1 class="titleInHeader">Iron Foundry <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid7">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(7,4);" class="build_logo">
	<img class="building big white g7" src="img/x.gif" alt="Iron Foundry" title="Iron Foundry" />
</a>
Iron is smelted in the iron foundry. Based on its level your Iron Foundry can increase your iron production up to 25 percent.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current increase in production:</th>
			<td><b><?php echo $bid7[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Increase in production at level<?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo $bid7[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>