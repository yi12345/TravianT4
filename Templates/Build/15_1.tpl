<div class="clear"></div>
<?php

if($_REQUEST["cancel"] == "1") {
	$database->delDemolition($village->wid);
	header("Location: build.php?gid=15&amp;cancel=0&amp;demolish=0");
}

if(!empty($_REQUEST["demolish"]) && $_REQUEST["c"] == $session->mchecker) {
	if($_REQUEST["type"] != null) 	{
		$type = $_REQUEST['type'];
		$database->addDemolition($village->wid,$type);
		$session->changeChecker();
		header("Location: build.php?gid=15&amp;cancel=0&amp;demolish=0");
	}
}

if($village->resarray['f'.$id] >= DEMOLISH_LEVEL_REQ) {
	echo "<h4>Demolish building:</h4><p>Your architects can demolish buildings you no longer need:</p>";
	$VillageResourceLevels = $database->getResourceLevel($village->wid);
	$DemolitionProgress = $database->getDemolition($village->wid);
	if (!empty($DemolitionProgress)) {
		$Demolition = $DemolitionProgress[0];
        echo" <table cellpadding='1' cellspacing='1' id='demolish'><tbody><tr>
		<td><a href='build.php?id=26&cancel=1'><img class='del' src='img/x.gif' title='mégse' alt='mégse'></a></td><td>
		<b>".$building->procResType($VillageResourceLevels['f'.$Demolition['buildnumber'].'t'])."</b></td><td><span id='timer1'>".$generator->getTimeFormat($Demolition['timetofinish']-time())."</span></td>
		</tr></tbody></table>";
	} else {
		echo "
		<form action=\"build.php?gid=15&amp;demolish=1&amp;cancel=0&amp;c=".$session->mchecker."\" method=\"POST\" style=\"display:inline\">
		<select name=\"type\" class=\"dropdown\">";
		for ($i=19; $i<=41; $i++) {
			if ($VillageResourceLevels['f'.$i.'t'] >= 1) {
				echo "<option value=".$i.">".$i.". ".$building->procResType($VillageResourceLevels['f'.$i.'t'])." ".$VillageResourceLevels['f'.$i]."</option>";
			}
		}
		echo "</select>
        <button type=\"submit\" value=\"Lebontás\" id=\"btn_demolish\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Demolish</div></div></button></form>";
	}
}
?>
