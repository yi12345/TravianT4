<?php 
$hero = $database->getHeroData($session->uid);
$herodetail = $database->HeroFace($session->uid);
$tribe = $session->tribe;
$hero_t = $GLOBALS["hero_t".$tribe];
if($hero['points'] > 0){ $pStyle = ""; }else { $pStyle = " hidden"; }
$plevel = $hero['level']-1;
$heroWrefC = $generator->getMapCheck($hero['wref']);
if($tribe == 1){ $tp = 100; }else{ $tp = 80; }
$rp = 3*SPEED*$hero['product'];
ob_start();
?>
<div id="attributes"><div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    	<div class="attribute headline">
			<div class="attributesHeadline">Attributes</div>
			<div class="pointsHeadline">Point</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<?php if($hero['itempower']==0){ ?>
  <div class="attribute power tooltip" title="Fighting Strength Combines with your heros defence and offense. The higher the Fighting strength the better in battle.<br><font color='#5dcbfb'>Fighting Strength: <?php echo $hero['power']; ?> from hero</font>">
			<?php }else{ ?>
  <div class="attribute power tooltip" title="Fighting Strength Combines with your heros defence and offense. The higher the Fighting strength the better in battle.<br><font color='#5dcbfb'>Fighting Strength: <?php echo 100+$tp*$hero['power']; ?> from hero + <?php echo $hero['itempower']; ?> bonus from items</font>">
			<?php } ?>
			<div class="element attribName">Fighting Strength</div>
			<div class="element current power"><?php echo 100+$tp*$hero['power']+$hero['itempower']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo $hero['power']; ?>%;"></div>
				</div>
			</div>
			<div class="element add">
        <a class="setPoint<?php echo $pStyle; ?>" href="?add=power&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo $hero['power']; ?></div>
		</div>

  <div class="clear"></div>
  <div class="attribute offBonus tooltip" title="Offence bonus gives a bonus when attacking.<br><font color='#5dcbfb'>Offence Bonus <?php echo ($hero['offBonus']/5); ?>%</font>">
			<div class="element attribName">Offence Bonus</div>
			<div class="element current power"><span class="value"><?php echo ($hero['offBonus']/5); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo $hero['offBonus']; ?>%;"></div>
				</div>
			</div>
			<div class="element add">
            <a class="setPoint<?php echo $pStyle; ?>" href="?add=offBonus&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo $hero['offBonus']; ?></div>
		</div>

		<div class="clear"></div>

  <div class="attribute defBonus tooltip" title="Defence Bonus gives an extra bonus when attacked <?php echo ($hero['defBonus']/5); ?>%</font>">
			<div class="element attribName">Defence Bonus</div>
			<div class="element current power"><span class="value"><?php echo ($hero['defBonus']/5); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo $hero['defBonus']; ?>%;"></div>
				</div>
			</div>
			<div class="element add">
            <a class="setPoint<?php echo $pStyle; ?>" href="?add=defBonus&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo $hero['defBonus']; ?></div>
		</div>

		<div class="clear"></div>

  <div class="attribute productionPoints tooltip" title="The Hero also gathers resources, the higher the level the more resources.<br><font color='#5dcbfb'>Resources bonus : <?php if($hero['r0']!=0){echo $rp;}else if($hero['r1']!=0){echo $hero['r1']*10*SPEED;}else if($hero['r2']!=0){echo $hero['r2']*10*SPEED;}else 
if($hero['r3']!=0){echo $hero['r3']*10*SPEED;}else if($hero['r4']!=0){echo $hero['r4']*10*SPEED;}; ?></font>">
			<div class="element attribName">Resources</div>
			<div class="element current power"><?php echo $hero['product']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo $hero['product']; ?>%;"></div>
                   
				</div>
			</div>
			<div class="element add">
             <a class="setPoint<?php echo $pStyle; ?>" href="?add=productionPoints&a=<?php echo $plevel; ?>&c=<?php echo $heroWrefC; ?>"></a>
			</div>
			<div class="element points"><?php echo $hero['product']; ?></div>
		</div>

		<div class="clear"></div>
		</div>
  </div>
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    <div class="attribute res" id="setResource">
		<div class="changeResourcesHeadline">Change the resources production of your Hero</div>
		<div class="clear"></div>
		<div class="resource">
		  <input type="radio" onclick="window.location.href = '?product=r0';" name="resource" value="0" id="resourceHero0" <?php if($hero['r0']!=0){ echo $checked="checked"; } ?>>
			<label for="resourceHero0">
				<img title="All resouces" class="r0" src="img/x.gif">
                <span class="current"> <?php echo $rp; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r1';" name="resource" value="1" id="resourceHero1" <?php if($hero['r1']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',1); ?>>
			<label for="resourceHero1">
				<img title="Wood" class="r1" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']*10*SPEED; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r2';" name="resource" value="2" id="resourceHero2" <?php if($hero['r2']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',2); ?>>
			<label for="resourceHero2">
				<img title="Clay" class="r2" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']*10*SPEED; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r3';" name="resource" value="3" id="resourceHero3" <?php if($hero['r3']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',3); ?>>
			<label for="resourceHero3">
				<img title="Iron" class="r3" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']*10*SPEED; ?></span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" onclick="window.location.href = '?product=r4';" name="resource" value="4" id="resourceHero4" <?php if($hero['r4']!=0){ echo $checked="checked"; } ?> <?php echo $form->getRadio('resource',4); ?>>
			<label for="resourceHero4">
				<img title="Crop" class="r4" src="img/x.gif">
                <span class="current"> <?php echo $hero['product']*10*SPEED; ?></span>
			</label>
		</div>
			</div>
	<div class="clear"></div>
		</div>
  </div>
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">

