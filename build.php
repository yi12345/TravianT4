<?php
ob_start();
include("GameEngine/Village.php");
include("GameEngine/Units.php");

if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF'].(isset($_GET['id'])?'?id='.$_GET['id']:(isset($_GET['gid'])?'?gid='.$_GET['gid']:'')));
}
if($_GET['id'] == 99 && $village->natar == 0){
header("Location: dorf2.php");
}
		if(isset($_GET['t'])==99 && $session->goldclub == 1) {

			if($_GET['slid']) {
			$FLData = $database->getFLData($_GET['slid']);
			if($FLData['owner'] == $session->uid){
			$checked[$_GET['slid']] = 1;
			}
			}
			if(isset($_GET['slid']) && is_numeric($_GET['slid'])) {
			$FLData = $database->getFLData($_GET['slid']);
			if($FLData['owner'] == $session->uid){
			$checked[$_GET['slid']] = 1;
			}
			}
		}
$start = $generator->pageLoadTimeStart();
$alliance->procAlliForm($_POST);
$technology->procTech($_POST);
$market->procMarket($_POST);	
if(isset($_GET['gid'])) {
	$_GET['id'] = strval($building->getTypeField($_GET['gid']));
} else if(isset($_POST['id'])) {
	$_GET['id'] = $_POST['id'];
}
if(isset($_POST['t'])){
	$_GET['t'] = $_POST['t'];
}

