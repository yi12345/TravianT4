<?php

    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

if($golds['b1'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b1 = '0' where `id`='".$session->uid."'") or die(mysql_error());
}

if($golds['b2'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b2 = '0' where `id`='".$session->uid."'") or die(mysql_error());
}
if($golds['b3'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b3 = '0' where `id`='".$session->uid."'") or die(mysql_error());
}

if($golds['b4'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b4 = '0' where `id`='".$session->uid."'") or die(mysql_error());
}

include("Templates/Plus/pmenu.tpl");
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

        $today = date("mdHi");

if (mysql_num_rows($MyGold)) {
	if($session->gold == 0) {
		echo "<div class=\"boxes boxesColor gray goldBalance\"><div class=\"boxes-tl\"></div><div class=\"boxes-tr\"></div><div class=\"boxes-tc\"></div><div class=\"boxes-ml\"></div><div class=\"boxes-mr\"></div><div class=\"boxes-mc\"></div><div class=\"boxes-bl\"></div><div class=\"boxes-br\"></div><div class=\"boxes-bc\"></div><div class=\"boxes-contents\">You don't have any Gold!</div></div>";
	} else {
		echo "<div class=\"boxes boxesColor gray goldBalance\"><div class=\"boxes-tl\"></div><div class=\"boxes-tr\"></div><div class=\"boxes-tc\"></div><div class=\"boxes-ml\"></div><div class=\"boxes-mr\"></div><div class=\"boxes-mc\"></div><div class=\"boxes-bl\"></div><div class=\"boxes-br\"></div><div class=\"boxes-bc\"></div><div class=\"boxes-contents\">You have <b>$session->gold</b>  Pieces of gold</div></div>";
	}
}

if($_GET['action']==FinishBuilding){
	$golds = $database->getUserArray($session->uid, 1);

    $MyVilId = mysql_query("SELECT * FROM ".TB_PREFIX."bdata WHERE `wid`='".$village->wid."'") or die(mysql_error());
    $uuVilid = mysql_fetch_array($MyVilId);
    $MyVilId2 = mysql_query("SELECT * FROM ".TB_PREFIX."research WHERE `vref`='".$village->wid."'") or die(mysql_error());
    $uuVilid2 = mysql_fetch_array($MyVilId2);
	
    $buildnum = mysql_num_rows($MyVilId);
    $resnum = mysql_num_rows($MyVilId2);
    
    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

if($session->gold >= 2) {

		if($session->access!=BANNED){
		$ww = 1;
		foreach($building->buildArray as $jobs) {
		if($jobs['wid']==$village->wid){
		$wwvillage = $database->getResourceLevel($jobs['wid']);
		if($wwvillage['f99t']!=40){
			$level = $jobs['level'];
			if($jobs['type'] != 25 AND $jobs['type'] != 26 AND $jobs['type'] != 40) {
			$finish = 1;
				$resource = $building->resourceRequired($jobs['field'],$jobs['type']);
				if($jobs['master'] == 0){
				$q = "UPDATE ".TB_PREFIX."fdata set f".$jobs['field']." = ".$jobs['level'].", f".$jobs['field']."t = ".$jobs['type']." where vref = ".$jobs['wid'];
				}else{
				$villwood = $database->getVillageField($jobs['wid'],'wood');
				$villclay = $database->getVillageField($jobs['wid'],'clay');
				$villiron = $database->getVillageField($jobs['wid'],'iron');
				$villcrop = $database->getVillageField($jobs['wid'],'crop');
				$type = $jobs['type'];
				$buildarray = $GLOBALS["bid".$type];
				$buildwood = $buildarray[$level]['wood'];
				$buildclay = $buildarray[$level]['clay'];
				$buildiron = $buildarray[$level]['iron'];
				$buildcrop = $buildarray[$level]['crop'];
				if($buildwood < $villwood && $buildclay < $villclay && $buildiron < $villiron && $buildcrop < $villcrop){
				$enought_res = 1;
				$q = "UPDATE ".TB_PREFIX."fdata set f".$jobs['field']." = ".$jobs['level'].", f".$jobs['field']."t = ".$jobs['type']." where vref = ".$jobs['wid'];
				}
				}
				if($database->query($q) && ($enought_res == 1 or $jobs['master'] == 0)) {
					$database->modifyPop($jobs['wid'],$resource['pop'],0);
					$database->addCP($jobs['wid'],$resource['cp']);
					$q = "DELETE FROM ".TB_PREFIX."bdata where id = ".$jobs['id'];
					$database->query($q);
					if($jobs['type'] == 18) {
						$owner = $database->getVillageField($jobs['wid'],"owner");
						$max = $bid18[$level]['attri'];
						$q = "UPDATE ".TB_PREFIX."alidata set max = $max where leader = $owner";
						$database->query($q);
					}
				}
				if(($jobs['field'] >= 19 && ($session->tribe == 1 || ALLOW_ALL_TRIBE)) || (!ALLOW_ALL_TRIBE && $session->tribe != 1)) { $innertimestamp = $jobs['timestamp']; }
			}
		}
		}
		}
		$wwvillage1 = $database->getResourceLevel($village->wid);
		if($wwvillage1['f99t']!=40){
		$ww = 0;
		}
		if($ww == 0){
		$database->finishDemolition($village->wid);
		$technology->finishTech();
		$logging->goldFinLog($village->wid);
		$database->modifyGold($session->uid,2,0);
		$stillbuildingarray = $database->getJobs($village->wid);
		if(count($stillbuildingarray) == 1) {
			if($stillbuildingarray[0]['loopcon'] == 1) {
				$q = "UPDATE ".TB_PREFIX."bdata SET loopcon=0,timestamp=".(time()+$stillbuildingarray[0]['timestamp']-$innertimestamp)." WHERE id=".$stillbuildingarray[0]['id'];
				$database->query($q);
			}
		}
		}
		header("Location: plus.php?id=3");
		}else{
		header("Location: banned.php");
		}
} else {
        $done1 = "Not enough Gold";
}

}
 ?>
<!-- TODO - Show Construction and research in progress here? -->
<!-- <h4 class="spacer">ساخت</h4> --> 
<br><br>
<?php echo $done1; ?>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
	<thead>

		<tr>
			<td>Description</td>
			<td>Duration</td>
			<td>Gold</td>
			<td>Action</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="desc">
				Plus <b><font color="#71D000">Account</font></b><br><span class="run">
<?php 
$datetimep=$golds['plus'];
$datetime1=$golds['b1'];
$datetime2=$golds['b2'];
$datetime3=$golds['b3'];
$datetime4=$golds['b4'];
$datetimeap=$golds['ap'];
$datetimedp=$golds['dp'];
//Retrieve the current date/time  
$date2=strtotime("NOW"); 


	if ($datetimep == 0) {
		print "";
	}elseif ($datetimep <= $date2) {
		mysql_query("UPDATE ".TB_PREFIX."users set plus = '0' where `id`='".$session->uid."'") or die(mysql_error());
 	} else {
   
$holdtotmin=(($datetimep-$date2)/60);
$holdtothr=(($datetimep-$date2)/3600); 
$holdtotday=round(($datetimep-$date2)/86400, 1);
$holdhr=intval($holdtothr-($holdtotday*24));	
$holdmr=intval($holdtotmin-(($holdhr*60)+($holdtotday*1440))); 
    
    echo "You have <b>".$holdtotday. "</b> days left till ".date('H:i',$golds['plus'])."";
 }
?>
                </span>			</td>
			<td class="dur"><?php if(PLUS_TIME >= 86400){
			echo ''.(PLUS_TIME/86400).' Days';
			} else if(PLUS_TIME < 86400){
			echo ''.(PLUS_TIME/3600).' Days';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="gold">10</td>
			<td class="act">
<?php
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 9 && $datetimep < $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=8'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activate</div></div></button>";
}elseif
	($golds['gold'] > 9 && $datetimep > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=8'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Extend</div></div></button>";

} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Needs Gold</div></div></button>";
    }
}
 ?>            
            </td>
		</tr>
  </tbody>
</table>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td>Description</td>
			<td>Duration</td>
			<td>Gold</td>
			<td>Action</td>
		</tr>
	</thead>
	<tbody>
				<tr>
			<td class="desc">
				+<b>25</b>% Lumber <img class="r1" src="img/x.gif" alt="<br>
				<span class="run">
<?php

$tl_b1=$golds['b1'];
 if ($tl_b1 < $date2) {
     print "";
 } else {
$holdtotmin1=(($tl_b1-$date2)/60);
$holdtothr1=(($tl_b1-$date2)/3600); 
$holdtotday1=round(($tl_b1-$date2)/86400, 1);
$holdhr1=intval($holdtothr1-($holdtotday1*24));	
$holdmr1=intval($holdtotmin1-(($holdhr1*60)+($holdtotday1*1440))); 
}

 if ($tl_b1 < $date2) {
     print " ";
 } else {
echo "    <br>You have <b>".$holdtotday1. "</b> days left till   ".date('H:i',$golds['b1'])."";

 }
?>               
                
                </span>			</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' Days';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="gold">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b1 < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=9'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activate</div></div></button>";
}elseif
	($golds['gold'] > 4 && $datetime1 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=9'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Extend</div></div></button>";
} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Needs Gold</div></div></button>";
    }
}
?>            
            </td>
		</tr>
			<tr>
			<td class="desc">
				+<b>25</b>% Clay <img class="r2" src="img/x.gif" alt="<br>
				<span class="run">
                <?php

