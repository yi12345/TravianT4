<?php
$start=41;
?>	
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role">Defender</div>	</div></div></td>
            <td class="troopHeadline" colspan="<?php if($dataarray[139]){ echo'11'; }else{ echo'10'; } ?>">
            <?php
            if($targettribe=='5'){
            echo '<a href="spieler.php?uid='.$database->getUserField($dataarray[30],"id",0).'">';
            echo "Natar";
            echo '</a> Village <a href="karte.php?d='.$dataarray[31].'&amp;c='.$generator->getMapCheck($dataarray[31]).'">
            '.stripslashes($dataarray[32]).'</a>';
            } else {
            echo "REPORT_REINF";
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
	if($i==($start+9) && !$dataarray[139]){ $last = ' last'; }else{ $last = ''; }
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if($dataarray[139]){
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>Troops</th>";
for($i=129;$i<=138;$i++) {
	if($i==138 && !$dataarray[139]){ $last = ' last'; }else{ $last = ''; }
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none".$last."\">0</td>";
    } else {
    	echo "<td class=\"unit".$last."\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[139]) {
    	echo "<td class=\"unit last\">".$dataarray[139]."</td>";
    }
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>Casualties</th>";
for($i=140;$i<=149;$i++) {
	if($i==149 && !$dataarray[139]){ $last2 = ' last'; }else{ $last2 = ''; }
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none".$last2."\">0</td>";
    } else {
    	echo "<td class=\"unit".$last2."\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[139]) {
	if($dataarray[150] == 0) {
    	echo "<td class=\"unit none last\">0</td>";
    } else {
    	echo "<td class=\"unit last\">".$dataarray[150]."</td>";
    }
    }
}else{
for($i=$start;$i<=($start+9);$i++) {
	if($i==($start+9) && !$dataarray[141]){ $last = ' last'; }else{ $last = ''; }
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if($dataarray[141]){
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=131;$i<=140;$i++) {
	if($i==140 && !$dataarray[141]){ $last = ' last'; }else{ $last = ''; }
    	echo "<td class=\"unit none".$last."\">?</td>";
}
	if($dataarray[141]) {
    	echo "<td class=\"unit last none\">?</td>";
    }
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=142;$i<=151;$i++) {
	if($i==151 && !$dataarray[141]){ $last2 = ' last'; }else{ $last2 = ''; }
    	echo "<td class=\"unit none".$last2."\">?</td>";
}
	if($dataarray[141]) {
    	echo "<td class=\"unit none last\">?</td>";
    }
}
echo "</tr></tbody>";
?>

</table>