if(isset($_GET['id'])) {
	if (!ctype_digit($_GET['id'])){
        $_GET['id'] = "1";
    }
	if($village->resarray['f'.$_GET['id'].'t'] == 17) {
		$market->procRemove($_GET);
	}
	if($village->resarray['f'.$_GET['id'].'t'] == 18) {
		$alliance->procAlliance($_GET);
	}
	if($village->resarray['f'.$_GET['id'].'t'] == 12 || $village->resarray['f'.$_GET['id'].'t'] == 13 || $village->resarray['f'.$_GET['id'].'t'] == 22) {
		$technology->procTechno($_GET);
	}
}
if($session->goldclub == 1 && count($session->villages) > 1){
		if(isset($_POST['action']) && $_POST['action'] == 'addRoute') {
		if($session->access != BANNED){
		if($session->gold >= 2) {
			for($i=1;$i<=4;$i++){
			if($_POST['r'.$i] == ""){
			$_POST['r'.$i] = 0;
			}
			}
			$totalres = preg_replace("/[^0-9]/","",$_POST['r1'])+preg_replace("/[^0-9]/","",$_POST['r2'])+preg_replace("/[^0-9]/","",$_POST['r3'])+preg_replace("/[^0-9]/","",$_POST['r4']);
			$reqMerc = ceil(($totalres-0.1)/$market->maxcarry);
			$second = date("s");
			$minute = date("i");
			$hour = date("G")-$_POST['start'];
			if(date("G") > $_POST['start']){
			$day = 1;
			}else{
			$day = 0;
			}
			$timestamp = strtotime("-$hour hours -$second second -$minute minutes +$day day");
			if($totalres > 0){
				$database->createTradeRoute($session->uid,$_POST['tvillage'],$village->wid,$_POST['r1'],$_POST['r2'],$_POST['r3'],$_POST['r4'],$_POST['start'],$_POST['deliveries'],$reqMerc,$timestamp);
				header("Location: build.php?gid=17&t=4");
				$route = 1;
			}else{
				header("Location: build.php?gid=17&t=4&create");
				$route = 1;
			}
		}
		}else{
		$route = 0;
		header("Location: banned.php");
		}
		}
		if(isset($_POST['action']) && $_POST['action'] == 'editRoute') {
		if($session->access != BANNED){
		$totalres = $_POST['r1']+$_POST['r2']+$_POST['r3']+$_POST['r4'];
		$reqMerc = ceil(($totalres-0.1)/$market->maxcarry);
		if($totalres > 0){
		$database->editTradeRoute($_POST['routeid'],"wood",$_POST['r1'],0);
		$database->editTradeRoute($_POST['routeid'],"clay",$_POST['r2'],0);
		$database->editTradeRoute($_POST['routeid'],"iron",$_POST['r3'],0);
		$database->editTradeRoute($_POST['routeid'],"crop",$_POST['r4'],0);
		$database->editTradeRoute($_POST['routeid'],"start",$_POST['start'],0);
		$database->editTradeRoute($_POST['routeid'],"deliveries",$_POST['deliveries'],0);
		$database->editTradeRoute($_POST['routeid'],"merchant",$reqMerc,0);
		$second = date("s");
		$minute = date("i");
		$hour = date("G")-$_POST['start'];
		if(date("G") > $_POST['start']){
		$day = 1;
		}else{
		$day = 0;
		}
		$timestamp = strtotime("-$hour hours -$second seconds -$minute minutes +$day day");
		$database->editTradeRoute($_POST['routeid'],"timestamp",$timestamp,0);
		}
		header("Location: build.php?gid=17&t=4");
		$route = 1;
		}else{
		$route = 0;
		header("Location: banned.php");
		}
		}
		if(isset($_GET['action']) && $_GET['action'] == 'delRoute') {
		if($session->access != BANNED){
		$traderoute = $database->getTradeRouteUid($_GET['routeid']);
		if($traderoute == $session->uid){
		$database->deleteTradeRoute($_GET['routeid']);
		header("Location: build.php?gid=17&t=4");
		$route = 1;
		}else{
		header("Location: build.php?gid=17&t=4");
		$route = 1;
		}
		}else{
		$route = 0;
		header("Location: banned.php");
		}
		}
}
if (isset($_POST['h']) && $_POST['a'] == 'adventure'){  
	$units->Adventures($_POST);
}elseif (isset($_POST['a']) == 533374 && isset($_POST['id']) == 39){  
	$units->Settlers($_POST);
}
if(isset($_GET['id'])){
$automation->isWinner();
}
include "Templates/html.tpl";
?>
<body class="v35 gecko build"> 
	<div id="wrapper"> 
		<img id="staticElements" src="img/x.gif" alt="" /> 
		<div id="logoutContainer"> 
			<a id="logout" href="logout.php" title="<?php echo LOGOUT; ?>">&nbsp;</a> 
		</div> 
		<div class="bodyWrapper"> 
			<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" /> 
			<div id="header"> 
				<div id="mtop">
					<a id="logo" href="<?php echo HOMEPAGE; ?>" target="_blank" title="<?php echo SERVER_NAME ?>"></a>
					<ul id="navigation">
						<li id="n1" class="resources">
							<a class="" href="dorf1.php" accesskey="1" title="<?php echo HEADER_DORF1; ?>"></a>
						</li>
						<li id="n2" class="village">
							<a class="" href="dorf2.php" accesskey="2" title="<?php echo HEADER_DORF2; ?>"></a>
						</li>
						<li id="n3" class="map">
							<a class="" href="karte.php" accesskey="3" title="<?php echo HEADER_MAP; ?>"></a>
						</li>
						<li id="n4" class="stats">
							<a class="" href="statistiken.php" accesskey="4" title="<?php echo HEADER_STATS; ?>"></a>
						</li>
<?php
    	if(count($database->getMessage($session->uid,9)) >= 1000) {
			$unmsg = "+1000";
		} else { $unmsg = count($database->getMessage($session->uid,9)); }
		
    	if(count($database->getNotice5($session->uid)) >= 1000) {
			$unnotice = "+1000";
		} else { $unnotice = count($database->getNotice5($session->uid)); }
?>
<li id="n5" class="reports"> 
<a href="berichte.php" accesskey="5" title="<?php echo HEADER_NOTICES; ?><?php if($message->nunread){ echo' ('.count($database->getNotice5($session->uid)).')'; } ?>"></a>
<?php
if($message->nunread){
	echo "<div class=\"ltr bubble\" title=\"".$unnotice." ".HEADER_NOTICES_NEW."\" style=\"display:block\">
			<div class=\"bubble-background-l\"></div>
			<div class=\"bubble-background-r\"></div>
			<div class=\"bubble-content\">".$unnotice."</div></div>";
}
?>
</li>
<li id="n6" class="messages"> 
<a href="nachrichten.php" accesskey="6" title="<?php echo HEADER_MESSAGES; ?><?php if($message->unread){ echo' ('.count($database->getMessage($session->uid,9)).')'; } ?>"></a> 
<?php
if($message->unread) {
	echo "<div class=\"ltr bubble\" title=\"".$unmsg." ".HEADER_MESSAGES_NEW."\" style=\"display:block\">
			<div class=\"bubble-background-l\"></div>
			<div class=\"bubble-background-r\"></div>
			<div class=\"bubble-content\">".$unmsg."</div></div>";
}
?>
</li>

