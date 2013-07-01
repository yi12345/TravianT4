

<div class="boxes villageList production"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
<table id="production" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<th colspan="4"><?php echo PROD_HEADER; ?> </th>
		</tr>
	</thead>
	<tbody>
				<tr>
			<td class="ico">
				<img class="r1" src="img/x.gif" alt="<?php echo WOOD; ?>" title="<?php echo WOOD; ?>" />
			</td>
			<td class="res">
				<?php echo WOOD; ?>:
			</td>
			<td class="num">
				<?php echo $village->getProd("wood"); ?>			</td>
		</tr>
				<tr>
			<td class="ico">
				<img class="r2" src="img/x.gif" alt="<?php echo CLAY; ?>" title="<?php echo CLAY; ?>" />
			</td>
			<td class="res">
				<?php echo CLAY; ?>:
			</td>
			<td class="num">
				<?php echo $village->getProd("clay"); ?>			</td>
		</tr>
				<tr>
			<td class="ico">
				<img class="r3" src="img/x.gif" alt="<?php echo IRON; ?>" title="<?php echo IRON; ?>" />
			</td>
			<td class="res">
				<?php echo IRON; ?>:
			</td>
			<td class="num">
				<?php echo $village->getProd("iron"); ?>			</td>
		</tr>
				<tr>
			<td class="ico">
				<img class="r4" src="img/x.gif" alt="<?php echo CROP; ?>" title="<?php echo CROP; ?>" />
			</td>
			<td class="res">
				<?php echo CROP; ?>:
			</td>
			<td class="num">
				<?php echo $village->getProd("crop"); ?>			</td>
		</tr>
			</tbody>
</table>
	</div> 
				</div>