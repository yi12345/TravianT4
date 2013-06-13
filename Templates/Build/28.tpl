<h1 class="titleInHeader">Trade Office <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid28">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(28,4);" class="build_logo">
        <img class="building big white g28" src="img/x.gif" alt="Kereskedelmi központ" title="Kereskedelmi központ"></a>
        The trade carts of your marketplace can be improved in the trade office. The higher the level, the more each merchant can carry.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Merchant shipping capacity:</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]]['attri']; ?>%</b></td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Merchant shipping capacity at level  <?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]+1]['attri']; ?>%</b></td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>
