<?php 
$displayarray = $database->getUserArray($session->uid,1);
if ($displayarray['fquest'] != "1,1,1,1,1,1,1,1,1,1,1" && QUEST==true){
?>

<div class="questMaster">
<div id="anm" style="width:120px; height:140px; visibility:hidden;"></div>
			<div id="qge">
				<?php if ($_SESSION['qst'] == 0 or $_SESSION['qstnew'] == 1){ ?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei" style="width:160px;height:195px;cursor:pointer;" class="q_l<?php echo $session->userinfo['tribe'];?>g" title="to the task">
				<?php }else{ ?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei" style="width:160px;height:195px;cursor:pointer;" class="q_l<?php echo $session->userinfo['tribe'];?>" title="to the task">
				<?php } ?>
			</div>
			<script type="text/javascript">
				<?php if ($_SESSION['qst']==0){ ?>
				quest.number=null;
				<?php }else{ ?>
				quest.number=0;
				<?php } ?>
				quest.last = 25;
			</script>						
</div>
<?php } ?>
<script type="text/javascript"> 
	Travian.Translation.add(
	{
		'close' : 'Bezárás'
	});
</script>
<?php
$timestamp = $database->isDeleting($session->uid);
if($displayarray['protect'] > time()){
echo "<div id=\"sideInfoCountdown\"><div class=\"head\"></div>";
echo "<div class=\"content\">";

		$uurover=$generator->getTimeFormat($displayarray['protect']-time());
        echo "You have <b><span
		id=\"timer1\">".$uurover."</span></b> hours of protection.</div></div>";
}
if($timestamp) {
echo "<div id=\"sideInfoCountdown\"><div class=\"head\"></div>";
echo "<div class=\"content\">";
		$time=$generator->getTimeFormat(($timestamp-time()));
       echo " The account will be deleted in <span id=\"timer1\">".$time."</span> .</div></div>";
}
?>