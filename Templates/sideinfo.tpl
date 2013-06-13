<?php
$hero = $database->getHeroData($session->uid);
$userarray = $database->getUserArray($session->uid, 1);
	if($session->tribe == 1){ $ttitle=TRIBE1; }
    elseif($session->tribe == 2){ $ttitle=TRIBE2; }
    elseif($session->tribe == 3){ $ttitle=TRIBE3; }
$aid = $session->alliance;
$allianceinfo = $database->getAlliance($aid);
?>

<div id="side_info">
	<div class="sideInfoHero">
    <img id="heroImage" src="hero_image.php?uid=<?php echo $session->uid; ?>&size=sideinfo&<?php echo $hero['hash']; ?>" class="heroImage"/>
	<div class="heroImageBorder"></div> 
    <a id="heroProfile" href="hero_inventory.php" class="heroProfile"></a>
	<a href="hero_adventure.php" class="adventures" title="<?php echo SIDEINFO_ADVENTURES; ?>"></a>
    <a href="hero_auction.php" class="auctions" title="<?php echo SIDEINFO_AUCTIONS; ?>"></a>
	</div>
<script type="text/javascript">
	window.addEvent('domready', function()
	{
		var element = $('heroProfile');
		if (!element)
		{
			return;
		}
		var fnHeroTitle = function()
		{
			element.removeEvent('mouseover', fnHeroTitle);
			Travian.ajax(
			{
				data:
				{
					cmd: 'getHeroStatus'
				},
				onSuccess: function(data)
				{
					element.setTitle(data.statusInfoText);
					Travian.Tip.show(data.statusInfoText);
				}
			});
		};
		element.addEvent('mouseover', fnHeroTitle);
	});
</script>
	<div class="sideInfoPlayer" title="<?php echo SIDEINFO_PROFILE; ?>">
	<a class="signLink" href="spieler.php?uid=<?php echo $session->uid; ?>">
		<span class="wrap">
        <?php echo $userarray['username']; ?>
        </span> 
	</a>
	<img class="nationBig nationBig<?php echo $session->tribe; ?>" title="<?php echo $ttitle; ?>" src="img/x.gif"/> 
	</div> 
<?php
if($session->alliance != 0){
echo "<div class='sideInfoAlly'><a class='signLink' href='allianz.php' title='".SIDEINFO_ALLIANCE."'><span class='wrap'>".$allianceinfo['tag']."</span></a><a href='allianz.php?s=2' class='crest' title='".SIDEINFO_ALLY_FORUM."'><img src='img/x.gif'></a></div>";
}
include("Templates/multivillage.tpl");
?>
</div>