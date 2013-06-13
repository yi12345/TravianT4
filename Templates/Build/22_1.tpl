<?php 
$fail = $success = 0;
$acares = $technology->grabAcademyRes();
$r2=array('wood'=>700,'clay'=>620,'iron'=>1480,'crop'=>580,'time'=>7080);
$r3=array('wood'=>1000,'clay'=>740,'iron'=>1880,'crop'=>640,'time'=>7560);
$r4=array('wood'=>940,'clay'=>740,'iron'=>360,'crop'=>400,'time'=>5880);
for($i==2;$i<=9;$i++) {
	if($technology->meetRRequirement($i) && !$technology->getTech($i) && !$technology->isResearch($i,1)) {
    	echo "<div class=\"build_details researches\">
        <div class=\"research\">
			<div class=\"bigUnitSection\">
				<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">
					<img class=\"unitSection u".$i."Section\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\">
				</a>
				<a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(".$i.");\">
					<img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\">
				</a>
			</div>
			<div class=\"information\">
<div class=\"title\">
<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">
<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\"></a>
<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">".$technology->getUnitName($i)."</a>
</div>
<div class=\"costs\">
<div class=\"showCosts\">
                    <span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${'r'.$i}['wood']."</span>
                    <span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${'r'.$i}['clay']."</span>
                    <span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${'r'.$i}['iron']."</span>
                    <span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${'r'.$i}['crop']."</span>
                    <div class=\"clear\"></div>
                    <span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
                    echo $generator->getTimeFormat(round(${'r'.$i}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
                    echo "</span>";
                    if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1) {
                   echo "<button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".${'r'.$i}['wood']."&r2=".${'r'.$i}['clay']."&r3=".${'r'.$i}['iron']."&r4=".${'r'.$i}['crop']."'; return false;\"><img src=\"img/x.gif\" class=\"npc\" alt=\"npc\"></button>
                    <div class=\"clear\"></div>";
                   }
                   if(${'r'.$i}['wood'] > $village->maxstore || ${'r'.$i}['clay'] > $village->maxstore || ${'r'.$i}['iron'] > $village->maxstore) {
                    echo "<br><div class=\"contractLink\"><span class=\"none\">Upgrade your warehouse</span></div>
</div>
<div class=\"clear\">&nbsp;</div>
</div></div>";
echo "<div class=\"clear\">&nbsp;</div></div></div>";
                }
                else if(${'r'.$i}['crop'] > $village->maxcrop) {
                    echo "<br><div class=\"contractLink\"><span class=\"none\">Upgrade your Granary</span></div>
</div>
<div class=\"clear\">&nbsp;</div>
</div></div>";
                    echo "<div class=\"clear\">&nbsp;</div></div></div>";
                }
                   else if(${'r'.$i}['wood'] > $village->awood || ${'r'.$i}['clay'] > $village->aclay || ${'r'.$i}['iron'] > $village->airon || ${'r'.$i}['crop'] > $village->acrop) {
                   	$time = $technology->calculateAvaliable(22,${'r'.$i});
                    echo "<br><div class=\"contractLink\"><span class=\"none\">Not Enough Resources ~ Available on ".$time[1]."</span></div>
</div>
<div class=\"clear\"></div>
</div></div>";
                    echo "<div class=\"clear\">&nbsp;</div></div></div>";
                }
                else if (count($acares) > 0) {
                echo "<br><div class=\"contractLink\"><span class=\"none\">
					Research in Process</span></div></div></div></div>
                    <div class=\"clear\">&nbsp;</div>
                    </div></div>";
                }
                else {
                echo "<div class=\"contractLink\"><button type=\"button\" value=\"Research\" class=\"build\" onclick=\"window.location.href = 'build.php?id=$id&amp;a=$i&amp;c=".$session->mchecker."'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Research</div></div></button></div>
</div>
<div class=\"clear\">&nbsp;</div>
</div></div><div class=\"clear\">&nbsp;</div></div></div>";
                }
                $success += 1;
    }
    else {
    $fail += 1;
    }
}
if($success == 0) {
echo "<div class=\"buildActionOverview trainUnits\"><td colspan=\"2\"><div class=\"none\" align=\"center\">No research available</div></td></div>";
}
?>

<?php
if($fail > 0) { 
	echo "<p class=\"switch\"><a class=\"openedClosedSwitch switchOpened\" id=\"researchFutureLink\" href=\"#\" onclick=\"return $('researchFuture').toggle();\">More</a></p>
    <div id=\"researchFuture\" class=\"researches hide \">";
      if(!$technology->meetRRequirement(2) && !$technology->getTech(2)) {
     echo"<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(2,1);\"><img class=\"unitSection u2Section\" src=\"img/x.gif\" alt=\"Testőrség\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(2);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(2,1);\"><img class=\"unit u2\" src=\"img/x.gif\" alt=\"Praetorian\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(2,1);\">Praetorian</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r2}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r2}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r2}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r2}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Praetorian\">";
	 echo $generator->getTimeFormat(round(${r2}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> Level 1</span>, <a href=\"#\">Smithy</a><span class=\"level\"> Level 1</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(3) && !$technology->getTech(3)) {
     echo"<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(3,1);\"><img class=\"unitSection u3Section\" src=\"img/x.gif\" alt=\"Birodalmi\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(3);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(3,1);\"><img class=\"unit u3\" src=\"img/x.gif\" alt=\"Birodalmi\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(3,1);\">Imperian</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r3}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r3}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r3}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r3}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
	 echo $generator->getTimeFormat(round(${r3}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> level 5</span>, <a href=\"#\">Smithy</a><span class=\"level\"> level 1</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(4) && !$technology->getTech(4)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(4,1);\"><img class=\"unitSection u4Section\" src=\"img/x.gif\" alt=\"Equites Legati\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(4);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(4,1);\"><img class=\"unit u4\" src=\"img/x.gif\" alt=\"Equites Legati\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(4,1);\">Equites Legati</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r4}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r4}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r4}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r4}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
	 echo $generator->getTimeFormat(round(${r4}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> level 5</span>, <a href=\"#\">Stable</a><span class=\"level\"> level 1</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(5) && !$technology->getTech(5)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(5,1);\"><img class=\"unitSection u5Section\" src=\"img/x.gif\" alt=\"Equites Imperatoris\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(5);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(5,1);\"><img class=\"unit u5\" src=\"img/x.gif\" alt=\"Equites Imperatoris\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(5,1);\">Equites Imperatoris</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r5}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r5}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r5}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r5}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
	 echo $generator->getTimeFormat(round(${r5}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> level 5</span>, <a href=\"#\">Stable</a><span class=\"level\"> level 5</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(6) && !$technology->getTech(6)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(6,1);\"><img class=\"unitSection u6Section\" src=\"img/x.gif\" alt=\"Equites Caesaris\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(6);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(6,1);\"><img class=\"unit u6\" src=\"img/x.gif\" alt=\"Equites Caesaris\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(6,1);\">Equites Caesaris</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r6}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r6}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r6}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r6}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
	 echo $generator->getTimeFormat(round(${r6}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> level 15</span>, <a href=\"#\">Stable</a><span class=\"level\"> level 10</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(7) && !$technology->getTech(7)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(7,1);\"><img class=\"unitSection u7Section\" src=\"img/x.gif\" alt=\"Faltörő kos\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(7);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(7,1);\"><img class=\"unit u7\" src=\"img/x.gif\" alt=\"Faltörő kos\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(7,1);\">Battering Ram</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r7}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r7}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r7}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r7}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
	 echo $generator->getTimeFormat(round(${r7}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> level 10</span>, <a href=\"#\">Workshop</a><span class=\"level\"> Level 1</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(8) && !$technology->getTech(8)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(8,1);\"><img class=\"unitSection u8Section\" src=\"img/x.gif\" alt=\"Tűzkatapult\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(8);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(8,1);\"><img class=\"unit u8\" src=\"img/x.gif\" alt=\"Tűzkatapult\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(8,1);\">Fire Catapult</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r8}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r8}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r8}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r8}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
	 echo $generator->getTimeFormat(round(${r8}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> Level 15</span>, <a href=\"#\">Workshop</a><span class=\"level\"> level 10</span></div></div><div class=\"clear\"></div></div><hr>";
     }
     if(!$technology->meetRRequirement(9) && !$technology->getTech(9)) {
     echo "<div class=\"research\"><div class=\"bigUnitSection\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(9,1);\"><img class=\"unitSection u9Section\" src=\"img/x.gif\" alt=\"Szenátor\"></a><a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(9);\"><img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\"></a></div><div class=\"information\"><div class=\"title\"><a href=\"#\" onclick=\"return Travian.Game.iPopup(9,1);\"><img class=\"unit u9\" src=\"img/x.gif\" alt=\"Szenátor\"></a><a href=\"#\" onclick=\"return Travian.Game.iPopup(9,1);\">Senatorr</a></div><div class=\"costs\"><div class=\"showCosts\"><span class=\"resources r1 little_res\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${r9}['wood']."</span><span class=\"resources r2 little_res\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${r9}['clay']."</span><span class=\"resources r3 little_res\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${r9}['iron']."</span><span class=\"resources r4 little_res\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${r9}['crop']."</span><div class=\"clear\"></div><span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
	 echo $generator->getTimeFormat(round(${r9}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
	 echo"</span><div class=\"clear\"></div></div></div><div class=\"contractLink\"><a href=\"#\">Academy</a><span class=\"level\"> level 20</span>, <a href=\"#\">Rally point</a><span class=\"level\"> Level 10</span></div></div><div class=\"clear\"></div></div>";
     }
?>
<script type="text/javascript">
		//<![CDATA[
			$("researchFuture").toggle = (function()
			{
				this.toggleClass("hide");

				$("researchFutureLink").set("text",
					this.hasClass("hide")
					?	"More"
					:	"Less"
				);

				return false;
			}).bind($("researchFuture"));
		//]]>
</script>
<?php
     echo "<div class=\"clear\"></div></div>";
}

if(count($acares) > 0) {
	echo "<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\"><thead><tr><td>Training</td><td>Duration</td><td>Finish</td></tr>
	</thead><tbody>";
			$timer = 1;
	foreach($acares as $aca) {
		$unit = substr($aca['tech'],1,2);
		echo "<tr><td class=\"desc\"><img class=\"unit u$unit\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unit)."\" title=\"".$technology->getUnitName($unit)."\" />".$technology->getUnitName($unit)."</td>";
			echo "<td class=\"dur\"><span id=\"timer$timer\">".$generator->getTimeFormat($aca['timestamp']-time())."</span></td>";
			$date = $generator->procMtime($aca['timestamp']);
		    echo "<td class=\"fin\"><span>".$date[1]."</span><span> Hour</span></td>";
		echo "</tr>";
		$timer +=1;
	}
	echo "</tbody></table>";
}



?>