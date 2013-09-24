<h1 class="titleInHeader">Trapper <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid36">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(36,4);" class="build_logo">
        <img class="building big white g36" src="img/x.gif" alt="Trapper" title="Trapper"></a>
     The trapper protects your village with well hidden traps. This means that unwary enemies can be imprisoned and won't be able to harm your village any more.</div>

<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Currect maximum traps to train:</th>

		<td><b><?php echo $bid36[$village->resarray['f'.$id]]['attri']*TRAPPER_CAPACITY; ?></b> Traps</td>
	</tr>
	<tr>
	<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
		<th>Maximum traps to train at level <?php echo $next; ?>:</th>
		<td><b><?php echo $bid36[$next]['attri']*TRAPPER_CAPACITY; ?></b> Traps</td>
        <?php
            }else{
		?>
		<th>Maximum traps to train at level 20:</th>
		<td><b><?php echo $bid36[20]['attri']*TRAPPER_CAPACITY; ?></b> Traps</td>
		<?php
			}
			}
        ?>

	</tr>
</table>
<p>Your currently have <b><?php echo $village->unitarray['u99']; ?></b> traps, <b><?php echo $village->unitarray['u99o']; ?></b> of which are occupied.</p>
<?php 
include("upgrade.tpl");
?>
<div class="clear"></div>
<?php if ($building->getTypeLevel(36) > 0) { ?>
<form method="POST" name="snd" action="build.php">
				<input type="hidden" name="id" value="<?php echo $id; ?>" />
				<input type="hidden" name="ft" value="t1" />
			<?php
			$trainlist = $technology->getTrainingList(8);
			foreach($trainlist as $train) {
			$train_amt += $train['amt'];
			}
			
			$max = $technology->maxUnit(99,false);
			$max1 = 0;
			for($i=19;$i<41;$i++){
			if($village->resarray['f'.$i.'t'] == 36){
			$max1 += $bid36[$village->resarray['f'.$i]]['attri']*TRAPPER_CAPACITY;
			}
			}
			if($max > $max1 - ($village->unitarray['u99'] + $train_amt)){
			$max = $max1 - ($village->unitarray['u99'] + $train_amt);
			}
			if($max < 0){
			$max = 0;
			}
			?>
		<tr>
			<div class="buildActionOverview trainUnits">
			<div class="action first">
			<div class="details">
			<div class="tit"><a href="#" onclick="return Travian.Game.iPopup(36,4,'gid')"><img class="unit u99" src="img/x.gif" alt="تله"></a> <a href="#" onclick="return Travian.Game.iPopup(36,4,'gid')">Traps</a>
			<span class="furtherInfo">(Available: <?php echo $village->unitarray['u99']; ?>)</span>
			</div>

			<div class="showCosts">
			<span class="resources r1"><img class="r1" src="img/x.gif" alt="Wood">35</span>
			<span class="resources r2"><img class="r2" src="img/x.gif" alt="Clay">30</span>
			<span class="resources r3"><img class="r3" src="img/x.gif" alt="Iron">10</span>
			<span class="resources r4"><img class="r4" src="img/x.gif" alt="Crop">20</span>
			<span class="resources r5"><img class="r5" src="img/x.gif" alt="Crop consumption">0</span>
			<div class="clear"></div>
			<span class="clocks"><img class="clock" src="img/x.gif" alt="Duration"><?php $dur=$generator->getTimeFormat(round(${'u99'}['time'] * ($bid19[$village->resarray['f'.$id]]['attri']*TRAPPER_CAPACITY / 100) / SPEED)); echo ($dur=="0:00:00")? "0:00:01":$dur; ?></span><div class="clear"></div></div>
			<span class="value"></span> <input type="text" class="text" name="t99" value="0" maxlength="4"><span class="value">
			/ </span> <a href="#" onClick="document.snd.t99.value=<?php echo $max; ?>; return false;"><?php echo $max; ?></a>
			</div>
			<div class="clear"></div>
			</div>
			</div>
		</tr>
<button type="submit" value="ok" name="s1" id="s1" class="startBuild"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Make</div></div></button></form>
	<?php
	} else {
		echo "<b>Training can commence when trapper are completed.</b><br>\n";
	}
    if(count($trainlist) > 0) {
    	echo "
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Training</td>
			<td>Duration</td>
			<td>Finished</td>
		</tr></thead>
		<tbody>";
		$TrainCount = 0;
        foreach($trainlist as $train) {
			$TrainCount++;
	        echo "<tr><td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".U99."\" title=\"".U99."\" />";
			echo $train['amt']." ".U99."</td><td class=\"dur\">";
			if ($TrainCount == 1 ) {
				$NextFinished = $generator->getTimeFormat(($train['timestamp']-time())-($train['amt']-1)*$train['eachtime']);
				echo "<span id=timer1>".$generator->getTimeFormat($train['timestamp']-time())."</span>";
			} else {
				echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
			}
			echo "</td><td class=\"fin\">";
			$time = $generator->procMTime($train['timestamp']);
			if($time[0] != "today") {
				echo "on ".$time[0]." at ";
            }
			echo $time[1];
		} ?>
		</tr><tr class="next"><td colspan="3">The next unit will be finished in <span id="timer2"><?php echo $NextFinished; ?></span></td></tr>
		</tbody></table>
    <?php } ?>
</p></div>
