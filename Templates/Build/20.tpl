<h1 class="titleInHeader">stable <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid20">
<p class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(20,4);" class="build_logo">
<img class="building big white g20" src="img/x.gif" alt="Istálló" title="Istálló" /> </a>
In the stable cavalry is trained. The higher its level the faster the troops are trained.<br /></p>
<?php 
include("upgrade.tpl");
?>
<?php if ($building->getTypeLevel(20) > 0) { ?>
<div class="clear"></div>
		<form method="POST" name="snd" action="build.php">
			<input type="hidden" name="id" value="<?php echo $id; ?>" />
            <input type="hidden" name="ft" value="t1" />
                <div class="buildActionOverview trainUnits">
                <?php 
                	include("20_".$session->tribe.".tpl");
                ?>
                </div>
			<div class="clear"></div>
				    <button type="submit" value="ok" name="s1" id="btn_train" value="ok" class="startTraining">
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Train</div></div>
                    </button>

		</form>
<?php
	} else {
		echo "<b>No Units have been Researched</b><br>\n";
	}
    $trainlist = $technology->getTrainingList(2);
    if(count($trainlist) > 0) {
    //$timer = 2*count($trainlist);
    	echo "
        <h4 class=\"round spacer\">Training</h4>
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Unit</td>
			<td>Duration</td>
			<td>Finished</td>
		</tr></thead>
		<tbody>";
		$TrainCount = 0;
        foreach($trainlist as $train) {
			$TrainCount++;
			echo "<tr><td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />";
			echo $train['amt']." ".$train['name']."</td><td class=\"dur\">";
			if ($TrainCount == 1 ) {
			$NextFinished = $generator->getTimeFormat($train['timestamp2']-time());
			echo "<span id=timer1>".$generator->getTimeFormat($train['timestamp']-time())."";
			} else {
			echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
			}
			echo "</span></td><td class=\"fin\">";
			$time = $generator->procMTime($train['timestamp']);
			if($time[0] != "today") {
			echo $time[0]." at ";
			}
			echo $time[1];
			} ?>
		</tr><tr class="next"><td colspan="3">The next unit is ready <span id="timer2"><?php echo $NextFinished; ?></span> </td></tr>
        </tbody></table>
    <?php }
    ?> </p></div>
<div class="clear">&nbsp;</div>
    <div class="clear"></div>