<?php

include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
if(isset($_GET['rank'])){ $_POST['rank']==$_GET['rank']; }
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	if(isset($_GET['tid'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?tid=".$_GET['tid']);
	}else{
	header("Location: ".$_SERVER['PHP_SELF']);
	}
}
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome statistics">
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
							<a class=" active" href="statistiken.php" accesskey="4" title="<?php echo HEADER_STATS; ?>"></a>
						</li>
<?php
    	if(count($database->getMessage($session->uid,9)) >= 1000){
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
								<div id="content" class="statistics">
                                		<script type="text/javascript"> 
					window.addEvent('domready', function()
					{
						$$('.subNavi').each(function(element)
						{
							new Travian.Game.Menu(element);
						});
					});
				</script>

<h1 class="titleInHeader">Statistics<?php if($session->access == ADMIN) { echo " (<a href=\"medals.php\">Aggiorna Top 10</a>)"; } ?></h1>
<div class="contentNavi subNavi">
				<div title="" <?php if(!isset($_GET['tid']) || (isset($_GET['tid']) && ($_GET['tid'] == 1 || $_GET['tid'] == 31 || $_GET['tid'] == 32 || $_GET['tid'] == 7))) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>> 
					<div class="background-start">&nbsp;</div> 
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php"><span class="tabItem">Players</span></a></div> 
				</div> 
				<div title="" <?php if(isset($_GET['tid']) && ($_GET['tid'] == 4 || $_GET['tid'] == 41 || $_GET['tid'] == 42 || $_GET['tid'] == 43)) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>> 
					<div class="background-start">&nbsp;</div> 
					<div class="background-end">&nbsp;</div> 
					<div class="content"><a href="statistiken.php?tid=4"><span class="tabItem">Alliances</span></a></div> 
				</div> 
				<div title="" <?php if(isset($_GET['tid']) && $_GET['tid'] == 2) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>> 
					<div class="background-start">&nbsp;</div> 
					<div class="background-end">&nbsp;</div> 
					<div class="content"><a href="statistiken.php?tid=2"><span class="tabItem">Villages</span></a></div> 
				</div> 
				<div title="" <?php if(isset($_GET['tid']) && $_GET['tid'] == 8) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>> 
					<div class="background-start">&nbsp;</div> 
					<div class="background-end">&nbsp;</div> 
					<div class="content"><a href="statistiken.php?tid=8"><span class="tabItem">Heroes</span></a></div> 
				</div> 
				<div title="" <?php if(isset($_GET['tid']) && $_GET['tid'] == 0) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>> 
					<div class="background-start">&nbsp;</div> 
					<div class="background-end">&nbsp;</div> 
					<div class="content"><a href="statistiken.php?tid=0"><span class="tabItem">General</span></a></div> 
				</div> 
				<?php if(WW == true){ include "Templates/Ranking/ww2.tpl"; }?>
				<div class="clear"></div>
</div>
<?php
if(isset($_GET['tid'])) {
	switch($_GET['tid']) {
		 case 31:
        include("Templates/Ranking/player_attack.tpl");
        break;
        case 32:
        include("Templates/Ranking/player_defend.tpl");
        break;
        case 7:
        include("Templates/Ranking/player_top10.tpl");
        break;
        case 2:
        include("Templates/Ranking/villages.tpl");
        break;
        case 4:
        include("Templates/Ranking/alliance.tpl");
        break;
        case 8:
        include("Templates/Ranking/heroes.tpl");
        break;
        case 11:
        include("Templates/Ranking/player_1.tpl");
        break;
        case 12:
        include("Templates/Ranking/player_2.tpl");
        break;
        case 13:
        include("Templates/Ranking/player_3.tpl");
        break;
        case 41:
        include("Templates/Ranking/alliance_attack.tpl");
        break;
        case 42:
        include("Templates/Ranking/alliance_defend.tpl");
        break;
        case 43:
        include("Templates/Ranking/ally_top10.tpl");
        break;
        case 0:
        include("Templates/Ranking/general.tpl");
        break;
        case 1:
        default:
        include("Templates/Ranking/overview.tpl");
        break;
        case 99:
        default:
        include("Templates/Ranking/ww.tpl");
        break;
	}
}
else {
	include("Templates/Ranking/overview.tpl");
}
?>

</div>
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


