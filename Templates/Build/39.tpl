<h1 class="titleInHeader">Great Granary <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid39">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(39,4);" class="build_logo">
        <img class="building big white g39" src="img/x.gif" alt="Nagy Magtár" title="Nagy Magtár"></a>
        In the Granary, the wheat produced by your wheat fields is stored. The Great Granary offers you more space than the regular Granary to keep your wheat safe and dry.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Storage:</th>
		<td><b><?php echo $bid39[$village->resarray['f'.$id]]['attri']; ?></b></td>
	</tr>
    
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Storage at level <?php echo $village->resarray['f'.$id]+1; ?> :</th>
		<td><b><?php echo $bid39[$village->resarray['f'.$id]+1]['attri']; ?></b></td>
        <?php
            }
            ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>