<?php
$aantal=(count($database->getMovement2(4,$village->wid,1))+count($database->getMovement2(34,$village->wid,1))+count($database->getMovement2(3,$village->wid,1))+count($database->getMovement2(3,$village->wid,0))+count($database->getMovement2(9,$village->wid,0))+count($database->getMovement2(5,$village->wid,0)));
if($aantal > 0){
}
if($aantal != "") { $class = ''; } else { $class = 'hide'; }
?>
<div class="movements <?php echo $class ?>"><div class="boxes villageList movements"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div>
    <div class="boxes-contents">
    <table id="movements" cellpadding="1" cellspacing="1"><thead><tr><th colspan="3"><?php echo TROOP_MOVEMENTS; ?></th></tr></thead><tbody>

<?php

/* attack/raid on you! */
$aantal = count($database->getMovement2(3,$village->wid,1));
$aantal2 = $database->getMovement2(3,$village->wid,1);
for($i=0;$i<$aantal;$i++){
	if($aantal2[$i]['attack_type'] == 2)
		$aantal -= 1;
	}
	if($aantal > 0){
			foreach($aantal2 as $receive) {
				$action = 'att1';
				$aclass = 'a1';
				$title = ''.ARRIVING_ATTACKING_TROOPS.'';
				$short = ''.ATTACK.'';
			}
			
		echo '
		<tr>
			<td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
			<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">در&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td>
		</tr>';
		
$timer += 1;

}

?>
<?php
/* Units send to reinf. (to my town) */
$units_type = $database->getMovement2("34",$village->wid,1);
$lala = count($units_type);

	if($lala > 0){
			foreach($units_type as $receive) {
				$action = 'def1';
				$aclass = 'd1';
				$title = ''.OWN_REINFORCING_TROOPS.'';
				$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
			}
			
		echo '<tr>
			<td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
			<td><div class="mov"><span class="'.$aclass.'">'.$lala.'&nbsp;'.$short.'</span></div><div class="dur_r">&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td>
		</tr>';
		
	$timer += 1;

	}

/* Units send to reinf. (to my town) */
$aantal = count($database->getMovement2('7',$village->wid,0)); $lala=$aantal;

$aantal2 = $database->getMovement2('7',$village->wid,0);
for($i=0;$i<$aantal;$i++){
	if(($aantal2[$i]['attack_type']==1) or ($aantal2[$i]['sort_type']==9)){
		$lala -= 1; }
}
	if($lala > 0){
			foreach($aantal2 as $receive) {
				$action = 'def2';
				$aclass = 'd2';
				$title = ''.OWN_REINFORCING_TROOPS.'';
				$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
				}
			
		echo '
		<tr>
			<td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
			<td><div class="mov"><span class="'.$aclass.'">'.$lala.'&nbsp;'.$short.'</span></div><div class="dur_r">&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td>
		</tr>';
		
$timer += 1;

}

?>
<?php
/* on attack, raid */
$aantal = count($database->getMovement2(3,$village->wid,0));
$aantal2 = $database->getMovement2(3,$village->wid,0);
for($i=0;$i<$aantal;$i++){
	if($aantal2[$i]['attack_type'] == 2)
		$aantal -= 1;
}
	if($aantal > 0){
			foreach($aantal2 as $receive) {
				$action = 'att2';
				$aclass = 'a2';
				$title = ''.OWN_ATTACKING_TROOPS.'';
				$short = ''.ATTACK.'';
			}
			
		echo '
		<tr>
			<td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
			<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td>
		</tr>';
		
$timer += 1;

}

?>

<?php
$aantal = count($database->getMovement2(5,$village->wid,0));
$aantal2 = $database->getMovement2(5,$village->wid,0);
	if($aantal > 0){
			foreach($aantal2 as $receive) {
				$action = 'att3';
				$aclass = 'a3';
				$title = 'Found new village';
				$short = 'Found new village';
			}
			
		echo '
		<tr>
			<td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
			<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td>
		</tr>';
		
$timer += 1;

}

$aantal = count($database->getMovement2(9,$village->wid,0));
$aantal2 = $database->getMovement2(9,$village->wid,0);
	if($aantal > 0){
			foreach($aantal2 as $receive) {
				$action = 'att3';
				$aclass = 'a3';
				$title = 'Adventure';
				$short = 'Adventure';
			}
			
		echo '
		<tr>
			<td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
			<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td>
		</tr>';
		
$timer += 1;

}
?>


</tbody></table>
        </div></div></div>