<?php
$bid = $village->resarray['f'.$id.'t'];
$bindicate = $building->canBuild($id,$village->resarray['f'.$id.'t']);
if($bindicate == 1) {
	echo "<p><span class=\"none\"><b><!--".$building->procResType($village->resarray['f'.$id.'t'])."--> Fully upgraded</b></span></p>";
} else if($bindicate == 10) {
	echo "<p><span class=\"none\"><b>".$building->procResType($village->resarray['f'.$id.'t'])." Fully upgraded</b></span></p>";
} else if($bindicate == 11) {
	echo "<p><span class=\"none\"><b>".$building->procResType($village->resarray['f'.$id.'t'])." Le lett rombolva</b></span></p>";
} else {
	$loopsame = $building->isCurrent($id)?1:0;
        if ($loopsame>0 && $building->isLoop($id)) {
            $doublebuild = 1;
        }
	$master = count($database->getMasterJobsByField($village->wid,$id));
	$uprequire = $building->resourceRequired($id,$village->resarray['f'.$id.'t'],($loopsame > 0 ? 2:1)+$doublebuild+$master);
	$mastertime = $uprequire['time'];
?>
<div id="contract" class="contractWrapper">
<div class="contractText">It Costs to Upgrade to Level <?php echo $village->resarray['f'.$id]+($loopsame > 0 ? 2:1)+$doublebuild+$master; ?> </div>
<div class="contractCosts">
<div class="showCosts">
<span class="resources r1"><img class="r1" src="img/x.gif" title="Wood"><?php echo $uprequire['wood']; ?></span>
<span class="resources r2"><img class="r2" src="img/x.gif" title="Clay"><?php echo $uprequire['clay']; ?></span>
<span class="resources r3"><img class="r3" src="img/x.gif" title="Iron"><?php echo $uprequire['iron']; ?></span>
<span class="resources r4"><img class="r4" src="img/x.gif" title="Wheat"><?php echo $uprequire['crop']; ?></span>
<span class="resources r5"><img class="r5" src="img/x.gif" title="Consumption"><?php echo $uprequire['pop']; ?></span>
<div class="clear"></div>
<span class="clocks">
<img class="clock" src="img/x.gif" title="duration">
<?php
echo $generator->getTimeFormat($uprequire['time']);

$wood = round($village->awood);
$clay = round($village->aclay);
$iron = round($village->airon);
$crop = round($village->acrop);

$totalres = $uprequire['wood']+$uprequire['clay']+$uprequire['iron']+$uprequire['crop'];
$availres = $wood+$clay+$iron+$crop;
if($availres >= $totalres){ $style = "npc"; } else { $style = "npc_inactive"; $disable = "disabled=\"disabled\""; }
if($session->plus) {
if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
echo "&nbsp;&nbsp;<button ".$disable." type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".$uprequire['wood']."&r2=".$uprequire['clay']."&r3=".$uprequire['iron']."&r4=".$uprequire['crop']."'; return false;\">&nbsp;<img src=\"img/x.gif\" style=\"margin-top:6px;\" class=\"".$style."\" alt=\"NPC\"></button>";
}

}
?></span>
<div class="clear"></div>
</div></div>
<?php
    if($bindicate == 2) {
   		echo "<span class=\"none\">Our Builders are busy.</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($id <= 18) {
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime\">Constructing with master builder </a>";
		echo '(costs: <img src="'.GP_LOCATE.'img/a/gold.gif" alt="Gold" title="Gold"/>1)';
	}else{
		echo "<span class=\"none\">Constructing with master builder</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
	}
	}else{
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Constructing with master builder </a>";
		echo '(costs: <img src="'.GP_LOCATE.'img/a/gold.gif" alt="Gold" title="Gold"/>1)';
	}else{
		echo "<span class=\"none\">Constructing with master builder</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
	}
	}
	}
	echo "</div>";
    }
    else if($bindicate == 3) {
    	echo "<span class=\"none\">Our Builders are busy (waiting loop).</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($id <= 18) {
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime\">Constructing with master builder </a>";
		echo '(costs: <img src="'.GP_LOCATE.'img/a/gold.gif" alt="Gold" title="Gold"/>1)';
	}else{
		echo "<span class=\"none\">Constructing with master builder</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
	}
	}else{
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Constructing with master builder </a>";
		echo '(costs: <img src="'.GP_LOCATE.'img/a/gold.gif" alt="Gold" title="Gold"/>1)';
	}else{
		echo "<span class=\"none\">Constructing with master builder</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
	}
	}
	}
	echo "</div>";
    }
    else if($bindicate == 4) {
    	echo "<span class=\"none\">Food Shortage: Expand Cropland.</span></div>";
    }
   
    else if($bindicate == 5) {
    	echo "<span class=\"none\">Upgrade Warehouse.</span></div>";
    }
    else if($bindicate == 6) {
    	echo "<span class=\"none\">Upgrade Granary.</span></div>";
    }
    else if($bindicate == 7) {
    	$neededtime = $building->calculateAvaliable($id,$village->resarray['f'.$id.'t'],($loopsame > 0 ? 2:1));
    	echo "<span class=\"none\">Enough resources: ".$neededtime[0]." at ".$neededtime[1]."</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($id <= 18) {
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime\">Constructing with master builder </a>";
		echo '(costs: <img src="'.GP_LOCATE.'img/a/gold.gif" alt="Gold" title="Gold"/>1)';
	}else{
		echo "<span class=\"none\">Constructing with master builder</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
	}
	}else{
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Constructing with master builder </a>";
		echo '(costs: <img src="'.GP_LOCATE.'img/a/gold.gif" alt="Gold" title="Gold"/>1)';
	}else{
		echo "<span class=\"none\">Constructing with master builder</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
	}
	}
	}
	echo "</div>";
    }
    else if($bindicate == 8) {
    	if($id <= 18) {
    	echo "<button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'dorf1.php?a=$id&c=$session->checker'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Build to level ";
        }
        else {
        echo "<button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'dorf2.php?a=$id&c=$session->checker'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Build to level ";
        }
		echo $village->resarray['f'.$id]+1;
		echo " </div></div></button></div>";
    }
    else if($bindicate == 9) {
    	if($id <= 18) {
    	echo "<button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'dorf1.php?a=$id&c=$session->checker'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Build to level   ";
        }
        else {
        echo "<button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'dorf2.php?a=$id&c=$session->checker'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Build to level ";
        }
		echo $village->resarray['f'.$id]+($loopsame > 0 ? 2:1);
		echo "</div></div></button> <span class=\"none\">(queue)</span></div>";
    }
}

?>

