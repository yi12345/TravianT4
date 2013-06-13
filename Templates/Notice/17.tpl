<?php
if(isset($_GET['aid']) && $_GET['aid']==$session->alliance){
	$dataarray = explode(",",$database->getNotice2($_GET['id'], 'data'));
    $topic = $database->getNotice2($_GET['id'], 'topic');
    $time = $database->getNotice2($_GET['id'], 'time');
}else{
	$dataarray = explode(",",$message->readingNotice['data']);
    $topic = $message->readingNotice['topic'];
    $time = $message->readingNotice['time'];
}
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
				<div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents cf">
                <div class="role"><?php echo REPORT_DEFENDER; ?></div>
					</div>
				</div>			</td>
			<td colspan="11" class="troopHeadline">
				<p>
					<a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[0],"id",0); ?>"><?php echo $database->getUserField($dataarray[0],"username",0); ?></a> <?php echo REPORT_FROM_VIL; ?> <a href="karte.php?d=<?php echo $dataarray[1]."&amp;c=".$generator->getMapCheck($dataarray[1]); ?>"><?php echo $database->getVillageField($dataarray[1],"name"); ?></a>
				</p>
			</td>
		</tr>
	</thead>
    
    <tbody class="units"><tr>
    <th class="coords"></th>
<?php
$targettribe = $dataarray['3'];
$start = ($targettribe-1)*10+1;
$end = ($targettribe*10);
    for($i=$start;$i<=$end;$i++) {
        echo "<td class=\"uniticon\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
    }
        echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
    echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
    for($i=4;$i<=14;$i++) {
    	if($i == 14){ $last = ' last'; }else{ $last = ''; }
        if($dataarray[$i] == 0) {
            echo "<td class=\"unit none".$last."\">0</td>";
        } else {
            echo "<td class=\"unit".$last."\">".$dataarray[$i]."</td>";
        }
    }
    echo "</tr></tbody>";
    
    echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
    for($i=15;$i<=25;$i++) {
    	if($i == 25){ $last = ' last'; }else{ $last = ''; }
        if($dataarray[$i] == 0) {
            echo "<td class=\"unit none".$last."\">0</td>";
        } else {
            echo "<td class=\"unit".$last."\">".$dataarray[$i]."</td>";
        }
    }
    echo "</tr></tbody>";
?>

</table>

</td></tr></tbody></table>
<div class="clear">&nbsp;</div>