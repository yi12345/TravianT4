<?php
$totalproduction = $village->allcrop; // all crops + bakery + grain mill
$heroData = $database->getHeroData($session->uid);
if($heroData['dead']==0 && $heroData['wref']==$village->wid){
$totalproduction += $heroData['r4']*10*SPEED*$heroData['product'];
$totalproduction += $heroData['r0']*3*SPEED*$heroData['product'];
}
?>
<ul id="res">
		<li class="r1" title="<div style=color:#FFF><b><?php echo WOOD; ?></b></div>Production: <?php echo $village->getProd("wood"); ?>"> 
		<p> 
        	<img src="img/x.gif" alt="<?php echo WOOD; ?>"/> 

			<span id="l1" class="value "><?php echo round($village->awood)."/".$village->maxstore; ?></span> 
        <div class="bar-bg">
	     	 <div id="lbar1" class="bar" style="width: 0%; background-color: rgb(0, 105, 0); "></div>
      	</div>
	    </p>
        </li> 
        
		<li class="r2" title="<div style=color:#FFF><b><?php echo CLAY; ?></b></div>Production: <?php echo $village->getProd("clay"); ?>"> 
		<p> 
        	<img src="img/x.gif" alt="<?php echo CLAY; ?>"/> 
			<span id="l2" class="value "><?php echo round($village->aclay)."/".$village->maxstore; ?></span> 
          <div class="bar-bg">
	      <div id="lbar2" class="bar" style="width: 0%; background-color: rgb(0, 105, 0); "></div>
      	  </div>
		</p> 

        	</li> 
		<li class="r3" title="<div style=color:#FFF><b><?php echo IRON; ?></b></div>Production: <?php echo $village->getProd("iron"); ?>"> 
		<p> 
        	<img src="img/x.gif" alt="<?php echo IRON; ?>"/> 
			<span id="l3" class="value "><?php echo round($village->airon)."/".$village->maxstore; ?></span>
          <div class="bar-bg">
	      <div id="lbar3" class="bar" style="width: 0%; background-color: rgb(0, 105, 0); "></div>
      	  </div> 
		</p> 

        	</li> 
		<li class="r4" title="<div style=color:#FFF><b><?php echo CROP; ?></b></div>Production: <?php echo $village->getProd("crop"); ?>"> 
		<p> 
        	<img src="img/x.gif" alt="<?php echo CROP; ?>"/> 
			<span id="l4" class="value "><?php echo round($village->acrop)."/".$village->maxcrop; ?></span>
          <div class="bar-bg">
	      <div id="lbar4" class="bar" style="width: 0%; background-color: rgb(0, 105, 0); "></div>
      	  </div>
		</p> 

        	</li> 
		<li class="r5" title="<div style=color:#FFF><b><?php echo CROP_COM; ?></b></div><?php echo ($village->pop+$technology->getUpkeep($village->unitall,0))."/".$totalproduction.""; ?>"> 
		<p> 
        	<img src="img/x.gif" alt="<?php echo CROP_COM; ?>"/> 
			<span id="l5" class="value "><?php echo ($village->pop+$technology->getUpkeep($village->unitall,0))."/".$totalproduction.""; ?></span> 
		</p> 
			</li> 
	</ul>
<div class="clear"></div>

<script type="text/javascript"> 
	resources.production = {
'l1': <?php echo $village->getProd("wood"); ?>,'l2': <?php echo $village->getProd("clay"); ?>,'l3': <?php echo $village->getProd("iron"); ?>,'l4': <?php echo $village->getProd("crop"); ?>			};
</script>