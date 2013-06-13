<div class="boxes villageList units"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
<table id="troops" cellpadding="1" cellspacing="1">
<thead><tr>
	<th colspan="3"><?php echo TROOPS_DORF; ?></th>
</tr></thead><tbody>
<?php

$units = $technology->getUnitList();
$reinfs = $village->enforcetome;
$heroamt = 0;

if(count($units) == 0 && count($reinfs) == 0) {
	echo "<tr><td>None</td></tr>";
}
else {
	foreach($units as $unit) {
    	if($unit['id']=="hero"){
        	foreach($reinfs as $reinf) {
                if($reinf['hero']!=0){
                	$heroamt += $reinf['hero'];
                }
            }
        	$heroamt += $unit['amt'];
        	echo "<tr><td class=\"ico\"><a href=\"build.php?id=39\"><img class=\"unit u".$unit['id']."\" src=\"img/x.gif\" alt=\"".$unit['name']."\" title=\"".$unit['name']."\" /></a></td>
    ";	
            echo "<td class=\"num\">".$heroamt."</td><td class=\"un\">".$unit['name']."</td></tr>";
            
        }else{
        	echo "<tr><td class=\"ico\"><a href=\"build.php?id=39\"><img class=\"unit u".$unit['id']."\" src=\"img/x.gif\" alt=\"".$unit['name']."\" title=\"".$unit['name']."\" /></a></td>
    ";	
            echo "<td class=\"num\">".$unit['amt']."</td><td class=\"un\">".$unit['name']."</td></tr>";
        }
        
	}
    
    
    if(count($reinfs)>0){
    	foreach($reinfs as $reinf) {
        	for($i=1;$i<=50;$i++){
            	if($reinf['u'.$i]!=0){
				echo "<tr><td class=\"ico\"><a href=\"build.php?id=39\"><img class=\"unit u".$i."\" src=\"img/x.gif\" title=\"".$technology->unarray[$i]."\" /></a></td>
";	
				echo "<td class=\"num\">".$reinf['u'.$i]."</td><td class=\"un\">".$technology->unarray[$i]."</td></tr>";
                }
            }
    	}
    }

}
?>
            </tbody></table>
            	</div> 
				</div>