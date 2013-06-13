<?php

/*
|--------------------------------------------------------------------------
|   PLEASE DO NOT REMOVE THIS COPYRIGHT NOTICE!
|--------------------------------------------------------------------------  
|
|   Developed by:   Dzoki < dzoki.travian@gmail.com >
|  
|   This script is property of TravianX Project. You are allowed to change
|   its source and release it, but you have no rights to remove copyright
|   notices.
|
|   TravianX All rights reserved
|
*/


    if(isset($aid)) {
        $aid = $aid;
    } else {
        $aid = $session->alliance;
    }
    $allianceinfo = $database->getAlliance($aid);
echo "<h1>Alliance - ".$allianceinfo['tag']."</h1>";
    include("alli_menu.tpl"); 
?>


<h4 class="round">Diplomacy</h4>
<form method="post" action="allianz.php">
<input type="hidden" name="a" value="6">
<input type="hidden" name="o" value="6">
<input type="hidden" name="s" value="5">
		<div class="option diplomacy">
			<table cellpadding="1" cellspacing="1" class="option transparent">
				<tbody>
					<tr>
						<th>
							Name:						</th>
						<td>
							<input class="ally text" type="text" name="a_name" maxlength="8">
						</td>
					</tr>

					<tr>
						<td>
						</td>
						<td>
							<input class="radio" type="radio" id="dipl1" name="dipl" value="1">
							<label for="dipl1">Offer confederation</label>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<input class="radio" type="radio" id="dipl2" name="dipl" value="2">
							<label for="dipl2">Offer non-aggression pact</label>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<input class="radio" type="radio" id="dipl3" name="dipl" value="3">
                            <label for="dipl3">Declare war</label>
						</td>
					</tr>
				</tbody>
			</table>

			<p class="option">
				<input type="hidden" name="a" value="6">
				<button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Save</div></div></button><p class="error"></p>
                </p>
		</div>
</form>
		<div class="boxes boxesColor gray infos"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">			<div class="title">
				Notice			</div>
			<div class="text">
				It is considered good diplomatic etiquette to contact the other alliance before sending them an offer for a confederation or non-aggression pact.			</div>
			</div>
				</div>		<div class="clear"></div>

			
<h4 class="round">Own offers</h4>
<table cellpadding="1" cellspacing="1" class="option own transparent">
	<tbody>
        <tbody>
        <?php 
        $alliance = $session->alliance;
        
        if(count($database->diplomacyOwnOffers($alliance))){
            foreach($database->diplomacyOwnOffers($alliance) as $key => $value){
                if($value['type'] == 1){
                    $type = "Confedartion with";
                } else if($value['type'] == 2){
                    $type = "Nap With";
                } else if($value['type'] == 3){
                    $type = "War With";
                }
                echo "<tr><td class=\"abo\"><form method=\"post\" action=\"allianz.php\"><input type=\"hidden\" name=\"o\" value=\"101\"><input type=\"hidden\" name=\"id\" value=\"".$value['id']."\"><button type=\"submit\" value=\"del\" class=\"icon\"><img src=\"img/x.gif\" class=\"del\" alt=\"Cancel\"></button></form></td>";
                echo '<td><a href="allianz.php?aid='.$value['alli2'].'">'.$type.' '.$database->getAllianceName($value['alli2']).'</a></td></tr>';
            }   
        } else {
            echo '<tr><td class="noData">None</td></tr>';
        }
        ?>
        </tbody>
    </table>

<h4 class="round">Foreign offers</h4>
<table width="100px" border="0" class="option foreign transparent">
        <tbody>
             <?php 
        unset($type);
        $alliance = $session->alliance;
        
        if(count($database->diplomacyInviteCheck($alliance))){
            foreach($database->diplomacyInviteCheck($alliance) as $key => $row){
                if($row['type'] == 1){
                    $type = "Confedartion with";
                } else if($row['type'] == 2){
                    $type = "Nap With";
                } else if($row['type'] == 3){
                    $type = "War With";
                }
                
                echo '<td><form method="post" action="allianz.php"><input type="hidden" name="o" value="102"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli1" value="'.$row['alli1'].'"><button type="submit" value="del" class="icon"><img src="img/x.gif" class="del" alt="Decline"></button></form></td>';
                echo '<td><a href="allianz.php?aid='.$row['alli1'].'">'.$type.' '.$database->getAllianceName($row['alli1']).'</a></td>';                
                
                echo '<td><form method="post" action="allianz.php"><input type="hidden" name="o" value="103"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli2" value="'.$row['alli2'].'"><button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Accept</div></div></button></form></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
                
            }   
        } else {
            echo '<tr><td class="noData">None</td></tr>';
        }
        ?>
        </tbody>
    </table>
    
    
    <h4 class="round">Current Relations</h4>
    <table cellpadding="1" cellspacing="1" class="option existing transparent">
		<tbody>

             <?php 
        unset($type);
        unset($row);
        $alliance = $session->alliance;
        
        if(count($database->diplomacyExistingRelationships($alliance))){
            foreach($database->diplomacyExistingRelationships($alliance) as $key => $row){
                if($row['type'] == 1){
                    $type = "Confedartion with";
                } else if($row['type'] == 2){
                    $type = "Nap With";
                } else if($row['type'] == 3){
                    $type = "war with";
                }                
                echo '<tr><td class="abo"><form method="post" action="allianz.php"><input type="hidden" name="o" value="104"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli2" value="'.$row['alli2'].'"><button type="submit" value="del" class="icon"><img src="img/x.gif" class="del" alt="انصراف"></button></form></td>';
                echo '<td>'.$type.' <a href="allianz.php?aid='.$row['alli1'].'">'.$database->getAllianceName($row['alli1']).'</a></td></tr>';
            }   
        } elseif(count($database->diplomacyExistingRelationships2($alliance))){
            foreach($database->diplomacyExistingRelationships2($alliance) as $key => $row){
                if($row['type'] == 1){
                    $type = "Confedartion with";
                } else if($row['type'] == 2){
                    $type = "Nap With";
                } else if($row['type'] == 3){
                    $type = "War With";
                }
                echo '<tr><td class="abo"><form method="post" action="allianz.php"><input type="hidden" name="o" value="104"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli2" value="'.$row['alli1'].'"><button type="submit" value="del" class="icon"><img src="img/x.gif" class="del" alt="انصراف"></button></form></td>';
                echo '<td>'.$type.' <a href="allianz.php?aid='.$row['alli2'].'">'.$database->getAllianceName($row['alli2']).'</a></td></tr>';
            }   
        }else {
            echo '<tr><td class="noData">None</td></tr>';
        }
        
        ?>
        
                
        </tbody>
    </table>
<div class="boxes boxesColor gray infos"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">		<div class="title">
			Hint		</div>
		<div class="text">
			To automatically display alliance relations in the profile, simply write [diplomatie], [ally], [nap] and [war] separated in the profile.
 <span class="e">[diplomatie]        
</span><span class="e"></span><span class="e"></span><span class="e"></span>  		</div>
		</div>
				</div>