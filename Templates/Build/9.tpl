<h1 class="titleInHeader">Bakery <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid9">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(9,4);" class="build_logo">
	<img class="building big white g9" src="img/x.gif" alt="Bakery" title="Bakery" />
</a>
Here the flour produced in your mill is used to bake bread. In conjunction with the grain mill the increase in crop production can go up to 50 percent.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current increase in production:</th>
			<td><b><?php echo $bid9[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Increase in production at level  <?php echo $village->resarray['f'.$id]+1; ?> L</th>
			<td><b><?php echo $bid9[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>