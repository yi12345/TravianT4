
<div id="content" class="map">

<div class="t2"></div>

<?php
if(isset($_GET['d']) && isset($_GET['c'])) {
	if($generator->getMapCheck($_GET['d']) == $_GET['c']) {
        $wref = $_GET['d'];
        $coor = $database->getCoor($wref);
        $x = $coor['x'];
        $y = $coor['y'];
	}
}
else if(isset($_GET['x']) && isset($_GET['y'])) {
    $x = $_GET['x'];
    $y = $_GET['y'];
    $bigmid = $generator->getBaseID($x,$y);
}
else if(isset($_POST['xp']) && isset($_POST['yp'])){
	$x = $_POST['xp'];
    $y = $_POST['yp'];
    $bigmid = $generator->getBaseID($x,$y);
}
else {
    $y = $village->coor['y'];
	$x = $village->coor['x'];
    $bigmid = $village->wid;
}

$south1 = ($y-1) < -WORLD_MAX? $y+WORLD_MAX+WORLD_MAX : $y-1;
$south2 = ($y-2) < -WORLD_MAX? $y+WORLD_MAX+WORLD_MAX-1 : $y-2;
$south3 = ($y-3) < -WORLD_MAX? $y+WORLD_MAX+WORLD_MAX-2 : $y-3;

$north1 = ($y+1) > WORLD_MAX? $y-WORLD_MAX-WORLD_MAX : $y+1;
$north2 = ($y+2) > WORLD_MAX? $y-WORLD_MAX-WORLD_MAX+1 : $y+2;
$north3 = ($y+3) > WORLD_MAX? $y-WORLD_MAX-WORLD_MAX+2 : $y+3;

$west1 = ($x-1) < -WORLD_MAX? $x+WORLD_MAX+WORLD_MAX : $x-1;
$west2 = ($x-2) < -WORLD_MAX? $x+WORLD_MAX+WORLD_MAX-1 : $x-2;
$west3 = ($x-3) < -WORLD_MAX? $x+WORLD_MAX+WORLD_MAX-2 : $x-3;
$west4 = ($x-4) < -WORLD_MAX? $x+WORLD_MAX+WORLD_MAX-3 : $x-4;

$east1 = ($x+1) > WORLD_MAX? $x-WORLD_MAX-WORLD_MAX : $x+1;
$east2 = ($x+2) > WORLD_MAX? $x-WORLD_MAX-WORLD_MAX+1 : $x+2;
$east3 = ($x+3) > WORLD_MAX? $x-WORLD_MAX-WORLD_MAX+2 : $x+3;
$east4 = ($x+4) > WORLD_MAX? $x-WORLD_MAX-WORLD_MAX+3 : $x+4;

$xarray = array($west4,$west3,$west2,$west1,$x,$east1,$east2,$east3,$east4);
$yarray = array($north3,$north2,$north1,$y,$south1,$south2,$south3);


$maparray = array();
$ycount = 0;
for($i=0;$i<=8;$i++) {
    if($ycount != 7) {
    	array_push($maparray,$database->getMInfo($generator->getBaseID($xarray[$i],$yarray[$ycount])));
    	if($i==8) {
    		$i = -1;
    		$ycount +=1;
    	}
	}
}
echo "<h1 dir=\"rtl\">Map</h1>";
$row = 0;
$coorindex = 0;
?>

<div class="map2 lowRes">
	<div id="mapContainer" class="lowRes">
  <?php if($session->goldclub) { ?>
  
    <div id="toolbar" class="toolbar">
	<div class="ml">
		<div class="mr">
			<div class="mc">
				<div class="contents">
                	<a href="cropfinder.php"><div class="iconButton linkCropfinder" title="15-9 Crop Finder"></div></a>
				</div>
			</div>
		</div>
	</div>
	<div class="bl">
		<div class="mr">
			<div class="bc"></div>
		</div>
	</div>
</div>
<?php } ?>
<div class="mapContainerData" id="mapData">
<?php
$index = 0;
$row1 = 0;


