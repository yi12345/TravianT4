<?php
$to = $database->getVillage($enforce['from']);
$fromcoor = $database->getCoor($enforce['from']);
$tocoor = $database->getCoor($enforce['vref']);

	$fromCor = array('x'=>$tocoor['x'], 'y'=>$tocoor['y']);
	$toCor = array('x'=>$fromcoor['x'], 'y'=>$fromcoor['y']);
    
    $tribe = $database->getUserField($to['owner'], 'tribe', 0);
    $start = ($tribe-1)*10+1;
    $end = ($tribe*10);
if ($enforce['hero']>0){ $colspan = 11; }else{ $colspan = 10; }
?>
<form method="POST" name="snd" action="a2b.php">
		<table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $generator->getBaseID($fromcoor['x'],$fromcoor['y']); ?>&amp;c=<?php echo $generator->getMapCheck($generator->getBaseID($fromcoor['x'],$fromcoor['y'])); ?>"><?php echo $to['name']; ?></a></td>
            <td colspan="<?php echo $colspan; ?>"><a href="spieler.php?uid=<?php echo $to['owner']; ?>">Send these troops back</a></td>
        </tr>
    </thead>
    <tbody class="units">
    	<tr>
        <th>&nbsp;</th>
        <?php
        for($i=$start;$i<=$end;$i++) {
        	echo '<td><img src="img/x.gif" class="unit u'.$i.'" title="'.$technology->unarray[$i].'" alt="'.$technology->unarray[$i].'"></td>';
        }
        	if ($enforce['hero']>0){
            	echo '<td><img src="img/x.gif" class="unit uhero" title="'.$technology->unarray[51].'" alt="'.$technology->unarray[51].'"></td>';
            }
        ?>
        </tr>
        <tr>
        <th>Units</th>
        <?php
        $t = 1;
        for($i=$start;$i<=$end;$i++) {
        	if ($enforce['u'.$i]>0){ 
        		echo "<td><input class=\"text\" name=\"t".$t."\" value=\"".$enforce['u'.$i]."\" maxlength=\"5\" type=\"text\"></td>";
            }else{
					echo "<td class=\"none\">".$enforce['u'.$i]."</td>";
            }
            $t++;
        }
        	if ($enforce['hero']>0){
        		echo "<td><input class=\"text\" name=\"t11\" value=\"".$enforce['hero']."\" maxlength=\"5\" type=\"text\"></td>";
            }
        ?>


        </tr>
    </tbody>
			<?php
			$att_tribe = $database->getUserField($to['owner'],'tribe',0);  
            $start = ($att_tribe-1)*10+1;
            $end = ($att_tribe*10);
			$speeds = array();
				//find slowest unit.
				for($i=$start;$i<=$end;$i++){
					if (isset($enforce['u'.$i])){ 
						if($enforce['u'.$i]!='' && $enforce['u'.$i]>0){ 
							//$speeds[] = $unitspeeds[$i-2];
                            $speeds[] = ${'u'.$i}['speed'];
						}
					}
                    if (isset($enforce['hero'])){ 
						if($enforce['hero']!='' && $enforce['hero']>0){ 
                            $herodetail = $database->getHeroData($to['owner']);
							$speeds[] = $herodetail['speed'];
						}
					}
				}
				$time = $generator->procDistanceTime($fromCor,$toCor,min($speeds),1);

			?>
   <tbody class="infos">
		<tr>
			<th>Arrival</th>
            
            <td colspan="<?php echo $colspan; ?>">
			<div class="in">Travel Time <?php echo $generator->getTimeFormat($time); ?> Hours</div>
			<div class="at"><span id="tp2"><?php echo date("H:i:s",time()+$time)?></span><span> Time</span></div>
			<div class="clear"></div>
			</td>
		</tr>
	</tbody>
</table>
<input name="ckey" value="<?php echo $ckey; ?>" type="hidden"> 
<input name="id" value="39" type="hidden"> 
<input name="a" value="533374" type="hidden">
<input name="c" value="8" type="hidden">

		<p class="button">
			<button type="submit" value="ok" name="s1" id="btn_ok" onclick="if (this.disabled==false) {document.getElementsByTagName('form')[0].submit();} this.disabled=true;"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">confirm</div></div></button>
            </p>
</form>