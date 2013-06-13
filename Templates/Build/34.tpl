<h1 class="titleInHeader">StoneMason <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid34">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(34,4);" class="build_logo">
        <img class="building big white g34" src="img/x.gif" alt="Kőfaragő" title="Kőfaragő"></a>
       The stonemason is an expert at manipulating stone. The higher the level, the stronger each of the buildings in your village</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>
Stability of buildings at current levels:</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]]['attri']; ?>%</b></td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Stability of buildings at level <?php echo $village->resarray['f'.$id]+1; ?></th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]+1]['attri']; ?>%</b></td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>