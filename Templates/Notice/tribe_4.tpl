<?php
$start=31;
?>	
<table cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<td class="role"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><div class="role">Defender</div>	</div></div></td>
            <td class="troopHeadline" colspan="<?php if($dataarray[116]){ echo'11'; }else{ echo'10'; } ?>">
            <?php
            if($targettribe=='4'){
            echo '<a href="spieler.php?uid='.$database->getUserField($dataarray[30],"id",0).'">';
            echo "<span class=\"none2\">Nature</span>";
            $coor = $database->getCoor($dataarray[31]);
            echo '</a> from village <a href="karte.php?d='.$dataarray[31].'&amp;c='.$generator->getMapCheck($dataarray[31]).'">
            '.stripslashes($dataarray[32]).' ('.$coor[x].'|'.$coor[y].')</a>';
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
	if($i==($start+9) && !$dataarray[116]){ $last = ' last'; }else{ $last = ''; }
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if($dataarray[116]){
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>Troops</th>";
for($i=106;$i<=115;$i++) {
	if($i==115 && !$dataarray[116]){ $last = ' last'; }else{ $last = ''; }
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none".$last."\">0</td>";
    } else {
    	echo "<td class=\"unit".$last."\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[116]) {
    	echo "<td class=\"unit last\">".$dataarray[116]."</td>";
    }
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>Casualties</th>";
for($i=117;$i<=126;$i++) {
	if($i==126 && !$dataarray[116]){ $last2 = ' last'; }else{ $last2 = ''; }
	if($dataarray[$i] == 0) {
    	echo "<td class=\"unit none".$last2."\">0</td>";
    } else {
    	echo "<td class=\"unit".$last2."\">".$dataarray[$i]."</td>";
    }
}
	if($dataarray[116]) {
	if($dataarray[127] == 0) {
    	echo "<td class=\"unit none last\">0</td>";
    } else {
    	echo "<td class=\"unit last\">".$dataarray[127]."</td>";
    }
    }
}else{
for($i=$start;$i<=($start+9);$i++) {
	if($i==($start+9) && !$dataarray[118]){ $last = ' last'; }else{ $last = ''; }
	echo "<td class=\"uniticon".$last."\"><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if($dataarray[118]){
	echo "<td class=\"uniticon last\"><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(51)."\" alt=\"".$technology->getUnitName(51)."\" /></td>";
}
echo "</tr></tbody><tbody class=\"units\"><tr><th>".REPORT_TROOPS."</th>";
for($i=108;$i<=117;$i++) {
	if($i==117 && !$dataarray[118]){ $last = ' last'; }else{ $last = ''; }
    	echo "<td class=\"unit none".$last."\">?</td>";
}
	if($dataarray[118]) {
    	echo "<td class=\"unit last none\">?</td>";
    }
echo "</tr></tbody>";

echo "<tbody class=\"units last\"><th>".REPORT_CASUALTIES."</th>";
for($i=119;$i<=128;$i++) {
	if($i==128 && !$dataarray[118]){ $last2 = ' last'; }else{ $last2 = ''; }
    	echo "<td class=\"unit none".$last2."\">?</td>";
}
	if($dataarray[118]) {
    	echo "<td class=\"unit none last\">?</td>";
    }
}
echo "</tr></tbody>";
?>

</table>
