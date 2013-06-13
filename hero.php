<?php
ob_start();
include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
include "Templates/html.tpl";
?>
<body class="v35 gecko hero"> 
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
								<div id="content" class="hero_editor"><h1 class="titleInHeader">Hero</h1>

<div class="contentNavi subNavi">
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_inventory.php"><span class="tabItem">Attributes</span></a></div>
				</div>
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero.php"><span class="tabItem">Appearance</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_adventure.php"><span class="tabItem">Adventure</span></a></div>
				</div>
				<div class="container normal">
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
$herodetail = $database->HeroFace($session->uid);
if($herodetail['color']==0){
	$color = "black";
}
if($herodetail['color']==1){
	$color = "brown";
}
if($herodetail['color']==2){
	$color = "darkbrown";
}
if($herodetail['color']==3){
	$color = "yellow";
}
if($herodetail['color']==4){
	$color = "red";
}

?>
<div id="heroEditor">
	<div class="hero_head head">
		<div class="tl"><div class="tr"></div></div>
		<div class="bl"><div class="br"></div></div>
		<div class="image">
		<img style="position:absolute;left:0px;top:0px;" src="img/hero/head/254x330/face0.png" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroEye HeroEye<?php echo $herodetail['eye']; ?>" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroEyebrow HeroEyebrow<?php echo $herodetail['eyebrow']; ?>" id="<?php echo $color; ?>" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroHair HeroHair<?php echo $herodetail['hair']; ?>" id="<?php echo $color; ?>" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroFace HeroFace<?php echo $herodetail['face']; ?>" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroMouth HeroMouth<?php echo $herodetail['mouth']; ?>" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroNose HeroNose<?php echo $herodetail['nose']; ?>" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroEar HeroEar<?php echo $herodetail['ear']; ?>" alt="">
        <img style="position:absolute;left:0px;top:0px;" class="HeroBeard HeroBeard<?php echo $herodetail['beard']; ?>" id="<?php echo $color; ?>" alt="">
        </div>
	</div>
    
	<div class="attributes">
		<div class="boxes boxesColor gray">
			<div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
        
        <div class="container">
			<div class="info" id="headProfile">
				<div class="headline switchClosed">
					<div class="title">Head</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
                	<img onclick='$$(".HeroFace").set("class","HeroFace HeroFace0");$("HeroEditorForm").HeroFace.value="0";' class="attribute" src="img/hero/thumb/head/face/face0.png" alt="">
                    <img onclick='$$(".HeroFace").set("class","HeroFace HeroFace1");$("HeroEditorForm").HeroFace.value="1";' class="attribute" src="img/hero/thumb/head/face/face1.png" alt="">
                    <img onclick='$$(".HeroFace").set("class","HeroFace HeroFace2");$("HeroEditorForm").HeroFace.value="2";' class="attribute" src="img/hero/thumb/head/face/face2.png" alt="">
                    <img onclick='$$(".HeroFace").set("class","HeroFace HeroFace3");$("HeroEditorForm").HeroFace.value="3";' class="attribute" src="img/hero/thumb/head/face/face3.png" alt="">
                    <img onclick='$$(".HeroFace").set("class","HeroFace HeroFace4");$("HeroEditorForm").HeroFace.value="4";' class="attribute" src="img/hero/thumb/head/face/face4.png" alt="">
                    <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="hairColor">
				<div class="headline switchClosed">
					<div class="title">Hair Color</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
                	<img onclick='$$(".HeroHair",".HeroEyebrow",".HeroBeard").set("id","black");$("HeroEditorForm").color.value="0";' class="attribute" src="img/hero/thumb/head/hair/color0.png" alt="">
                	<img onclick='$$(".HeroHair",".HeroEyebrow",".HeroBeard").set("id","brown");$("HeroEditorForm").color.value="1";' class="attribute" src="img/hero/thumb/head/hair/color1.png" alt="">
                	<img onclick='$$(".HeroHair",".HeroEyebrow",".HeroBeard").set("id","darkbrown");$("HeroEditorForm").color.value="2";' class="attribute" src="img/hero/thumb/head/hair/color2.png" alt="">
                	<img onclick='$$(".HeroHair",".HeroEyebrow",".HeroBeard").set("id","yellow");$("HeroEditorForm").color.value="3";' class="attribute" src="img/hero/thumb/head/hair/color3.png" alt="">
                	<img onclick='$$(".HeroHair",".HeroEyebrow",".HeroBeard").set("id","red");$("HeroEditorForm").color.value="4";' class="attribute" src="img/hero/thumb/head/hair/color4.png" alt="">
                    <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="hairStyle">
				<div class="headline switchClosed">
					<div class="title">Hair Style</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
					<img onclick='$$(".HeroHair").set("class","HeroHair HeroHair0");$("HeroEditorForm").HeroHair.value="0";' class="attribute" src="img/hero/thumb/head/hair/hair0.png" alt="">
                    <img onclick='$$(".HeroHair").set("class","HeroHair HeroHair1");$("HeroEditorForm").HeroHair.value="1";' class="attribute" src="img/hero/thumb/head/hair/hair1.png" alt="">
                    <img onclick='$$(".HeroHair").set("class","HeroHair HeroHair2");$("HeroEditorForm").HeroHair.value="2";' class="attribute" src="img/hero/thumb/head/hair/hair2.png" alt="">
                    <img onclick='$$(".HeroHair").set("class","HeroHair HeroHair3");$("HeroEditorForm").HeroHair.value="3";' class="attribute" src="img/hero/thumb/head/hair/hair3.png" alt="">
                    <img onclick='$$(".HeroHair").set("class","HeroHair HeroHair4");$("HeroEditorForm").HeroHair.value="4";' class="attribute" src="img/hero/thumb/head/hair/hair4.png" alt="">
                    <img onclick='$$(".HeroHair").set("class","HeroHair HeroHairNone");$("HeroEditorForm").HeroHair.value="5";' class="attribute" src="img/hero/thumb/head/hair/hairNone.png" alt="">
                   
                   <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="ears">
				<div class="headline switchClosed">
					<div class="title">Ears</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
					<img onclick='$$(".HeroEar").set("class","HeroEar HeroEar0");$("HeroEditorForm").HeroEar.value="0";' class="attribute" src="img/hero/thumb/head/ear/ear0.png" alt="">
                    <img onclick='$$(".HeroEar").set("class","HeroEar HeroEar1");$("HeroEditorForm").HeroEar.value="1";' class="attribute" src="img/hero/thumb/head/ear/ear1.png" alt="">
                    <img onclick='$$(".HeroEar").set("class","HeroEar HeroEar2");$("HeroEditorForm").HeroEar.value="2";' class="attribute" src="img/hero/thumb/head/ear/ear2.png" alt="">
                    <img onclick='$$(".HeroEar").set("class","HeroEar HeroEar3");$("HeroEditorForm").HeroEar.value="3";' class="attribute" src="img/hero/thumb/head/ear/ear3.png" alt="">
                    <img onclick='$$(".HeroEar").set("class","HeroEar HeroEar4");$("HeroEditorForm").HeroEar.value="4";' class="attribute" src="img/hero/thumb/head/ear/ear4.png" alt="">
                    
                    <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="eyebrow">
				<div class="headline switchClosed">
					<div class="title">Eyebrows</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
					<img onclick='$$(".HeroEyebrow").set("class","HeroEyebrow HeroEyebrow0");$("HeroEditorForm").HeroEyebrow.value="0";' class="attribute" src="img/hero/thumb/head/eyebrow/eyebrow0.png" alt="">
                    <img onclick='$$(".HeroEyebrow").set("class","HeroEyebrow HeroEyebrow1");$("HeroEditorForm").HeroEyebrow.value="1";' class="attribute" src="img/hero/thumb/head/eyebrow/eyebrow1.png" alt="">
                    <img onclick='$$(".HeroEyebrow").set("class","HeroEyebrow HeroEyebrow2");$("HeroEditorForm").HeroEyebrow.value="2";' class="attribute" src="img/hero/thumb/head/eyebrow/eyebrow2.png" alt="">
                    <img onclick='$$(".HeroEyebrow").set("class","HeroEyebrow HeroEyebrow3");$("HeroEditorForm").HeroEyebrow.value="3";' class="attribute" src="img/hero/thumb/head/eyebrow/eyebrow3.png" alt="">
                    <img onclick='$$(".HeroEyebrow").set("class","HeroEyebrow HeroEyebrow4");$("HeroEditorForm").HeroEyebrow.value="4";' class="attribute" src="img/hero/thumb/head/eyebrow/eyebrow4.png" alt="">
                    
                    <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="eyes">
				<div class="headline switchClosed">
					<div class="title">Eyes</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
					<img onclick='$$(".HeroEye").set("class","HeroEye HeroEye0");$("HeroEditorForm").HeroEye.value="0";' class="attribute" src="img/hero/thumb/head/eye/eye0.png" alt="">
                    <img onclick='$$(".HeroEye").set("class","HeroEye HeroEye1");$("HeroEditorForm").HeroEye.value="1";' class="attribute" src="img/hero/thumb/head/eye/eye1.png" alt="">
                    <img onclick='$$(".HeroEye").set("class","HeroEye HeroEye2");$("HeroEditorForm").HeroEye.value="2";' class="attribute" src="img/hero/thumb/head/eye/eye2.png" alt="">
                    <img onclick='$$(".HeroEye").set("class","HeroEye HeroEye3");$("HeroEditorForm").HeroEye.value="3";' class="attribute" src="img/hero/thumb/head/eye/eye3.png" alt="">
                    <img onclick='$$(".HeroEye").set("class","HeroEye HeroEye4");$("HeroEditorForm").HeroEye.value="4";' class="attribute" src="img/hero/thumb/head/eye/eye4.png" alt="">
                    
                    <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="nose">
				<div class="headline switchClosed">
					<div class="title">Nose</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
					<img onclick='$$(".HeroNose").set("class","HeroNose HeroNose0");$("HeroEditorForm").HeroNose.value="0";' class="attribute" src="img/hero/thumb/head/nose/nose0.png" alt="">
                    <img onclick='$$(".HeroNose").set("class","HeroNose HeroNose1");$("HeroEditorForm").HeroNose.value="1";' class="attribute" src="img/hero/thumb/head/nose/nose1.png" alt="">
                    <img onclick='$$(".HeroNose").set("class","HeroNose HeroNose2");$("HeroEditorForm").HeroNose.value="2";' class="attribute" src="img/hero/thumb/head/nose/nose2.png" alt="">
                    <img onclick='$$(".HeroNose").set("class","HeroNose HeroNose3");$("HeroEditorForm").HeroNose.value="3";' class="attribute" src="img/hero/thumb/head/nose/nose3.png" alt="">
                    <img onclick='$$(".HeroNose").set("class","HeroNose HeroNose4");$("HeroEditorForm").HeroNose.value="4";' class="attribute" src="img/hero/thumb/head/nose/nose4.png" alt="">
                    
                    <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="mouth">
				<div class="headline switchClosed">
					<div class="title">Mouth</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
					<img onclick='$$(".HeroMouth").set("class","HeroMouth HeroMouth0");$("HeroEditorForm").HeroMouth.value="0";' class="attribute" src="img/hero/thumb/head/mouth/mouth0.png" alt="">
                    <img onclick='$$(".HeroMouth").set("class","HeroMouth HeroMouth1");$("HeroEditorForm").HeroMouth.value="1";' class="attribute" src="img/hero/thumb/head/mouth/mouth1.png" alt="">
                    <img onclick='$$(".HeroMouth").set("class","HeroMouth HeroMouth2");$("HeroEditorForm").HeroMouth.value="2";' class="attribute" src="img/hero/thumb/head/mouth/mouth2.png" alt="">
                    <img onclick='$$(".HeroMouth").set("class","HeroMouth HeroMouth3");$("HeroEditorForm").HeroMouth.value="3";' class="attribute" src="img/hero/thumb/head/mouth/mouth3.png" alt="">
                    
                    <div class="clear"></div>
				</div>
			</div>
					<div class="info" id="beard">
				<div class="headline switchClosed">
					<div class="title">Beard</div>
					<div class="clear"></div>
				</div>
				<div class="details" style="display: none; ">
					<img onclick='$$(".HeroBeard").set("class","HeroBeard HeroBeard0");$("HeroEditorForm").HeroBeard.value="0";' class="attribute" src="img/hero/thumb/head/beard/beard0.png" alt="">
                    <img onclick='$$(".HeroBeard").set("class","HeroBeard HeroBeard1");$("HeroEditorForm").HeroBeard.value="1";' class="attribute" src="img/hero/thumb/head/beard/beard1.png" alt="">
                    <img onclick='$$(".HeroBeard").set("class","HeroBeard HeroBeard2");$("HeroEditorForm").HeroBeard.value="2";' class="attribute" src="img/hero/thumb/head/beard/beard2.png" alt="">
                    <img onclick='$$(".HeroBeard").set("class","HeroBeard HeroBeard3");$("HeroEditorForm").HeroBeard.value="3";' class="attribute" src="img/hero/thumb/head/beard/beard3.png" alt="">
                    <img onclick='$$(".HeroBeard").set("class","HeroBeard HeroBeard4");$("HeroEditorForm").HeroBeard.value="4";' class="attribute" src="img/hero/thumb/head/beard/beard4.png" alt="">
                    <img onclick='$$(".HeroBeard").set("class","HeroBeard HeroBeardNone");$("HeroEditorForm").HeroBeard.value="5";' class="attribute" src="img/hero/thumb/head/beard/beardNone.png" alt="">
                    
                    <div class="clear"></div>
				</div>
			</div>
				</div>
			</div>
				</div>
		<div class="options">
		<form id="HeroEditorForm" method="post">
		<button type="submit" value="save" name="save" id="btn_login" onClick="document.snd.attributes.value=screen.width+':'+screen.height;">
        <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div>
        <div class="button-contents">Save</div></div>
        </button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<button type="submit" value="random" name="random" id="btn_login" onClick="document.snd.attributes.value=screen.width+':'+screen.height;">
        <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div>
        <div class="button-contents">Random</div></div>
        </button>
		<input type="hidden" name="uid" value="<?php echo $session->uid; ?>" /><input type="hidden" name="HeroFace" value="<?php echo $herodetail['face']; ?>" /><input type="hidden" name="color" value="<?php echo $herodetail['color']; ?>" /><input type="hidden" name="HeroHair" value="<?php echo $herodetail['hair']; ?>" /><input type="hidden" name="HeroEar" value="<?php echo $herodetail['ear']; ?>" /><input type="hidden" name="HeroEyebrow" value="<?php echo $herodetail['eyebrow']; ?>" /><input type="hidden" name="HeroEye" value="<?php echo $herodetail['eye']; ?>" /><input type="hidden" name="HeroNose" value="<?php echo $herodetail['nose']; ?>" /><input type="hidden" name="HeroMouth" value="<?php echo $herodetail['mouth']; ?>" /><input type="hidden" name="HeroBeard" value="<?php echo $herodetail['beard']; ?>" />
        </form>
    </div>