for($i=0;$i<=62;$i++) {
	
	if($maparray[$index]['occupied'] > 0 && $maparray[$index]['fieldtype'] >= 0) {
	$targetalliance = $database->getUserField($maparray[$index]['owner'],"alliance",0);
    $tribe = $database->getUserField($maparray[$index]['owner'],"tribe",0);
    $username = $database->getUserField($maparray[$index]['owner'],"username",0);
    $oasisowner = $database->getUserField($maparray[$index]['owner'],"username",0);
    $friendarray = array();
    $enemyarray = array();
    $neutralarray = array();
    }
    
    
switch($maparray[$index]['fieldtype']) {
case 1:
$tt =  "3-3-3-9";
break;
case 2:
$tt =  "3-4-5-6";
break;
case 3:
$tt =  "4-4-4-6";
break;
case 4:
$tt =  "4-5-3-6";
break;
case 5:
$tt =  "5-3-4-6";
break;
case 6:
$tt =  "1-1-1-15";
break;
case 7:
$tt =  "4-4-3-7";
break;
case 8:
$tt =  "3-4-4-7";
break;
case 9:
$tt =  "4-3-4-7";
break;
case 10:
$tt =  "3-5-4-6";
break;
case 11:
$tt =  "4-3-5-6";
break;
case 12:
$tt =  "5-4-3-6";
break;
case 0:
switch($maparray[$index]['oasistype']) {
case 1:
$tt =  "<img class='r1' src='img/x.gif' /> Lumber 25%";
break;
case 2:
$tt =  "<img class='r1' src='img/x.gif' /> Lumber 50%";
break;
case 3:
$tt =  "<img class='r1' src='img/x.gif' /> Lumber 25%<br><img class='r4' src='img/x.gif' /> Crop 25%";
break;
case 4:
$tt =  "<img class='r2' src='img/x.gif' /> Clay 25%";
break;
case 5:
$tt =  "<img class='r2' src='img/x.gif' /> Clay 50%";
break;
case 6:
$tt =  "<img class='r2' src='img/x.gif' /> Clay 25%<br><img class='r4' src='img/x.gif' /> Crop 25%";
break;
case 7:
$tt =  "<img class='r3' src='img/x.gif' /> Iron 25%";
break;
case 8:
$tt =  "<img class='r3' src='img/x.gif' /> Iron 50%";
break;
case 9:
$tt =  "<img class='r3' src='img/x.gif' /> Iron 25%<br><img class='r4' src='img/x.gif' /> Crop 25%";
break;
case 10:
case 11:
$tt =  "<img class='r4' src='img/x.gif' /> Crop 25%";
break;
case 12:
$tt =  "<img class='r4' src='img/x.gif' /> Crop 50%";
break;
}
break;
}

   	$image = ($maparray[$index]['occupied'] == 1 && $maparray[$index]['fieldtype'] > 0)? (($maparray[$index]['owner'] == $session->uid)? ($maparray[$index]['pop']>=100? $maparray[$index]['pop']>= 250?$maparray[$index]['pop']>=500? 'b30-'.$tribe: 'b20-'.$tribe :'b10-'.$tribe : 'b00-'.$tribe) : (($targetalliance != 0)? (in_array($targetalliance,$friendarray)? ($maparray[$index]['pop']>=100? $maparray[$index]['pop']>= 250?$maparray[$index]['pop']>=500? 'b31-'.$tribe: 'b21-'.$tribe :'b11-'.$tribe : 'b01-'.$tribe) : (in_array($targetalliance,$enemyarray)? ($maparray[$index]['pop']>=100? $maparray[$index]['pop']>= 250?$maparray[$index]['pop']>=500? 'b32-'.$tribe: 'b22-'.$tribe :'b12-'.$tribe : 'b02-'.$tribe) : (in_array($targetalliance,$neutralarray)? ($maparray[$index]['pop']>=100? $maparray[$index]['pop']>= 250?$maparray[$index]['pop']>=500? 'b35-'.$tribe: 'b25-'.$tribe :'b15-'.$tribe : 'b05-'.$tribe) : ($targetalliance == $session->alliance? ($maparray[$index]['pop']>=100? $maparray[$index]['pop']>= 250?$maparray[$index]['pop']>=500? 'b33-'.$tribe: 'b23-'.$tribe :'b13-'.$tribe : 'b03-'.$tribe) : ($maparray[$index]['pop']>=100? $maparray[$index]['pop']>= 250?$maparray[$index]['pop']>=500? 'b34-'.$tribe: 'b24-'.$tribe :'b14-'.$tribe : 'b04-'.$tribe))))) : ($maparray[$index]['pop']>=100? $maparray[$index]['pop']>= 250?$maparray[$index]['pop']>=500? 'b34-'.$tribe: 'b24-'.$tribe :'b14-'.$tribe : 'b04-'.$tribe))) : $maparray[$index]['image'];
    
    if($targetalliance!=0) {
    	$allyname = $database->getAllianceName($targetalliance);
    	}
    if($tribe==1) {
    	$tribename = "Roman";
    }elseif($tribe==2) {
    	$tribename = "Teuton";
    }elseif($tribe==3) {
    	$tribename = "Gaul";
    }elseif($tribe==5) {
    	$tribename = "Natar";
        }
    if($maparray[$index]['fieldtype'] > 0){
    $odata = $database->getOMInfo($maparray[$index]['id']);
    $uinfo = $database->getUserField($odata['owner'],'username',0);
	}else{
	$vdata = $database->getMInfo($maparray[$index]['id']);
    $uinfo = $database->getUserField($vdata['owner'],'username',0);
	}
    
    if($maparray[$index]['fieldtype'] > 0 && $maparray[$index]['occupied'] == 1) {
    $targettitle = "<font color='white'><b>Village ".$maparray[$index]['name']."</b></font><br>(".$maparray[$index]['x']."|".$maparray[$index]['y'].")<br>Player: ".$username."<br>Population: ".$maparray[$index]['pop']."<br>Alliance ".$allyname."<br>Tribe: ".$tribename."";
    }
    if($maparray[$index]['oasistype'] == 0 && $maparray[$index]['occupied'] == 0) {
    $targettitle = "<font color='white'><b>Abandoned valley ".$tt."</b></font><br>(".$maparray[$index]['x']."|".$maparray[$index]['y'].")";
    }
    
    if($maparray[$index]['fieldtype'] == 0 && $maparray[$index]['oasistype'] > 0 && $maparray[$index]['occupied'] == 0) {
    $targettitle = "<font color='white'><b>Unoccupied oasis</b></font><br /> (".$maparray[$index]['x']."|".$maparray[$index]['y'].")<br />".$tt."";
    }elseif($maparray[$index]['fieldtype'] == 0 && $maparray[$index]['oasistype'] > 0 && $maparray[$index]['occupied'] > 0) {
    $targettitle = "<font color='white'><b>occupied oasis</b></font><br /> (".$maparray[$index]['x']."|".$maparray[$index]['y'].")<br />".$tt."<br>Player: ".$uinfo."<br>Alliance: ".$allyname."<br>Tribe: ".$tribename."";
    }
    
    
    
    if(!$maparray[$index]['fieldtype'] && $maparray[$index]['oasistype'] && $maparray[$index]['occupied']){
    	$occupied = "-s";
    }else{ $occupied = ""; }
    echo "<a href=\"position_details.php?x=".$maparray[$index]['x']."&y=".$maparray[$index]['y']."\" style=\"cursor:deLumberult;\"><div class=\"tile tile-".$i."-row".$row1." ".$image."".$occupied."\" title=\"".$targettitle."\">";
    if($session->plus) {
    	$wref = $village->wid;
        $toWref = $maparray[$index]['id'];
    	if ($database->checkAttack($wref,$toWref) != 0) {
			echo '<img style="margin-right:45px;" class="att1" src="img/x.gif" />';
		}
    }
    echo "</div></a>\n";
    
	if($i == 8 || $i == 17 || $i == 26 && $row1 <= 5) {
		$row1 += 1;
	}
	$index+=1;

}
?>

