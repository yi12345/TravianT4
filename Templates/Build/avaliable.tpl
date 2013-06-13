<?php
$normalA = $database->getOwnArtefactInfoByType($village->wid,6);  
$largeA = $database->getOwnUniqueArtefactInfo($session->uid,6,2);


$mainbuilding = $building->getTypeLevel(15);
$cranny = $building->getTypeLevel(23);
$granary = $building->getTypeLevel(11);
$warehouse = $building->getTypeLevel(10);
$embassy = $building->getTypeLevel(18);
$wall = $village->resarray['f40'];
$rallypoint = $building->getTypeLevel(16);
$hero = $building->getTypeLevel(37);
$market = $building->getTypeLevel(17);
$barrack = $building->getTypeLevel(19);
$cropland = $building->getTypeLevel(4);
$grainmill = $building->getTypeLevel(8);
$residence = $building->getTypeLevel(25);
$academy = $building->getTypeLevel(22);
$woodcutter = $building->getTypeLevel(1);
$palace = $building->getTypeLevel(26);
$claypit = $building->getTypeLevel(2);
$ironmine = $building->getTypeLevel(3);
$blacksmith = $building->getTypeLevel(12);
$stable = $building->getTypeLevel(20);
$trapper = $building->getTypeLevel(36);
$treasury = $building->getTypeLevel(27);
$sawmill = $building->getTypeLevel(5);
$brickyard = $building->getTypeLevel(6);
$ironfoundry = $building->getTypeLevel(7);
$workshop = $building->getTypeLevel(21);
$stonemasonslodge = $building->getTypeLevel(34);
$townhall = $building->getTypeLevel(24);
$tournamentsquare = $building->getTypeLevel(14);
$bakery = $building->getTypeLevel(9);
$tradeoffice = $building->getTypeLevel(28);
$greatbarracks = $building->getTypeLevel(29);
$greatstable = $building->getTypeLevel(30);
$brewery = $building->getTypeLevel(35);
$horsedrinkingtrough = $building->getTypeLevel(41);
$herosmansion = $building->getTypeLevel(37);
$greatwarehouse = $building->getTypeLevel(38);
$greatgranary = $building->getTypeLevel(39);  
$greatworkshop = $building->getTypeLevel(42);

