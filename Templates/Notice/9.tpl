<?php
	$dataarray = explode(",",$database->getNotice2($_GET['id'], 'data'));
    $topic = $message->readingNotice['topic'];
    $time = $message->readingNotice['time'];
	$userarray = $database->getUserArray($message->readingNotice['uid'], 1);
?>
				<table cellpadding="1" cellspacing="1" id="report_surround">
				<thead class="theader">
					<tr>
						<th colspan="2">
							<div id="subject">
								<div class="header label"><?php echo REPORT_SUBJECT; ?></div>
								<div class="header text"><?php echo $topic; ?></div>
								<div class="clear"></div>
							</div>

							<div id="time">
                            <?php $date = $generator->procMtime($time); ?>
								<div class="header label"><?php echo REPORT_SENT; ?></div>
								<div class="header text"><?php echo $date[0]."<span> ".REPORT_AT." ".$date[1]; ?></span></div>
                                
                                <div class="toolList">
<?php if($session->plus){ ?>
					<button type="button" value="reportButton delete" class="icon" title="<?php echo REPORT_DEL_BTN; ?>" onclick="return (function(){
				('<?php echo REPORT_DEL_QST; ?>').dialog(
				{
					onOkay: function(dialog, contentElement)
					{
						window.location.href = '?n1=<?php echo $_GET['id']; ?>&amp;del=1'}
				});
				return false;
			})()"><img src="img/x.gif" class="reportButton delete" alt="reportButton delete" /></button>
<?php } ?>
					<div class="clear"></div></div>
                                
                                <div class="clear"></div>
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr><td colspan="2" class="report_content">
			<img src="img/x.gif" class="adventureReportImage adventureGrasslandVictory" alt="">

<table cellspacing="0" cellpadding="0" id="attacker">
	<thead>
		<tr>
			<td class="role">
				<div class="boxes boxesColor red"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents cf">
                <div class="role"><?php echo REPORT_ATTACKER; ?></div>
					</div>
				</div>			</td>
			<td colspan="11" class="troopHeadline">
				<p>
					<a href="spieler.php?uid=<?php echo $session->uid; ?>"><?php echo $userarray['username']; ?></a> <?php echo REPORT_FROM_VIL; ?> <a href="karte.php?d=<?php echo $dataarray[0]."&amp;c=".$generator->getMapCheck($dataarray[0]); ?>"><?php echo $database->getVillageField($dataarray[0],"name"); ?></a>
				</p>
			</td>
		</tr>
	</thead>

	<tbody class="units">
		<tr>
			<th class="coords"></th>
<?php
$owntribe = $userarray['tribe'];
$start = ($owntribe-1)*10+1;
$end = ($owntribe*10);
for($i=$start;$i<=$end;$i++) {
	echo '<td class="unit"><img src="img/x.gif" class="unit u'.$i.'" title="'.$technology->unarray[$i].'"></td>';
}
?>
						<td class="unit last">
				<img title="Hero" class="unit uhero" src="img/x.gif">
			</td>
		</tr>
	</tbody>
	<tbody class="units last">
		<tr>
			<th>Troops</th>
	<?php
	for($i=1;$i<=6;$i++){
	if($dataarray[2] == $i){
	?>
	<td><?php echo $dataarray[3]; ?></td>
	<?php }else{ ?>
	<td class="unit none">0</td>
	<?php }} ?>
	<td class="unit none">0</td>
	<td class="unit none">0</td>
	<td class="unit none">0</td>
	<td class="unit none">0</td>
	<td class="unit  last">1</td>
</tr>
	</tbody>

	<tbody class="infos">
		<tr><td class="empty" colspan="12"></td></tr>
		<tr>
			<th>Information</th>
			<td class="dropItems" colspan="11">
            <?php if($dataarray[1]!='dead'){ ?>
				<img src="img/x.gif" class="iExperience" title="Experience:">
				+<?php echo $dataarray[5]; ?>
				<img src="img/x.gif" class="injury" title="Injury:">
				-<?php echo round($dataarray[4]); ?>%
            <?php }else{
            		echo '<img src="img/x.gif" class="adventureDifficulty0" title="Your hero is dead">'.$dataarray[2];
                  }
            ?>
            	
			</td>
		</tr>
			</tbody>
<?php if($dataarray[1]!='dead'){ ?>
	<tbody class="goods">
		<tr><td class="empty" colspan="12"></td></tr>
		<tr>
			<th>Bounty</th>
			<td colspan="11">
            <?php
           	if($dataarray[1]){
            	$typeArray = array("","helmet","body","leftHand","rightHand","shoes","horse","bandage25","bandage33","cage","scroll","ointment","bucketOfWater","bookOfWisdom","lawTables","artWork");
                $btype = $dataarray[1];
                $type = $dataarray[2];
				if($btype < 16){
				include "Templates/Auction/alt.tpl";
				$typeArray = array("","helmet","body","leftHand","rightHand","shoes","horse","bandage25","bandage33","cage","scroll","ointment","bucketOfWater","bookOfWisdom","lawTables","artWork");
            	include "Templates/Auction/alt.tpl";
				echo '<img src="img/x.gif" class="reportInfo itemCategory itemCategory_'.$typeArray[$btype].'" title="'.$title.'">';
				echo ' '.$name.' ('.$dataarray[3].'x)';
				}else if($btype == 16){
				echo '<img src="img/x.gif" class="unit u'.$type.'" title="'.$technology->getUnitName($type).'">';
				echo ' '.$technology->getUnitName($type).' ('.$dataarray[3].'x)';
							$outputList .= "<div class=\"reportInfoIcon\"><img title=\"".$technology->getUnitName($type)." (".$dataarray[3]."x)\" src=\"img/x.gif\" class=\"unit u".$type."\"\"></div>";
				}else{
				echo '<img src="img/x.gif" class="silver" title="silver">';
				echo ' Silver ('.$dataarray[3].'x)';
				}
            }else{
            	echo $dataarray[2];
            }
            ?>
			</td>
		</tr>
	</tbody>
<?php } ?>
</table>
</td></tr></tbody></table>
<div class="clear">&nbsp;</div>