<div class="clear"></div>
<div class="ruler x">
	<div class="rulerContainer">
    	<?php
			for($i=0;$i<=8;$i++) {
				echo "<div class=\"coordinate zoom1\">".$xarray[$i]."</div>\n";
			}
		?>
				<div class="clear"></div>
	</div>
</div>
<div class="ruler y">
	<div class="rulerContainer">
    	<?php
			for($i=0;$i<=6;$i++) {
				echo "<div class=\"coordinate zoom1\">".$yarray[$i]."</div>\n";
			}
		?>
</div>
</div>
</div>
		<div class="navigation">
			<a href="karte.php?x=<?php echo $y-1; ?>&y=<?php echo $x; ?>" id="navigationMoveLeft" class="moveLeft"><img src="img/x.gif" title="move left"></a>
            <a href="karte.php?x=<?php echo $y+1; ?>&y=<?php echo $x; ?>" id="navigationMoveRight" class="moveRight"><img src="img/x.gif" title="move right"></a>
			<a href="karte.php?x=<?php echo $y; ?>&y=<?php echo $x+1; ?>" id="navigationMoveUp" class="moveUp"><img src="img/x.gif" title="move up"></a>
			<a href="karte.php?x=<?php echo $y; ?>&y=<?php echo $x-1; ?>" id="navigationMoveDown" class="moveDown"><img src="img/x.gif" title="move down"></a>
            <?php if($session->plus) { ?>
            <a href="karte2.php?x=<?php echo $y ?>&y=<?php echo $x; ?>" id="navigationFullScreen" class="viewFullScreen full"><img src="img/x.gif" alt="view fullscreen" title="view fullscreen"></a>
            <?php } ?>
		</div>
		<form id="mapCoordEnter" name="map_coords" method="post" action="karte.php" class="toolbar ">
	<div class="ml">
		<div class="mr">
			<div class="mc">
				<div class="contents">
			<div class="coordinatesInput">
            <?php
            if(isset($_GET['x']) && isset($_GET['y'])) {
            	$x = $_GET['x'];
                $y = $_GET['y'];
                }else{
                //$x = "0";
                //$y = "0";
                }
            ?>
				<div class="xCoord">
					<label for="xCoordInputMap">X:</label>
                    <input id="mcx" class="text" name="xp" value="" maxlength="4"/>
				</div>
				<div class="yCoord">
					<label for="yCoordInputMap">Y:</label>
					<input id="mcy" class="text" name="yp" value="" maxlength="4"/>
				</div>
			</div>
			<button type="submit" value="OK" class="small"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">OK</div></div></button>					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</form>
</div>
</div>
<script type="text/javascript">
		window.addEvent('domready', function()
	{
		
		Travian.Game.Map.LowRes.Options.DeLumberult.tileDisplayInformation.type = 'dialog';
		new Travian.Game.Map.LowRes.Container($merge(Travian.Game.Map.LowRes.Options.DeLumberult,
		{
			fullScreen:	false,
			mapInitialPosition:
			{
				x:	<?php echo $x; ?>,
				y:	<?php echo $y; ?>			}
		}));
	});
</script></div>