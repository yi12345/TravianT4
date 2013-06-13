<?php
include("GameEngine/Village.php");

$start = $generator->pageLoadTimeStart();
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome hero_adventure">
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
<div id="content" class="hero_adventure">
<h1 class="titleInHeader">Hero</h1>

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
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_adventure.php"><span class="tabItem">Adventures</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_auction.php"><span class="tabItem">Auctions</span></a></div>
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
<table cellspacing="1" cellpadding="1">
	<thead>
		<tr>
			<th class="location" colspan="2">Location</th>
			<th class="moveTime">Time</th>
			<th class="difficulty">Difficulty</th>
			<th class="timeLeft">Lime Left</th>
			<th class="goTo">Link</th>
		</tr>
	</thead>
	<tbody>
<?php
$sql = mysql_query("SELECT * FROM ".TB_PREFIX."adventure WHERE end = 0 and uid = ".$session->uid." ORDER BY time ASC");
$query = mysql_num_rows($sql);

$outputList = '';
$timer = 1;
if($query == 0) {        
    $outputList .= "<td colspan=\"6\" class=\"none\"><center>No adventure found.</center></td>";
}else{
	while($row = mysql_fetch_array($sql)){ 
include "Templates/Auction/alt.tpl";

//find slowest unit.
$herodetail = $database->getHeroData($session->uid);
$eigen = $database->getCoor($herodetail['wref']);
$coor = $database->getCoor($row['wref']);
$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);
$to = array('x'=>$coor['x'], 'y'=>$coor['y']);
$speed = $herodetail['speed'];
$time = $generator->procDistanceTime($from,$to,$speed,1);

$isoasis = $database->isVillageOases($row['wref']);
if($isoasis){
	$get = $database->getOMInfo($row['wref']);
	$type = $get['type'];
}else{
	$get = $database->getMInfo($row['wref']);
	$type = $get['fieldtype'];
}
switch($type) {
case 1:
case 2:
case 3:
$tname =  "forest";
break;
case 4:
case 5:
case 6:
$tname =  "field";
break;
case 7:
case 8:
case 9:
$tname =  "mountain";
break;
case 10:
case 11:
case 12:
$tname =  "sea";
break;
}

	$outputList .= "<tr><td class=\"location\">".$tname."</td>";
	
	$outputList .= '<td class="coords"><a href="karte.php?x='.$coor['y'].'&amp;y='.$coor['x'].'">
        <span class="coordinates coordinatesAligned">
        <span class="coordinateY">('.$coor['y'].'</span>
        <span class="coordinatePipe">|</span>
        <span class="coordinateX">'.$coor['x'].')</span>
        </span><span class="clear"></span>
        </a></td>';
    $outputList .= "<td class=\"moveTime\"> ".$generator->getTimeFormat($time)." </td>";
	if(!$row['dif']){
		$outputList .= "<td class='difficulty'><img src='img/x.gif' class='adventureDifficulty2' title='Normális' /></td>";
	}else{
		$outputList .= "<td class='difficulty'><img src='img/x.gif' class='adventureDifficulty0' title='Veszélyes' /></td>";	
	}
	$outputList .= "<td class=\"timeLeft\"><span id=\"timer".$timer."\">".$generator->getTimeFormat($row['time']-time())."</span></td>";
	$outputList .= "<td class=\"goTo\"><a class=\"gotoAdventure arrow\" href=\"a2b.php?id=".$row['wref']."&h=1\">To the Adventure</a></td></tr>";	
    $timer++;
	}
}
echo $outputList;
?>
	
    </tbody>
</table>




		  <div class="clear">&nbsp;</div></div>							<div class="clear"></div>
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