$tl_b2=$golds['b2'];
 if ($tl_b2 < $date2) {
     print " ";
 } else {
$holdtotmin2=(($tl_b2-$date2)/60);
$holdtothr2=(($tl_b2-$date2)/3600); 
$holdtotday2=round(($tl_b2-$date2)/86400, 1);
$holdhr2=intval($holdtothr2-($holdtotday2*24));	
$holdmr2=intval($holdtotmin2-(($holdhr2*60)+($holdtotday2*1440))); 
}

 if ($tl_b2 < $date2) {
     print " ";
 } else {		

echo "<br> You have <b>".$holdtotday2. "</b> days left till ".date('H:i',$golds['b2'])."";

 }
?>
                
                </span>			</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' Days';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="gold">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b2 < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=10'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activate</div></div></button>";
}elseif
	($golds['gold'] > 4 && $tl_b2 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=10'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Extend</div></div></button>";
} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Needs Gold</div></div></button>";
    }
    }
 ?>
            
            </td>
		</tr>
			<tr>
			<td class="desc">
				+<b>25</b>% iron <img class="r3" src="img/x.gif" alt="<br>
				<span class="run">
<?php

$tl_b3=$golds['b3'];
 if ($tl_b3 < $date2) {
     print " ";
 } else {
$holdtotmin3=(($tl_b3-$date2)/60);
$holdtothr3=(($tl_b3-$date2)/3600); 
$holdtotday3=round(($tl_b3-$date2)/86400, 1);
$holdhr3=intval($holdtothr3-($holdtotday3*24));	
$holdmr3=intval($holdtotmin3-(($holdhr3*60)+($holdtotday3*1440))); 
}

 if ($tl_b3 < $date2) {
     print " ";
 } else {		
echo " <br> You have <b>".$holdtotday3. "</b> Days left till ".date('H:i',$golds['b3'])."";

 }
