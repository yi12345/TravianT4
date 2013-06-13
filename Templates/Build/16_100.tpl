<?php
if(!$session->goldclub) {
			include "Templates/Build/16.tpl";
			}else{
?>
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
                <div class="container noraml">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=39&amp;t=99"><span class="tabItem">Farm list</span></a></div>
				</div>
				<?php if($session->goldclub==1){ ?>
                <div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=39&amp;t=100"><span class="tabItem">Gold Club</span></a></div>
				</div>
				<?php } ?>
</div>

<div id="raidList">
				<div class="round spacer listTitle">
						<div class="listTitleText">
							Evasion settings
						</div>
						<div class="clear"></div>
					</div>
<div class="options">
	<?php
	if($session->evasion == 1){
	?>
		<input type="checkbox" class="check" name="hideShow" onclick="window.location.href = '?id=39&t=100&disable';" checked="checked"> activate troop evasion for your capital.
	<?php 
	}else{
	?>
		<input type="checkbox" class="check" name="hideShow" onclick="window.location.href = '?id=39&t=100&enable';"> activate troop evasion for your capital.
	<?php } ?>
</div>

</div>

</div>
<?php } ?>