</ul>
<div class="clear"></div> 
</div> 
</div>
					<div id="mid">

												<div class="clear"></div> 
						<div id="contentOuterContainer"> 
							<div class="contentTitle">&nbsp;</div> 
							<div class="contentContainer"> 
								<div id="content" class="build">

<?php

if(isset($_GET['id'])) {
	if(isset($_GET['s']))
	{
		if (!ctype_digit($_GET['s'])) {
			$_GET['s'] = null;
		}
	}
	if(isset($_GET['t']))
	{
		if (!ctype_digit($_GET['t'])) {
			$_GET['t'] = null;
		}
	}
	if (!ctype_digit($_GET['id'])) {
		$_GET['id'] = "1";
	}
	$id = $_GET['id'];
	if($id=='99' AND $village->resarray['f99t'] == 40){
	include("Templates/Build/ww.tpl");
	} else
	if($village->resarray['f'.$_GET['id'].'t'] == 0 && $_GET['id'] >= 19) {
		include("Templates/Build/avaliable.tpl");
	}
	else {
		if(isset($_GET['t'])) {
			if($_GET['t'] == 1) {
			$_SESSION['loadMarket'] = 1;
			}
			include("Templates/Build/".$village->resarray['f'.$_GET['id'].'t']."_".$_GET['t'].".tpl");
		} else
		if(isset($_GET['s'])) {
			include("Templates/Build/".$village->resarray['f'.$_GET['id'].'t']."_".$_GET['s'].".tpl");
		}
		else {
			include("Templates/Build/".$village->resarray['f'.$_GET['id'].'t'].".tpl");
		}
		if(isset($_GET['t'])==99 && $session->goldclub == 1) {

			if($_GET['action'] == 'addList') {
				include("Templates/goldClub/farmlist_add.tpl");
			}
			if($_GET['action'] == 'showSlot' && $_GET['lid']) {
				include("Templates/goldClub/farmlist_addraid.tpl");
			}elseif($_GET['action'] == 'showSlot' && $_GET['eid']) {
				include("Templates/goldClub/farmlist_editraid.tpl");
			}
			if($_GET['action'] == 'deleteList') {
				$database->delFarmList($_GET['lid'], $session->uid);
    			header("Location: build.php?id=39&t=99");
			}elseif($_GET['action'] == 'deleteSlot') {
				$database->delSlotFarm($_GET['eid']);
   				header("Location: build.php?id=39&t=99");
    		}
			if($_POST['action'] == 'startRaid'){
			if($session->access != BANNED){
			include ("Templates/a2b/startRaid.tpl");
			}else{
			header("Location: banned.php");
			}
			}
		}
		if(isset($_GET['t'])==100 && $session->goldclub == 1) {
			if(isset($_GET['enable'])) {
			$database->updateUserField($session->uid, "evasion", 1, 1);
			header("Location: build.php?id=39&t=100");
			}else if(isset($_GET['disable'])){
			$database->updateUserField($session->uid, "evasion", 0, 1);
			header("Location: build.php?id=39&t=100");
			}
		}
	}
}
?>
<div class="clear">&nbsp;</div>
</div>
<div class="clear"></div>
</div>
<div class="contentFooter">&nbsp;</div>
</div>                    
<?php
include("Templates/sideinfo.tpl");
include("Templates/footer.tpl");
include("Templates/header.tpl");
include("Templates/res.tpl");
include("Templates/vname.tpl");
include("Templates/quest.tpl");
?>

</div>
<div id="ce"></div>
</div>
</body>
</html>


