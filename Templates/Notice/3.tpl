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
if($dataarray[158] != 0 or $dataarray[159] != 0 or $dataarray[160] != 0 or $dataarray[161] != 0 or $dataarray[162] != 0 or $dataarray[163] != 0 or $dataarray[164] != 0 or $dataarray[165] != 0 or $dataarray[166] != 0 or $dataarray[167] != 0){
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
					<div class="clear"></div></div><div class="clear"></div>
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr><td colspan="2" class="report_content">
			<img src="img/x.gif" class="reportImage reportType3" alt=""><table id="attacker" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor red"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_ATTACKER; ?></div>	</div></div></td>
            <td class="troopHeadline" colspan="11">
            <a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[0],"id",0); ?>"><?php echo $database->getUserField($dataarray[0],"username",0); ?></a> <?php echo REPORT_FROM_VIL; ?> <a href="karte.php?d=<?php echo $dataarray[1]."&amp;c=".$generator->getMapCheck($dataarray[1]); ?>"><?php echo $database->getVillageField($dataarray[1],"name"); ?></a>
            <div class="toolList">
<?php if($session->plus){ ?>
<button type="button" value="reportButton warsim" class="icon" title="<?php echo REPORT_WARSIM; ?>" onclick="window.location.href = 'warsim.php?bid=<?php echo $_GET[id]; ?>'; return false;"><img src="img/x.gif" class="reportButton warsim" alt="reportButton warsim" /></button>
<button type="button" value="reportButton repeat" class="icon" title="<?php echo REPORT_ATK_AGAIN; ?>" onclick="window.location.href = 'a2b.php?bid=<?php echo $_GET[id]; ?>'; return false;"><img src="img/x.gif" class="reportButton repeat" alt="reportButton repeat" /></button>
<?php } ?>
<div class="clear"></div></div></td></tr></thead>

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
if($dataarray[158] != 0 or $dataarray[159] != 0 or $dataarray[160] != 0 or $dataarray[161] != 0 or $dataarray[162] != 0 or $dataarray[163] != 0 or $dataarray[164] != 0 or $dataarray[165] != 0 or $dataarray[166] != 0 or $dataarray[167] != 0){
echo "</tr></tbody>";
echo "<tbody class=\"units last\"><tr><th>".REPORT_PRISONERS."</th>";
for($i=158;$i<=167;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none\">0</td>";
    }
    else {
    	echo "<td class=\"unit\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[168] == 0) {
    	echo "<td class=\"unit none last\">0</td>";
    }
    else {
    	echo "<td class=\"unit last\">".$dataarray[168]."</td>";
    }
}
echo "</tr></tbody>";

?>

</td></tr></tbody></table>

<?php
$targettribe = $dataarray['33'];
if ($targettribe=='1'){
$start=1;
?>
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_DEFENDER; ?></div></div></div></td>
            <td class="troopHeadline" colspan="11">
            <?php
            if($targettribe=='1'){
            echo '<a href="spieler.php?uid='.$database->getUserField($dataarray[30],"id",0).'">';
            echo $database->getUserField($dataarray[30],"username",0);
            echo '</a> '.REPORT_FROM_VIL.' <a href="karte.php?d='.$dataarray[31].'&amp;c='.$generator->getMapCheck($dataarray[31]).'">
            '.stripslashes($dataarray[32]).'</a>';
            } else {
            echo REPORT_REINF;
            }
            ?>
            </td>
		</tr>
	</thead>
    
    <tbody class="units"><tr>
    <th class="coords"></th>
<?php
for($i=$start;$i<=($start+9);$i++) {
	echo "<td class=\"uniticon\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=37;$i<=46;$i++) {
    	echo "<td class=\"unit none\">?</td>";
}
    	echo "<td class=\"unit none last\">?</td>";
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=48;$i<=57;$i++) {
    	echo "<td class=\"unit none\">?</td>";
}
    	echo "<td class=\"unit none last\">?</td>";
echo "</tr></tbody>";
?>

</table>

<?php } 
if ($targettribe=='2'){ 
$start=11;
?>	
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_DEFENDER; ?></div>	</div></div></td>
            <td class="troopHeadline" colspan="11">
            <?php
            if($targettribe=='2'){
            echo '<a href="spieler.php?uid='.$database->getUserField($dataarray[30],"id",0).'">';
            echo $database->getUserField($dataarray[30],"username",0);
            echo '</a> '.REPORT_FROM_VIL.' <a href="karte.php?d='.$dataarray[31].'&amp;c='.$generator->getMapCheck($dataarray[31]).'">
            '.stripslashes($dataarray[32]).'</a>';
            } else {
            echo REPORT_REINF;
            }
            ?>
            </td>
		</tr>
	</thead>
    
    <tbody class="units"><tr>
    <th class="coords"></th>
<?php
for($i=$start;$i<=($start+9);$i++) {
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=60;$i<=69;$i++) {
    	echo "<td class=\"unit none\">?</td>";
}
    	echo "<td class=\"unit none last\">?</td>";
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=71;$i<=80;$i++) {
    	echo "<td class=\"unit none\">?</td>";
}
    	echo "<td class=\"unit none last\">?</td>";
