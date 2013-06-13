<?php
if(isset($_GET['u'])) {
$u = $_GET['u'];
}
else {
$u=0;
}
?>
<h1 class="titleInHeader">Market <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid17">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(17,4);" class="build_logo"> 
    <img class="building big white g17" src="img/x.gif" alt="Piac" title="Piac" /> 
</a> 
At the marketplace you can trade resources with other players. The higher its level, the more resources can be transported at the same time.</div> 
<?php
include("upgrade.tpl");
include("17_menu.tpl");
if($session->plus) {
?>
<div class="boxes boxesColor gray traderCount"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">Merchants <?php echo $market->merchant; ?> / <?php echo $market->merchantAvail(); ?></div>
				</div><div class="clear"></div>
<div class="boxes boxesColor gray search_select"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><table id="search_select" class="buy_select transparent" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td colspan="4">I'm Searching</td>
		</tr>
	</thead>
	<tbody>
		<tr>
        <td>
        <button type="button" value="r1Big" <?php if(isset($_GET['s']) && $_GET['s'] == 1) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&s=1<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['b'])) echo "&b=".$_GET['b']; ?>'; return false;"><img src="img/x.gif" class="r1Big" alt="r1Big"></button>
        </td>
        <td>
        <button type="button" value="r2Big" <?php if(isset($_GET['s']) && $_GET['s'] == 2) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&s=2<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['b'])) echo "&b=".$_GET['b']; ?>'; return false;"><img src="img/x.gif" class="r2Big" alt="r2Big"></button>
        </td>
        <td>
        <button type="button" value="r3Big" <?php if(isset($_GET['s']) && $_GET['s'] == 3) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&s=3<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['b'])) echo "&b=".$_GET['b']; ?>'; return false;"><img src="img/x.gif" class="r3Big" alt="r3Big"></button>
        </td>
        <td>
        <button type="button" value="r4Big" <?php if(isset($_GET['s']) && $_GET['s'] == 4) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&s=4<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['b'])) echo "&b=".$_GET['b']; ?>'; return false;"><img src="img/x.gif" class="r4Big" alt="r4Big"></button>
        </td>
        </tr>
	</tbody>
</table>
	</div>
</div>

<div class="boxes boxesColor gray ratio_select"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
<table id="ratio_select" class="buy_select transparent" cellpadding="1" cellspacing="1">
<tbody>
	<tr>
    <td>
    <button type="button" value="marketPercentage marketPercentage1_1" <?php if(isset($_GET['v'])) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&v=1:1<?php if(isset($_GET['s'])) echo "&s=".$_GET['s']; if(isset($_GET['b'])) echo "&b=".$_GET['b']; ?>'; return false;">
    <img src="img/x.gif" class="marketPercentage marketPercentage1_1" alt="marketPercentage marketPercentage1_1"></button>
    </td>
    </tr>
    <tr>
    <td>
    <button type="button" value="marketPercentage marketPercentage1_x" <?php if(!isset($_GET['v'])) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1<?php if(isset($_GET['s'])) echo "&s=".$_GET['s']; if(isset($_GET['b'])) echo "&b=".$_GET['b']; ?>'; return false;">
    <img src="img/x.gif" class="marketPercentage marketPercentage1_x" alt="marketPercentage marketPercentage1_x"></button>
    </td>
	</tr>
</tbody>
</table>
</div></div>

<div class="boxes boxesColor gray bid_select"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
<table id="bid_select" class="buy_select transparent" cellpadding="1" cellspacing="1">
<thead><tr>
<td colspan="4">I'm Offering</td>
</tr></thead>
<tbody>
<tr>
<td>
<button type="button" value="r1Big" <?php if(isset($_GET['b']) && $_GET['b'] == 1) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&b=1<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['s'])) echo "&s=".$_GET['s']; ?>'; return false;">
<img src="img/x.gif" class="r1Big" alt="r1Big"></button>
</td>
<td>
<button type="button" value="r2Big" <?php if(isset($_GET['b']) && $_GET['b'] == 2) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&b=2<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['s'])) echo "&s=".$_GET['s']; ?>'; return false;">
<img src="img/x.gif" class="r2Big" alt="r2Big"></button>
</td>
<td>
<button type="button" value="r3Big" <?php if(isset($_GET['b']) && $_GET['b'] == 3) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&b=3<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['s'])) echo "&s=".$_GET['s']; ?>'; return false;">
<img src="img/x.gif" class="r3Big" alt="r3Big"></button>
</td>
<td>
<button type="button" value="r4Big" <?php if(isset($_GET['b']) && $_GET['b'] == 4) { echo "class=\"iconFilter iconFilterActive\""; } else { echo "class=\"iconFilter\""; } ?> onclick="window.location.href = 'build.php?id=<?php echo $id; ?>&t=1&b=4<?php if(isset($_GET['v'])) echo "&v=".$_GET['v']; if(isset($_GET['s'])) echo "&s=".$_GET['s']; ?>'; return false;">
<img src="img/x.gif" class="r4Big" alt="r4Big"></button>
</td>
</tr>
</tbody>
</table>
</div></div>
 <?php
 }
 ?>
<div class="clear"></div>
<h4 class="spacer">Offered on the market</h4>

<table id="range" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<th>Offered</th>
			<th><img src="img/x.gif" class="ratio" alt="Ratio"></th>
			<th>Searched</th>
			<th>Players</th>
			<th>Duration</th>
			<th>Action</th>
		</tr>
	</thead>