foreach ($database->getJobs($_SESSION['wid']) as $bdata) {
    $UnderConstruction = strtolower(str_replace(array(" ","'"),"",$building->procResType($bdata['type'])));
    $$UnderConstruction = ($$UnderConstruction == 0 ? -1 : $$UnderConstruction);
}
?>
<h1 class="titleInHeader">Construction of new building</h1>
<div id="build" class="gid0">
<?php
if($mainbuilding == 0 && !$database->getBuildList(15) && $id != 39  && $id != 40) {
    include("avaliable/mainbuilding.tpl");
}
if(($cranny == 0 || $cranny == 9) && !$database->getBuildList(23) && $mainbuilding >= 1 && $id != 39 && $id != 40) {
    include("avaliable/cranny.tpl");
}
if(($granary == 0 || $granary == 20) && !$database->getBuildList(11) && $mainbuilding >= 1 && $id != 39 && $id != 40 ) {
    include("avaliable/granary.tpl");
}
if($wall == 0 && !$database->getBuildList(32)) {
    if($session->tribe == 1 && $id != 39) {
    include("avaliable/citywall.tpl");
    }
    if($session->tribe == 2 && $id != 39) {
    include("avaliable/earthwall.tpl");
    }
    if($session->tribe == 3 && $id != 39) {
    include("avaliable/palisade.tpl");
    }
    if($session->tribe == 4 && $id != 39) {
    include("avaliable/earthwall.tpl");
    }
     if($session->tribe == 5 && $id != 39) {
    include("avaliable/citywall.tpl");
    }
}
if(($warehouse == 0 || $warehouse == 20) && !$database->getBuildList(10) && $id != 39 && $id != 40) {
include("avaliable/warehouse.tpl");
}
if($mainbuilding >= 10 && !$database->getBuildList(38) && $village->capital == 0 && $largeA['owner'] == $session->uid || $normalA['vref'] == $village->wid ) {
    include("avaliable/greatwarehouse.tpl");
}
if($mainbuilding >= 10 && !$database->getBuildList(39) && $village->capital == 0 && $largeA['owner'] == $session->uid || $normalA['vref'] == $village->wid ) {
    include("avaliable/greatgranary.tpl");
}  
if(($trapper ==0 || $trapper == 20) && !$database->getBuildList(36) && $rallypoint >= 1 && $session->tribe == 3 && $id != 39 && $id != 40) {
include("avaliable/trapper.tpl");
}
if($rallypoint == 0 && !$database->getBuildList(16) && $id != 40) {
include("avaliable/rallypoint.tpl");
}
if($embassy == 0 && !$database->getBuildList(18) && $id != 39 && $id != 40) {
include("avaliable/embassy.tpl");
}
if($hero == 0 && !$database->getBuildList(37) && $mainbuilding >= 3 && $rallypoint >= 1 && $id != 39  && $id != 40) {
include("avaliable/hero.tpl");
}
if($rallypoint >= 1 && !$database->getBuildList(19) && $mainbuilding >= 3 && $barrack == 0 && $id != 39 && $id != 40) {
include("avaliable/barracks.tpl");
}
if($cropland >= 5 && !$database->getBuildList(8) && $grainmill == 0 && $id != 39 && $id != 40) {
include("avaliable/grainmill.tpl");
}
if($granary >= 1 && !$database->getBuildList(17) && $warehouse >= 1 && $mainbuilding >= 3 && $market == 0 && $id != 39 && $id != 40) {
include("avaliable/marketplace.tpl");
}
if($mainbuilding >= 5 && !$database->getBuildList(25) && !$database->getBuildList(26) && $residence == 0  && $id != 39 && $id != 40 && $palace == 0) {
include("avaliable/residence.tpl");
}
if($academy == 0 && !$database->getBuildList(22) && $mainbuilding >= 3 && $barrack >= 3 && $id != 39 && $id != 40) {
include("avaliable/academy.tpl");
}
if($palace == 0 && !$database->getBuildList(26) && !$database->getBuildList(25) && $embassy >= 1 && $mainbuilding >= 5 && $id != 39 && $id != 40 && $residence == 0) {

//Fix Castle
//id user
$user = $session->uid;

//connect to DB
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

//loop search village user
$query = mysql_query("SELECT * FROM ".TB_PREFIX."vdata WHERE owner = ".$user."");
while($villaggi_array = mysql_fetch_array($query)){

	//loop structure village
	$query1 = mysql_query("SELECT * FROM ".TB_PREFIX."fdata WHERE vref = ".$villaggi_array['wref']."");
	$strutture= mysql_fetch_array($query1);

//search Castle in array structure village 
$test =	in_array(26,$strutture);
if ($test){	
	break;
	}

}


//if Castle no ready include palace.tpl
if (!$test){
	include("avaliable/palace.tpl");
}

   //end Fix
}
if($blacksmith == 0 && !$database->getBuildList(12) && $academy >= 1 && $mainbuilding >= 3 && $id != 39 && $id != 40) {
include("avaliable/blacksmith.tpl");
}
if($stonemasonslodge == 0 && !$database->getBuildList(34) && $palace >= 3 && $mainbuilding >= 5 && $id != 39 && $id != 40) {
include("avaliable/stonemason.tpl");
}
if($stable == 0 && !$database->getBuildList(20) && $blacksmith >= 3 && $academy >= 5 && $id != 39 && $id != 40) {
include("avaliable/stable.tpl");
}
if($treasury == 0 && !$database->getBuildList(27) && $mainbuilding >= 10  && $id != 39 && $id != 40) {
include("avaliable/treasury.tpl");
}
if($brickyard == 0 && !$database->getBuildList(6) && $claypit >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40 ) {
include("avaliable/brickyard.tpl");
}
if($sawmill == 0 && !$database->getBuildList(5) && $woodcutter >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40) {
   include("avaliable/sawmill.tpl");
  }