echo "</tr></tbody>";
?>

</table>

<?php } ?>
<?php
if ($targettribe=='3'){
$start=21;
?>
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_DEFENDER; ?></div>	</div></div></td>
            <td class="troopHeadline" colspan="11">
            <?php
            if($targettribe=='3'){
            echo '<a href="spieler.php?uid='.$database->getUserField($dataarray[30],"id",0).'">';
            echo $database->getUserField($dataarray[30],"username",0);
            echo '</a> '.REPORT_FROM_VIL.' <a href="karte.php?d='.$dataarray[31].'&amp;c='.$generator->getMapCheck($dataarray[31]).'">
            '.stripslashes($dataarray[32]).'</a>';
            } else {
            echo REPORT_REINF;
            }
            ?>
            </td>
		</tr>
	</thead>
    
    <tbody class="units"><tr>
    <th class="coords"></th>
<?php
for($i=$start;$i<=($start+9);$i++) {
	echo "<td class=\"uniticon\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=83;$i<=92;$i++) {
    	echo "<td class=\"unit none\">?</td>";
}
    	echo "<td class=\"unit none last\">?</td>";
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=94;$i<=103;$i++) {
    	echo "<td class=\"unit none\">?</td>";
}
    	echo "<td class=\"unit none last\">?</td>";
echo "</tr></tbody>";
?>

</table>

<?php } ?>
<?php  if ($targettribe=='4'){ 
$start=31; ?>	
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_DEFENDER; ?></div>	</div></div></td>
            <td class="troopHeadline" colspan="11">
            <?php
            if($targettribe=='4'){
            echo "<span class=\"none2\">Nature</span>";
            $coor = $database->getCoor($dataarray[31]);
            echo ' '.REPORT_FROM_VIL.' <a href="karte.php?d='.$dataarray[31].'&amp;c='.$generator->getMapCheck($dataarray[31]).'">
            '.stripslashes($dataarray[32]).' ('.$coor[x].'|'.$coor[y].')</a>';
            } else {
            echo REPORT_REINF;
            }
            ?>
            </td>
		</tr>
	</thead>
    
    <tbody class="units"><tr>
    <th class="coords"></th>
<?php
for($i=$start;$i<=($start+9);$i++) {
	if($i==($start+9)){ $last2 = ' last'; }else{ $last2 = ''; }
	echo "<td class=\"uniticon".$last2."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=106;$i<=115;$i++) {
	if($i==115){ $last = ' last'; }else{ $last = ''; }
    	echo "<td class=\"unit none".$last."\">?</td>";
}
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=117;$i<=126;$i++) {
	if($i==126 && !$dataarray[116]){ $last2 = ' last'; }else{ $last2 = ''; }
    	echo "<td class=\"unit none".$last2."\">?</td>";
}

echo "</tr></tbody>";
?>

</table>

<?php } ?>
<?php  if ($targettribe=='5'){
$start=41; ?>		
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_DEFENDER; ?></div>	</div></div></td>
            <td class="troopHeadline" colspan="<?php if($dataarray[139]){ echo'11'; }else{ echo'10'; } ?>">
            <?php
            if($targettribe=='5'){
            echo '<a href="spieler.php?uid='.$database->getUserField($dataarray[30],"id",0).'">';
            echo NATARS;
            echo '</a> '.REPORT_FROM_VIL.' <a href="karte.php?d='.$dataarray[31].'&amp;c='.$generator->getMapCheck($dataarray[31]).'">
            '.stripslashes($dataarray[32]).'</a>';
            } else {
            echo REPORT_REINF;
            }
            ?>
            </td>
		</tr>
	</thead>
    
    <tbody class="units"><tr>
    <th class="coords"></th>
<?php
for($i=$start;$i<=($start+9);$i++) {
	if($i==($start+9)){ $last = ' last'; }else{ $last = ''; }
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=129;$i<=138;$i++) {
	if($i==138){ $last = ' last'; }else{ $last = ''; }
    	echo "<td class=\"unit none".$last."\">?</td>";
}
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=140;$i<=149;$i++) {
	if($i==149 && !$dataarray[139]){ $last2 = ' last'; }else{ $last2 = ''; }
    	echo "<td class=\"unit none".$last2."\">?</td>";
}
echo "</tr></tbody>";
?>

</table>

<?php } ?>
</td></tr></tbody></table>
<div class="clear">&nbsp;</div>