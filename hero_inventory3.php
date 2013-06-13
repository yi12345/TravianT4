<?php
include("GameEngine/Village.php");
include("GameEngine/Units.php");
$start = $generator->pageLoadTimeStart();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
<style type="text/css" media="screen" id="jScroll.css">
.jScroll {overflow: hidden; width: 100%; height: 100%;position:relative;}
.jScroll .jScroll-content {position: absolute; top: 0px; right: 0px;}
.jScroll .jScroll-scroll {cursor:pointer; position: absolute; height: 100%; left: 0px; top: 0px;}
.jScroll .jScroll-scroll-up {position: absolute; width: 100%;}
.jScroll .jScroll-scroll-slider {position: absolute; width: 100%;}
.jScroll .jScroll-scroll-down {position: absolute; width: 100%;}
.jScroll .jScroll-scroll-between {position: absolute; width: 100%;}
.jScroll .jScroll-scroll-slider {top: 10px; height: 50px;}
.jScroll .jScroll-scroll-slider .top {width: 100%;}
.jScroll .jScroll-scroll-slider .center {width: 100%;}
.jScroll .jScroll-scroll-slider .bottom {width: 100%;}
.jScroll .jScroll-scroll-down {bottom: 0px;}
.jScroll .jScroll-element-scroll {width: 15px;}
.jScroll .jScroll-element-down {background: transparent url(crypt.js?<?php echo time(); ?>images/down.gif) no-repeat center bottom; height: 6px;}
.jScroll .jScroll-element-down:hover {background-image: url(crypt.js?<?php echo time(); ?>images/down-hover.gif);}
.jScroll .jScroll-element-up {background: transparent url(crypt.js?<?php echo time(); ?>images/up.gif) no-repeat center top; height: 6px;}
.jScroll .jScroll-element-up:hover {background-image: url(crypt.js?<?php echo time(); ?>images/up-hover.gif);}
.jScroll .jScroll-element-between {margin-right: 4px; width: 7px; opacity: 0; background-color: #000000; filter: alpha(opacity=0);}
.jScroll .jScroll-element-between:hover {opacity: 0.25; filter: alpha(opacity=25);}
.jScroll .jScroll-element-between.clicked {opacity: 0.5; filter: alpha(opacity=50);}
.jScroll .jScroll-element-slider .top {background: transparent url(crypt.js?<?php echo time(); ?>images/slider-top.gif) no-repeat center top; height: 1px;}
.jScroll .jScroll-element-slider:hover .top {background-image: url(crypt.js?<?php echo time(); ?>images/slider-top-hover.gif);}
.jScroll .jScroll-element-slider .center {background: transparent url(crypt.js?<?php echo time(); ?>images/slider-center.gif) repeat-y center top;}
.jScroll .jScroll-element-slider:hover .center {background-image: url(crypt.js?<?php echo time(); ?>images/slider-center-hover.gif);}
.jScroll .jScroll-element-slider .bottom {background: transparent url(crypt.js?<?php echo time(); ?>images/slider-bottom.gif) no-repeat center bottom; height: 1px;}
.jScroll .jScroll-element-slider:hover .bottom {background-image: url(crypt.js?<?php echo time(); ?>images/slider-bottom-hover.gif);}
</style>
		<title><?php echo SERVER_NAME ?></title>
		<meta http-equiv="cache-control" content="max-age=0" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="imagetoolbar" content="no" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="content-language" content="ir" />
		<link href="gpack/travian_Travian_4.0_41/lang/ir/compact.css?asd423" rel="stylesheet" type="text/css" />
        <link href="gpack/travian_Travian_4.0_41/lang/ir/lang.css?asd423" rel="stylesheet" type="text/css" />										
        <link href="img/travian_basics.css" rel="stylesheet" type="text/css" />
        <script src="crypt.js" type="text/javascript"></script>

<script type="text/javascript">
Travian.Translation.add(
{
	'allgemein.anleitung':	'Instructions',
	'allgemein.cancel':	'Cancellation',
	'allgemein.ok':	'Confirmation',
	'cropfinder.keine_ergebnisse': 'Could not find anything matching your search'
});
Travian.applicationId = 'T4.0 Game';
Travian.Game.version = '4.0';
Travian.Game.worldId = 'ir33';

</script>
</head>
<body class="v35 webkit chrome hero_inventory">
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
    	if(count($database->getMessage($session->uid,7)) >= 1000) {
			$unmsg = "+1000";
		} else { $unmsg = count($database->getMessage($session->uid,7)); }
		
    	if(count($database->getMessage($session->uid,8)) >= 1000) {
			$unnotice = "+1000";
		} else { $unnotice = count($database->getMessage($session->uid,8)); }
?>
<li id="n5" class="reports"> 
<a href="berichte.php" accesskey="5" title="<?php echo HEADER_NOTICES; ?><?php if($message->nunread){ echo' ('.count($database->getMessage($session->uid,8)).')'; } ?>"></a>
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
<a href="nachrichten.php" accesskey="6" title="<?php echo HEADER_MESSAGES; ?><?php if($message->unread){ echo' ('.count($database->getMessage($session->uid,7)).')'; } ?>"></a> 
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
<?php include("Templates/menu.tpl"); ?>

												<div class="clear"></div> 
						<div id="contentOuterContainer"> 
							<div class="contentTitle">&nbsp;</div> 

<div class="contentContainer">
								<div id="content" class="hero_inventory"><h1 class="titleInHeader">قهرمان</h1>
<div class="contentNavi subNavi">
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_inventory.php"><span class="tabItem">Specifications</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero.php"><span class="tabItem">Apparent</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_adventure.php"><span class="tabItem">Adventures</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="hero_auction.php"><span class="tabItem">Auction</span></a></div>
				</div><div class="clear"></div>
		</div>
		<script type="text/javascript">
					window.addEvent('domready', function()
					{
						$$('.subNavi').each(function(element)
						{
							new Travian.Game.Menu(element);
						});
					});
</script>
<div class="clear"></div>
<?php
include("Templates/hero.tpl");
?>
<div id="bodyOptions">
	<div id="hero_body_container">
		<div id="hero_body">
			<img class="heroBody">
			<div class="clear"></div>
		</div>
		<div id="hero_body_content">
			<div class="content">
				<div id="helmet" class="draggable"></div>
				<div id="leftHand" class="draggable"></div>
				<div id="rightHand" class="draggable"></div>
				<div id="body" class="draggable"></div>
				<div id="horse" class="draggable"></div>
				<div id="shoes" class="draggable"></div>
				<div id="bag" class="draggable "></div>
			</div>
		</div>
	</div>
	<div class="heroHidden">
		<input type="checkbox" class="check" name="hideShow" id="heroHideShow" checked="checked" disabled> If it is selected, which is the defending champion of the village
Will not (will escape).
	</div>
</div>
<div id="hero_inventory">
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents cf">
    <div id="itemsToSale">
					<div id="inventory_1" class="inventory draggable"></div>
					<div id="inventory_2" class="inventory draggable"></div>
					<div id="inventory_3" class="inventory draggable"></div>
					<div id="inventory_4" class="inventory draggable"></div>
					<div id="inventory_5" class="inventory draggable"></div>
					<div id="inventory_6" class="inventory draggable"></div>
					<div id="inventory_7" class="inventory draggable"></div>
					<div id="inventory_8" class="inventory draggable"></div>
					<div id="inventory_9" class="inventory draggable"></div>
					<div id="inventory_10" class="inventory draggable"></div>
					<div id="inventory_11" class="inventory draggable"></div>
					<div id="inventory_12" class="inventory draggable"></div>
				<div class="market">
			<a class="buy arrow" href="hero_auction.php?action=buy">Buy Item.</a>
			<a class="sell arrow" href="hero_auction.php?action=sell">Selling Item.</a>
            
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
		</div>
				</div>
</div>
<div class="clear"></div>
<div id="placeHolder"></div>

<script type="text/javascript">
	window.addEvent('domready', function()
	{
		Travian.Game.Hero.Inventory = new Travian.Game.Hero.Inventory(
		{
			isInVillage: true,
			isDead: false,
			isRegenerating: false,
			heroData:{
				freePoints: 0,
				health: <?php echo round($hero['health']); ?>,
				percent: <?php echo round($hero['health']); ?>
			},
			heroState:{
				experience: 438,
				culturePoints: 3361
			},
			data:[
				{
					id:	107345,
					typeId:	103,
					name:	'اسب',
					placeId:	1,
					place:	'inventory',
					slot:	'bag',
					amount:	1,
                    instant: true,
                    isUsableIfDead: true,
					attributes: ["\u0633\u0631\u0639\u062a \u0642\u0647\u0631\u0645\u0627\u0646 \u0631\u0627 28 \u062e\u0627\u0646\u0647 \u062f\u0631 \u0633\u0627\u0639\u062a \u0627\u0641\u0632\u0627\u06cc\u0634 \u062e\u0648\u0627\u0647\u062f \u062f\u0627\u062f."]
				}
			],
			text:
			{
				notMoveableText: '<span class="itemNotMoveable">Your hero is dead or not in the village, because they may not be able to use this material.</span>',
				notMoveableTextDead: '<span class="itemNotMoveable">This material may not be able to shift. First, your Hero \ r \ n Make sure the.</span>',
				moveDialogDescription:	'The number of items that can be moved: {inputField}',
				useDialogDescription:	'The number of items that can be used: {inputField}',
                useOneDialogTitle:	'Do you really want to eat this item',
				moveDialogTitle: 'Shift',
				useDialogTitle: 'Use',
				buttonOk: 'Confirmation',
				buttonCancel: 'Cancellation'
			},
			elementHeroBody: $$('div#hero_body img')[0],
			heroBodyHash: '7e690da68a067eb445691ae4fac0014a',
			urlBodyImage: 'hero_body.php?uid=4&amp;size=inventory&{heroBodyHash}',
			useOneDialogTitleCallbacks:
			{
				0: Travian.emptyFunction
			},
			afterRequestCallback:
			{
				0: Travian.emptyFunction
			}
		});
	});
</script>

<div class="clear">&nbsp;</div>
</div>
<div class="clear"></div>
</div>

                        <div class="contentFooter">&nbsp;</div>

					</div><?php include("Templates/sideinfo.tpl"); ?><div class="clear"></div>

				</div>

<?php
include("Templates/footer.tpl");
include("Templates/header.tpl");
include("Templates/res.tpl");
?>
<script type="text/javascript"> 
	resources.production = {
'l1': <?php echo $village->getProd("wood"); ?>,'l2': <?php echo $village->getProd("clay"); ?>,'l3': <?php echo $village->getProd("iron"); ?>,'l4': <?php echo $village->getProd("crop"); ?>			};
</script>

<?php
include("Templates/vname.tpl");
include("Templates/quest.tpl");
?>

</div>
<div id="ce"></div>
</div>
</body>
</html>


