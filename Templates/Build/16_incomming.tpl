<?php

$units = $database->getMovement("34",$village->wid,1);
$total_for = count($units);

for($y=0;$y < $total_for;$y++){
$timer += 1;
if ($units[$y]['sort_type']==3){
	if ($units[$y]['attack_type']==3){
		$actionType = "Attack on ";
	} else if ($units[$y]['attack_type']==4){
		$actionType = "Raid on ";
	} else if ($units[$y]['attack_type']==2){
		$actionType = "Reinforcement from ";
	}

	if($units[$y]['attack_type'] != 1){
		echo "<table class=\"troop_details ";
        
        if($units[$y]['attack_type'] != 2){ echo "inRaid"; } else { echo "inReturn"; }
        	echo"\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$units[$y]['from']."&c=".$generator->getMapCheck($units[$y]['from'])."\">".$database->getVillageField($units[$y]['from'],"name")."</a></td>
                  <td colspan=\"11\" class=\"troopHeadline\">";
                  echo "<a href=\"spieler.php?uid=".$database->getVillageField($units[$y]['to'],"owner")."\">";
                  echo $actionType ." ". $village->vname;
                  echo " village</a></td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($units[$y]['from'],"owner"),"tribe",0);
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  $coor = $database->getCoor($units[$y]['from']);
                  echo "<tr><th class=\"coords\">
					<span class=\"coordinates coordinatesAligned\">
                    <span class=\"coordinateY\">(".$coor['y']."</span>
                    <span class=\"coordinatePipe\">|</span>
                    <span class=\"coordinateX\">".$coor['x'].")</span>
                    </span>
                    <span class=\"clear\">a</span></th>";
                  for($i=$start;$i<=$end;$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
                  echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(52)."\" alt=\"".$technology->getUnitName(52)."\" /></td>";	
                  echo "</tr><tr><th>Troops</th>";
                  
                  

if($village->resarray['f39'] >= 5){
	for($t=1;$t<=11;$t++){
        if($units[$y]['t'.$t]){
        	if($t!=7 or $t!=8 or $t!=8){
				echo "<td>?</td>";
            }
		}else{
			echo "<td class=\"none\">?</td>";
		}
    }
}else{
	for($t=1;$t<=11;$t++){
		echo "<td class=\"none\">?</td>";
	}
}
                  
                  echo "</tr></tbody>";
                  echo '
                  <tbody class="infos">
									<tr>
										<th>Arrival</th>
										<td colspan="11">
										<div class="in small"><span id=timer'.$timer.'>'.$generator->getTimeFormat($units[$y]['endtime']-time()).'</span> hrs.</div>';
										    $datetime = $generator->procMtime($units[$y]['endtime']);
										    echo "<div class=\"at small\">";
										    echo " ".$datetime[1]." hrs</div>
											</div>
										</td>
									</tr>
								</tbody>";
		echo "</table>";
        
	} 
}elseif ($units[$y]['sort_type']==4){
	if ($units[$y]['attack_type']==1){
		$actionType = "Return to ";
	} else if ($units[$y]['attack_type']==2){
		$actionType = "Return to ";
	} else if ($units[$y]['attack_type']==3){
		$actionType = "Return to ";
	} else if ($units[$y]['attack_type']==4){
		$actionType = "Return to ";
	}

$to = $database->getMInfo($units[$y]['vref']);
?>
<table class="troop_details inReturn" cellpadding="1" cellspacing="1">            
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td>
            <?php if($units[$y]['t11']!=0){ $colspan = '11'; }else{ $colspan = '10'; } ?>
			<td colspan="<?php echo $colspan; ?>" class="troopHeadline"><a href="karte.php?d=<?php echo $to['wref']."&c=".$generator->getMapCheck($to['wref']); ?>"><?php echo $actionType ." ". $to['name']; ?></a></td>
		</tr>
	</thead>
	<tbody class="units">
			<?php
				$tribe = $session->tribe;
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  $coor = $database->getCoor($units[$y]['vref']);
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
                  if($units[$y]['t11']!=0){
                  echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"".$technology->getUnitName(52)."\" alt=\"".$technology->getUnitName(52)."\" /></td>";
                  }	
			?>
			</tr>
 <tr><th>Troops</th>
            <?php
            for($i=1;$i<=10;$i++) {
            	if($units[$y]['t'.$i] == 0) {
                	echo "<td class=\"none\">";
                }else {
                echo "<td>";
                }
                echo $units[$y]['t'.$i]."</td>";
            }
            if($units[$y]['t11']!=0){
            	if($units[$y]['t11'] == 0) {
                	echo "<td class=\"none\">";
                }else {
                	echo "<td>";
                }
                echo $units[$y]['t11']."</td>";
            }
            ?>
           </tr>

           </tbody>
		<tbody class="infos">
        <?php
        if($units[$y]['attack_type']==3 || $units[$y]['attack_type']==4){        
        $dataarray = explode(",",$units[$y]['data']);
        
        ?>
    <tr><th>Bounty</th>
    <td colspan="<?php echo $colspan; ?>">
    <div class="res">
    <span class="resource" title="Wood"><img class="r1" src="img/x.gif" alt="Wood"><?php echo $dataarray['0']; ?></span>
    <span class="resource" title="Lumber"><img class="r1" src="img/x.gif" alt="Lumber"><?php echo $dataarray['0']; ?></span>

    <span class="resource" title="Clay"><img class="r2" src="img/x.gif" alt="Clay"><?php echo $dataarray['1']; ?></span>
    <span class="resource" title="Iron"><img class="r3" src="img/x.gif" alt="Iron"><?php echo $dataarray['2']; ?></span>
    <span class="resource" title="Crop"><img class="r4" src="img/x.gif" alt="Crop"><?php echo $dataarray['3']; ?></span>
    </div>
    <div class="carry">
    <?php
    if ($dataarray[0]+$dataarray[1]+$dataarray[2]+$dataarray[3] == 0) {
    echo"<img title=\"";
    echo ($dataarray[0]+$dataarray[1]+$dataarray[2]+$dataarray[3])."/".$dataarray[4];
    echo"\" src=\"img/x.gif\" class=\"carry empty\">";
	} elseif ($dataarray[0]+$dataarray[1]+$dataarray[2]+$dataarray[3] != $dataarray[4]) {
    echo "<img title=\"";
    echo ($dataarray[0]+$dataarray[1]+$dataarray[2]+$dataarray[3])."/".$dataarray[4];
    echo"\" src=\"img/x.gif\" class=\"carry half\">";
    } else {
    echo"<img title=\"";
    echo ($dataarray[0]+$dataarray[1]+$dataarray[2]+$dataarray[3])."/".$dataarray[4];
    echo"\" src=\"img/x.gif\" class=\"carry full\">";
    }

    ?>
    <?php echo ($dataarray[0]+$dataarray[1]+$dataarray[2]+$dataarray[3])."/".$dataarray[4]; ?>
    </td>
    </tr>
    <?php } ?>
			<tr>
				<th>Arrival</th>
				<td colspan="<?php echo $colspan; ?>">
				<?php
                
				    echo "<div class=\"in small\"><span id=timer".$timer.">".$generator->getTimeFormat($units[$y]['endtime']-time())."</span> hrs.</div>";
				    $datetime = $generator->procMtime($units[$y]['endtime']);
				    echo "<div class=\"at small\">";
				    echo " ".$datetime[1]."</div>";
    		?>
					</div>
				</td>
			</tr>
		</tbody>
</table>
<?php	

	}
}


?>