<?php

$del_protect = 0;

// Temp

$eigen = $database->getCoor($village->wid);

$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);

$to = array('x'=>$coor['x'], 'y'=>$coor['y']);

$time = $generator->procDistanceTime($from,$to,300,0);

// Temp

$ckey= $generator->generateRandStr(6);


 if (!isset($process['t1']) || $process['t1'] == ''){  $t1='0'; }else{  $t1=$process['t1']; }
 if (!isset($process['t2']) || $process['t2'] == ''){  $t2='0'; }else{  $t2=$process['t2']; } 
 if (!isset($process['t3']) || $process['t3'] == ''){  $t3='0'; }else{  $t3=$process['t3']; if ($session->tribe == 3){ $scout=1; } } 
 if (!isset($process['t4']) || $process['t4'] == ''){  $t4='0'; }else{  $t4=$process['t4']; if ($session->tribe == 1 || $session->tribe == 2 || $session->tribe == 4 || $session->tribe == 5){ $scout=1;} } 
 if (!isset($process['t5']) || $process['t5'] == ''){  $t5='0'; }else{  $t5=$process['t5']; } 
 if (!isset($process['t6']) || $process['t6'] == ''){  $t6='0'; }else{  $t6=$process['t6']; } 
 if (!isset($process['t7']) || $process['t7'] == ''){  $t7='0'; }else{  $t7=$process['t7']; } 
 if (!isset($process['t8']) || $process['t8'] == ''){  $t8='0'; }else{  $t8=$process['t8']; } 
 if (!isset($process['t9']) || $process['t9'] == ''){  $t9='0'; }else{  $t9=$process['t9']; } 
 if (!isset($process['t10']) || $process['t10'] == ''){  $t10='0'; }else{  $t10=$process['t10']; } 
 if (!isset($process['t11']) || $process['t11'] == ''){  $t11='0'; }else{  $t11=$process['t11']; $showhero=1;} 
 if ($session->tribe == 3){
 $totalunits =$process['t1']+$process['t2']+$process['t4']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];
 
 }else{
 
$totalunits=$process['t1']+$process['t2']+$process['t3']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];

 }

if ($scout==1 && $totalunits==0) {
$process['c'] = 1;
}

$id = $database->addA2b($ckey,time(),$process['0'],$t1,$t2,$t3,$t4,$t5,$t6,$t7,$t8,$t9,$t10,$t11,$process['c']);

if ($process['c']==1){
$actionType = "Scouting ";
}else if ($process['c']==2){
$actionType = "Reinforcement to ";
}elseif ($process['c']==3){
$actionType = "Normal Attack to ";
}else{
$actionType = "Raid to ";
}


$uid = $session->uid;

$tribe = $session->tribe;
$start = ($tribe-1)*10+1;
$end = ($tribe*10);
?>

<h1><?php echo $actionType." ".$process[1]; ?></h1>            

