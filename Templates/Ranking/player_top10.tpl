<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 4 ORDER BY ap DESC, id ASC LIMIT 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id  = '".$session->uid."' ORDER BY ap DESC, id ASC LIMIT 1");
    $attRank = $ranking->getTop10AttRank($session->uid);
    $defRank = $ranking->getTop10DefRank($session->uid);
    $clpRank = $ranking->getTop10ClpRank($session->uid);
    $rrRank = $ranking->getTop10RobbersRank($session->uid);
?>
<div class="contentNavi tabNavi">
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=1"><span class="tabItem">Overview</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=31"><span class="tabItem">Attackers</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=32"><span class="tabItem">Defenders</span></a></div>
				</div>
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="statistiken.php?tid=7"><span class="tabItem">Top 10</span></a></div>
				</div><div class="clear"></div>
</div>
<div id="statLeft" class="top10Wrapper">
<h4 class="round small  top top10_offs">Top 10 Attackers</h4>
<table cellpadding="1" cellspacing="1" id="top10_offs" class="top10 row_table_data">
	<thead>
		<tr>
			<td>Rank</td>
			<td>Player</td>
			<td>Point</td>
		</tr>
	</thead>
	<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->uid) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['ap']."</td>";
		echo "</tr>";
	}
?>
		<tr>
			<td colspan="3" class="empty"></td>
		</tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($attRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$attRank.".&nbsp;</td>";
        }
        
	  	if($attRank > 10) {
			echo "<td class=\"pla\">".$row['username']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['ap']."</td>";
		echo "</tr>";
	}
?>
         </tbody>
</table>
<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 4 ORDER BY dp DESC, id ASC Limit 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id  = '".$session->uid."' ORDER BY dp DESC, id ASC Limit 1");
?>
<h4 class="round small spacer top top10_defs">Top 10 Defenders</h4>
<table cellpadding="1" cellspacing="1" id="top10_defs" class="top10 row_table_data">
	<thead>
		<tr>
			<td>Rank</td>
			<td>Player</td>
			<td>Point</td>
		</tr>
	</thead>
	<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->uid) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['dp']."</td>";
		echo "</tr>";
	}
?>
		 <tr>
			<td colspan="3" class="empty"></td>
		</tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($defRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$defRank.".&nbsp;</td>";
        }
        
	  	if($defRank > 10) {
			echo "<td class=\"pla\">".$row['username']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['dp']."</td>";
		echo "</tr>";
	}
?>
         </tbody>
</table>
</div>

<div id="statRight" class="top10Wrapper">
<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 4 ORDER BY `clp` DESC, id ASC Limit 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id  = '".$session->uid."' ORDER BY `clp` DESC, id ASC Limit 1");
?>
<h4 class="round small  top top10_climbers">Top 10 Climbers</h4>
<table cellpadding="1" cellspacing="1" id="top10_climbers" class="top10 row_table_data">
	<thead>
		<tr>
			<td>Rank.</td>
			<td>Player</td>
			<td>Ranks</td>
		</tr>
	</thead>
	<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->uid) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['clp']."</td>";
		echo "</tr>";
	}
?>
         <tr>
            <td colspan="3" class="empty"></td>
        </tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($clpRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$clpRank.".&nbsp;</td>";
        }
        
	  	if($clpRank > 10) {
			echo "<td class=\"pla\">".$row['username']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['clp']."</td>";
		echo "</tr>";
	}
?>
    </tbody>
</table>
<?php
    for($i=1;$i<=0;$i++) {
    echo "Row ".$i;
    }
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 4 AND RR >= 0 ORDER BY RR DESC, id ASC Limit 10");
    $result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id  = '".$session->uid."' AND RR >= 0 ORDER BY RR DESC, id ASC Limit 1");
?>
<h4 class="round small spacer top top10_raiders">Top 10 Raiders</h4>
<table cellpadding="1" cellspacing="1" id="top10_raiders" class="top10 row_table_data">
	<thead>
		<tr>
			<td>Rank</td>
			<td>Player</td>
			<td>Resources</td>
		</tr>
	</thead>
	<tbody>
<?php
	while($row = mysql_fetch_array($result)){
		if($row['id']==$session->uid) {
			echo "<tr class=\"own hl hover\">";
        } else {
        	echo "<tr class=\"hover\">";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla hl\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['RR']."</td>";
		echo "</tr>";
	}
?>
		 <tr>
			<td colspan="3" class="empty"></td>
		</tr>
<?php
	while($row = mysql_fetch_array($result2)){
		if($rrRank > 10) {
			echo "<tr class=\"none\"><td class=\"ra fc\">?&nbsp;</td>";
        } else {
        	echo "<tr class=\"own hl select\"><td class=\"ra fc\">".$rrRank.".&nbsp;</td>";
        }
        
	  	if($rrRank > 10) {
			echo "<td class=\"pla\">".$row['username']."</td>";
        } else {
        	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
        }
		echo "<td class=\"val lc\">".$row['RR']."</td>";
		echo "</tr>";
	}
?>
    </tbody>
</table>
</div>
<div class="clear">&nbsp;</div>