<tbody>
<?php
if(count($market->onsale) > 0) {
for($i=0+$u;$i<=40+$u;$i++) {
if(isset($market->onsale[$i])) {
echo "<tr><td class=\"val\">";
$reqMerc = 1;
if($market->onsale[$i]['wamt'] > $market->maxcarry) {
			$reqMerc = round($market->onsale[$i]['wamt']/$market->maxcarry);
			if($market->onsale[$i]['wamt'] > $market->maxcarry*$reqMerc) {
				$reqMerc += 1;
			}
		}
        
        $sss = ($market->onsale[$i]['wamt']/$market->onsale[$i]['gamt']);
        $ratio = round($sss, 1);
        if($ratio <= 1){
        	$class = 'green';
        }elseif($ratio > 1 && $ratio < 2){
        	$class = 'orange';
        }elseif($ratio >= 2){
        	$class = 'red';
        }
            
switch($market->onsale[$i]['gtype']) {
    case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"Wood\" title=\"Wood\" /> "; break;
    case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" /> "; break;
    case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" /> "; break;
    case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"Wheat\" title=\"Wheat\" /> "; break;
 	}
    echo $market->onsale[$i]['gamt'];
    
    echo "</td><td class=\"ratio\">
	      <div class=\"boxes boxesColor ".$class."\"><div class=\"boxes-tl\"></div><div class=\"boxes-tr\"></div><div class=\"boxes-tc\"></div><div class=\"boxes-ml\"></div><div class=\"boxes-mr\"></div><div class=\"boxes-mc\"></div><div class=\"boxes-bl\"></div><div class=\"boxes-br\"></div><div class=\"boxes-bc\"></div><div class=\"boxes-contents\">".$ratio."</div>
      </div>
      </td><td class=\"val\">";
    switch($market->onsale[$i]['wtype']) {
    case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"Wood\" title=\"Wood\" /> "; break;
    case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" /> "; break;
    case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" /> "; break;
    case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"Wheat\" title=\"Wheat\" /> "; break;
    }
    echo $market->onsale[$i]['wamt'];
    echo "</td><td class=\"pla\">";
    echo "<img src=\"img/x.gif\" class=\"nation nation".$database->getUserField($database->getVillageField($market->onsale[$i]['vref'],"owner"),"tribe",0)."\"> <a href=\"karte.php?d=".$market->onsale[$i]['vref']."&c=".$generator->getMapCheck($market->onsale[$i]['vref'])."\" title=\"".$database->getVillageField($market->onsale[$i]['vref'],"name")."\">".$database->getUserField($database->getVillageField($market->onsale[$i]['vref'],"owner"),"username",0)."</a></td>";
    
    echo "<td class=\"dur\">".$generator->getTimeFormat($market->onsale[$i]['duration'])."</td>";
    
    if(($market->onsale[$i]['wtype'] == 1 && $village->awood <= $market->onsale[$i]['wamt']) ||($market->onsale[$i]['wtype'] == 2 && $village->aclay <= $market->onsale[$i]['wamt']) ||($market->onsale[$i]['wtype'] == 3 && $village->airon <= $market->onsale[$i]['wamt']) ||($market->onsale[$i]['wtype'] == 4 && $village->acrop <= $market->onsale[$i]['wamt'])) {
    echo "<td class=\"act none\">Nincs elég nyersanyag.</td></tr>";
    }
    else if($market->merchantAvail() == 0 && $reqMerc <= $market->merchantAvail()) {
    echo "<td class=\"act none\">Nincs elég kereskedő.</td></tr>";
    }
    else {
    echo "<td class=\"act\">
    <button type=\"button\" class=\"build\" onclick=\"window.location.href = 'build.php?id=$id&t=1&a=".$session->mchecker."&g=".$market->onsale[$i]['id']."'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Accept Offer</div></div></button></td>";
    }
    echo"</tr>";
    }
}
}
else {
echo "<tr><td class=\"none\" colspan=\"6\"><center>No Offers Currently</center></td></tr>";
}
?>
</tbody></table>
<tr><td colspan="5"><p>
<span class="none">
<?php
if(!isset($_GET['u']) && count($market->onsale) < 40) {
    echo "<span class=\"none\"><b>&laquo;</b></span> Pages <span class=\"none\"><b>&raquo;</b></span>";
    }
    else if (!isset($_GET['u']) && count($market->onsale) > 40) {
    echo "<span class=\"none\"><b>&laquo;</b></span> Pages <a href=\"build.php?id=$id&t=1&u=".($_GET['u']+40)."\">&raquo;</a>";
    }
    else if(isset($_GET['u']) && count($market->onsale) > $_GET['u']) {
    	if(count($market->onsale) > ($_GET['u']+40) && $_GET['u']-40 < count($market->onsale) && $_GET['u'] != 0) {
         echo "<a href=\"build.php?id=$id&t=1&u=".($_GET['u']+40)."\">&laquo;</a> Pages <a href=\"build.php?id=$id&t=1&u=".($_GET['u']+40)."\">&raquo;</a>";
         }
         else if(count($market->onsale) > $_GET['u']+40) {
         	echo "<span class=\"none\"><b>&laquo;</b></span> Pages <a href=\"build.php?id=$id&t=1&u=".($_GET['u']+40)."\">&raquo;</a>";
         }
        else {
        echo "<a href=\"build.php?id=$id&t=1&u=".($_GET['u']-40)."\">&laquo;</a> Pages <span class=\"none\"><b>&raquo;</b></span>";
        }
    }
?>
</td></tr> 
</div> 