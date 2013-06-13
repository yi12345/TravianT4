<?php
    // @todo re-check this once artefacts are available
    $artefact = $database->getOwnArtefactInfo($village->wid);
    $result = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "artefacts WHERE vref = " . $village->wid . ""));
    if ($result)
    {
       $wref = $village->wid;
       $coor = $database->getCoor($wref); 
       $coor2= $database->getCoor($artefact['vref']);
     }
   function getDistance($coorx1, $coory1, $coorx2, $coory2) {
    $max = 2 * WORLD_MAX + 1;
    $x1 = intval($coorx1);
    $y1 = intval($coory1);
    $x2 = intval($coorx2);
    $y2 = intval($coory2);
    $distanceX = min(abs($x2 - $x1), abs($max - abs($x2 - $x1)));
    $distanceY = min(abs($y2 - $y1), abs($max - abs($y2 - $y1)));
    $dist = sqrt(pow($distanceX, 2) + pow($distanceY, 2));
    return round($dist, 1);
   }
?>
<div class="gid27">
<h4 class="round">Your Artefacts</h4>
    <table id="own" cellpadding="1" cellspacing="1">
        <thead>
            <tr>
                <td></td>
                <td>Artefact Name</td>
                <td>Village</td>
                <td>Date</td>
            </tr>
        </thead>

        <tbody>
            <tr>
            <?php

        if($result == 0) {
        	echo '<td colspan="4" class="none">You don\'t own any Artefacts</td>';
        } else {
        	if($artefact['size'] == 1) {
        		$reqlvl = 10;
        		$effect = "Village containing inscriptions";
        	} elseif($artefact['size'] == 2 or 3) {
        		$reqlvl = 20;
        		$effect = "All villages";
        	}
        	echo '<td class="icon"><img class="artefact_icon_' . $artefact['type'] . '" src="img/x.gif"></td>';
        	echo '<td class="nam">
                            <a href="build.php?id=' . $id . '&show='.$artefact['id'].'">' . $artefact['name'] . '</a> <span class="bon">(' . $artefact['effect'] . ')</span>
                            <div class="info">
                                Kincstár <b>' . $reqlvl . '</b>, Hatás <b>' . $effect . '</b>
                            </div>
                        </td>';
        	echo '<td class="pla"><a href="karte.php?d=' . $artefact['vref'] . '&c=' . $generator->getMapCheck($artefact['vref']) . '">' . $database->getVillageField($artefact['vref'], "name") . '</a></td>';
        	echo '<td class="dist">' . date("Y.m.d H:i", $artefact['conquered']) . '</td>';
        }

?>
            </tr>
        </tbody>
    </table>
<br /><h4 class="round">Artefacts Nearby</h4>
    <table id="near" cellpadding="1" cellspacing="1">
        <thead>
            <tr>
                <td></td>

                <td>Artefact Name</td>

                <td>Player</td>

                <td>Distance</td>
            </tr>
        </thead>

        <tbody>
          <?php

        if(mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "artefacts")) == 0) {
        	echo '<td colspan="4" class="none">There are no Artefacts nearby</td>';
        } else {


        	function haversine($l1, $o1, $l2, $o2) {
        		$l1 = deg2rad($l1);
        		$sinl1 = sin($l1);
        		$l2 = deg2rad($l2);
        		$o1 = deg2rad($o1);
        		$o2 = deg2rad($o2);

        		return (7926 - 26 * $sinl1) * asin(min(1, 0.707106781186548 * sqrt((1 - (sin($l2) * $sinl1) - cos($l1) * cos($l2) * cos($o2 - $o1)))));
        	}


        	unset($reqlvl);
        	unset($effect);
        	$arts = mysql_query("SELECT * FROM " . TB_PREFIX . "ereklyék");
        	$rows = array();
        	while($row = mysql_fetch_array($arts)) {
        		$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'wdata` WHERE `id` = ' . $row['vref']);
        		$coor2 = mysql_fetch_assoc($query);

        		
        		$dist = haversine($coor['y'], $coor['x'], $coor2['y'], $coor2['x']);

        		$rows[$dist] = $row;

        	}
        	ksort($rows, SORT_DESC);
        	foreach($rows as $row) {
                $wref = $village->wid;
                $coor = $database->getCoor($wref);
                $wref2 = $row['vref'];
                $coor2 = $database->getCoor($wref2);
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span>';
        		echo '<div class="info">';
        		if($row['size'] == 1) {
        			$reqlvl = 10;
        			$effect = "Village containing inscriptions";
        		} elseif($row['size'] == 2 or $row['size'] == 3) {
        			$reqlvl = 20;
        			$effect = "All villages";
        		}
        		echo '<div class="info">Kincstár <b>' . $reqlvl . '</b>, Hatás <b>' . $effect . '</b>';
        		echo '</div></td><td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="dist">'.getDistance($coor['y'], $coor['x'], $coor2['y'], $coor2['x']).'</td>';
        		echo '</tr>';
        	}
        }

?>
        </tbody>
    </table>
</div>
