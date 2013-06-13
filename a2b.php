<?php

include("GameEngine/Village.php");
include("GameEngine/Units.php");

$start = $generator->pageLoadTimeStart();
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
if(isset($_GET['w'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?w=".$_GET['w']);
}
else if(isset($_GET['r'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?r=".$_GET['r']);
}
else if(isset($_GET['o'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?o=".$_GET['o']);
}
else if(isset($_GET['z'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?z=".$_GET['z']);
}
else if($_GET['id']!=0){
	header("Location: ".$_SERVER['PHP_SELF']);
}
}
else {
$building->procBuild($_GET);
}
if(isset($_GET['id'])) {
	$id = $_GET['id'];
}
if(isset($_GET['bid'])) {
	$bid = $_GET['bid'];
	if($too['conqured'] == 0){$disabledr ="disabled=disabled";}else{
    $disabledr ="";
    }
	$disabled ="disabled=disabled";
    $checked  ="checked=checked";
}
if(isset($_GET['w'])) {
	$w = $_GET['w'];
}
if(isset($_GET['r'])) {
	$r = $_GET['r'];
}
if(isset($_GET['o'])) {
    $o = $_GET['o'];
    $oid = $_GET['z'];
    $too = $database->getOasisField($oid,"conqured");
    if($too['conqured'] == 0){$disabledr ="disabled=disabled";}else{
    $disabledr ="";
    }
    $disabled ="disabled=disabled";
    $checked  ="checked=checked";
}
	$process = $units->procUnits($_POST);
	$automation->isWinner();
include "Templates/html.tpl";
?>

<body class="v35 webkit chrome a2b">
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
								<div id="content" class="a2b">

<?php

        if(!empty($id)) {
			if(isset($_GET['s'])){
        		include "Templates/a2b/newdorf.tpl";
			}
			if(isset($_GET['h'])){
        		include "Templates/a2b/adventure.tpl";
			}
        } else
        	if(isset($w)) {
        		$enforce = $database->getEnforceArray($w, 0);
				if($enforce['from'] != 0) {
        		if($enforce['vref'] == $village->wid) {
        			$to = $database->getVillage($enforce['from']);
        			$ckey = $w;
        			include ("Templates/a2b/sendback.tpl");
					} else {
        			include ("Templates/a2b/units_" . $session->tribe . ".tpl");
        			include ("Templates/a2b/search.tpl");
					}
        			} else {
						$database->deleteReinf($w);
						header("Location: build.php?id=39");
					}
        	} else
        		if(isset($r)) {
        			$enforce = $database->getEnforceArray($r, 0);
        			if($enforce['from'] == $village->wid) {
        				$to = $database->getVillage($enforce['from']);
        				$ckey = $r;
        				include ("Templates/a2b/sendback.tpl");
        			} else {
        				include ("Templates/a2b/units_" . $session->tribe . ".tpl");
        				include ("Templates/a2b/search.tpl");
        			}
        		} else {
        			if(isset($process['0'])) {
        				$coor = $database->getCoor($process['0']);
        				include ("Templates/a2b/attack.tpl");
        			} else {
        				include ("Templates/a2b/units_" . $session->tribe . ".tpl");
        				include ("Templates/a2b/search.tpl");
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

