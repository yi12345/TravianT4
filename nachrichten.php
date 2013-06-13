<?php
include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
if($_GET['t'] == 1){
$automation->isWinner();
}
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
if(isset($_GET['t'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?t=".$_GET['t']);
}else if($_GET['id']!=0) {
	header("Location: ".$_SERVER['PHP_SELF']."?id=".$_GET['id']);
}else{
	header("Location: ".$_SERVER['PHP_SELF']);
}
}
else {
	$message->procMessage($_POST);
}
if(isset($_GET['delfriend']) && is_numeric($_GET['delfriend'])){
$friend = $database->getUserField($session->uid, "friend".$_GET['delfriend'], 0);
for($i=0;$i<=19;$i++) {
$friend1 = $database->getUserField($friend, "friend".$i, 0);
if($friend1 == $session->uid){
$database->deleteFriend($friend,"friend".$i);
}
$friendwait1 = $database->getUserField($friend, "friend".$i."wait", 0);
if($friendwait1 == $session->uid){
$database->deleteFriend($friend,"friend".$i."wait");
}
$database->checkFriends($friend);
}
$database->deleteFriend($session->uid,"friend".$_GET['delfriend']);
$database->deleteFriend($session->uid,"friend".$_GET['delfriend']."wait");
$database->checkFriends($session->uid);
header("Location: ".$_SERVER['PHP_SELF']."?t=1");
}
if(isset($_GET['confirm']) && is_numeric($_GET['confirm'])){
$myid = $database->getUserArray($session->uid, 1);
$wait = $database->getUserArray($myid['friend'.$_GET['confirm'].'wait'], 1);
$added = 0;
for($i=0;$i<20;$i++) {
$user = $database->getUserField($wait['id'], "friend".$i, 0);
if($user == $session->uid && $added == 0){
$database->addFriend($wait['id'],"friend".$i."wait",0);
$added = 1;
}
}
$database->addFriend($session->uid,"friend".$_GET['confirm'],$wait['id']);
$database->addFriend($session->uid,"friend".$_GET['confirm']."wait",0);
header("Location: ".$_SERVER['PHP_SELF']."?t=1");
}
include "Templates/html.tpl";
?>
 
 
<body class="v35 webkit chrome messages">
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
<a class=" active" href="nachrichten.php" accesskey="6" title="<?php echo HEADER_MESSAGES; ?><?php if($message->unread){ echo' ('.count($database->getMessage($session->uid,9)).')'; } ?>"></a> 
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
								<div id="content" class="messages">
<h1 class="titleInHeader">Messages</h1>
<?php 
include("Templates/Message/menu.tpl");
?>
<script type="text/javascript">
					window.addEvent('domready', function()
					{
						$$('.subNavi').each(function(element)
						{
							new Travian.Game.Menu(element);
						});
					});
</script>
<?php
if(isset($_GET['id']) && !isset($_GET['t'])) {
	$message->loadMessage($_GET['id']);
	include("Templates/Message/read.tpl");
}elseif(isset($_GET['n1']) && !isset($_GET['t'])) {
	$database->delMessage($_GET['n1']);
	header("Location: nachrichten.php");
}
else if(isset($_GET['t'])) {
	switch($_GET['t']) {
		case 1:
		if(isset($_GET['id'])) {
		$id = $_GET['id'];
		}
		include("Templates/Message/write.tpl");
		break;
		case 2:
		include("Templates/Message/sent.tpl");
		break;
		case 3:
		if($session->plus) {
			include("Templates/Message/archive.tpl");
		}
		break;
		case 4:
		if($session->plus) {
			$message->loadNotes();
			include("Templates/Message/notes.tpl");
		}
		break;
		default:
		include("Templates/Message/inbox.tpl");
		break;
	}
}
else {
	include("Templates/Message/inbox.tpl");
}
?>

<div id="map_details">



<div class="clear"></div>

</div>

<div class="clear"></div>

								<div class="clear">&nbsp;</div>							</div>							<div class="clear"></div>

						</div> 						<div class="contentFooter">&nbsp;</div>

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