<?php
if($_POST){
if($_POST['random'] == "random"){
$_POST['HeroFace'] = rand(0,4);
$_POST['color'] = rand(0,4);
$_POST['HeroHair'] = rand(0.5);
$_POST['HeroEar'] = rand(0,4);
$_POST['HeroEyebrow'] = rand(0,4);
$_POST['HeroEye'] = rand(0,4);
$_POST['HeroNose'] = rand(0,4);
$_POST['HeroMouth'] = rand(0,3);
$_POST['HeroBeard'] = rand(0.5);
}
	$database->editTableField('heroface', 'face', $_POST['HeroFace'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'color', $_POST['color'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'hair', $_POST['HeroHair'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'ear', $_POST['HeroEar'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'eyebrow', $_POST['HeroEyebrow'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'eye', $_POST['HeroEye'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'nose', $_POST['HeroNose'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'mouth', $_POST['HeroMouth'], 'uid', $_POST['uid']);
	$database->editTableField('heroface', 'beard', $_POST['HeroBeard'], 'uid', $_POST['uid']);
	header("Location: hero.php");
}
?>
	</div>
	<div class="clear"></div>
</div>
<script type="text/javascript">
	new Travian.Game.Hero.Editor(
	{
		element: 'heroEditor',
		command: 'heroEditor',
		time: '<?php echo time(); ?>',
		urlHeroImage: 'hero_image.php?uid=<?php echo $session->uid; ?>&amp;size=sideinfo&amp;{time}',
		attributes: {"headProfile":<?php echo $herodetail['face']; ?>,"hairColor":<?php echo $herodetail['color']; ?>,"hairStyle":<?php echo $herodetail['hair']; ?>,"ears":<?php echo $herodetail['ear']; ?>,"eyebrow":<?php echo $herodetail['eyebrow']; ?>,"eyes":<?php echo $herodetail['eye']; ?>,"nose":<?php echo $herodetail['nose']; ?>,"mouth":<?php echo $herodetail['mouth']; ?>,"beard":<?php echo $herodetail['beard']; ?>},
		elementHeroImage: 'heroImage'
	});
</script>

<div class="clear">&nbsp;</div>							</div>							<div class="clear"></div>
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



