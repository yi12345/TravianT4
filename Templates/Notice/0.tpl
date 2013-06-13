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
echo $dataarray[94];
$trap = $faild = false;
if($dataarray[154] != '?'){ //if attack didn't fail
$trapstart = 159;
}else{
$faild = true;
$trapstart = 158;
}
for($i=$trapstart;$i<=$trapstart+9;$i++){
if($dataarray[$i] != 0){ $trap = true; }
}
if($trap){
$class = "units";
}else{
$class = "units last";
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
			<img src="img/x.gif" class="reportImage reportType1" alt="">
            <table id="attacker" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role">
            <div class="boxes boxesColor red"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_ATTACKER; ?></div></div></div>
            </td>
            <td class="troopHeadline" colspan="11">
            <a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[0],"id",0); ?>"><?php echo $database->getUserField($dataarray[0],"username",0); ?></a> <?php echo REPORT_FROM_VIL; ?> <a href="karte.php?d=<?php echo $dataarray[1]."&amp;c=".$generator->getMapCheck($dataarray[1]); ?>"><?php echo $database->getVillageField($dataarray[1],"name"); ?></a>

<div class="toolList">
<?php if($session->plus){ ?>
<button type="button" value="reportButton warsim" class="icon" title="<?php echo REPORT_WARSIM; ?>" onclick="window.location.href = 'warsim.php?bid=<?php echo $_GET[id]; ?>'; return false;"><img src="img/x.gif" class="reportButton warsim" alt="reportButton warsim" /></button>
<button type="button" value="reportButton repeat" class="icon" title="<?php echo REPORT_ATK_AGAIN; ?>" onclick="window.location.href = 'a2b.php?bid=<?php echo $_GET[id]; ?>'; return false;"><img src="img/x.gif" class="reportButton repeat" alt="reportButton repeat" /></button>
<?php } ?>
<div class="clear"></div></div>

</td></tr></thead>

<tbody class="units">
<tr><th class="coords"></th>
<?php
$start = $dataarray[2] == 1? 1 : (($dataarray[2] == 2)? 11 : (($dataarray[2] == 3)? 21 : 41));

