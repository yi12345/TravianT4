<?php
$units = $database->getMovement(3,$village->wid,0);
$total_for = count($units);

for($y=0;$y<$total_for;$y++){
$timer += 1;

if($units[$y]['attack_type'] == 2){
	$attack_type = "Reinforcing";
	}
if($units[$y]['attack_type'] == 1){
	$attack_type = "Scouting";
	}
if($units[$y]['attack_type'] == 3){
	$attack_type = "Attack to";
	}
if($units[$y]['attack_type'] == 4){
	$attack_type = "Raid to";
	}
$isoasis = $database->isVillageOases($units[$y]['to']);
if ($isoasis ==0){ 	
$to = $database->getMInfo($units[$y]['to']);
} else {
$to = $database->getOMInfo($units[$y]['to']);}


if($units[$y]['attack_type'] == 2){ $style = ""; }else{ $style = "outRaid"; }
?>

<table class="troop_details <?php echo $style; ?>" cellpadding="1" cellspacing="1">            
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td>
			<td colspan="11" class="troopHeadline"><a href="karte.php?d=<?php echo $to['wref']."&c=".$generator->getMapCheck($to['wref']); ?>"><?php echo $attack_type." ".$to['name']; ?></a>
            <?php
            $coor = $database->getCoor($to['wref']);
            
            if($isoasis){
            	echo " (".$coor['y']."|".$coor['x'].")";
                }
            ?></td>
		</tr>
	</thead>
	<tbody class="units">
			<?php
				$tribe = $session->tribe;
                  $start = ($tribe == 1)? 1 : (($tribe == 2)? 11 : 21);
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  $coor = $database->getCoor($village->wid);
                  echo "<tr><th class=\"coords\">
					<span class=\"coordinates coordinatesAligned\">
                    <span class=\"coordinateY\">(".$coor['y']."</span>
                    <span class=\"coordinatePipe\">|</span>
                    <span class=\"coordinateX\">".$coor['x'].")</span>
                    </span>
                    <span class=\"clear\"></span></th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
                  	echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(52)."\" alt=\"".$technology->getUnitName(52)."\" /></td>";	
			?>
			</tr>
 <tr><th>Troops</th>
            <?php
            for($i=1;$i<=11;$i++) {
            	if($units[$y]['t'.$i] == 0) {
                	echo "<td class=\"none\">";
                }
                else {
                echo "<td>";
                }
                echo $units[$y]['t'.$i]."</td>";
            }
            
            ?>
           </tr></tbody>
		<tbody class="infos">
			<tr>
				<th>Arrival</th>
				<td colspan="11">
				<?php
				    echo "<div class=\"in small\"> <span id=timer$timer>".$generator->getTimeFormat($units[$y]['endtime']-time())."</span> hrs</div>";
				    $datetime = $generator->procMtime($units[$y]['endtime']);
				    echo "<div class=\"at small\">";
				    echo " ".$datetime[1]." hrs </div>";
    		?>
					<!--<div class="abort"><a href="build.php?id=39&a=4&t=5360004"><img src="img/x.gif" class="del" title="Annuleren" alt="Annuleren" /></a>-->
					</div>
				</td>
			</tr>
		</tbody>
</table>
		<?php
		}
		?>
<?php
$adventures = $database->getMovement(9,$village->wid,0);   
if($adventures){
$total_for = count($adventures);

for($y=0;$y<$total_for;$y++){
$timer += 1;
    $coor = $database->getCoor($adventures[$y]['to']);
?>
<table class="troop_details inAttackOasis" cellpadding="1" cellspacing="1">            
    <thead>
        <tr>
            <td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td>
            <td colspan="11" class="troopHeadline"><a href="karte.php?d=<?php echo $adventures[$y]['to']."&c=".$generator->getMapCheck($adventures[$y]['to']); ?>">Go to adventure (<?php echo $coor['x']."|".$coor['y']; ?>)</a></td>
        </tr>
    </thead>
    <tbody class="units">
            <?php
                $tribe = $session->tribe;
                 $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  
                  echo "<tr><th class=\"coords\">
					<span class=\"coordinates coordinatesAligned\">
                    <span class=\"coordinateY\">(".$coor['y']."</span>
                    <span class=\"coordinatePipe\">|</span>
                    <span class=\"coordinateX\">".$coor['x'].")</span>
                    </span>
                    <span class=\"clear\"></span></th>";
                  for($i=$start;$i<=($end);$i++) {
                      echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";    
                  }
                  echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(52)."\" alt=\"".$technology->getUnitName(52)."\" /></td>"; 
            ?>
            </tr>
 <tr><th>Troops</th>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td>1</td>

           </tr></tbody>
        <tbody class="infos">
            <tr>
                <th>Arrival</th>
                <td colspan="11">
                <?php
                    echo "<div class=\"in small\"><span id=timer$timer>".$generator->getTimeFormat($adventures[$y]['endtime']-time())."</span> hrs</div>";
                    $datetime = $generator->procMtime($adventures[$y]['endtime']);
                    echo "<div class=\"at small\">";
                    echo $datetime[1]." hrs</div>";
            ?>
                    <!--<div class="abort"><a href="build.php?id=39&a=4&t=5360004"><img src="img/x.gif" class="del" title="Annuleren" alt="Annuleren" /></a>-->
                    </div>
                </td>
            </tr>
        </tbody>
</table>
        <?php
        }
        }
        ?>
<?php
$settlers = $database->getMovement(5,$village->wid,0);   
if($settlers){
$total_for = count($settlers);

for($y=0;$y<$total_for;$y++){
$timer += 1;
    $coor = $database->getCoor($settlers[$y]['to']);
?>
<table class="troop_details" cellpadding="1" cellspacing="1">            
    <thead>
        <tr>
            <td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td>
            <td colspan="10" class="troopHeadline"><a href="karte.php?d=<?php echo $settlers[$y]['to']."&c=".$generator->getMapCheck($settlers[$y]['to']); ?>">Új falu alapítás (<?php echo $coor['y']."|".$coor['x']; ?>)</a></td>
        </tr>
    </thead>
    <tbody class="units">
            <?php
                $tribe = $session->tribe;
                 $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  
                  echo "<tr><th class=\"coords\">
					<span class=\"coordinates coordinatesAligned\">
                    <span class=\"coordinateY\">(".$coor['y']."</span>
                    <span class=\"coordinatePipe\">|</span>
                    <span class=\"coordinateX\">".$coor['x'].")</span>
                    </span>
                    <span class=\"clear\"></span></th>";
                  for($i=$start;$i<=($end);$i++) {
                      echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";    
                  }
            ?>
            </tr>
 <tr><th>Troops</th>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td class="none">0</td>
            <td>3</td>

           </tr></tbody>
        <tbody class="infos">
            <tr>
                <th>Arrival</th>
                <td colspan="10">
                <?php
                    echo "<div class=\"in small\"><span id=timer$timer>".$generator->getTimeFormat($settlers[$y]['endtime']-time())."</span> hrs</div>";
                    $datetime = $generator->procMtime($settlers[$y]['endtime']);
                    echo "<div class=\"at small\">";
                    echo " ".$datetime[1]."</div>";
            ?>
                    <!--<div class="abort"><a href="build.php?id=39&a=4&t=5360004"><img src="img/x.gif" class="del" title="Annuleren" alt="Annuleren" /></a>-->
                    </div>
                </td>
            </tr>
        </tbody>
</table>
        <?php
        }
        }
        ?>

