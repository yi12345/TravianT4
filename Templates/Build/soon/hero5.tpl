<?php
$_GET['bid'] = 37;
$bid = $_GET['bid'];
$uprequire = $building->resourceRequired($id,$bid);
?>
<h2>Hero's Mansion</h2>
<div class="build_desc">
	<a href="#" onclick="return Travian.Game.iPopup(37,4);" class="build_logo">
		<img class="building big white g37" src="img/x.gif" alt="Hero's Mansion">
		<img class="building big white g37" src="img/x.gif" alt="Dimora dell'Eroe">

	</a>
In the home of the Hero can get an overview of the surrounding oasis. From level 10 of the structure can occupy oasis with your hero and increase production of the resources of this village<div id="contract" class="contract contractNew contractWrapper">
	<div class="contractText">Cost:</div>
	<div class="contractCosts">
    <div class="showCosts">
    <span class="resources r1 little_res"><img class="r1" src="img/x.gif" alt="Wood"><?php echo $uprequire['wood']; ?></span>
    <span class="resources r2 little_res"><img class="r2" src="img/x.gif" alt="Clay"><?php echo $uprequire['clay']; ?></span>
    <span class="resources r3 little_res"><img class="r3" src="img/x.gif" alt="Iron"><?php echo $uprequire['iron']; ?></span>
    <span class="resources r4"><img class="r4" src="img/x.gif" alt="Crop"><?php echo $uprequire['crop']; ?></span>
    <span class="resources r5"><img class="r5" src="img/x.gif" alt="Crop consumption"><?php echo $uprequire['pop']; ?></span>
    <div class="clear"></div>
    <span class="clocks"><img class="clock" src="img/x.gif" alt="Duration">


    <?php echo $generator->getTimeFormat($uprequire['time']); ?>
	</span>
    <div class="clear"></div>
    </div></div>
	<div class="contractLink">
    <div class="contractText">Required:</div>
    <span class="buildingCondition">
    <a href="#" onclick="return Travian.Game.iPopup(14,4, 'gid');">Rally Point</a> <span>Level 1</span></span>, <span class="buildingCondition"><a href="#" onclick="return Travian.Game.iPopup(15,4, 'gid');">Main Building</a> <span>Level 3</span></span>
    </div>
	<div class="clear"></div>
</div>
<div class="clear"></div><hr>
