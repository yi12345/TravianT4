<?php
if (date('H')>=20 or date('H')<6){
$hclass = "night";
$htitle = HEADER_NIGHT;
} elseif (date('H')<20 or date('H')>=6){
$hclass = "day";
$htitle = HEADER_DAY;
}
?>
<div id="stime" class="stime">
	<div class="content-background-l">&nbsp;</div>
	<div class="content-background-r">&nbsp;</div>
	<div class="content <?php echo $hclass; ?>" title="<?php echo $htitle; ?>">
		<?php echo SERVER_TIME; ?>&nbsp;<span id="tp1" ><?php echo date('H:i:s'); ?></span>
    </div>
</div>

<div id="plusLink">
	<div id="gs">
		<p class="gold">
			<a href="plus.php?id=3" title="<?php echo HEADER_GOLD; ?>"><img src="img/x.gif" alt="<?php echo HEADER_GOLD; ?>" class="gold" /><br><?php echo "$session->gold"; ?></a>
		</p>
<p class="silver">
			<a href="hero_auction.php" title="<?php echo HEADER_SILVER; ?>"><img src="img/x.gif" alt="<?php echo HEADER_SILVER; ?>" class="silver"><br><?php echo "$session->silver"; ?></a>
		</p>
        <div class="clear"></div>
	</div>
    <div id="plus">
    	<a href="plus.php" class="plusBtn" title="<?php echo HEADER_PLUSMENU; ?>"><span class="plusBtn-l"><span class="plus_g"><?php echo HEADER_PLUS; ?></span></span><span class="plusBtn-r">&nbsp;</span></a>
    </div>
        <?php if($session->access == MULTIHUNTER) { 
		echo "<div id=\"plus\"> 
    	<a href=\"".HOMEPAGE."Admin\" target=\"_blank\" title=\"".HEADER_ADMIN."\" class=\"plusBtn\"><span class=\"plusBtn-l\">".HEADER_ADMIN."</span></span><span class=\"plusBtn-r\">&nbsp;</span></a> 
    </div>";
		} ?>
        <?php if($session->access == ADMIN) {
		echo "<div id=\"plus\"> 
    	<a href=\"".HOMEPAGE."Admin\" target=\"_blank\" title=\"".HEADER_ADMIN."\" class=\"plusBtn\"><span class=\"plusBtn-l\">".HEADER_ADMIN."</span></span><span class=\"plusBtn-r\">&nbsp;</span></a> 
    </div>";
		} ?>

</div>
<div class="clear"></div>