<div class="attribute health tooltip" title="Your hero regeneration: <?php echo $hero['autoregen']*INCREASE_SPEED; ?>% per day </font>">
<?php if($hero['dead']==0){ ?>
			<div class="element attribName">Health</div>
			<div class="element current power"><span class="value"><?php echo round($hero['health']); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
                <?php
                if($hero['health']<=10){
                	$color = '#F00';
                }elseif($hero['health']<=25){
                	$color = '#F0B300';
                }elseif($hero['health']<=50){
                	$color = '#FFFF00';
                }elseif($hero['health']<=90){
                	$color = '#99C01A';
                }else{
                	$color = '#006900';
                }
                ?>
                
					<div class="bar" style="width:<?php echo $hero['health']; ?>%;background-color:<?php echo $color; ?>"></div>
				</div>
			</div>
<?php }else{ ?>
<div class="attributesHeadline"> The hero will revive in this village </div>
<div class="clear"></div>
    <?php
    $vRes = ($village->awood+$village->aclay+$village->airon+$village->acrop);
    $hRes = ($hero_t[$hero['level']]['wood']+$hero_t[$hero['level']]['clay']+$hero_t[$hero['level']]['iron']+$hero_t[$hero['level']]['crop']);
$checkT = $database->getHeroTrain($hero['wref']);

if(!$checkT){
    if($village->awood < $hero_t[$hero['level']]['wood'] || $village->aclay < $hero_t[$hero['level']]['clay'] || $village->airon < $hero_t[$hero['level']]['iron'] || $village->acrop < $hero_t[$hero['level']]['crop']){
    	echo '<span class="none">Not enought resources for hero revive</span>';
    }else{
        echo "<span class=\"regeneratebtn\"><button type=\"submit\" value=\"Revive\" onclick=\"window.location.href = 'hero_inventory.php?revive=1'; return false;\" name=\"save\" id=\"save\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">Revive</div></div></button></span>";
    }
}else{
	echo "Hero will be ready in <span id='timer1'>".$generator->getTimeFormat($checkT['eachtime']-time())."</span></br>";
}
if(!$checkT){
    ?>
        <div class="regenerateCosts">
        	<div class="showCosts">
            	<span class="resources r1 little_res" title="Wood">
                	<img class="r1" src="img/x.gif" title="Wood" />
					<?php echo $hero_t[$hero['level']]['wood']; ?>
                </span>
                <span class="resources r2 little_res" title="Clay">
                	<img class="r2" src="img/x.gif" title="Clay" />
					<?php echo $hero_t[$hero['level']]['clay']; ?>
                </span>
                <span class="resources r3 little_res" title="Iron">
                	<img class="r3" src="img/x.gif" title="Iron" />
					<?php echo $hero_t[$hero['level']]['iron']; ?>
                </span>
                <span class="resources r4 little_res" title="Crop">
                	<img class="r4" src="img/x.gif" title="Crop" />
					<?php echo $hero_t[$hero['level']]['crop']; ?>
                </span>
                <span class="resources r5" title="Crop Consumption">
                	<img class="r5" src="img/x.gif" title="Crop Consumption" />
                    6
                </span>
                <div class="clear"></div>
                <span class="clock">
                	<img class="clock" src="img/x.gif" title="Duration">
                    <?php echo $generator->getTimeFormat(($hero_t[$hero['level']]['time']/SPEED*1.5)); ?>
                </span>
                <button type="button" value="" class="icon" onclick="window.location.href = 'build.php?gid=17&amp;t=3&amp;r1=<?php echo $hero_t[$hero['level']]['wood']; ?>&amp;r2=<?php echo $hero_t[$hero['level']]['clay']; ?>&amp;r3=<?php echo $hero_t[$hero['level']]['iron']; ?>&amp;r4=<?php echo $hero_t[$hero['level']]['crop']; ?>'; return false;"><img src="img/x.gif" class="npc" alt="npc"></button>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
<?php }} ?>
		</div>

		<div class="clear"></div>
			</div>
  </div>
  
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    
<div class="attribute experience tooltip" title="Your hero need more <?php echo ($hero_levels[$hero['level']+1]-$hero['experience']); ?> experience to reach level <?php echo ($hero['level']+1); ?>">
			<div class="element attribName">Experience</div>
			<div class="element current power"><?php echo $hero['experience']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo round(100*(($hero['experience'] - $hero_levels[$hero['level']]) / ($hero_levels[$hero['level']+1] - $hero_levels[$hero['level']])),1); ?>%;"></div>
				</div>
			</div>
            
			<div class="element add"></div>
			<div class="element points"><?php echo intval($hero['points']); ?></div>
			<div class="clear"></div>
		</div>