if($ironfoundry == 0 && !$database->getBuildList(7) && $ironmine >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40) {
   include("avaliable/ironfoundry.tpl");
}
if($workshop == 0 && !$database->getBuildList(21) && $academy >= 10 && $mainbuilding  >= 5  && $id != 39 && $id != 40) {
   include("avaliable/workshop.tpl");
}
if($tournamentsquare == 0 && !$database->getBuildList(14) && $rallypoint >= 15  && $id != 39 && $id != 40) {
    include("avaliable/tsquare.tpl");
}
if($bakery == 0 && !$database->getBuildList(9) && $grainmill >= 5 && $cropland >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40) {
    include("avaliable/bakery.tpl");
}
if($townhall == 0 && !$database->getBuildList(24) && $mainbuilding >= 10 && $academy >= 10  && $id != 39 && $id != 40) {
    include("avaliable/townhall.tpl");
}
if($tradeoffice == 0 && !$database->getBuildList(28) && $market == 20 && $stable >= 10  && $id != 39 && $id != 40) {
    include("avaliable/tradeoffice.tpl");
}
if($session->tribe == 1 && !$database->getBuildList(41) && $horsedrinkingtrough == 0 && $rallypoint >= 10 && $stable == 20  && $id != 39 && $id != 40) {
    include("avaliable/horsedrinking.tpl");
}
if($session->tribe == 2 && !$database->getBuildList(35) && $brewery == 0 && $rallypoint >= 10 && $granary == 20  && $id != 39 && $id != 40) {
    include("avaliable/brewery.tpl");
}
if($greatbarracks == 0 && !$database->getBuildList(29) && $barrack == 20 && $village->capital == 0 && $id != 39 && $id != 40) {
    include("avaliable/greatbarracks.tpl");
}
if($greatstable == 0 && !$database->getBuildList(30) && $stable == 20 && $village->capital == 0 && $id != 39 && $id != 40) {
    include("avaliable/greatstable.tpl");
}
if($greatworkshop == 0 && !$database->getBuildList(42) && $workshop == 20 && $village->capital == 0 && $id != 39 && $id != 40 && GREAT_WKS) {
    include("avaliable/greatworkshop.tpl");
}
if($id != 39 && $id != 40) {
?>
<div class="switch"><a id="soon_link" class="openedClosedSwitch switchClosed" href="javascript:show_build_list('soon');">View constructions available soon</a></div>
<div id="build_list_soon" class="hide">
<?php
if($rallypoint == 0 && $session->tribe == 3) {
include("soon/trapper.tpl");
}
if($hero == 0 && ($mainbuilding <= 2 || $rallypoint == 0)){
    include("soon/hero.tpl");
}
if($barrack == 0 && ($rallypoint == 0 || $mainbuilding <= 2) ) {
    include("soon/barracks.tpl");
}
if($cropland <= 4) {
   include("soon/grainmill.tpl");
}
if($marketplace == 0 && ($mainbuilding <= 2 || $granary <= 0 || $warehouse <= 0)) {
   include("soon/marketplace.tpl");
}
if($residence == 0 && $mainbuilding <= 2) {
   include("soon/residence.tpl");
}
if($academy == 0 && ($mainbuilding <= 2 || $barrack <= 2)) {
   include("soon/academy.tpl");
}
if($embassy == 0 || $mainbuilding >= 2 && $mainbuilding <= 4) {

//Fix Castle
//id user
$user = $session->uid;

//connect to DB
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

//loop search village user
$query = mysql_query("SELECT * FROM ".TB_PREFIX."vdata WHERE owner = ".$user."");
while($villaggi_array = mysql_fetch_array($query)){

	//loop structure village
	$query1 = mysql_query("SELECT * FROM ".TB_PREFIX."fdata WHERE vref = ".$villaggi_array['wref']."");
	$strutture= mysql_fetch_array($query1);

//search Castle in array structure village 
$test =	in_array(26,$strutture);
if ($test){	
	break;
	}

}


//if Castle no ready include palace.tpl
if (!$test){
	include("soon/palace.tpl");
}

   //end Fix
}
if($blacksmith == 0 && ($academy <= 0 || $mainbuilding <= 2)) {
   include("soon/blacksmith.tpl");
}
if($stonemasonslodge == 0 && $palace <= 2  && $palace != 0 && $mainbuilding >= 2 && $mainbuilding <= 4 && $residence == 0) {
   include("soon/stonemason.tpl");
}
if($stable == 0 && (($blacksmith <= 2 && $blacksmith != 0) || ($academy >= 2 && $academy <= 4))) {
   include("soon/stable.tpl");
}
if($treasury == 0 && $mainbuilding <= 9 && $mainbuilding >= 5) {
   include("soon/treasury.tpl");
}
if($brickyard == 0 && $claypit <= 9  && $claypit >= 5 && $mainbuilding >= 2  && $mainbuilding <= 4) {
   include("soon/brickyard.tpl");
}
if($sawmill == 0 && $woodcutter <= 9 && $woodcutter >= 5 && $mainbuilding >= 2 && $mainbuilding <= 4) {
   include("soon/sawmill.tpl");
}
if($ironfoundry == 0 && $ironmine <= 9 && $ironmine >= 5 && $mainbuilding >= 2 && $mainbuilding <= 4) {
   include("soon/ironfoundry.tpl");
}
if($workshop == 0 && $academy <= 9 && $academy >= 5 && $mainbuilding >= 2 && $mainbuilding <= 4) {
   include("soon/workshop.tpl");
}
if($tournamentsquare == 0 && $rallypoint <= 14 && $rallypoint >= 7) {
    include("soon/tsquare.tpl");
}
if($bakery == 0 && $grainmill <= 4 && $grainmill != 0 && $cropland >= 5 &&  $cropland <= 9 && $mainbuilding >= 2 && $mainbuilding <= 4) {
    include("soon/bakery.tpl");
}
if($townhall == 0 && ($mainbuilding <= 9 && $mainbuilding >= 5) || ($academy >= 5 && $academy <= 9)) {
    include("soon/townhall.tpl");
}
if($tradeoffice == 0 && $market <= 19 && $market >= 10 || $stable >= 5 && $stable <= 9) {
    include("soon/tradeoffice.tpl");
}
if($session->tribe == 1 && $horsedrinkingtrough == 0 && $rallypoint <= 9 && $rallypoint >= 5 || $stable <= 19 && $stable >= 10 && $session->tribe == 1) {
    include("soon/horsedrinking.tpl");
    }
if($brewery == 0 && $rallypoint <= 9 && $rallypoint >= 5 || $granary <= 19 && $granary >= 10 && $session->tribe == 2) {
    include("soon/brewery.tpl");
}
if($village->capital == 0) {
    include("soon/greatwarehouse.tpl");
}
if($village->capital == 0) {
    include("soon/greatgranary.tpl");
} 
if($greatbarracks == 0 && $barrack >= 15 && $village->capital == 0) {
    include("soon/greatbarracks.tpl");
}
if($greatstable == 0 && $stable >= 15 && $village->capital == 0) {
    include("soon/greatstable.tpl");
}
if($greatworkshop == 0 && $workshop >= 15 && $village->capital == 0 && GREAT_WKS) {
    include("soon/greatworkshop.tpl");
}
   ?>
    </div>
<div class="switch"><a id="all_link" class="openedClosedSwitch switchClosed hide" href="#">More</a></div>
    
    <div id="build_list_all" class="hide">
    <?php
    if($academy == 0 && ($mainbuilding == 1 || $barrack == 0)) {
    include("soon/academy.tpl");
    }
    if($palace == 0 && ($embassy == 0 || $mainbuilding <= 2)) {
	//Fix Castle
	//id user
	$user = $session->uid;

	//connect to DB
	mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
	mysql_select_db(SQL_DB);

	//loop search village user
	$query = mysql_query("SELECT * FROM ".TB_PREFIX."vdata WHERE owner = ".$user."");
	while($villaggi_array = mysql_fetch_array($query)){

		//loop structure village
		$query1 = mysql_query("SELECT * FROM ".TB_PREFIX."fdata WHERE vref = ".$villaggi_array['wref']."");
		$strutture= mysql_fetch_array($query1);

	//search Castle in array structure village 
	$test =	in_array(26,$strutture);
	if ($test){	
		break;
		}

	}


	//if Castle no ready include palace.tpl
	if (!$test){
		include("soon/palace.tpl");
	}

	   //end Fix
    }
    if($blacksmith == 0 && ($academy == 0 || $mainbuilding == 1)) {
    include("soon/blacksmith.tpl");
    }
    if($stonemason == 0 && ($palace == 0 || $mainbuilding <= 2) && $residence == 0) {
    include("soon/stonemason.tpl");
    }
    if($stable == 0 && ($blacksmith == 0 || $academy <= 2)) {
    include("soon/stable.tpl");
    }
    if($treasury == 0 && $mainbuilding <= 5) {
    include("soon/treasury.tpl");
    }
    if($brickyard == 0 && ($claypit <= 5 || $mainbuilding <= 2)) {
    include("soon/brickyard.tpl");
    }
    if($sawmill == 0 && ($woodcutter <= 5 || $mainbuilding <= 2)) {
    include("soon/sawmill.tpl");
    }
    if($ironfoundry == 0 && ($ironmine <= 5 || $mainbuilding <= 2)) {
    include("soon/ironfoundry.tpl");
    }
    if($workshop == 0 && ($academy <= 5 || $mainbuilding <= 2)) {
    include("soon/workshop.tpl");
    }
    if($tournamentsquare == 0 && $rallypoint <= 7) {
    include("soon/tsquare.tpl");
    }
    if($bakery == 0 && ($grainmill == 0 || $cropland <= 5 || $mainbuilding <= 2)) {
    include("soon/bakery.tpl");
    }
    if($townhall == 0 && ($mainbuilding <= 5 || $academy <= 5)) {
    include("soon/townhall.tpl");
    }
    if($tradeoffice == 0 && ($market <= 10 || $stable <= 5)) {
    include("soon/tradeoffice.tpl");
    }
    if($session->tribe == 1 && $horsedrinkingtrough == 0 && ($rallypoint <= 5 || $stable <= 10)) {
    include("soon/horsedrinking.tpl");
    }
    if($brewery == 0 && ($rallypoint <= 5 || $granary <= 10) && $session->tribe == 2) {
    include("soon/brewery.tpl");
    }
    if($greatbarracks == 0 && $barrack >= 10 && $village->capital == 0) {
        include("soon/greatbarracks.tpl");
    }
    if($greatstable == 0 && $stable >= 10 && $village->capital == 0) {
        include("soon/greatstable.tpl");
    }
    if($greatworkshop == 0 && $workshop >= 15 && $village->capital == 0 && GREAT_WKS) {
        include("soon/greatworkshop.tpl");
    }
    ?>
    </div>
    <script language="JavaScript" type="text/javascript">
window.addEvent('domready', function()
{
	$each(
	{
		'all_link': 'all',
		'soon_link': 'soon'
	}, function(list, element)
	{
		if ($(element))
		{
			$(element).addEvent('click', function(e)
			{
				e.stop();
				// aktuelle liste, aktueller link
				var build_list = $('build_list_' + list);
				var link = $(list + '_link');

				var all_link = $('all_link');
				var soon_link = $('soon_link');

				var build_list_all = $('build_list_all');
				var build_list_soon = $('build_list_soon');

				Travian.toggleSwitch(build_list, link);
				if (!build_list.hasClass('hide'))
				{
					if (link == soon_link)
					{
						link.innerHTML = 'Hide constructions available soon';
						if (all_link !== null)
						{
							all_link.removeClass('hide');
						}
					}
					else
					{
						link.innerHTML = 'Less';
					}
				}
				else
				{
					if (link == soon_link)
					{
						link.innerHTML = 'View constructions available soon';
						if (all_link !== null)
						{
							all_link.innerHTML = 'More';
							all_link.addClass('hide');
							build_list_all.addClass('hide');
						}
					}
					else
					{
						link.innerHTML = 'More';
					}
				}
			});
		}
	});
});
</script>
<?php 
}
?>
</div>