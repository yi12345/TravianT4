
<div id="attributes">
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    	<div class="attribute headline">
			<div class="attributesHeadline">Specifikációk</div>
			<div class="pointsHeadline">Pontok</div>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

  <div class="attribute power tooltip" title="Támadó erő||A hős támadási ereje a védelmi erejének és a támadó erejének kombinációja. Minnél több ez az erő annál kevesebb sérülést kap a kalandnál a hős.<br><font color='#5dcbfb'>Támadási erő: <?php echo $hero_info['attack']; ?></font>">
			<div class="element attribName">Támadási erő</div>
			<div class="element current power"><?php echo $hero_info['attack']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo intval($hero_info['attack']/100)-1; ?>%;"></div>
				</div>
			</div>
			<div class="element add">
        <?php
        if($hero_info['points'] > 0){
            echo "<a class=\"setPoint\" href=\"hero_inventory.php?add=off\"></a>";
        }else {
            echo "<a class=\"setPoint hidden\" href=\"hero_inventory.php?add=off\"></a>";
        }
        ?>
			</div>
			<div class="element points"><?php echo intval($hero_info['attack']/150); ?></div>
		</div>

		<div class="clear"></div>
  <div class="attribute offBonus tooltip" title="<font color=white><b>Támadó pont</b></font><br>A támadópont növeli a hős életben maradási esélyeit<br><font color='#5dcbfb'>Támadó bónusz: <?php echo ($hero_info['attackbonus']/200); ?>%</font>">
			<div class="element attribName">Támadó bónusz</div>
			<div class="element current power"><span class="value"><?php echo ($hero_info['attackbonus']/200); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo intval($hero_info['attackbonus']/100); ?>%;"></div>
				</div>
			</div>
			<div class="element add">
            <?php
        if($hero_info['points'] > 0){
            echo "<a class=\"setPoint\" href=\"hero_inventory.php?add=obonus\"></a>";
        }else {
            echo "<a class=\"setPoint hidden\" href=\"hero_inventory.php?add=obonus\"></a>";
        }
        ?>
			</div>
			<div class="element points"><?php echo intval($hero_info['attackbonus']/100); ?></div>
		</div>

		<div class="clear"></div>

  <div class="attribute defBonus tooltip" title="<font color=white><b>امتیاز دفاعی</b></font><br>باعث افزایش قدرت دفاعی تمامی لشکریانی خواهد شد که همراه قهرمان می‌باشند.<br><font color='#5dcbfb'>امتیاز دفاعی: <?php echo ($hero_info['defencebonus']/200); ?>%</font>">
			<div class="element attribName">امتیاز دفاعی</div>
			<div class="element current power"><span class="value"><?php echo ($hero_info['defencebonus']/200); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo intval($hero_info['defencebonus']/100); ?>%;"></div>
				</div>
			</div>
			<div class="element add">
            <?php
        if($hero_info['points'] > 0){
            echo "<a class=\"setPoint\" href=\"hero_inventory.php?add=dbonus\"></a>";
        }else {
            echo "<a class=\"setPoint hidden\" href=\"hero_inventory.php?add=dbonus\"></a>";
        }
        ?>
			</div>
			<div class="element points"><?php echo intval($hero_info['defencebonus']/100); ?></div>
		</div>

		<div class="clear"></div>

  <div class="attribute productionPoints tooltip" title="<font color=white><b>منابع</b></font><br>باعث افزایش تولید منابع دهکده‌ای خواهد شد که قهرمان در حال حاضر در آن مقیم است.
