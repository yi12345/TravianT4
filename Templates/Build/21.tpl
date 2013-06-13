<h1 class="titleInHeader">Workshop <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid21"><div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(21,4, 'gid');" class="build_logo"> 
<img class="building big white g21" src="img/x.gif" alt="Műhely" title="Műhely" /> </a>
In the workshop siege engines like catapults and rams can be built. The higher its level the faster units are produced.</div>
<?php
include("upgrade.tpl");
if ($building->getTypeLevel(21) > 0) { ?>
<div class="clear"></div>
		<form method="POST" name="snd" action="build.php">
			<input type="hidden" name="id" value="<?php echo $id; ?>" />
            <input type="hidden" name="ft" value="t1" />
<div class="buildActionOverview trainUnits">
             <?php 
            $success = 0;
            $start = ($session->tribe == 1)? 7 : (($session->tribe == 2)? 17 : 27);
            if ($session->tribe == 1){
            $start = 7;
            }else if ($session->tribe == 2){
            $start = 17;
            }else if ($session->tribe == 3){
            $start = 27;
            }else if ($session->tribe == 4){
            $start = 37;
            }else if ($session->tribe == 5){
            $start = 47;
            }
            for($i=$start;$i<=($start+1);$i++) {
                if($technology->getTech($i)) {
                echo "<div class=\"action first\">
                	<div class=\"bigUnitSection\">
						<a href=\"#\" onclick=\"return Travian.Game.iPopup($i,1);\">
							<img class=\"unitSection u".$i."Section\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\">
						</a>
						<a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom($i);\">
							<img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\">
						</a>
					</div>
					<div class=\"details\">
						<div class=\"tit\">
							<a href=\"#\" onclick=\"return Travian.Game.iPopup($i,1);\"><img class=\"unit u$i\" src=\"img/x.gif\" alt=\"Paladin\"></a>
							<a href=\"#\" onclick=\"return Travian.Game.iPopup($i,1);\">".$technology->getUnitName($i)."</a>
							<span class=\"furtherInfo\">(Avalaible: ".$village->unitarray['u'.$i].")</span>
						</div>
                        <div class=\"showCosts\">
                        <span class=\"resources r1\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${'u'.$i}['wood']."</span>
                        <span class=\"resources r2\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${'u'.$i}['clay']."</span>
                        <span class=\"resources r3\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${'u'.$i}['iron']."</span>
                        <span class=\"resources r4\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${'u'.$i}['crop']."</span>
                        <span class=\"resources r5\"><img class=\"r5\" src=\"img/x.gif\" alt=\"Búzafogyasztás\">".${'u'.$i}['pop']."</span>
                        <div class=\"clear\"></div>
                        <span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"duration\">";
                        echo $generator->getTimeFormat(round(${'u'.$i}['time'] * ($bid21[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
						echo "</span><div class=\"clear\"></div></div><span class=\"value\">Összesen</span>
						<input type=\"text\" class=\"text\" name=\"t$i\" value=\"0\" maxlength=\"4\">
                        <span class=\"value\"> / </span>
						<a href=\"#\" onClick=\"document.snd.t$i.value=".$technology->maxUnit($i)."; return false;\">".$technology->maxUnit($i)."</a>
					</div></div>
					<div class=\"clear\"></div><br />";
                      $success += 1;
                }
            }
            if($success == 0) {
	echo "<tr><td colspan=\"3\"><div class=\"none\"><center>Units need to be researched</center></div></td></tr>";
            }
            ?>
</div><div class="clear"></div>
			<button type="submit" value="ok" name="s1" id="btn_train" value="ok" class="startTraining"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Train</div></div></button>
		</form>
<?php
	    } else {
			echo "<b>Units need to be researched</b><br>\n";
		}

    $trainlist = $technology->getTrainingList(3);
    if(count($trainlist) > 0) {
    //$timer = 2*count($trainlist);
    	echo "
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Unit alatt</td>
			<td>Duration</td>
			<td>Finish</td>
		</tr></thead>
		<tbody>";
        $TrainCount = 0;
		foreach($trainlist as $train) {
			$TrainCount++;
			echo "<tr><td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />";
			echo $train['amt']." ".$train['name']."</td><td class=\"dur\">";
			if ($TrainCount == 1 ) {
				$NextFinished = $generator->getTimeFormat(($train['commence']+$train['eachtime'])-time());
				echo "<span id=timer1>".$generator->getTimeFormat(($train['commence']+($train['eachtime']*$train['amt']))-time())."</span>";
			} else {
				echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
			}
			echo "</td><td class=\"fin\">";
			$time = $generator->procMTime($train['commence']+($train['eachtime']*$train['amt']));
			if($time[0] != "Ma") {
				echo "".$time[0]."&nbsp;óra ";
            }
            echo $time[1];
		} ?>
		</tr><tr class="next"><td colspan="3">Next Unit finished in <span id="timer2"><?php echo $NextFinished; ?></span> </td></tr>
        </tbody></table>
    <?php }
?>  
    </p></div>

<div class="clear">&nbsp;</div>
    <div class="clear"></div>
