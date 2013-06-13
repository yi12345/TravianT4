<?php
$eigen = $database->getCoor($village->wid);
$adventure = $database->getMInfo($_GET['id']);
$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);
$to = array('x'=>$adventure['x'], 'y'=>$adventure['y']);
$herodetail = $database->getHeroData($session->uid);
$speed = $herodetail['speed'];
$time = $generator->procDistanceTime($from,$to,$speed,1);
$founder = $database->getVillage($village->wid);
?>

<h1>Adventure</h1>
				<form method="POST" action="build.php">
				<input type="hidden" name="a" value="adventure" />
				<input type="hidden" name="c" value="5" />
				<input type="hidden" name="h" value="<?php echo $_GET['id']; ?>" />
				<input type="hidden" name="id" value="39" />
				<input type="hidden" name="timestamp" value="<?php echo $time ?>" />
		<table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $founder['0']; ?>&c=<?php echo $generator->getMapCheck($founder['0']); ?>"><?php echo $village->vname; ?></a></td><td colspan="11">Adventure (<?php echo $adventure['x']; ?>|<?php echo $adventure['y']; ?>)</td>
		</tr>
	</thead>
	<tbody class="units">
		<tr>
			<th></th>
				<?php for($i=($session->tribe-1)*10+1;$i<=$session->tribe*10;$i++) {
					echo "<td><img src=\"img/x.gif\" class=\"unit u".$i."\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
				} 
                echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
                ?>
		</tr>
		<tr>
			<th>Units</th>
				<?php for($i=1;$i<=10;$i++) {
					echo "<td class=\"none\">0</td>";
				} ?>
				<td>1</td>
		</tr>
	</tbody>
	<tbody class="infos">
		<tr>
			<th>Arrival</th>
				<td colspan="11"><img class="clock" src="img/x.gif" alt="Duration" title="Duration" /> <?php echo $generator->getTimeFormat($time); ?></td>
		</tr>
	</tbody>
</table>
<?php
if($village->resarray['f39'] >= 1){
if($herodetail['dead']==0){
	if($database->getHUnit($village->wid)){
?>
	<p class="button">
		<button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Start Adventure</div></div></button>
	</p>
<?php }else{ ?>
<button type="button" title="Your hero is not in this village yet." value="Kalandra fel!" class="disabled"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Start Adventure</div></div></button>
<?php } ?>
<?php }else{ ?>
<button type="button" title="Your hero is dead." value="Kalandra fel" class="disabled"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Start Adventure</div></div></button>
<?php 
}
}else{ 
?>
<button type="button" title="You need to build rally point." value="Kalandra fel" class="disabled"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Start Adventure</div></div></button>
<?php } ?>
</form>