<div class="attribute level tooltip" title="<?php echo $tp; ?> The Higher the Hero level , the more points you get.</font>">
			<div class="element attribName">Hero Level</div>
			<div class="element current power"><?php echo $hero['level']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo min(100,$hero['level']); ?>%"></div>
				</div>
			</div>
			<div class="clear"></div>
</div>
<div class="attribute speed tooltip" title="Your Heros speed determines how many fields he travels an hour <?php echo $hero['speed']; ?> </font>">
	<div class="element attribName">Speed</div>
    <div class="element power">
    	<span class="currect"><?php echo $hero['speed']*INCREASE_SPEED; ?></span> Fields Per Hour
    </div>
    <div class="clear"></div>
</div>

		</div>
  </div></div>

<?php
$heroid = $hero['heroid'];
if(isset($_GET['revive'])==1 && $village->awood > $hero_t[$hero['level']]['wood'] && $village->aclay > $hero_t[$hero['level']]['clay'] && $village->airon > $hero_t[$hero['level']]['iron'] && $village->acrop > $hero_t[$hero['level']]['crop']){
	if($tribe==1){
		$each = (time() + ($hero_t1[$hero['level']]['time']/SPEED*1.5));
	}elseif($tribe==2){
		$each = (time() + ($hero_t2[$hero['level']]['time']/SPEED*1.5));
	}elseif($tribe==3){
		$each = (time() + ($hero_t3[$hero['level']]['time']/SPEED*1.5));
	}
	$database->trainHero($village->wid, $each, 0);
	$database->modifyResource($village->wid,$hero_t[$hero['level']]['wood'],$hero_t[$hero['level']]['clay'],$hero_t[$hero['level']]['iron'],$hero_t[$hero['level']]['crop'],0);
    $database->modifyHero2('wref', $village->wid, $session->uid, 0);
    header("Location: hero_inventory.php");
}
if(isset($_GET['add'])){
if($hero['points']>0){
	if(isset($_GET['add']) && $_GET['add']==power){
		$database->modifyHero('power', 1, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
		header("Location: hero_inventory.php");
    }elseif(isset($_GET['add']) && $_GET['add']==offBonus){
		$database->modifyHero('offBonus', 1, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
		header("Location: hero_inventory.php");
    }elseif(isset($_GET['add']) && $_GET['add']==defBonus){
		$database->modifyHero('defBonus', 1, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
		header("Location: hero_inventory.php");
    }elseif(isset($_GET['add']) && $_GET['add']==productionPoints){
		$database->modifyHero('product', 1, $heroid, 1);
        $database->modifyHero('points', 1, $heroid, 2);
		header("Location: hero_inventory.php");
    }
}
}

if(isset($_GET['product'])){
	for($i=0;$i<=4;$i++){
    	if($_GET['product'] == 'r'.$i){
        	if('r'.$i == 'r0'){
				header("Location: hero_inventory.php");
            }else{
				header("Location: hero_inventory.php");
            }
    		$database->modifyHero('r'.$i, 1, $heroid, 0);
			header("Location: hero_inventory.php");
        }else{
        	$database->modifyHero('r'.$i, 0, $heroid, 0);
			header("Location: hero_inventory.php");
        }
    }
}elseif($hero['r0'] == 0 && $hero['r1'] == 0 && $hero['r2'] == 0 && $hero['r3'] == 0 && $hero['r4'] == 0){
$database->modifyHero('r0', 1, $heroid, 0);
header("Location: hero_inventory.php");
}
?>
