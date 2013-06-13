<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       25_train.tpl                                                ##
##  Made by:       Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

	$slots = $database->getAvailableExpansionTraining();

	if ($slots['settlers']+$slots['chiefs']>0) { ?>

<form method="POST" name="snd" action="build.php">
<input type="hidden" name="id" value="<?php echo $id; ?>" />
<input type="hidden" name="ft" value="t1" />
<div class="buildActionOverview trainUnits">
<?php
		for ($i=($session->tribe-1)*10+9;$i<=($session->tribe*10);$i++) {
			if ($slots['settlers']>0 && $i%10==0 || $slots['chiefs']>0 && $i%10==9) {
			       $maxunit = MIN($technology->maxUnit($i),($i%10==0?$slots['settlers']:$slots['chiefs']));

echo "<div class=\"action first\">
                	<div class=\"bigUnitSection\">
						<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">
							<img class=\"unitSection u".$i."Section\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\">
						</a>
						<a href=\"#\" class=\"zoom\" onclick=\"return Travian.Game.unitZoom(".$i.");\">
							<img class=\"zoom\" src=\"img/x.gif\" alt=\"zoom in\">
						</a>
					</div>
					<div class=\"details\">
						<div class=\"tit\">
							<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\"><img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\"></a>
							<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$i.",1);\">".$technology->getUnitName($i)."</a>
							<span class=\"furtherInfo\">(Current: ".$village->unitarray['u'.$i].")</span>
						</div>
                        <div class=\"showCosts\">
                        <span class=\"resources r1\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Fa\">".${'u'.$i}['wood']."</span>
                        <span class=\"resources r2\"><img class=\"r2\" src=\"img/x.gif\" alt=\"Agyag\">".${'u'.$i}['clay']."</span>
                        <span class=\"resources r3\"><img class=\"r3\" src=\"img/x.gif\" alt=\"Vasérc\">".${'u'.$i}['iron']."</span>
                        <span class=\"resources r4\"><img class=\"r4\" src=\"img/x.gif\" alt=\"Búza\">".${'u'.$i}['crop']."</span>
                        <div class=\"clear\"></div>
                        <span class=\"clocks\"><img class=\"clock\" src=\"img/x.gif\" alt=\"Időtartam\">";
echo $generator->getTimeFormat(round(${'u'.$i}['time'] * ($bid25[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
                echo "</span>";
if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
echo "&nbsp;&nbsp;<button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?gid=17&t=3&r1=".${'u'.$i}['wood']."&r2=".${'u'.$i}['clay']."&r3=".${'u'.$i}['iron']."&r4=".${'u'.$i}['crop']."'; return false;\">&nbsp;<img src=\"img/x.gif\" class=\"npc\" alt=\"npc\"></button>";
}

echo "</span><div class=\"clear\"></div></div><span class=\"value\"></span>
                        <input type=\"text\" class=\"text\" name=\"t".$i."\" value=\"0\" maxlength=\"4\">
                        <span class=\"value\"> / </span>
						<a href=\"#\" onClick=\"document.snd.t".$i.".value=".$maxunit."; return false;\">".$maxunit."</a>
					</div></div>
					<div class=\"clear\">&nbsp;</div><BR />";
			}
		} ?>
<div class="clear">&nbsp;</div>
    <div class="clear"></div></div>
<button type="submit" value="ok" name="s1" id="btn_train" value="ok" class="startTraining">
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Train</div></div>
                    </button>
</form>
<?php
	} else {
		echo '<div class="none">The creation of a new village, or occupy a residence level 20 is required.</div>';
	}
    include ("25_progress.tpl");
?>
