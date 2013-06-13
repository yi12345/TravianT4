<h1 class="titleInHeader">Treasure Chamber <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid27">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(27,4);" class="build_logo">
        <img class="building big white g27" src="img/x.gif" alt="Kincstár" title="Kincstár"></a>
        The riches of your empire are kept in the treasure chamber. In each treasure chamber level 10 or higher, there is room for one artifact. After you have captured an artifact it takes 24 hours to be effective, except on speed servers where it only takes 12 hours.</div>
        
        <?php
include("upgrade.tpl");
        include ("27_menu.tpl");

?>
        <h4 class="round">Small Artefacts</h4>
        <table id="show_artefacts" cellpadding="1" cellspacing="1">
    		<thead>
    			<tr>
    				<td></td>
                                <td>Artefact Name</td>
                                <td>Village</td>
                                <td>Date</td>
    			</tr>
    		</thead>
    		<tbody>
            <?php

        if(mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "artefacts")) == 0) {
        	echo '<td colspan="4" class="none">No Small Artefacts</td>';
        } else {


        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 1");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 2");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 4");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 5");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 6");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 8");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 9");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 9");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_9" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}
			?>
            
            <tr><td colspan="4" class="empty"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 7");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_10" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}
			?>
            <tr><td colspan="4" class="empty"></td></tr>
            <?php
        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 3");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">(' . $row['effect'] . ')</span><div class="info">Treasure Chamber <b>10</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
        <?php

        }

?>
            
    	</tbody></table></div>

        
