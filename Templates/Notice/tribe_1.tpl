<?php
$start=1;
?>	
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role"><?php echo REPORT_DEFENDER; ?></div>	</div></div></td>
            <td class="troopHeadline" colspan="<?php if($dataarray[47]){ echo'11'; }else{ echo'10'; } ?>">
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
if(!$faild){
for($i=$start;$i<=($start+9);$i++) {
	if($i==($start+9) && !$dataarray[47]){ $last = ' last'; }else{ $last = ''; }
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if($dataarray[47]){
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=37;$i<=46;$i++) {
	if($i==46 && !$dataarray[47]){ $last = ' last'; }else{ $last = ''; }
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none".$last."\">0</td>";
    } else {
    	echo "<td class=\"unit".$last."\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[47]) {
    	echo "<td class=\"unit last\">".$dataarray[47]."</td>";
    }
echo "</tr></tbody>";
echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=48;$i<=57;$i++) {
	if($i==57 && !$dataarray[47]){ $last2 = ' last'; }else{ $last2 = ''; }
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none".$last2."\">0</td>";
    } else {
    	echo "<td class=\"unit".$last2."\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[47]) {
	if($dataarray[58] == 0) {
    	echo "<td class=\"unit none last\">0</td>";
    } else {
    	echo "<td class=\"unit last\">".$dataarray[58]."</td>";
    }
    }
}else{
for($i=$start;$i<=($start+9);$i++) {
	if($i==($start+9) && !$dataarray[49]){ $last = ' last'; }else{ $last = ''; }
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if($dataarray[49]){
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=39;$i<=48;$i++) {
	if($i==48 && !$dataarray[49]){ $last = ' last'; }else{ $last = ''; }
    	echo "<td class=\"unit none".$last."\">?</td>";
}
	if($dataarray[49]) {
    	echo "<td class=\"unit last none\">?</td>";
    }
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=50;$i<=59;$i++) {
	if($i==59 && !$dataarray[49]){ $last2 = ' last'; }else{ $last2 = ''; }
    	echo "<td class=\"unit none".$last2."\">?</td>";
}
	if($dataarray[49]) {
    	echo "<td class=\"unit none last\">?</td>";
    }
}
echo "</tr></tbody>";
?>

</table>
