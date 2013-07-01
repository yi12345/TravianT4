<?php
$bid = $_GET['bid'];
unset($_GET['bid']);
$bindicator = $building->canBuild($id,$bid);
$uprequire = $building->resourceRequired($id,$bid);
$crop = round($village->acrop);

$bindicate = $building->canBuild($id,$village->resarray['f'.$id.'t']);
if($bindicate == 1) {
	echo "<p><span class=\"none\">Building Complete.</span></p>";
} else if($bindicate == 10) {
	echo "<p><span class=\"none\">The last level of the building is under construction.</span></p>";
} else if($bindicate == 11) {
	echo "<p><span class=\"none\">The building is being demolished.</span></p>";
} else {
	$loopsame = $building->isCurrent($id)?1:0;
        if ($loopsame>0 && $building->isLoop($id)) {
            $doublebuild = 1;
        }
        
?>
<div id="contract" class="contract contractNew contractWrapper">
	<div class="contractText">Cost:</div>
	<div class="contractCosts">
    <div class="showCosts">
    <span class="resources r1 little_res"><img class="r1" src="img/x.gif" title="Wood"><?php echo $uprequire['wood']; ?></span>
    <span class="resources r2 little_res"><img class="r2" src="img/x.gif" title="Clay"><?php echo $uprequire['clay']; ?></span>
    <span class="resources r3 little_res"><img class="r3" src="img/x.gif" title="Iron"><?php echo $uprequire['iron']; ?></span>
    <span class="resources r4"><img class="r4" src="img/x.gif" title="Crop"><?php echo $uprequire['crop']; ?></span>
    <span class="resources r5"><img class="r5" src="img/x.gif" title="Crop consumption"><?php echo $uprequire['pop']; ?></span>
    <div class="clear"></div>
    <span class="clocks"><img class="clock" src="img/x.gif" title="Duration">

    <?php echo $generator->getTimeFormat($uprequire['time']);
		echo "</span>";
                   if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
    
    echo "<button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".$uprequire['wood']."&r2=".$uprequire['clay']."&r3=".$uprequire['iron']."&r4=".$uprequire['crop']."'; return false;\">
    <img src=\"img/x.gif\" class=\"npc\" alt=\"npc\"></button>";
                 } ?>
	
    <div class="clear"></div>
    </div></div>
	<div class="contractLink">
    <?php
    if($bindicate == 2) {
   		echo "<span class=\"none\">Workers are working.</span>";
    }
    else if($bindicate == 3) {
    	echo "<span class=\"none\">Workers are working</span>";
    }
    else if($bindicate == 4) {
    	echo "<span class=\"none\">Food shortages: first upgrade Cropland!</span>";
    }
   
    else if($bindicate == 5) {
    	echo "<span class=\"none\">Upgrade warehouse.</span>";
    }
    else if($bindicate == 6) {
    	echo "<span class=\"none\">Upgrade Granary.</span>";
    }
     else if($bindicator == 7) {
    	$neededtime = $building->calculateAvaliable($id,$bid);
    	echo "<span class=\"none\">Enough resources at ".$neededtime[1]."</span>";
     }
     else if($bindicator == 8) {
     	echo "<button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'dorf2.php?a=$bid&id=$id&c=".$session->checker."'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Build</div></div></button>";
     }
     else if($bindicator == 9) {
     	echo "<button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'dorf2.php?a=$bid&id=$id&c=".$session->checker."'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Build</div></div></button> <span class=\"none\">(Queue)</span>";
     } }
            ?>

</div>
	
    <div class="clear"></div></div>
