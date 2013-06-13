<div class="clear"></div>
<?php
$level = $village->resarray['f'.$id];
$inuse = $database->getVillageField($village->wid, 'celebration');
$time = Time();
$i = 1;
echo "
<div class=\"build_details researches\">
	<div class=\"research\">
		<div class=\"information\">
			<div class=\"title\">
                <a href=\"#\" onclick=\"return Travian.Game.iPopup(24,4);\">
                <img class=\"celebration celebrationSmall\" src=\"img/x.gif\" alt=\"Kis ünnepség\">
                </a>
                <a href=\"#\" onclick=\"return Travian.Game.iPopup(24,4);\">Small Party</a>
                <span class=\"points\">(500 Culture Points)</span>
            </div>
            <div class=\"costs\">
				<div class=\"showCosts\">
                    <span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".$cel[$i]['wood']."</span>
                    <span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".$cel[$i]['clay']."</span>
                    <span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".$cel[$i]['iron']."</span>
                    <span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".$cel[$i]['crop']."</span>
                    <div class=\"clear\"></div>
                    <span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
					echo $generator->getTimeFormat(round($cel[$i]['time'] * ($bid24[$building->getTypeLevel(24)]['attri'] / 100)/SPEED));
					echo "</span>";
					if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                        echo "<button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".$cel[$i]['wood']."&r2=".$cel[$i]['clay']."&r3=".$cel[$i]['iron']."&r4=".$cel[$i]['crop']."'; return false;\"><img src=\"img/x.gif\" class=\"npc\" alt=\"npc\"></button>";
                   }
                    echo "<div class=\"clear\"></div>
                </div>
			</div>";
            if($inuse > $time){            
                echo "<div class=\"contractLink\"><span class=\"none\">A small celebration is in full swing</span></div>";
			}
			else if($cel[$i]['wood'] > $village->awood || $cel[$i]['clay'] > $village->aclay || $cel[$i]['iron'] > $village->airon || $cel[$i]['crop'] > $village->acrop) {
				if($village->getProd("crop")>0){
					$time = $technology->calculateAvaliable(24,$cel[$i]);
					echo "<div class=\"contractLink\"><span class=\"none\">Enough resources at ~".$time[1]."</span></div>";
				} else {
					echo "<div class=\"contractLink\"><span class=\"none\">Wheat is negative ~ Upgrade wheat field</span></div>";
				}
			} else {
				echo "
                	<button type=\"button\" value=\"Ünnepelj\" class=\"build\" onclick=\"window.location.href = 'celebration.php?id=$id&type=$i'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Celebrate</div></div></button>";
                echo "</div><div class=\"clear\"></div></div></div>";

                }
		if($level >= 10){	
		$level = $village->resarray['f'.$id];
        $i = 2;
        echo "
<div class=\"build_details researches\">
<div class=\"research\">
<div class=\"information\">
<div class=\"title\">
<a href=\"#\" onclick=\"return Travian.Game.iPopup(24,4);\">
<img class=\"celebration celebrationSmall\" src=\"img/x.gif\" alt=\"Nagy ünnepség\">
</a>
<a href=\"#\" onclick=\"return Travian.Game.iPopup(24,4);\">Big Party</a>
<span class=\"points\">(2000 Culture Points)</span>
</div>
<div class=\"costs\">
				<div class=\"showCosts\">
                <span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".$cel[$i]['wood']."</span>
                <span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".$cel[$i]['clay']."</span>
                <span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".$cel[$i]['iron']."</span>
                <span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".$cel[$i]['crop']."</span>
                <div class=\"clear\"></div>
                <span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
                echo $generator->getTimeFormat(round($cel[$i]['time'] * ($bid24[$building->getTypeLevel(24)]['attri'] / 100)/SPEED));
                echo "</span>";
                if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                echo "<button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".$cel[$i]['wood']."&r2=".$cel[$i]['clay']."&r3=".$cel[$i]['iron']."&r4=".$cel[$i]['crop']."'; return false;\"><img src=\"img/x.gif\" class=\"npc\" alt=\"npc\"></button>";
                   }
                echo "<div class=\"clear\"></div>
                </div>
                </div>";
if($inuse > $time){            
echo "<div class=\"contractLink\"><span class=\"none\">The Great Celebration in full swing</span></div>";
					}
                  else if($cel[$i]['wood'] > $village->awood || $cel[$i]['clay'] > $village->aclay || $cel[$i]['iron'] > $village->airon || $cel[$i]['crop'] > $village->acrop) {
					if($village->getProd("crop")>0){
	                   	$time = $technology->calculateAvaliable(24,$cel[$i]);
		                echo "<div class=\"contractLink\"><span class=\"none\">Enough Resources ".$time[0]." -> ".$time[1]."</span></div>";
					} else {
						echo "<div class=\"contractLink\"><span class=\"none\">Negatív a búzatermelés, soha nem lesz elég nyersanyag</span></div>";
					}
                }
                else {
                    echo "<button type=\"button\" value=\"Ünnepelj\" class=\"build\" onclick=\"window.location.href = 'celebration.php?id=$id&type=$i'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Celebrate</div></div></button>";
                }           
echo "</div><div class=\"clear\"></div></div></div>";
                }     
        ?>