<form method="post" action="a2b.php">

            <table id="short_info" cellpadding="1" cellspacing="1">

                <tbody>

                    <tr>

                        <th>Location</th>

                        <td><a href="position_details.php?x=<?php echo $coor['x']; ?>&amp;y=<?php echo $coor['y']; ?>"><?php echo $process[1]; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</a></td>

                    </tr>

                    <tr>

                        <th>Player</th>

                        <td>
                        <?php if($process['2'] == 3){ ?>
                        <font class="none"><b>Nature</b></font>
                        <?php } else { ?>
                        <a href="spieler.php?uid=<?php echo $process['2']; ?>">
                        <?php if($process['2'] == 2){
                        	echo "Natar";
                            	} else {
                       				echo $database->getUserField($process['2'],'username',0);
                        		} ?>
                        </a>
                        <?php } ?>
                        </td>

                    </tr>

                </tbody>

            </table>



            <table class="troop_details" cellpadding="1" cellspacing="1">

                <thead>

                    <tr>

                        <td><?php echo $village->vname; ?></td>

                        <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><?php echo $actionType." ".$process['1']; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</td>

                    </tr>

                </thead>

                <tbody class="units">

                    <tr>

                        <td></td>
                 <?php 
                for($i=$start;$i<=($end);$i++) {
                      echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";    
                  } if ($process['t11'] != ''){
                  echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Hero\" alt=\"Hero\" /></td>";    
                  
                  }?>
                        
                    </tr>

                    <tr>

                        <th>Units</th>

                        <td <?php if (!isset($process['t1']) || $process['t1'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t1'];} ?></td>

                        <td <?php if (!isset($process['t2']) || $process['t2'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t2'];} ?></td>

                        <td <?php if (!isset($process['t3']) || $process['t3'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t3'];} ?></td>

                        <td <?php if (!isset($process['t4']) || $process['t4'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t4'];} ?></td>

                        <td <?php if (!isset($process['t5']) || $process['t5'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t5'];} ?></td>

                        <td <?php if (!isset($process['t6']) || $process['t6'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t6'];} ?></td>

                        <td <?php if (!isset($process['t7']) || $process['t7'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t7'];} ?></td>

                        <td <?php if (!isset($process['t8']) || $process['t8'] == ''){ echo "class=\"none\">0"; }else{ $kata='1'; echo ">".$process['t8'];} ?></td>

                        <td <?php if (!isset($process['t9']) || $process['t9'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t9'];} ?></td>

                        <td <?php if (!isset($process['t10']) || $process['t10'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t10'];} ?></td>

                        <?php if (!isset($process['t11']) || $process['t11'] == ''){ echo ""; }else{ echo "<td>".$process['t11']."</td>";} ?>

                     </tr>

                </tbody>
			<?php if ($process['c']==1){ ?>
                <tbody class="options">
                
                <tr>
            <th>Options</th>
            <td colspan="11"><input class="radio" name="spy" value="1" checked="checked" type="radio">Scout resources and troops<br>
            <input class="radio" name="spy" value="2" type="radio">Scout defences and troops                                            </td>
        </tr>
    </tbody>
    <?php } ?>
                

        <?php if(isset($kata) AND $process['c']!='2'){?>

            <?php if($process['c']=='3'){ ?><tbody class="cata">
                <tr>
                    <th>Catapults</th>
                    <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">
                    
                        <select name="ctar1" class="dropdown">
                            <option value="0">Random</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                			<optgroup label="Resource">
                                <option value="1">Lumber</option>
                                <option value="2">Clay Pit</option>
                                <option value="3">Iron Mine</option>
                                <option value="4">Cropland</option>
                                <option value="5">Sawmill</option>
                                <option value="6">Brickworks</option>
                                <option value="7">Iron foundry</option>
                                <option value="8">Flour Mill</option>
                                <option value="9">Bakery</option>
                            </optgroup>
                            <?php } ?>
                            
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infranstructer">
                                <option value="10">warehouse</option>
                                <option value="11">granary</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">main Building</option>
                                <option value="17">market</option>
                                <option value="18">embassy</option>
                                <option value="24">town hall</option>
                                <option value="25">Residence</option>
                                <option value="26">Palace</option>
                                <option value="27">treasury</option>
                                <option value="28">Trade center</option>
                                <?php } ?>
                                <option value="38">Great Warehouse</option>
                                <option value="39">Great Granary</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Katonai">
                                <option value="12">smithy</option>
                                <option value="13">Armoury</option>
                                <option value="14">Tournament Square</option>
                                <option value="16">Rally Point</option>
 								<option value="19">barrack</option>
 								<option value="20">stable</option>
 								<option value="21">workshop</option>
                                <option value="22">Akadémia</option>
 								<option value="29">Great Barracks</option>
  								<option value="30">Great Stable</option>
  								<option value="37">Heros Mansion</option>
                            </optgroup>
                            <?php } ?>
                        </select>

            <?php if($building->getTypeLevel(16) == 20) { ?>
                     <select name="ctar2" class="dropdown">
                <option value="0">-</option>
                <option value="0">Random</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                            <optgroup label="Nyersanyagok">
                                <option value="1">lumber</option>
                                <option value="2">clay Pit</option>
                                <option value="3">Iron Mine</option>
                                <option value="4">Cropland</option>
                                <option value="5">Sawmill</option>
                                <option value="6">Brickworks</option>
                                <option value="7">iron foundry</option>
                                <option value="8">Flour Mill</option>
                                <option value="9">bakery</option>
                            </optgroup>
                            <?php } ?>
                            
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infrastruktúra">
                                <option value="10">warehouse</option>
                                <option value="11">granary</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">main Building</option>
                                <option value="17">market</option>
                                <option value="18">Embassy</option>
                                <option value="24">town hall</option>
                                <option value="25">residence</option>
                                <option value="26">Palace</option>
                                <option value="27">treasury</option>
                                <option value="28">Trade center</option>
                                <?php } ?>
                                <option value="38">Great Warehouse</option>
                                <option value="39">Great Granary</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Katonai">
                                <option value="12">smithy</option>
                                <option value="13">Armoury</option>
                                <option value="14">Tournament Square</option>
                                <option value="16">Rally Point</option>
                                <option value="19">barrack</option>
                                <option value="20">stable</option>
                                <option value="21">workshop</option>
                                <option value="22">academy</option>
                                <option value="29">Great Barracks</option>
                                <option value="30">Great Stable</option>
                                <option value="37">Heros Mansion</option>
                            </optgroup>
                            <?php } ?>
                        </select>
                    <?php }?>

                    <span class="info">(will be attacked by catapult(s))</span>
                     </td>
                </tr>
            </tbody><?PHP  
            }
            else if($process['c']=='4')
            {
                ?><tbody class="infos">  
                <th>Destination:</th>

            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">
                <?PHP
                
                echo"Warning: Catapult will <b>ONLY</b> shoot with a normal attack (they dont shoot with raids!)";
                ?>
                </td>

                <?PHP
            }
            ?>

        <?php } ?>



             <tbody class="infos">
    <tr>

   <th>Arrival</th>

            

            <?php
            $speeds = array();
            $scout = 1;
                //find slowest unit.
                for($i=1;$i<=11;$i++){
                    if (isset($process['t'.$i])){
                        if( $process['t'.$i] != '' && $process['t'.$i] > 0){
                            if ($i<11) {
								$speeds[] = ${'u'.(($session->tribe-1)*10+$i)}['speed'];
							}else{
								$herodetail = $database->getHeroData($session->uid);
								$speeds[] = $herodetail['speed'];
							}

                            if($i != 4){
                                $scout = 0;
                            }
                        }
                    }
                }
            

            if($scout){
                $process['c'] = 1;
			}
                
                $time = $generator->procDistanceTime($from,$to,min($speeds),1);

            ?>

            

            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">

            <div class="in">In <?php echo $generator->getTimeFormat($time); ?> hour</div>

            <div class="at"><span id="tp2"> <?php echo date("H:i:s",time()+$time)?></span> Hour</div>

            </td>

        </tr>

    </tbody>

</table>

<input name="timestamp" value="<?php echo time(); ?>" type="hidden"> 

<input name="timestamp_checksum" value="<?php echo $ckey; ?>" type="hidden"> 

<input name="ckey" value="<?php echo $id; ?>" type="hidden"> 

<input name="id" value="39" type="hidden"> 

<input name="a" value="533374" type="hidden">
<input name="c" value="3" type="hidden">

<?php
$attacker = $database->getUserField($session->uid,'alliance',0);
$defender = $database->getUserField($process['2'],'alliance',0);
		if($attacker!=0 && $attacker==$defender){
			echo "<div class=\"alert\">Warning! Are you sure you want to attack this player</div>";
		}

    if($database->hasBeginnerProtection($process['0'])==1) {  
        echo"<div class=\"alert\"><b>Cannot attack, in begginers protection.</b></div>"; 
    } else { 
?> 
<button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">confirm</div></div></button>
<?php
if($database->hasBeginnerProtection($village->wid)==1 && $process['2']!=2 && $process['2']!=3) { 
		$del_protect = 1;
?>
		</br></br><span style="color: #DD0000"><b>Warning:</b> if you attack this player you will lose your beginner protection!</span>
<?php }} ?>
<input name="del_protect" value="<?php echo $del_protect; ?>" type="hidden"> 
</form>
