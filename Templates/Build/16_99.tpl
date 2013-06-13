<h1 class="titleInHeader">Rally Point <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid16">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(16,4);" class="build_logo">
<img class="g16 big white" src="img/x.gif" alt="Rally Point" title="Rally Point" />
</a>
Your village's troops meet here. From here you can send them out to conquer, raid or reinforce other villages.</div>
<?php include("upgrade.tpl"); ?>
<div class="contentNavi tabNavi">
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=<?php echo $id; ?>"><span class="tabItem">Overview</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="a2b.php"><span class="tabItem">Send Troops</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="warsim.php"><span class="tabItem">Combat Simulator</span></a></div>
				</div>
                <div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=39&amp;t=99"><span class="tabItem">Farm list</span></a></div>
				</div>
				<?php if($session->goldclub==1){ ?>
                <div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=39&amp;t=100"><span class="tabItem">Gold Club</span></a></div>
				</div>
				<?php } ?>
</div>

		<div id="raidList">
	<?php if(!$session->goldclub) { ?>
	<div class="options">
					<div id="spaceUsed">
				<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">				The farm list is free, but only when the gold club available.					</div>
				</div>
                <div class="clear"></div>
			</div>

			<a class="arrow" href="plus.php?id=3#goldclub">Gold Club</a>
			</div>
            <?php
            }else{ include "Templates/goldClub/farmlist.tpl"; }
            
            ?>
</div>

</div>
