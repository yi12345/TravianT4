<h1 class="titleInHeader">Great Warehouse <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid38">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(38,4);" class="build_logo">
        <img class="building big white g38" src="img/x.gif" alt="Nagy Raktár" title="Nagy Raktár"></a>
        In your Warehouse, the resources wood, clay and iron are stored. The Great Warehouse offers you more space than the regular warehouse to keep your resources safe and dry.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Storage:</th>
		<td><b><?php echo $bid38[$village->resarray['f'.$id]]['attri']; ?></b></td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Storage at level <?php echo $village->resarray['f'.$id]+1; ?> </th>
		<td><b><?php echo $bid38[$village->resarray['f'.$id]+1]['attri']; ?></b></td>
        <?php
            }
            ?>
	</tr>
	</table>
 <?php 
include("upgrade.tpl");
?>
</p></div>