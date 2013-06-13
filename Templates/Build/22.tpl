<h1 class="titleInHeader">Academy <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

<div id="build" class="gid22">
<div class="build_desc">
<a href="#" onClick="return Popup(22,4);" class="build_logo">

	<img class="building big white g22" src="img/x.gif" alt="Akadémia" title="Akadémia" />
</a>
New troop types must first be researched at the academy before they can be trained. The higher the level, the greater the number of troop types available to be researched..</div>
<?php
include("upgrade.tpl");
?>
<div class="clear"></div>

<?php
	if ($building->getTypeLevel(22) > 0) {
		include("22_".$session->tribe.".tpl");
	} else {
		echo "<p><b>No new troop types are currently available to be researched/b><br></p>\n";
	}
?>

         </div>
<div class="clear">&nbsp;</div>
<div class="clear"></div>