<br><font color='#5dcbfb'>افزایش تولید منابع: <?php echo ($hero_info['resource']); ?>%</font>">
			<div class="element attribName">منابع</div>
			<div class="element current power"><?php echo ($hero_info['resource']/10); ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo intval($hero_info['resource']); ?>%;"></div>
				</div>
			</div>
			<div class="element add">
             <?php
        if($hero_info['points'] > 0){
            echo "<a class=\"setPoint\" href=\"hero_inventory.php?add=resource\"></a>";
        }else {
            echo "<a class=\"setPoint hidden\" href=\"hero_inventory.php?add=resource\"></a>";
        }
        ?>
			</div>
			<div class="element points"><?php echo intval($hero_info['resource']/10); ?></div>
		</div>

		<div class="clear"></div>
		</div>
  </div>
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">	<div class="attribute res" id="setResource">
		<div class="changeResourcesHeadline">
			تغییر نوع تولید منابع از طرف قهرمان		</div>
		<div class="clear"></div>
		<div class="resource">
		  <input type="radio" name="resource" value="0" id="resourceHero0" checked="checked">
			<label for="resourceHero0">
				<img alt="تمامی منابع" class="r0" src="img/x.gif">				<span class="current">0</span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" name="resource" value="1" id="resourceHero1">
			<label for="resourceHero1">
				<img alt="چوب" class="r1" src="img/x.gif">				<span class="current">0</span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" name="resource" value="2" id="resourceHero2">
			<label for="resourceHero2">
				<img alt="خشت" class="r2" src="img/x.gif">				<span class="current">0</span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" name="resource" value="3" id="resourceHero3">
			<label for="resourceHero3">
				<img alt="آهن" class="r3" src="img/x.gif">				<span class="current">0</span>
			</label>
		</div>
				<div class="resource">
			<input type="radio" name="resource" value="4" id="resourceHero4">
			<label for="resourceHero4">
				<img alt="گندم" class="r4" src="img/x.gif">				<span class="current">0</span>
			</label>
		</div>
			</div>
	<div class="clear"></div>
		</div>
  </div>
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    
<div class="attribute health tooltip" title="<font color=white><b>سلامتی</b></font><br>بازسازی قهرمان شما: 20% برای هر روز
<br><font color='#5dcbfb'>سلامتی: 20% در روز از قهرمان</font>">
			<div class="element attribName">سلامتی</div>
			<div class="element current power"><span class="value"><?php echo floor($hero_info['health']); ?></span>%</div>
			<div class="element progress">
				<div class="bar-bg">
                <?php
                if($hero_info['health']>=90){
                $color = '#006900';
                } elseif($hero_info['health']>50){
                $color = '#99c01a';
                }
                if($hero_info['health']<=50 && $hero_info['health']>35){
                $color = '#FFFF00';
                }
                if($hero_info['health']<=35 && $hero_info['health']>15){
                $color = '#F0B300';
                } elseif($hero_info['health']<=15) {
                $color = '#f00000';
                }
                ?>
              <font color="#006900"></font>
					<div class="bar" style="width:<?php echo floor($hero_info['health']); ?>%;background-color:<?php echo $color; ?>"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
			</div>
  </div>
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
    
<div class="attribute experience tooltip" title="<font color=white><b>تجربه <?php echo floor($hero_info['level']/2); ?>%</b></font><br>Level <?php echo ($hero_info['experience']+1); ?> قهرمان شما به <?php echo (150-$hero_info['level']); ?> تجربه نیاز دارد.">
			<div class="element attribName">تجربه</div>
			<div class="element current power"><?php echo $hero_info['level']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo floor($hero_info['level']); ?>%;"></div>
				</div>
			</div>
			<div class="element add"></div>
			<div class="element points"><?php echo intval($hero_info['points']); ?></div>
			<div class="clear"></div>
		</div>





  <div class="attribute level tooltip" title="<font color=white><b>Level</b></font><br>Level<br><font color='#5dcbfb'>قدرت هجومی قهرمان شما برای هر امتیازی که به آن داده می‌شود به جای اینکه به میزان 80 افزایش یابد به میزان 100 افزایش خواهد یافت.</font>">
			<div class="element attribName">Level</div>
			<div class="element current power"><?php echo $hero_info['experience']; ?></div>
			<div class="element progress">
				<div class="bar-bg">
					<div class="bar" style="width:<?php echo min(100,$hero_info['experience']); ?>%"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>

		</div>
  </div></div>
    