?>
                
                </span>			</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' Days';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="gold">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b3  < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=11'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activate</div></div></button>";
}elseif
	($golds['gold'] > 4 && $tl_b3 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=11'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Extend</div></div></button>";
} else  {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Needs Gold</div></div></button>";
} }
 ?>            
            </td>
		</tr>
			<tr>
			<td class="desc">
				+<b>25</b>% wheat <img class="r4" src="img/x.gif" alt="<br>
				<span class="run">
<?php
$tl_b4=$golds['b4'];
 if ($tl_b4 < $date2) {
     print " ";
 } else {
$holdtotmin4=(($tl_b4-$date2)/60);
$holdtothr4=(($tl_b4-$date2)/3600); 
$holdtotday4=round(($tl_b4-$date2)/86400, 1);
$holdhr4=intval($holdtothr4-($holdtotday4*24));	
$holdmr4=intval($holdtotmin4-(($holdhr4*60)+($holdtotday4*1440))); 
}

 if ($tl_b4 < $date2) {
     print " ";
 } else {		

echo "<br> You have <b>".$holdtotday4. "</b> days left till ".date('H:i',$golds['b4'])."";
 }
?>
		</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' Days';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="gold">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b4 < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=12'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activate</div></div></button>";
}elseif
	($golds['gold'] > 4 && $tl_b4 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=12'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Extend</div></div></button>";
} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Needs Gold</div></div></button>";
} }
?>
            
            </td>
		</tr>
  </tbody>
</table>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td>Description</td>
			<td>Duration</td>
			<td>Gold</td>
			<td>Action</td>
		</tr>
	</thead>
	<tbody>
		
		<tr>
			<td class="desc">Complete all Building and Researches immediately.</td>
			<td class="dur">Instant</td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="gold">2</td>
			<td class="act">
<?php
if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 1) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=3&action=FinishBuilding'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Complete</div></div></button>";

} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Needs Gold</div></div></button>";
	}
}
 ?>
			</td>
		</tr>
			<tr>
			<td class="desc">NPC Merchant 1:1</td>
			<td class="dur">instant</td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="gold">3</td>
			<td class="act link">
            <?php
            if($building->getTypeLevel(17)){ ?>
            <a class="arrow" href="build.php?gid=17&amp;t=3">Go to Market</a>
            <?php }else{ ?>
            <span class="none"><center>Go To Market</center></span>
            <?php } ?>
			</td>
		</tr>
        <tr>
				<td class="desc">Exchange Gold and Silver</td>
				<td class="dur">Instant</td>
				<td class="cost"><img src="img/x.gif" class="gold" title= "Gold" alt="Gold"></td>
				<td class="act arrow" style="text-align: right"><a class="arrow" href="plus.php?id=6">Exchange Office</a></td>
			</tr>
        </tbody>
</table>
<h4 class="spacer">Gold Club</h4>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
		<thead>
			<tr>
				<td>Description</td>
				<td>Duration</td>
				<td>Gold</td>
				<td>Action</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="desc">
					<a name="goldclub"></a>
					<b>Gold Club</b>

<div class="run">Activate Gold Club for extra.</div>
				</td>
				<td class="dur">
					The whole Game
					
				</td>
				<td class="cost"><img src="img/x.gif" class="gold" alt="gold">100</td>
				<td class="act">
<?php
if($session->gold >= 100){
	if($golds['goldclub'] == 0) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=15'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activate</div></div></button>";

	} else {
		echo "<button type=\"button\" value=\"فعال شده\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activated</div></div></button>";
	}
}else{
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Activate</div></div></button>";
}
                ?></td>
			</tr>



	</tbody>
</table>
<div class="clear">&nbsp;</div>