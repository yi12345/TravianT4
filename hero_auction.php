<?php
include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome hero_auction">
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
<a id="ingameManual" href="help.php"><img class="question" alt="Help" src="img/x.gif"></a>
												<div class="clear"></div> 
						<div id="contentOuterContainer"> 
							<div class="contentTitle">&nbsp;</div> 

<div class="contentContainer">
								<div id="content" class="hero_auction"><h1 class="titleInHeader">Hero</h1>

<div class="contentNavi subNavi">
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_inventory.php"><span class="tabItem">Attributes</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero.php"><span class="tabItem">Appearance</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_adventure.php"><span class="tabItem">Adventures</span></a></div>
				</div>
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_auction.php"><span class="tabItem">Auction</span></a></div>
				</div><div class="clear"></div>
		</div><script type="text/javascript">
					window.addEvent('domready', function()
					{
						$$('.subNavi').each(function(element)
						{
							new Travian.Game.Menu(element);
						});
					});
				</script>

<?php		

if($_GET['action']=='sell' && $_GET['abort']){
	$database->delAuction($_GET['abort']);
}
$sql = mysql_query("SELECT * FROM ".TB_PREFIX."auction WHERE finish = 0 and owner = '".$session->uid."'");
$query = mysql_num_rows($sql);
if($_GET['action']=='sell' && $_POST['a']=='e45'){
	if($query < 5){
		$data = $database->getItemData($_POST['id']);
		$database->addAuction($session->uid, $_POST['id'], $data['btype'], $data['type'], $_POST['amount']);
	}
}

if(isset($_POST['a']) && $_POST['action']=='buy' || isset($_POST['a']) && $_POST['action']=='bids'){
$bidError = '';
$getBidData = $database->getBidData($_POST['a']);
$total_silver = $_POST['silver'] + $session->silver;
	if($_POST['maxBid'] <= $_POST['silver']){
		$bidError .= "Too low bid. You need to offer at least ".($_POST['silver']+1)." silver.";
	}elseif($_POST['maxBid'] > $session->silver || ($_POST['uid'] == $session->uid && $_POST['maxBid'] > $total_silver)){
		$bidError .= "You haven't enough silver for this bid.";
	}else{
		if($database->checkBid($_POST['a'], $_POST['maxBid'])){
			
			if($getBidData['uid']==0){
				$database->addBid($_POST['a'], $session->uid, $_POST['maxBid']);
				$database->setSilver($session->uid,$_POST['maxBid'],0);
				$database->setNewSilver($_POST['a'],$_POST['maxBid']);
				
			}elseif($getBidData['uid']==$session->uid){
				$maxBid = $_POST['maxBid'] - $getBidData['newsilver'];
				$database->setSilver($session->uid,$maxBid,0);
				$database->setNewSilver($_POST['a'],$_POST['maxBid']);
			}else{
				$database->setSilver($getBidData['uid'],$getBidData['newsilver'],1);
				$database->setSilver($session->uid,$_POST['maxBid'],0);
				$database->addBid($_POST['a'], $session->uid, $_POST['maxBid']);
				$database->setNewSilver($_POST['a'],$_POST['maxBid']);
			}
			if(isset($_POST['page'])){ $page = "&page=".$_POST['page']; }else{ $page = ""; }
			if($_POST['action']=='bids'){ $ssss = 'bids'; } elseif($_POST['action']=='buy'){ $ssss = 'buy'; }
			header("Location: ?action=".$ssss."".$page."&a=".$_POST['a']);	
		}else{
			if($getBidData['uid']==$session->uid){
				$maxBid = $getBidData['newsilver'] - $_POST['maxBid'];
				$database->setSilver($session->uid,$maxBid,1);
				$database->setNewSilver($_POST['a'],$_POST['maxBid']);
			}else{
				$database->editBid($_POST['a'], $_POST['maxBid']);
				$bidError .= "Your bid is lower than the other player's one.";
			}
			if(isset($_POST['page'])){ $page = "&page=".$_POST['page']; }else{ $page = ""; }
			if($_POST['action']=='bids'){ $ssss = 'bids'; } elseif($_POST['action']=='buy'){ $ssss = 'buy'; }
			header("Location: ?action=".$ssss."".$page."&a=".$_POST['a']);	
		}
	}
	
}

include("Templates/Auction/menu.tpl");
if(isset($_GET['action'])){
	if($_GET['action'] == 'buy'){
		include("Templates/Auction/buy.tpl");
	} elseif($_GET['action'] == 'sell'){
		include("Templates/Auction/sell.tpl");
	} elseif($_GET['action'] == 'bids'){
		include("Templates/Auction/bids.tpl");
	}
} else {
		include("Templates/Auction/buy.tpl");
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


