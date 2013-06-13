<h1 class="titleInHeader">Brickworks <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid6">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(6,4);" class="build_logo">
	<img class="building big white g6" src="img/x.gif" alt="Brickworks" title="Brickworks" />
</a>
Here clay is processed into bricks. Based on its level your Brickyard can increase your clay production up to 25 percent.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>
Current increase in production:</th>
			<td><b><?php echo $bid6[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Increase in production at level <?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo $bid6[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>