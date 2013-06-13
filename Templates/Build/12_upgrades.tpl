<div class="clear"></div>
<div class="build_details researches">
			<?php
		$abdata = $database->getABTech($village->wid);
		$ABups = $technology->getABUpgrades('b');
		for($i=($session->tribe*10-9);$i<=($session->tribe*10-2);$i++) {
			$j = $i % 10 ;
			if ( $technology->getTech($i) || $j == 1 ) {
				echo "<div class=\"research\">
		<div class=\"bigUnitSection\">
			<a class=\"unitSection\" href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">
				<img class=\"unitSection u".$i."Section\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\">
			</a>
			<a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(".$i.");\">
				<img class=\"zoom\" src=\"img/x.gif\" alt=\"Zoom\">
			</a>
		</div>
		<div class=\"information\">
<div class=\"title\">
<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">
<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\"></a> 
<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">".$technology->getUnitName($i)."</a>
<span class=\"level\">Level ".$abdata['b'.$j]."</span>
</div>";
if($abdata['b'.$j] != 20) {
echo "<div class=\"costs\">
<div class=\"showCosts\">
<span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"fa\">".${'ab'.$i}[$abdata['b'.$j]+1]['wood']."</span>
<span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"agyag\">".${'ab'.$i}[$abdata['b'.$j]+1]['clay']."</span>
<span class=\"resources r3\"><img class=\"r3\" src=\"img/x.gif\" alt=\"vasérc\">".${'ab'.$i}[$abdata['b'.$j]+1]['iron']."</span>
<span class=\"resources r4\"><img class=\"r4\" src=\"img/x.gif\" alt=\"búza\">".${'ab'.$i}[$abdata['b'.$j]+1]['crop']."</span>
<div class=\"clear\"></div>

<span class=\"clocks\">
<img class=\"clock\" src=\"img/x.gif\" alt=\"Idő\">";
				echo $generator->getTimeFormat(round(${'ab'.$i}[$abdata['b'.$j]+1]['time']*($bid12[$building->getTypeLevel(12)]['attri'] / 100)/SPEED));
echo "</span>";
				if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
echo "
<button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".${'ab'.$i}[$abdata['b'.$j]+1]['wood']."&r2=".${'ab'.$i}[$abdata['b'.$j]+1]['clay']."&r3=".${'ab'.$i}[$abdata['b'.$j]+1]['iron']."&r4=".${'ab'.$i}[$abdata['b'.$j]+1]['crop']."'; return false;\">
<img src=\"img/x.gif\" class=\"npc\" alt=\"npc\"></button>";
}
echo "<div class=\"clear\"></div>
</div>
</div>";
}
		        if (${'ab'.$i}[$abdata['b'.$j]+1]['wood'] > $village->maxstore || ${'ab'.$i}[$abdata['b'.$j]+1]['clay'] > $village->maxstore || ${'ab'.$i}[$abdata['b'.$j]+1]['iron'] > $village->maxstore) {
					echo "<div class=\"contractLink\"><span class=\"none\">Upgrade Warehouse</span></div>";
				}
				else if (${'ab'.$i}[$abdata['b'.$j]+1]['crop'] > $village->maxcrop) {
					echo "<div class=\"contractLink\"><span class=\"none\">Upgrade Granary</span></div>";
				}
				else if (${'ab'.$i}[$abdata['b'.$j]+1]['wood'] > $village->awood || ${'ab'.$i}[$abdata['b'.$j]+1]['clay'] > $village->aclay || ${'ab'.$i}[$abdata['b'.$j]+1]['iron'] > $village->airon || ${'ab'.$i}[$abdata['b'.$j]+1]['crop'] > $village->acrop) {
					if($village->getProd("crop")>0){
						$time = $technology->calculateAvaliable(12,${'ab'.$i}[$abdata['b'.$j]+1]);
			            echo "<div class=\"contractLink\"><span class=\"none\">Enough Resources: ".$time[0]." ".$time[1]."</span></div>";
					} else {
						echo "<div class=\"contractLink\"><span class=\"none\">Wheat production is negative, there will never be enough resources</span></div>";
					}
		            //echo "<div class=\"contractLink\"><span class=\"none\">few resources</span></div>";
				}
				else if ($building->getTypeLevel(12) <= $abdata['b'.$j]) {
                    if ($abdata['b'.$j] == 20)
                    {
                        echo "<div class=\"contractLink\"><span class=\"none\">Fully Developed  </span></div>";
                    }
                    else
                    {
                        echo "<div class=\"contractLink\"><span class=\"none\">Improve the blacksmith</span></div>";
                    }
				}
				else if (count($ABups) > 0) {
					echo "<div class=\"contractLink\"><span class=\"none\">Research in progress</span></div>";
				}
				else {

					echo "<div class=\"contractLink\"><span class=\"none\">
                    <button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'build.php?id=$id&amp;a=$j&amp;c=$session->mchecker'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">development</div></div></button>
                    </span></div>";
				}
echo "</div>
<div class=\"clear\"></div>
</div><hr>";
}
}
?>

</div>

<?php
	if(count($ABups) > 0) {
		echo "<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\"><thead><tr><td>Unit</td><td>Remaining time</td><td>Finished</td></tr>
</thead><tbody>";
		$timer = 1;
		foreach($ABups as $black) {
			$unit = ($session->tribe-1)*10 + substr($black['tech'],1,2);
			echo "<tr><td class=\"desc\"><img class=\"unit u$unit\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unit)."\" title=\"".$technology->getUnitName($unit)."\" />".$technology->getUnitName($unit)."</td>";
			echo "<td class=\"dur\"><span id=\"timer$timer\">".$generator->getTimeFormat($black['timestamp']-time())."</span></td>";
			$date = $generator->procMtime($black['timestamp']);
			echo "<td class=\"fin\"><span>".$date[1]."</span><span> </span></td>";
			echo "</tr>";
			$timer +=1;
		}
		echo "</tbody></table>";
	}
?>