<div id="villageList" class="listing">
<div class="head">
	<a href="dorf3.php" accesskey="9" title="Village Overview"><?php echo MULTI_V_HEADER; ?>:</a> 
</div> 
<div class="list"> 
	<ul>        
<?php 
    for($i=1;$i<=count($session->villages);$i++) { 
    	if($session->plus){
        		$aantal = count($database->getMovement2(3,$session->villages[$i-1],1));
				$attack_coming = $database->getMovement2(3,$session->villages[$i-1],1);
                if($attack_coming[$i-1]['attack_type'] == 2){
					$aantal -= 1;
                }
				if($aantal > 0){
					$village_attack = "attack ";
					$village_title = "attacks on this village: ".$aantal;
				} else {
					$village_attack = "";
					$village_title = htmlspecialchars($returnVillageArray[$i-1]['name']);
				}
         }
    if($session->villages[$i-1] == $village->wid){ $select = "active"; $sid = "currentVillage"; }else{ $select = ""; $sid = ""; }
    $coorproc = $database->getCoor($session->villages[$i-1]);
    if(isset($_GET['id'])){
    	$vill = "&id=".$_GET['id'];
    }else if(isset($_GET['gid'])){
    	$vill = "&gid=".$_GET['gid'];
    }else if(isset($_GET['w'])) {
    	$vill = "&w=".$_GET['w'];
	}else if(isset($_GET['r'])) {
    	$vill = "&r=".$_GET['r'];
	}else if(isset($_GET['o'])) {
    	$vill = "&o=".$_GET['o'];
	}else if(isset($_GET['z'])) {
    	$vill = "&z=".$_GET['z'];
	}else if(isset($_GET['s'])) {
    	$vill = "&s=".$_GET['s'];
	}else if(isset($_GET['c'])) {
    	$vill = "&c=".$_GET['c'];
	}else if(isset($_GET['t'])) {
    	$vill = "&t=".$_GET['t'];
	}else if(isset($_GET['d'])) {
    	$vill = "&d=".$_GET['d'];
	}else if(isset($_GET['aid'])) {
    	$vill = "&aid=".$_GET['aid'];
	}else if(isset($_GET['uid'])) {
    	$vill = "&uid=".$_GET['uid'];
	}else if(isset($_GET['tid'])) {
    	$vill = "&tid=".$_GET['tid'];
	}else if(isset($_GET['vill']) && isset($_GET['id'])) {
    	$vill = "&id=".$_GET['id']."&vill=".$_GET['vill'];
	}else if(isset($_GET['t']) && isset($_GET['id'])) {
    $vill = "&id=".$_GET['id']."&t=".$_GET['t'];
	}else if(isset($_GET['x']) && isset($_GET['y'])) {
    	$vill = "&x=".$_GET['x']."&y=".$_GET['y'];
    }else{
    	$vill = "";
    }
    $gid = $_GET['gid'];
	echo "<li class=\"entry ".$village_attack."".$select."\" title=\"".$village_title."\">
    <a id=\"".$sid."\" title=\"".$database->getVillageField($session->villages[$i-1],'name')." (".$coorproc['x']."|".$coorproc['y'].")\" href=\"?newdid=".$session->villages[$i-1]."".$vill."\" class=\"".$select."\">".$database->getVillageField($session->villages[$i-1],'name')."</a></li>";
	}
    	?>
		
	</ul>
</div>
<div class="foot"> 
</div>
</div>
<?php include("Templates/links.tpl"); ?>
