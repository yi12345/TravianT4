<h1 class="titleInHeader">Main Building <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid15">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(15,4);" class="build_logo">
<img class="building big white g15" src="img/x.gif" alt="Főépület" title="Főépület" />
</a>The architects of the village live in the main building. The higher the level, the faster other buildings will be built or upgraded.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current construction time:</th>
			<td><b><?php echo round($bid15[$village->resarray['f'.$id]]['attri']); ?></b> Percent</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Construction time at level <?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo round($bid15[$village->resarray['f'.$id]+1]['attri']); ?></b> Percent</td>
            <?php
            }
            ?>
		</tr>
	</table>
	
<?php 
include("upgrade.tpl");
if($village->resarray['f'.$id] >= 10){
	include("Templates/Build/15_1.tpl");
}
?>
</p></div>