for($i=$start;$i<=($start+9);$i++) {
	echo "<td class=\"uniticon\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
echo "</tr><tr><th>".REPORT_TROOPS."</th>";
for($i=3;$i<=12;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none\">0</td>";
    }
    else {
    	echo "<td class=\"unit\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[13] == 0) {
    	echo "<td class=\"unit none last\">0</td>";
    }
    else {
    	echo "<td class=\"unit last\">".$dataarray[13]."</td>";
    }
echo "</tr></tbody>";
echo "<tbody class=\"".$class."\"><tr><th>".REPORT_CASUALTIES."</th>";
for($i=14;$i<=23;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none\">0</td>";
    }
    else {
    	echo "<td class=\"unit\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[24] == 0) {
    	echo "<td class=\"unit none last\">0</td>";
    }
    else {
    	echo "<td class=\"unit last\">".$dataarray[24]."</td>";
    }

if($trap){
echo "</tr></tbody>";
echo "<tbody class=\"units last\"><tr><th>".REPORT_PRISONERS."</th>";
for($i=$trapstart;$i<=$trapstart+9;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none\">0</td>";
    }
    else {
    	echo "<td class=\"unit\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[$trapstart+10] == 0) {
    	echo "<td class=\"unit none last\">0</td>";
    }
    else {
    	echo "<td class=\"unit last\">".$dataarray[$trapstart+10]."</td>";
    }
}

if ($dataarray[151]!='' and $dataarray[152]!=''){ //ram

?>
	<tbody><tr><td class="empty" colspan="12"></td></tr></tbody>
    <tbody class="goods"><tr><th><?php echo REPORT_INFORMATION; ?></th><td style="text-align:left" colspan="11">
	<img class="unit u<?php echo $dataarray[151]; ?>" src="img/x.gif" alt="<?php echo $technology->unarray[$dataarray[151]]; ?>" title="<?php echo $technology->unarray[$dataarray[151]]; ?>" />
	<?php echo $dataarray[152]; ?>
    </td></tr></tbody>
<?php } 
if ($dataarray[153]!='' and $dataarray[154]!=''){ //cata
?>
	<tbody><tr><td class="empty" colspan="12"></td></tr></tbody>
    <tbody class="goods"><tr><th><?php echo REPORT_INFORMATION; ?></th><td style="text-align:left" colspan="11">
	<img class="unit g<?php echo $dataarray[153]; ?>Icon" src="img/x.gif" alt="<?php echo $technology->unarray[$dataarray[153]]; ?>" title="<?php echo $technology->unarray[$dataarray[153]]; ?>" />
	<?php echo $dataarray[154]; ?>
    </td></tr></tbody>
<?php }
if ($dataarray[155]!='' and $dataarray[156]!=''){ //chief
?>
	<tbody><tr><td class="empty" colspan="12"></td></tr></tbody>
    <tbody class="goods"><tr><th><?php echo REPORT_INFORMATION; ?></th><td style="text-align:left" colspan="11">
	<img class="unit u<?php echo $dataarray[155]; ?>" src="img/x.gif" alt="<?php echo $technology->unarray[$dataarray[155]]; ?>" title="<?php echo $technology->unarray[$dataarray[155]]; ?>" />
	<?php echo $dataarray[156]; ?>
    </td></tr></tbody>
<?php } ?>
<?php if ($dataarray[157]!='' and $dataarray[158]!=''){ //spy
?>
    <tbody><tr><td class="empty" colspan="12"></td></tr></tbody>
    <tbody class="goods"><tr><th><?php echo REPORT_INFORMATION; ?></th><td style="text-align:left" colspan="11">
    <?php echo $dataarray[158]; ?>
    </td></tr></tbody>
<?php }
if ($dataarray[$trapstart+11]!='' and $dataarray[$trapstart+11]!=''){ //release prisoners
?>
    <tbody><tr><td class="empty" colspan="12"></td></tr></tbody>
    <tbody class="goods"><tr><th><?php echo REPORT_INFORMATION; ?></th><td style="text-align:left" colspan="11">
    <?php echo $dataarray[$trapstart+11]; ?>
    </td></tr></tbody>
<?php } ?>


<tbody><tr><td class="empty" colspan="12"></td></tr></tbody>
<tbody class="goods">
	<tr><th><?php echo REPORT_BOUNTY; ?></th>
    <td colspan="11">
    <div class="res">
    <div class="rArea">
    <img class="r1" src="img/x.gif" title="<?php echo LUMBER; ?>"><?php echo $dataarray[25]; ?></div>
    <div class="rArea">
    <img class="r2" src="img/x.gif" title="<?php echo CLAY; ?>"><?php echo $dataarray[26]; ?></div>
    <div class="rArea">
    <img class="r3" src="img/x.gif" title="<?php echo IRON; ?>"><?php echo $dataarray[27]; ?></div>
    <div class="rArea">
    <img class="r4" src="img/x.gif" title="<?php echo CROP; ?>"><?php echo $dataarray[28]; ?></div>
    </div>
    <div class="clear"></div>
    <div class="carry">
    <?php
    if ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28] == 0) {
    echo"<img title=\"";
    echo ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28])."/".$dataarray[29];
    echo"\" src=\"img/x.gif\" class=\"carry empty\">";
	} elseif ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28] != $dataarray[29]) {
    echo "<img title=\"";
    echo ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28])."/".$dataarray[29];
    echo"\" src=\"img/x.gif\" class=\"carry half\">";
    } else {
    echo"<img title=\"";
    echo ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28])."/".$dataarray[29];
    echo"\" src=\"img/x.gif\" class=\"carry full\">";
    }
    ?>
    <?php echo ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28])."/".$dataarray[29]; ?>
    </div>
    </td>
    </tr>
</tbody>
</table>

<?php
$targettribe = $dataarray['33'];
$ddd = '36';
include "Templates/Notice/tribe_".$targettribe.".tpl";
for($s=1;$s<=5;$s++){
	if($s != $targettribe){
    	if($dataarray[$ddd]==1){
    		include "Templates/Notice/tribe_".$s.".tpl";
        }
    }
    $ddd += '23';
}
?>	
</td></tr></tbody></table>
<div class="clear">&nbsp;</div>