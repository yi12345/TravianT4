<?php
class Automation {
    
    private $bountyresarray = array();
    private $bountyinfoarray = array();
    private $bountyproduction = array();
    private $bountyocounter = array();
    private $bountyunitall = array();
    private $bountypop;
    private $bountyOresarray = array();
    private $bountyOinfoarray = array();
    private $bountyOproduction = array();
    private $bountyOpop = 1;
    
		public function isWinner() {
		$q = mysql_query("SELECT vref FROM ".TB_PREFIX."fdata WHERE f99 = '100' and f99t = '40'");
		$isThere = mysql_num_rows($q);
		if($isThere > 0)
		{
		header('Location: '.SERVER.'winner.php');
		die();
		}
		}

        public function procResType($ref) {
        global $session;
        switch($ref) {
            case 1: $build = "Woodcutter"; break;
            case 2: $build = "Clay Pit"; break;
            case 3: $build = "Iron Mine"; break;
            case 4: $build = "Cropland"; break;
            case 5: $build = "Sawmill"; break;
            case 6: $build = "Brickyard"; break;
            case 7: $build = "Iron Foundry"; break;
            case 8: $build = "Grain Mill"; break;
            case 9: $build = "Bakery"; break;
            case 10: $build = "Warehouse"; break;
            case 11: $build = "Granary"; break;
            case 12: $build = "Blacksmith"; break;
            case 13: $build = "Armoury"; break;
            case 14: $build = "Tournament Square"; break;
            case 15: $build = "Main Building"; break;
            case 16: $build = "Rally Point"; break;
            case 17: $build = "Marketplace"; break;
            case 18: $build = "Embassy"; break;
            case 19: $build = "Barracks"; break;
            case 20: $build = "Stable"; break;
            case 21: $build = "Workshop"; break;
            case 22: $build = "Academy"; break;
            case 23: $build = "Cranny"; break;
            case 24: $build = "Town Hall"; break;
            case 25: $build = "Residence"; break;
            case 26: $build = "Palace"; break;
            case 27: $build = "Treasury"; break;
            case 28: $build = "Trade Office"; break;
            case 29: $build = "Great Barracks"; break;
            case 30: $build = "Great Stable"; break;
            case 31: $build = "City Wall"; break;
            case 32: $build = "Earth Wall"; break;
            case 33: $build = "Palisade"; break;
            case 34: $build = "Stonemason's Lodge"; break;
            case 35: $build = "Brewery"; break;
            case 36: $build = "Trapper"; break;
            case 37: $build = "Hero's Mansion"; break;
            case 38: $build = "Great Warehouse"; break;
            case 39: $build = "Great Granary"; break;
            case 40: $build = "Wonder of the World"; break;
            case 41: $build = "Horse Drinking Trough"; break;
            case 42: $build = "Great Workshop"; break;
            default: $build = "Nothing had"; break;
        }
        return addslashes($build);
    }

	function recountPop($vid){
	global $database;
		$fdata = $database->getResourceLevel($vid);
		$popTot = 0;

		for ($i = 1; $i <= 40; $i++) {
			$lvl = $fdata["f".$i];
			$building = $fdata["f".$i."t"];
			if($building){
				$popTot += $this->buildingPOP($building,$lvl);
			}
		}
		$this->recountCP($vid);
		$q = "UPDATE ".TB_PREFIX."vdata set pop = $popTot where wref = $vid";
		mysql_query($q);
		$owner = $database->getVillageField($vid,"owner");
		$this->procClimbers($owner);

		return $popTot;

	}

	function recountCP($vid){
	global $database;
		$fdata = $database->getResourceLevel($vid);
		$popTot = 0;

		for ($i = 1; $i <= 40; $i++) {
			$lvl = $fdata["f".$i];
			$building = $fdata["f".$i."t"];
			if($building){
				$popTot += $this->buildingCP($building,$lvl);
			}
		}

		$q = "UPDATE ".TB_PREFIX."vdata set cp = $popTot where wref = $vid";
		mysql_query($q);

		return $popTot;

	}

    function buildingPOP($f,$lvl){
    $name = "bid".$f;
    global $$name;        
        $popT = 0;
        $dataarray = $$name;
    
        for ($i = 0; $i <= $lvl; $i++) {
            $popT += $dataarray[$i]['pop'];
        }
    return $popT;
    }

	function buildingCP($f,$lvl){
	$name = "bid".$f;
	global $$name;
		$popT = 0;
		$dataarray = $$name;

		for ($i = 0; $i <= $lvl; $i++) {
			$popT += $dataarray[$i]['cp'];
		}
	return $popT;
	}

     public function Automation() {
        if(!file_exists("GameEngine/Prevention/cleardeleting.txt") or time()-filemtime("GameEngine/Prevention/cleardeleting.txt")>50) {
            $this->clearDeleting();
        }
		$this->procNewClimbers();
        $this->ClearUser();
        $this->ClearInactive();
		$this->oasisResourcesProduce();
        $this->pruneResource();
		$this->pruneOResource();
		$this->addAdventures();
		$this->checkWWAttacks();
        if(!file_exists("GameEngine/Prevention/loyalty.txt") or time()-filemtime("GameEngine/Prevention/loyalty.txt")>50) {
	        $this->loyaltyRegeneration();
		}
        if(!file_exists("GameEngine/Prevention/updatehero.txt") or time()-filemtime("GameEngine/Prevention/updatehero.txt")>50) {
	        $this->updateHero();
		}
        if(!file_exists("GameEngine/Prevention/celebration.txt") or time()-filemtime("GameEngine/Prevention/celebration.txt")>50) {
	        $this->celebrationComplete();
		}
        if(!file_exists("GameEngine/Prevention/culturepoints.txt") or time()-filemtime("GameEngine/Prevention/culturepoints.txt")>50) {
            $this->culturePoints();
        }
        if(!file_exists("GameEngine/Prevention/research.txt") or time()-filemtime("GameEngine/Prevention/research.txt")>50) {
            $this->researchComplete();
        }
        if(!file_exists("GameEngine/Prevention/starvation.txt") or time()-filemtime("GameEngine/Prevention/starvation.txt")>50) {
	        $this->starvation();
		}
        if(!file_exists("GameEngine/Prevention/build.txt") or time()-filemtime("GameEngine/Prevention/build.txt")>50) {
            $this->buildComplete();
        }
		$this->MasterBuilder();
		if(!file_exists("GameEngine/Prevention/auction.txt") or time()-filemtime("GameEngine/Prevention/auction.txt")>50) {
            $this->auctionComplete();
        }
        if(!file_exists("GameEngine/Prevention/market.txt") or time()-filemtime("GameEngine/Prevention/market.txt")>50) {
            $this->marketComplete();
        }
        if(!file_exists("GameEngine/Prevention/training.txt") or time()-filemtime("GameEngine/Prevention/training.txt")>50) {
            $this->trainingComplete();
        }
        if(!file_exists("GameEngine/Prevention/sendreinfunits.txt") or time()-filemtime("GameEngine/Prevention/sendreinfunits.txt")>50) {
            $this->sendreinfunitsComplete();
        }
        if(!file_exists("GameEngine/Prevention/returnunits.txt") or time()-filemtime("GameEngine/Prevention/returnunits.txt")>50) {
            $this->returnunitsComplete();
        }
        if(!file_exists("GameEngine/Prevention/settlers.txt") or time()-filemtime("GameEngine/Prevention/settlers.txt")>50) {
            $this->sendSettlersComplete();
        } 
		if(!file_exists("GameEngine/Prevention/adventures.txt") or time()-filemtime("GameEngine/Prevention/adventures.txt")>50) {
            $this->sendAdventuresComplete();
        } 
        if(!file_exists("GameEngine/Prevention/demolition.txt") or time()-filemtime("GameEngine/Prevention/demolition.txt")>50) {  
            $this->demolitionComplete();    
        }
        if(!file_exists("GameEngine/Prevention/sendunits.txt") or time()-filemtime("GameEngine/Prevention/sendunits.txt")>50) {
            $this->sendunitsComplete();
        }
		$this->updateStore();
		$this->TradeRoute();
		$this->regenerateOasisTroops();
    }
	
	private function getfieldDistance($coorx1, $coory1, $coorx2, $coory2) {
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
   
   public function getTypeLevel($tid,$vid) {
        global $village,$database;
        $keyholder = array();
       
            $resourcearray = $database->getResourceLevel($vid);
        
        foreach(array_keys($resourcearray,$tid) as $key) {
            if(strpos($key,'t')) {
                $key = preg_replace("/[^0-9]/", '', $key);
                array_push($keyholder, $key);
            }     
        }
        $element = count($keyholder);
        if($element >= 2) {
            if($tid <= 4) {
                $temparray = array();
                for($i=0;$i<=$element-1;$i++) {
                    array_push($temparray,$resourcearray['f'.$keyholder[$i]]);
                }
                foreach ($temparray as $key => $val) {
                    if ($val == max($temparray)) 
                    $target = $key; 
                }
            }
            else {
                $target = 0;
                for($i=1;$i<=$element-1;$i++) {
                    if($resourcearray['f'.$keyholder[$i]] > $resourcearray['f'.$keyholder[$target]]) {
                        $target = $i;
                    }
                }
            }
        }
        else if($element == 1) {
            $target = 0;
        }
        else {
            return 0;
        }
        if($keyholder[$target] != "") {
            return $resourcearray['f'.$keyholder[$target]];
        }
        else {
            return 0;
        }
    }  
	
	
	private function loyaltyRegeneration() {
	if(file_exists("GameEngine/Prevention/loyalty.txt")) {
            unlink("GameEngine/Prevention/loyalty.txt");
        }
        global $database;
        $array = array();
        $q = "SELECT * FROM ".TB_PREFIX."vdata WHERE loyalty < 100";
        $array = $database->query_return($q);
		if(!empty($array)) { 
	        foreach($array as $loyalty) {
                if($this->getTypeLevel(25,$loyalty['wref']) >= 1){
                    $value = $this->getTypeLevel(25,$loyalty['wref']);
                }elseif($this->getTypeLevel(26,$loyalty['wref']) >= 1){
                    $value = $this->getTypeLevel(26,$loyalty['wref']);
                } else {
					$value = 0;
				}
				$newloyalty = min(100,$loyalty['loyalty']+$value*(time()-$loyalty['lastupdate'])*SPEED/(60*60));
                $q = "UPDATE ".TB_PREFIX."vdata SET loyalty = $newloyalty WHERE wref = '".$loyalty['wref']."'";
                $database->query($q);
			}
        }
        $array = array();
        $q = "SELECT * FROM ".TB_PREFIX."odata WHERE loyalty<>100";
        $array = $database->query_return($q);
		if(!empty($array)) { 
	        foreach($array as $loyalty) {
                if($this->getTypeLevel(25,$loyalty['conqured']) >= 1){
                    $value = $this->getTypeLevel(25,$loyalty['conqured']);
                }elseif($this->getTypeLevel(26,$loyalty['conqured']) >= 1){
                    $value = $this->getTypeLevel(26,$loyalty['conqured']);
                } else {
					$value = 0;
				}
				$newloyalty = min(100,$loyalty['loyalty']+$value*(time()-$loyalty['lastupdate'])*SPEED/(60*60));
                $q = "UPDATE ".TB_PREFIX."odata SET loyalty = $newloyalty WHERE wref = '".$loyalty['wref']."'";
                $database->query($q);
			}
        }
		
		$array2 = array();
        $q2 = "SELECT * FROM ".TB_PREFIX."vdata WHERE loyalty>125";
        $array2 = $database->query_return($q2);
		if(!empty($array2)) { 
	        foreach($array2 as $loyalty) {
                $q = "UPDATE ".TB_PREFIX."vdata SET loyalty = 125 WHERE wref = '".$loyalty['wref']."'";
                $database->query($q);
			}
        }
		if(file_exists("GameEngine/Prevention/loyalty.txt")) {
            unlink("GameEngine/Prevention/loyalty.txt");
        }
    }
    
	private function clearDeleting() {
	if(file_exists("GameEngine/Prevention/cleardeleting.txt")) {
			unlink("GameEngine/Prevention/cleardeleting.txt");
		}
		global $database;
		$ourFileHandle = fopen("GameEngine/Prevention/cleardeleting.txt", 'w');
		fclose($ourFileHandle);
		$needDelete = $database->getNeedDelete();
		if(count($needDelete) > 0) {
			foreach($needDelete as $need) {
				$needVillage = $database->getVillagesID($need['uid']);
				foreach($needVillage as $village) {
				$getvillage = $database->getVillage($village);
					$q = "DELETE FROM ".TB_PREFIX."abdata where wref = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."bdata where wid = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."enforcement where from = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."fdata where vref = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."market where vref = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."odata where wref = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."research where vref = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."tdata where vref = ".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."training where vref =".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."units where vref =".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."farmlist where wref =".$village;
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."raidlist where towref = ".$village;
					$database->query($q);
					$getmovement = $database->getMovement(3,$village,1);
					foreach($getmovement as $movedata) {
					$time = time();
					$time2 = $time - $movedata['starttime'];
					$database->addMovement(4,$movedata['to'],$movedata['from'],$movedata['ref'],$time,$time+$time2);
					$database->setMovementProc($movedata['moveid']);
					}
					$q = "DELETE FROM ".TB_PREFIX."movement where from = ".$village;
					$database->query($q);
					$getprisoners = $database->getPrisoners($village);
					foreach($getprisoners as $pris) {
					$troops = 0;
					for($i=1;$i<12;$i++){
					$troops += $pris['t'.$i];
					}
					$database->modifyUnit($pris['wref'],array("99o"),array($troops),array(0));
					$database->deletePrisoners($pris['id']);
					}
					$getprisoners = $database->getPrisoners3($village);
					foreach($getprisoners as $pris) {
					$troops = 0;
					for($i=1;$i<12;$i++){
					$troops += $pris['t'.$i];
					}
					$database->modifyUnit($pris['wref'],array("99o"),array($troops),array(0));
					$database->deletePrisoners($pris['id']);
					}
					$enforcement = $database->getEnforceVillage($village,0);
					foreach($enforcement as $enforce) {
					$time = time();
					$fromcoor = $database->getCoor($enforce['vref']);
					$tocoor = $database->getCoor($enforce['from']);
					$targettribe = $database->getUserField($database->getVillageField($enforce['from'],"owner"),"tribe",0);
					$time2 = $this->procDistanceTime($tocoor,$fromcoor,$targettribe,0);
					$start = 10*($targettribe-1);
					for($i=1;$i<11;$i++){
					$unit = $start + $i;
					$post['t'.$i] = $enforce['u'.$unit];
					}
					$post['t11'] = $enforce['hero'];
					$reference = $database->addAttack($enforce['from'],$post['t1'],$post['t2'],$post['t3'],$post['t4'],$post['t5'],$post['t6'],$post['t7'],$post['t8'],$post['t9'],$post['t10'],$post['t11'],2,0,0,0,0);
					$database->addMovement(4,$enforce['vref'],$enforce['from'],$reference,$time,$time+$time2);
					$q = "DELETE FROM ".TB_PREFIX."enforcement where id = ".$enforce['id'];
					$database->query($q);
					}
					}
					for($i=0;$i<20;$i++){
					$q = "SELECT * FROM ".TB_PREFIX."users where friend".$i." = ".$need['uid']." or friend".$i."wait = ".$need['uid']."";
					$array = $database->query_return($q);
					foreach($array as $friend){
					$database->deleteFriend($friend['id'],"friend".$i);
					$database->deleteFriend($friend['id'],"friend".$i."wait");
					}
					}
					$database->updateUserField($need['uid'], 'alliance', 0, 1);
					if($database->isAllianceOwner($need['uid'])){
					$alliance = $database->getUserAllianceID($need['uid']);
					$newowner = $database->getAllMember2($alliance);
					$newleader = $newowner['id'];
					$q = "UPDATE " . TB_PREFIX . "alidata set leader = ".$newleader." where id = ".$alliance."";
					$database->query($q);
					$database->updateAlliPermissions($newleader, $alliance, "Leader", 1, 1, 1, 1, 1, 1, 1);
					$villages = $database->getVillagesID2($newleader);
					$max = 0;
					foreach($villages as $village){
					$field = $database->getResourceLevel($village['wref']);
					for($i=19;$i<=40;$i++){
					if($field['f'.$i.'t'] == 18){
					$level = $field['f'.$i];
					$attri = $bid18[$level]['attri'];
					}
					}
					if($attri > $max){
					$max = $attri;
					}
					}
					$q = "UPDATE ".TB_PREFIX."alidata set max = $max where leader = $newleader";
					$database->query($q);
					}
					$database->deleteAlliance($alliance);
					$q = "DELETE FROM ".TB_PREFIX."hero where uid = ".$need['uid'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."mdata where target = ".$need['uid']." or owner = ".$need['uid'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."ndata where uid = ".$need['uid'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."users where id = ".$need['uid'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."deleting where uid = ".$need['uid'];
					$database->query($q);
					if($getvillage['capital'] == 0){
					$q = "DELETE FROM ".TB_PREFIX."vdata where wref = ".$village;
					$database->query($q);
					$q = "UPDATE ".TB_PREFIX."wdata set occupied = 0 where id = ".$village;
					$database->query($q);
					}else{
					$q = "UPDATE ".TB_PREFIX."vdata set capital = 0, owner = 2 where id = ".$village;
					$database->query($q);
					$database->addTech($village);
					$database->addABTech($village);
					$database->addUnits($village);
					}
				$q = "DELETE FROM ".TB_PREFIX."mdata where target = ".$need['uid']." or owner = ".$need['uid'];
				$database->query($q);
				$q = "DELETE FROM ".TB_PREFIX."ndata where uid = ".$need['uid'];
				$database->query($q);
				$q = "DELETE FROM ".TB_PREFIX."users where id = ".$need['uid'];
				$database->query($q);
			}
		}
		if(file_exists("GameEngine/Prevention/cleardeleting.txt")) {
			unlink("GameEngine/Prevention/cleardeleting.txt");
		}
	}
    
    private function ClearUser() {
        global $database;
        if(AUTO_DEL_INACTIVE) {
            $time = time()+UN_ACT_TIME;
            $q = "DELETE from ".TB_PREFIX."users where timestamp >= $time and act != ''";
            $database->query($q);
        }
    }
    
    private function ClearInactive() {
        global $database;
        if(TRACK_USR) {
            $timeout = time()-USER_TIMEOUT*60;
              $q = "DELETE FROM ".TB_PREFIX."active WHERE timestamp < $timeout";
             $database->query($q);
        }
    }
    private function pruneOResource() {
        global $database;
		if(!ALLOW_BURST) {
		$q = "SELECT * FROM ".TB_PREFIX."odata WHERE maxstore < 800 OR maxcrop < 800";
        $array = $database->query_return($q);
	    foreach($array as $getoasis) {
		if($getoasis['maxstore'] < 800){
		$maxstore = 800;
		}else{
		$maxstore = $getoasis['maxstore'];
		}
		if($getoasis['maxcrop'] < 800){
		$maxcrop = 800;
		}else{
		$maxcrop = $getoasis['maxcrop'];
		}
		$q = "UPDATE " . TB_PREFIX . "odata set maxstore = $maxstore, maxcrop = $maxcrop where wref = ".$getoasis['wref']."";
		$database->query($q);
		}
		$q = "SELECT * FROM ".TB_PREFIX."odata WHERE wood < 0 OR clay < 0 OR iron < 0 OR crop < 0";
        $array = $database->query_return($q);
	    foreach($array as $getoasis) {
		if($getoasis['wood'] < 0){
		$wood = 0;
		}else{
		$wood = $getoasis['wood'];
		}
		if($getoasis['clay'] < 0){
		$clay = 0;
		}else{
		$clay = $getoasis['clay'];
		}
		if($getoasis['iron'] < 0){
		$iron = 0;
		}else{
		$iron = $getoasis['iron'];
		}
		if($getoasis['crop'] < 0){
		$crop = 0;
		}else{
		$crop = $getoasis['crop'];
		}
		$q = "UPDATE " . TB_PREFIX . "odata set wood = $wood, clay = $clay, iron = $iron, crop = $crop where wref = ".$getoasis['wref']."";
		$database->query($q);
		}
        }
    }
    private function pruneResource() {
        global $database;
		if(!ALLOW_BURST) {
		$q = "SELECT * FROM ".TB_PREFIX."vdata WHERE maxstore < 800 OR maxcrop < 800";
        $array = $database->query_return($q);
	    foreach($array as $getvillage) {
		if($getvillage['maxstore'] < 800){
		$maxstore = 800;
		}else{
		$maxstore = $getvillage['maxstore'];
		}
		if($getvillage['maxcrop'] < 800){
		$maxcrop = 800;
		}else{
		$maxcrop = $getvillage['maxcrop'];
		}
		$q = "UPDATE " . TB_PREFIX . "vdata set maxstore = $maxstore, maxcrop = $maxcrop where wref = ".$getvillage['wref']."";
		$database->query($q);
		}
        $q = "SELECT * FROM ".TB_PREFIX."vdata WHERE wood > maxstore OR clay > maxstore OR iron > maxstore OR crop > maxcrop";
        $array = $database->query_return($q);
	    foreach($array as $getvillage) {
		if($getvillage['wood'] > $getvillage['maxstore']){
		$wood = $getvillage['maxstore'];
		}else{
		$wood = $getvillage['wood'];
		}
		if($getvillage['clay'] > $getvillage['maxstore']){
		$clay = $getvillage['maxstore'];
		}else{
		$clay = $getvillage['clay'];
		}
		if($getvillage['iron'] > $getvillage['maxstore']){
		$iron = $getvillage['maxstore'];
		}else{
		$iron = $getvillage['iron'];
		}
		if($getvillage['crop'] > $getvillage['maxstore']){
		$crop = $getvillage['maxstore'];
		}else{
		$crop = $getvillage['crop'];
		}
		$q = "UPDATE " . TB_PREFIX . "vdata set wood = $wood, clay = $clay, iron = $iron, crop = $crop where wref = ".$getvillage['wref']."";
		$database->query($q);
		}
		$q = "SELECT * FROM ".TB_PREFIX."vdata WHERE wood < 0 OR clay < 0 OR iron < 0 OR crop < 0";
        $array = $database->query_return($q);
	    foreach($array as $getvillage) {
		if($getvillage['wood'] < 0){
		$wood = 0;
		}else{
		$wood = $getvillage['wood'];
		}
		if($getvillage['clay'] < 0){
		$clay = 0;
		}else{
		$clay = $getvillage['clay'];
		}
		if($getvillage['iron'] < 0){
		$iron = 0;
		}else{
		$iron = $getvillage['iron'];
		}
		if($getvillage['crop'] < 0){
		$crop = 0;
		}else{
		$crop = $getvillage['crop'];
		}
		$q = "UPDATE " . TB_PREFIX . "vdata set wood = $wood, clay = $clay, iron = $iron, crop = $crop where wref = ".$getvillage['wref']."";
		$database->query($q);
		}
        }
    }
    
    private function culturePoints() {
	if(file_exists("GameEngine/Prevention/culturepoints.txt")) {
            unlink("GameEngine/Prevention/culturepoints.txt");
        }
        global $database;
        $ourFileHandle = @fopen("GameEngine/Prevention/culturepoints.txt", 'w');
        @fclose($ourFileHandle);
        $time = time()-43200;
        $array = array();
        $q = "SELECT id, lastupdate FROM ".TB_PREFIX."users where lastupdate < $time";
        $array = $database->query_return($q);
        
        foreach($array as $indi) {
            if($indi['lastupdate'] < $time){
                $cp = $database->getVSumField($indi['id'], 'cp');
                $newupdate = time();
                $q = "UPDATE ".TB_PREFIX."users set cp = cp + $cp, lastupdate = $newupdate where id = '".$indi['id']."'";
                $database->query($q);
            }
        }
        if(file_exists("GameEngine/Prevention/culturepoints.txt")) {
            unlink("GameEngine/Prevention/culturepoints.txt");
        }
    }
    
    private function buildComplete() {
	if(file_exists("GameEngine/Prevention/build.txt")) {
            unlink("GameEngine/Prevention/build.txt");
        }
        global $database,$bid18,$bid10,$bid11,$bid38,$bid39;
        $ourFileHandle = @fopen("GameEngine/Prevention/build.txt", 'w');
        @fclose($ourFileHandle);
        $time = time();
        $array = array();
        $q = "SELECT * FROM ".TB_PREFIX."bdata where timestamp < $time and master = 0";
        $array = $database->query_return($q);
        foreach($array as $indi) {
            $q = "UPDATE ".TB_PREFIX."fdata set f".$indi['field']." = ".$indi['level'].", f".$indi['field']."t = ".$indi['type']." where vref = ".$indi['wid'];
            if($database->query($q)) {
                $level = $database->getFieldLevel($indi['wid'],$indi['field']);
                $pop = $this->getPop($indi['type'],($level-1));
                $database->modifyPop($indi['wid'],$pop[0],0);
				$this->procClimbers($database->getVillageField($indi['wid'],'owner'));
                $database->addCP($indi['wid'],$pop[1]);
                if($indi['type'] == 18) {
				$allyleader = $database->getVillageField($indi['wid'],"owner");
				$allyvillages = $database->getVillagesID2($allyleader);
				$allymax = 0;
				foreach($allyvillages as $allyvillage){
				$allyfield = $database->getResourceLevel($allyvillage['wref']);
				for($i=19;$i<=40;$i++){
				if($allyfield['f'.$i.'t'] == 18){
				$allylevel = $allyfield['f'.$i];
				$allyattri = $bid18[$allylevel]['attri'];
				}
				}
				if($allyattri > $allymax){
				$allymax = $allyattri;
				}
				}
				$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
				$database->query($q);
                }

                    if($indi['type'] == 10) {
                      $max=$database->getVillageField($indi['wid'],"maxstore");
                      if($level=='1' && $max==800){ $max-=800; }
                      $max-=$bid10[$level-1]['attri'];      
                      $max+=$bid10[$level]['attri'];  
                      $database->setVillageField($indi['wid'],"maxstore",$max);
                    }
                    
                    if($indi['type'] == 11) {
                      $max=$database->getVillageField($indi['wid'],"maxcrop");
                      if($level=='1' && $max==800){ $max-=800; }
                      $max-=$bid11[$level-1]['attri'];      
                      $max+=$bid11[$level]['attri']; 
                      $database->setVillageField($indi['wid'],"maxcrop",$max);
                    }
                    if($indi['type'] == 38) {
                    $max=$database->getVillageField($indi['wid'],"maxstore");
                    if($level=='1' && $max==800){ $max-=800; }
                    $max-=$bid38[$level-1]['attri'];      
                    $max+=$bid38[$level]['attri'];  
                    $database->setVillageField($indi['wid'],"maxstore",$max);
                    }

                    if($indi['type'] == 39) {
                    $max=$database->getVillageField($indi['wid'],"maxcrop");
                    if($level=='1' && $max==800){ $max-=800; }
                    $max-=$bid39[$level-1]['attri'];      
                    $max+=$bid39[$level]['attri']; 
                    $database->setVillageField($indi['wid'],"maxcrop",$max);
                    }      
          
                $q4 = "UPDATE ".TB_PREFIX."bdata set loopcon = 0 where loopcon = 1 and wid = ".$indi['wid'];
                $database->query($q4);
                $q = "DELETE FROM ".TB_PREFIX."bdata where id = ".$indi['id'];
                $database->query($q);
            }
					// by SlimShady95 aka Manuel Mannhardt < manuel_mannhardt@web.de >
					if($indi['type'] == 40 and ($indi['level'] % 5 == 0 or $indi['level'] > 95) and $indi['level'] != 100){
					$this->startNatarAttack($indi['level'], $indi['wid']);
					}
					if($indi['type'] == 40 && $indi['level'] == 100){ //now can't be more than one winners if ww to level 100 is build by 2 users or more on same time
					mysql_query("TRUNCATE ".TB_PREFIX."bdata");
					}
				if($database->getUserField($database->getVillageField($indi['wid'],"owner"),"tribe",0) != 1){
				$q4 = "UPDATE ".TB_PREFIX."bdata set loopcon = 0 where loopcon = 1 and master = 0 and wid = ".$indi['wid'];
				$database->query($q4);
				}else{
				if($indi['field'] > 18){
				$q4 = "UPDATE ".TB_PREFIX."bdata set loopcon = 0 where loopcon = 1 and master = 0 and wid = ".$indi['wid']." and field > 18";
				$database->query($q4);
				}else{
				$q4 = "UPDATE ".TB_PREFIX."bdata set loopcon = 0 where loopcon = 1 and master = 0 and wid = ".$indi['wid']." and field < 19";
				$database->query($q4);
				}
				}
				$q = "DELETE FROM ".TB_PREFIX."bdata where id = ".$indi['id'];
				$database->query($q);
				$crop = $database->getCropProdstarv($indi['wid']);
				$unitarrays = $this->getAllUnits($indi['wid']);
				$village = $database->getVillage($indi['wid']);
				$upkeep = $village['pop'] + $this->getUpkeep($unitarrays, 0);
				if ($crop < $upkeep){
					// add starv data
					$database->setVillageField($indi['wid'], 'starv', $upkeep);
					$database->setVillageField($indi['wid'], 'starvupdate', $time);
				}
        }
        if(file_exists("GameEngine/Prevention/build.txt")) {
            unlink("GameEngine/Prevention/build.txt");
        }
    }
	
	// by SlimShady95 aka Manuel Mannhardt < manuel_mannhardt@web.de >
	private function startNatarAttack($level, $vid) {
		global $database;

		// bad, but should work :D
		// I took the data from my first ww (first .org world)
		// todo: get the algo from the real travian with the 100 biggest
		// offs and so on
		$troops = array(
			5 => array(
				array(3412, 2814, 4156, 3553, 9, 0),
				array(35, 0, 77, 33, 17, 10)
			),

			10 => array(
				array(4314, 3688, 5265, 4621, 13, 0),
				array(65, 0, 175, 77, 28, 17)
			),

			15 => array(
				array(4645, 4267, 5659, 5272, 15, 0),
				array(99, 0, 305, 134, 40, 25)
			),

			20 => array(
				array(6207, 5881, 7625, 7225, 22, 0),
				array(144, 0, 456, 201, 56, 36)
			),

			25 => array(
				array(6004, 5977, 7400, 7277, 23, 0),
				array(152, 0, 499, 220, 58, 37)
			),

			30 => array(
				array(7073, 7181, 8730, 8713, 27, 0),
				array(183, 0, 607, 268, 69, 45)
			),

			35 => array(
				array(7090, 7320, 8762, 8856, 28, 0),
				array(186, 0, 620, 278, 70, 45)
			),

			40 => array(
				array(7852, 6967, 9606, 8667, 25, 0),
				array(146, 0, 431, 190, 60, 37)
			),

			45 => array(
				array(8480, 8883, 10490, 10719, 35, 0),
				array(223, 0, 750, 331, 83, 54)
			),

			50 => array(
			  array(8522, 9038, 10551, 10883, 35, 0),
			  array(224, 0, 757, 335, 83, 54)
			),

			55 => array(
				array(8931, 8690, 10992, 10624, 32, 0),
				array(219, 0, 707, 312, 84, 54)
			),

			60 => array(
				array(12138, 13013, 15040, 15642, 51, 0),
				array(318, 0, 1079, 477, 118, 76)
			),

			65 => array(
				array(13397, 14619, 16622, 17521, 58, 0),
				array(345, 0, 1182, 522, 127, 83)
			),

			70 => array(
				array(16323, 17665, 20240, 21201, 70, 0),
				array(424, 0, 1447, 640, 157, 102)
			),

			75 => array(
				array(20739, 22796, 25746, 27288, 91, 0),
				array(529, 0, 1816, 803, 194, 127)
			),

			80 => array(
				array(21857, 24180, 27147, 28914, 97, 0),
				array(551, 0, 1898, 839, 202, 132)
			),

			85 => array(
				array(22476, 25007, 27928, 29876, 100, 0),
				array(560, 0, 1933, 855, 205, 134)
			),

			90 => array(
				array(31345, 35053, 38963, 41843, 141, 0),
				array(771, 0, 2668, 1180, 281, 184)
			),

			95 => array(
				array(31720, 35635, 39443, 42506, 144, 0),
				array(771, 0, 2671, 1181, 281, 184)
			),

			96 => array(
				array(32885, 37007, 40897, 44130, 150, 0),
				array(795, 0, 2757, 1219, 289, 190)
			),

			97 => array(
				array(32940, 37099, 40968, 44235, 150, 0),
				array(794, 0, 2755, 1219, 289, 190)
			),

			98 => array(
				array(33521, 37691, 41686, 44953, 152, 0),
				array(812, 0, 2816, 1246, 296, 194)
			),

			99 => array(
				array(36251, 40861, 45089, 48714, 165, 0),
				array(872, 0, 3025, 1338, 317, 208)
			)
		);

		// select the troops^^
		if (isset($troops[$level]))
		{
			$units = $troops[$level];
		}
		else
		{
			return false;
		}

		// get the capital village from the natars
		$query = mysql_query('SELECT `wref` FROM `' . TB_PREFIX . 'vdata` WHERE `owner` = 3 and `capital` = 1 LIMIT 1') or die(mysql_error());
		$row = mysql_fetch_assoc($query);

		// start the attacks
		$endtime = time() + round((60 * 60 * 24) / INCREASE_SPEED);

		// -.-
		mysql_query('INSERT INTO `' . TB_PREFIX . 'ww_attacks` (`vid`, `attack_time`) VALUES (' . $vid . ', ' . $endtime . ')');
		mysql_query('INSERT INTO `' . TB_PREFIX . 'ww_attacks` (`vid`, `attack_time`) VALUES (' . $vid . ', ' . ($endtime + 1) . ')');

		// wave 1
		$ref = $database->addAttack($row['wref'], 0, $units[0][0], $units[0][1], 0, $units[0][2], $units[0][3], $units[0][4], $units[0][5], 0, 0, 0, 3, 0, 0, 0, 0, 20, 20, 0, 20, 20, 20, 20);
		$database->addMovement(3, $row['wref'], $vid, $ref, 0, $endtime);

		// wave 2
		$ref2 = $database->addAttack($row['wref'], 0, $units[1][0], $units[1][1], 0, $units[1][2], $units[1][3], $units[1][4], $units[1][5], 0, 0, 0, 3, 40, 0, 0, 0, 20, 20, 0, 20, 20, 20, 20, array('vid' => $vid, 'endtime' => ($endtime + 1)));
		$database->addMovement(3, $row['wref'], $vid, $ref2, 0, $endtime + 1);
	}
	
	private function checkWWAttacks() {
		$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'ww_attacks` WHERE `attack_time` <= ' . time());
		while ($row = mysql_fetch_assoc($query))
		{
			// fix for destroyed wws
			$query2 = mysql_query('UPDATE `' . TB_PREFIX . 'fdata` SET `f99t` = 40 WHERE `vref` = ' . $row['vid']);

			// delete the attack
			$query3 = mysql_query('DELETE FROM `' . TB_PREFIX . 'ww_attacks` WHERE `vid` = ' . $row['vid'] . ' AND `attack_time` = ' . $row['attack_time']);
		}
	}
    
    private function getPop($tid,$level) {
        $name = "bid".$tid;
        global $$name,$village;
        $dataarray = $$name;
        $pop = $dataarray[($level+1)]['pop'];
        $cp = $dataarray[($level+1)]['cp'];
        return array($pop,$cp);
    }
	
	private function TradeRoute() {
		global $database;
			$time = time();
			$q = "SELECT * FROM ".TB_PREFIX."route where timestamp < $time";
			$dataarray = $database->query_return($q);
			foreach($dataarray as $data) {
			$database->modifyResource($data['from'],$data['wood'],$data['clay'],$data['iron'],$data['crop'],0);
			$targettribe = $database->getUserField($database->getVillageField($data['from'],"owner"),"tribe",0);
			$this->sendResource2($data['wood'],$data['clay'],$data['iron'],$data['crop'],$data['from'],$data['wid'],$targettribe,$data['deliveries']);
			$database->editTradeRoute($data['id'],"timestamp",86400,1);
			}
	}
    
    private function marketComplete() {
	if(file_exists("GameEngine/Prevention/market.txt")) {
            unlink("GameEngine/Prevention/market.txt");
        }
        global $database,$generator;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."send where ".TB_PREFIX."movement.ref = ".TB_PREFIX."send.id and ".TB_PREFIX."movement.proc = 0 and sort_type = 0 and endtime < $time";
        $dataarray = $database->query_return($q);
        foreach($dataarray as $data) {
            
            if($data['wood'] >= $data['clay'] && $data['wood'] >= $data['iron'] && $data['wood'] >= $data['crop']){ $sort_type = "10"; }
            elseif($data['clay'] >= $data['wood'] && $data['clay'] >= $data['iron'] && $data['clay'] >= $data['crop']){ $sort_type = "11"; }
            elseif($data['iron'] >= $data['wood'] && $data['iron'] >= $data['clay'] && $data['iron'] >= $data['crop']){ $sort_type = "12"; }
            elseif($data['crop'] >= $data['wood'] && $data['crop'] >= $data['clay'] && $data['crop'] >= $data['iron']){ $sort_type = "13"; }

            $to = $database->getMInfo($data['to']);
            $from = $database->getMInfo($data['from']);
			$toAlly = $database->getUserField($to['owner'],'alliance',0);
			$fromAlly = $database->getUserField($from['owner'],'alliance',0);
			$database->addNotice($to['owner'],$to['wref'],$toAlly,$sort_type,''.addslashes($from['name']).' sent resources to '.addslashes($to['name']).'',''.$from['wref'].','.$to['wref'].','.$data['wood'].','.$data['clay'].','.$data['iron'].','.$data['crop'].'',$data['endtime']);
			if($from['owner'] != $to['owner']) {
                $database->addNotice($from['owner'],$to['wref'],$fromAlly,$sort_type,''.addslashes($from['name']).' sent resources to '.addslashes($to['name']).'',''.$from['wref'].','.$to['wref'].','.$data['wood'].','.$data['clay'].','.$data['iron'].','.$data['crop'].'',$data['endtime']);
            }
            $database->modifyResource($data['to'],$data['wood'],$data['clay'],$data['iron'],$data['crop'],1);
            $tocoor = $database->getCoor($data['from']);
            $fromcoor = $database->getCoor($data['to']);
            $targettribe = $database->getUserField($database->getVillageField($data['from'],"owner"),"tribe",0);
            $endtime = $this->procDistanceTime($tocoor,$fromcoor,$targettribe,0) + $data['endtime'];
            $database->addMovement(2,$data['to'],$data['from'],$data['merchant'],'0,0,0,0,0',$endtime,$data['send'],$data['wood'],$data['clay'],$data['iron'],$data['crop']);
            $database->setMovementProc($data['moveid']);
        }
        $q1 = "SELECT * FROM ".TB_PREFIX."movement where proc = 0 and sort_type = 2 and endtime < $time";
		$dataarray1 = $database->query_return($q1);
		foreach($dataarray1 as $data1) {
			$database->setMovementProc($data1['moveid']);
			if($data1['send'] > 1){
			$targettribe1 = $database->getUserField($database->getVillageField($data1['to'],"owner"),"tribe",0);
			$send = $data1['send']-1;
			$this->sendResource2($data1['wood'],$data1['clay'],$data1['iron'],$data1['crop'],$data1['to'],$data1['from'],$targettribe1,$send);
			}
		}
		if(file_exists("GameEngine/Prevention/market.txt")) {
            unlink("GameEngine/Prevention/market.txt");
        }
    }
	
	private function sendResource2($wtrans,$ctrans,$itrans,$crtrans,$from,$to,$tribe,$send) {
		global $bid17,$bid28,$database,$generator,$logging;
		$availableWood = $database->getWoodAvailable($from);
		$availableClay = $database->getClayAvailable($from);
		$availableIron = $database->getIronAvailable($from);
		$availableCrop = $database->getCropAvailable($from);
		if($availableWood >= $wtrans AND $availableClay >= $ctrans AND $availableIron >= $itrans AND $availableCrop >= $crtrans){
		$merchant2 = ($this->getTypeLevel(17,$from) > 0)? $this->getTypeLevel(17,$from) : 0;
		$used2 = $database->totalMerchantUsed($from);
		$merchantAvail2 = $merchant2 - $used2;
		$maxcarry2 = ($tribe == 1)? 500 : (($tribe == 2)? 1000 : 750);
		$maxcarry2 *= TRADER_CAPACITY;
		if($this->getTypeLevel(28,$from) != 0) {
			$maxcarry2 *= $bid28[$this->getTypeLevel(28,$from)]['attri'] / 100;
		}
		$resource = array($wtrans,$ctrans,$itrans,$crtrans);
		$reqMerc = ceil((array_sum($resource)-0.1)/$maxcarry2);
		if($merchantAvail2 != 0 && $reqMerc <= $merchantAvail2) {
					$coor = $database->getCoor($to);
					$coor2 = $database->getCoor($from);
				if($database->getVillageState($to)) {
					$timetaken = $generator->procDistanceTime($coor,$coor2,$tribe,0);
					$res = $resource[0]+$resource[1]+$resource[2]+$resource[3];
					if($res!=0){
					$resdata = "".$resource[0].",".$resource[1].",".$resource[2].",".$resource[3]."";
					$reference = $database->sendResource($resource[0],$resource[1],$resource[2],$resource[3],$reqMerc,0);
					$database->modifyResource($from,$resource[0],$resource[1],$resource[2],$resource[3],0);
					$database->addMovement(0,$from,$to,$reference,$resdata,time()+$timetaken,$send);
					}
				}
		}
	}
	}
    
    private function sendunitsComplete() {
	if(file_exists("GameEngine/Prevention/sendunits.txt")) {
                unlink("GameEngine/Prevention/sendunits.txt");
            }
        global $bid23,$database,$battle,$village,$technology,$logging,$session;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."attacks where ".TB_PREFIX."movement.ref = ".TB_PREFIX."attacks.id and ".TB_PREFIX."movement.proc = '0' and ".TB_PREFIX."movement.sort_type = '3' and ".TB_PREFIX."attacks.attack_type != '2' and endtime < $time ORDER BY endtime ASC";
        $dataarray = $database->query_return($q);
        $totalattackdead = 0;
        foreach($dataarray as $data) {
            //set base things
			//$battle->resolveConflict($data);
            $tocoor = $database->getCoor($data['from']);
            $fromcoor = $database->getCoor($data['to']);
            $isoasis = $database->isVillageOases($data['to']);
            $AttackArrivalTime = $data['endtime']; 
            if ($isoasis == 0){
			$AttackerID = $database->getUserField($database->getVillageField($data['from'],"owner"),"id",0);
			$DefenderID = $database->getUserField($database->getVillageField($data['to'],"owner"),"id",0);
            $owntribe = $database->getUserField($database->getVillageField($data['from'],"owner"),"tribe",0);
            $targettribe = $database->getUserField($database->getVillageField($data['to'],"owner"),"tribe",0);
            $ownally = $database->getUserField($database->getVillageField($data['from'],"owner"),"alliance",0);
            $targetally = $database->getUserField($database->getVillageField($data['to'],"owner"),"alliance",0);
            $to = $database->getMInfo($data['to']);
            $from = $database->getMInfo($data['from']);
            $toF = $database->getVillage($data['to']);
            $fromF = $database->getVillage($data['from']);
            
						$DefenderUnit = array();
						$DefenderUnit = $database->getUnit($data['to']);
						$evasion = $database->getUserField($DefenderID,"evasion",0);
						$capital = $database->getVillageField($data['to'],"capital");
						$playerunit = ($targettribe-1)*10;
						$cannotsend = 0;
						$movements = $database->getMovement("34",$data['to'],1);
						for($y=0;$y < count($movements);$y++){
						$returntime = $units[$y]['endtime']-time();
						if($units[$y]['sort_type'] == 4 && $units[$y]['from'] != 0 && $returntime <= 10){
						$cannotsend = 1;
						}
						}
						if($evasion == 1 && $capital == 1 && $cannotsend == 0 && $dataarray[0]['attack_type'] > 2){
						$totaltroops = 0;
						for($i=1;$i<=10;$i++){
						$playerunit += $i;
						$data['u'.$i] = $DefenderUnit['u'.$playerunit];
						$database->modifyUnit($data['to'],array($playerunit),array($DefenderUnit['u'.$playerunit]),array(0));
						$playerunit -= $i;
						$totaltroops += $data['u'.$i];
						}
						$data['u11'] = $DefenderUnit['hero'];
						$totaltroops += $data['u11'];
						if($totaltroops > 0){
						$database->modifyUnit($data['to'],array("hero"),array($DefenderUnit['hero']),array(0));
						$attackid = $database->addAttack($data['to'],$data['u1'],$data['u2'],$data['u3'],$data['u4'],$data['u5'],$data['u6'],$data['u7'],$data['u8'],$data['u9'],$data['u10'],$data['u11'],4,0,0,0,0,0,0,0,0,0,0,0);
						$database->addMovement(4,0,$data['to'],$attackid,'0,0,0,0,0',time()+(180/EVASION_SPEED));
						}
						}
           
                        //get defence units 
                        $Defender = array();    $rom = $ger = $gal = $nat = $natar = 0;
                        $Defender = $database->getUnit($data['to']);
                        $enforcementarray = $database->getEnforceVillage($data['to'],0);
                        if(count($enforcementarray) > 0) {
                            foreach($enforcementarray as $enforce) {
                                for($i=1;$i<=50;$i++) {
                                    $Defender['u'.$i] += $enforce['u'.$i];
                                }
									$DefenderHeroRef += $enforce['hero'];
                            }
                        }
                            for($i=1;$i<=50;$i++){
                            	if(!isset($Defender['u'.$i])){
                                    $Defender['u'.$i] = '0';
                                } else {
                                	if($Defender['u'.$i]=='' or $Defender['u'.$i]<='0'){
                                    	$Defender['u'.$i] = '0';                                 
                                	} else {
                                            if($i<=10){ $rom='1'; } 

                                            else if($i<=20){ $ger='1'; } 
                                            else if($i<=30){ $gal='1'; } 
                                            else if($i<=40){ $nat='1'; } 
                                            else if($i<=50){ $natar='1'; } 
                            		}
                               }
                            }
							if(!isset($Defender['hero'])){
                            	$Defender['hero'] = '0';
                            } else {
                            	if($Defender['hero']=='' or $Defender['hero']<='0'){
                            		$Defender['hero'] = '0';                                 
                            	}
                            }
                                    //get attack units            
                                            $Attacker = array();
                                            $start = ($owntribe-1)*10+1;
                                            $end = ($owntribe*10);
                                            $u = (($owntribe-1)*10);                                                            
                                            $catp =  0;                                
                                            $catapult = array(8,18,28,38,48);
                                            $ram = array(7,17,27,37,47);
                                            $chief = array(9,19,29,39,49);
                                            $spys = array(4,14,23,34,44);
                                        for($i=$start;$i<=$end;$i++) {
                                            $y = $i-$u;
                                            $Attacker['u'.$i] = $dataarray[0]['t'.$y];
                                                //there are catas
                                                if(in_array($i,$catapult)) {
                                                $catp += $Attacker['u'.$i];
                                                $catp_pic = $i;
                                                }
                                                if(in_array($i,$ram)) {
                                                $rams += $Attacker['u'.$i];
                                                $ram_pic = $i;
                                                }
                                                if(in_array($i,$chief)) {
                                                $chiefs += $Attacker['u'.$i];
                                                $chief_pic = $i;
                                                }
                                                if(in_array($i,$spys)) {
                                                $chiefs += $Attacker['u'.$i];
                                                $spy_pic = $i;
                                                }
                                         } 
                        $Attacker['hero'] = $dataarray[0]['t11'];       
                        $hero_pic = "hero";
						$Attacker['id'] = $database->getVillageField($data['from'],"owner");
            			$Defender['id'] = $database->getVillageField($data['to'],"owner");
						$AttackerID = $database->getVillageField($data['from'],"owner");
						$DefenderID = $database->getVillageField($data['to'],"owner");
                                    //need to set these variables.
                                    $def_wall = $database->getFieldLevel($data['to'],40);
                                    $att_tribe = $owntribe;
                                    $def_tribe = $targettribe;
                                    $residence = "0";
                                    $attpop = $fromF['pop'];
                                    $defpop = $toF['pop']; 
                                    for ($i=19; $i<40; $i++){
                                        if ($database->getFieldLevel($data['to'],"".$i."t")=='25' OR $database->getFieldLevel($data['to'],"".$i."t")=='26'){
                                            $residence = $database->getFieldLevel($data['to'],$i);
                                            $i=40;
                                        }
                                    }
                        
                                    //type of attack
                                    if($dataarray[0]['attack_type'] == 1){
                                        $type = 1;
                                        $scout = 1;
                                    }
                                    if($dataarray[0]['attack_type'] == 2){
                                        $type = 2;
                                    }
                                    if($dataarray[0]['attack_type'] == 3){
                                        $type = 3;
                                    }
                                    if($dataarray[0]['attack_type'] == 4){
                                        $type = 4;
                                    }
                                
                                    $def_ab = Array (
                                        "b1" => 0, // Blacksmith level
                                        "b2" => 0, // Blacksmith level
                                        "b3" => 0, // Blacksmith level
                                        "b4" => 0, // Blacksmith level
                                        "b5" => 0, // Blacksmith level
                                        "b6" => 0, // Blacksmith level
                                        "b7" => 0, // Blacksmith level
                                        "b8" => 0); // Blacksmith level
                                    
                                    $att_ab = Array ( 
                                        "a1" => 0, // armoury level
                                        "a2" => 0, // armoury level
                                        "a3" => 0, // armoury level
                                        "a4" => 0, // armoury level
                                        "a5" => 0, // armoury level
                                        "a6" => 0, // armoury level
                                        "a7" => 0, // armoury level
                                        "a8" => 0); // armoury level

                        //rams attack
		if($rams > 0 and $type=='3'){ 
			$basearraywall = $database->getMInfo($data['to']); 
			if($database->getFieldLevel($basearraywall['wref'],40)>'0'){
				for ($w=1; $w<2; $w++){  
					if ($database->getFieldLevel($basearraywall['wref'],40)!='0'){
                        
						$walllevel = $database->getFieldLevel($basearraywall['wref'],40);
                        $wallgid = $database->getFieldLevel($basearraywall['wref'],"40t");
                        $wallid = 40;
                        $w='4';
					} else {
						$w = $w--;
					} 
				}                          
			}else{
				$empty = 1;    
			}
		}
                        
                                    $tblevel = '1';                    
                                    $stonemason = "1";

                            
           /*--------------------------------
            // End Battle part
            --------------------------------*/
            }else{
				$Attacker['id'] = $database->getUserField($database->getVillageField($data['from'],"owner"),"id",0);
				$Defender['id'] = 3;
				$AttackerID = $database->getVillageField($data['from'],"owner");
				$DefenderID = $database->getOasisField($data['to'],"owner");
				$owntribe = $database->getUserField($database->getVillageField($data['from'],"owner"),"tribe",0);
				$targettribe = 4;
				$ownally = $database->getUserField($database->getVillageField($data['from'],"owner"),"alliance",0);
				$targetally = 0;
				$to = $database->getOMInfo($data['to']);
				$from = $database->getMInfo($data['from']);
				$toF = $database->getOasisV($data['to']);
				$fromF = $database->getVillage($data['from']);
				$cageID = $database->getHeroItemID($AttackerID, 9);
				if($cageID != 0){
				$cage = $database->getItemData($cageID);
				}else{
				$cage['type'] = 0;
				}
            
            
                        //get defence units 
                        $Defender = array();    $rom = $ger = $gal = $nat = $natar = 0;
                        $Defender = $database->getUnit($data['to']);
                        $enforcementarray = $database->getEnforceVillage($data['to'],0);
                        if(count($enforcementarray) > 0) {
                            foreach($enforcementarray as $enforce) {
                                for($i=1;$i<=50;$i++) {
                                    $Defender['u'.$i] += $enforce['u'.$i];
                                }
									$DefenderHeroRef += $enforce['hero'];
                            }
                        }
                            for($i=1;$i<=50;$i++){
                                if(!isset($Defender['u'.$i])){
                                    $Defender['u'.$i] = '0';
                                } else {
                                	if($Defender['u'.$i]=='' or $Defender['u'.$i]<='0'){
                                    	$Defender['u'.$i] = '0';                                 
                                	} else {
                                                 if($i<=10){ $rom='1'; } 
                                            else if($i<=20){ $ger='1'; } 
                                            else if($i<=30){ $gal='1'; } 
                                            else if($i<=40){ $nat='1'; } 
                                            else if($i<=50){ $natar='1'; } 
                                	}
                                }
                            }
								if(!isset($Defender['hero'])){
                                    $Defender['hero'] = '0';
                                } else {
                                	if($Defender['hero']=='' or $Defender['hero']<='0'){
                                    	$Defender['hero'] = '0';                                 
                                	}
                                }
                                    //get attack units            
                                            $Attacker = array();
                                            $start = ($owntribe-1)*10+1;
                                            $end = ($owntribe*10);
                                            $u = (($owntribe-1)*10);                                                            
                                            $catp =  0;                                
                                            $catapult = array(8,18,28,38,48);
                                            $ram = array(7,17,27,37,47);
                                            $chief = array(9,19,29,39,49);
                                            $spys = array(4,14,23,34,44);
                                        for($i=$start;$i<=$end;$i++) {
                                            $y = $i-$u;
                                            $Attacker['u'.$i] = $dataarray[0]['t'.$y];
                                                //there are catas
                                                if(in_array($i,$catapult)) {
                                                $catp += $Attacker['u'.$i];
                                                $catp_pic = $i;
                                                }
                                                if(in_array($i,$ram)) {
                                                $rams += $Attacker['u'.$i];
                                                $ram_pic = $i;
                                                }
                                                if(in_array($i,$chief)) {
                                                $chiefs += $Attacker['u'.$i];
                                                $chief_pic = $i;
                                                }
                                                if(in_array($i,$spys)) {
                                                $chiefs += $Attacker['u'.$i];
                                                $spy_pic = $i;
                                                }
                                         }        
                        $Attacker['hero'] = $dataarray[0]['t11'];       
                        $hero_pic = "hero";
						$Attacker['id'] = $database->getUserField($database->getVillageField($data['from'],"owner"),"id",0);
            			$Defender['id'] = $database->getUserField($database->getVillageField($data['to'],"owner"),"id",0);
                                    //need to set these variables.
                                    $def_wall = 1;
                                    $att_tribe = $owntribe;
                                    $def_tribe = $targettribe;
                                    $residence = "0";
                                    $attpop = $fromF['pop'];
                                    $defpop = 100; 
              
                        
                                    //type of attack
                                    if($dataarray[0]['attack_type'] == 1){
                                        $type = 1;
                                        $scout = 1;
                                    }
                                    if($dataarray[0]['attack_type'] == 2){
                                        $type = 2;
                                    }
                                    if($dataarray[0]['attack_type'] == 3){
                                        $type = 3;
                                    }
                                    if($dataarray[0]['attack_type'] == 4){
                                        $type = 4;
                                    }
									
                                    $def_ab = Array (
                                        "b1" => 0, // Blacksmith level
                                        "b2" => 0, // Blacksmith level
                                        "b3" => 0, // Blacksmith level
                                        "b4" => 0, // Blacksmith level
                                        "b5" => 0, // Blacksmith level
                                        "b6" => 0, // Blacksmith level
                                        "b7" => 0, // Blacksmith level
                                        "b8" => 0); // Blacksmith level
                                    
                                    $att_ab = Array ( 
                                        "a1" => 0, // armoury level
                                        "a2" => 0, // armoury level
                                        "a3" => 0, // armoury level
                                        "a4" => 0, // armoury level
                                        "a5" => 0, // armoury level
                                        "a6" => 0, // armoury level
                                        "a7" => 0, // armoury level
                                        "a8" => 0); // armoury level
                                        
                                        $empty='1'; 
                                        $tblevel = '0'; 
                                        $stonemason = "1";
   
        }
		    $hidehero = $database->getHeroData($DefenderID);
			if($hidehero['hide'] == 1){
			$Defender['hero'] = 0;
			}
			if($cage['type'] == 0 || $Attacker['hero'] == 0 || $isoasis == 0){
					if($targettribe == 1){
		$def_spy = $Defender['u4'];
		}elseif($targettribe == 2){
		$def_spy = $Defender['u14'];
		}elseif($targettribe == 3){
		$def_spy = $Defender['u23'];
		}elseif($targettribe == 5){
		$def_spy = $Defender['u54'];
		}
		if(!$scout or $def_spy > 0){
				$traps = $Defender['u99']-$Defender['u99o'];
				for($i=1;$i<=11;$i++){
				$traps1 = $traps;
				if($data['t'.$i] < $traps1){
				$traps1 = $data['t'.$i];
				}
				${traped.$i}=$traps1;
				$traps -= $traps1;
				$database->modifyUnit($data['to'],"99o",$traps1,1);
				}
				for($i=$start;$i<=$end;$i++) {
				$j = $i-$start+1;
				$Attacker['u'.$i] -= ${traped.$j};
				}
				$Attacker['uhero'] -= $traped11;
				$totaltraped_att = $traped1+$traped2+$traped3+$traped4+$traped5+$traped6+$traped7+$traped8+$traped9+$traped10+$traped11;
				if($totaltraped_att > 0){
				$prisoners2 = $database->getPrisoners2($data['to'],$data['from']);
				if(empty($prisoners2)){
				$database->addPrisoners($data['to'],$data['from'],$traped1,$traped2,$traped3,$traped4,$traped5,$traped6,$traped7,$traped8,$traped9,$traped10,$traped11);
				}else{
				$database->updatePrisoners($data['to'],$data['from'],$traped1,$traped2,$traped3,$traped4,$traped5,$traped6,$traped7,$traped8,$traped9,$traped10,$traped11);
				}
				}
		}
            $battlepart = $battle->calculateBattle($Attacker,$Defender,$def_wall,$att_tribe,$def_tribe,$residence,$attpop,$defpop,$type,$def_ab,$att_ab,$tblevel,$stonemason,$walllevel,$AttackerID,$DefenderID);
            //units attack string for battleraport
            $unitssend_att = ''.$data['t1'].','.$data['t2'].','.$data['t3'].','.$data['t4'].','.$data['t5'].','.$data['t6'].','.$data['t7'].','.$data['t8'].','.$data['t9'].','.$data['t10'].','.$data['t11'].'';
			$totalsend_att = ''.$data['t1']+$data['t2']+$data['t3']+$data['t4']+$data['t5']+$data['t6']+$data['t7']+$data['t8']+$data['t9']+$data['t10']+$data['t11'];
            
            //units defence string for battleraport 
                $unitssend_def[1] = ''.$Defender['u1'].','.$Defender['u2'].','.$Defender['u3'].','.$Defender['u4'].','.$Defender['u5'].','.$Defender['u6'].','.$Defender['u7'].','.$Defender['u8'].','.$Defender['u9'].','.$Defender['u10'].','.($Defender['hero']+$DefenderHeroRef).'';
				
                $unitssend_def[2] = ''.$Defender['u11'].','.$Defender['u12'].','.$Defender['u13'].','.$Defender['u14'].','.$Defender['u15'].','.$Defender['u16'].','.$Defender['u17'].','.$Defender['u18'].','.$Defender['u19'].','.$Defender['u20'].','.($Defender['hero']+$DefenderHeroRef).'';
				
                $unitssend_def[3] = ''.$Defender['u21'].','.$Defender['u22'].','.$Defender['u23'].','.$Defender['u24'].','.$Defender['u25'].','.$Defender['u26'].','.$Defender['u27'].','.$Defender['u28'].','.$Defender['u29'].','.$Defender['u30'].','.($Defender['hero']+$DefenderHeroRef).'';
				
                $unitssend_def[4] = ''.$Defender['u31'].','.$Defender['u32'].','.$Defender['u33'].','.$Defender['u34'].','.$Defender['u35'].','.$Defender['u36'].','.$Defender['u37'].','.$Defender['u38'].','.$Defender['u39'].','.$Defender['u40'].','.($Defender['hero']+$DefenderHeroRef).'';
				
                $unitssend_def[5] = ''.$Defender['u41'].','.$Defender['u42'].','.$Defender['u43'].','.$Defender['u44'].','.$Defender['u45'].','.$Defender['u46'].','.$Defender['u47'].','.$Defender['u48'].','.$Defender['u49'].','.$Defender['u50'].','.($Defender['hero']+$DefenderHeroRef).'';
                $unitssend_deff[1] = '?,?,?,?,?,?,?,?,?,?,?,'; 
                $unitssend_deff[2] = '?,?,?,?,?,?,?,?,?,?,?,'; 
                $unitssend_deff[3] = '?,?,?,?,?,?,?,?,?,?,?,'; 
                $unitssend_deff[4] = '?,?,?,?,?,?,?,?,?,?,?,'; 
                $unitssend_deff[5] = '?,?,?,?,?,?,?,?,?,?,?,'; 
            //how many troops died? for battleraport
            if($battlepart['casualties_attacker'][1] == 0) { $dead1 = 0; } else { $dead1 = $battlepart['casualties_attacker'][1]; }
            if($battlepart['casualties_attacker'][2] == 0) { $dead2 = 0; } else { $dead2 = $battlepart['casualties_attacker'][2]; }
            if($battlepart['casualties_attacker'][3] == 0) { $dead3 = 0; } else { $dead3 = $battlepart['casualties_attacker'][3]; }
            if($battlepart['casualties_attacker'][4] == 0) { $dead4 = 0; } else { $dead4 = $battlepart['casualties_attacker'][4]; }
            if($battlepart['casualties_attacker'][5] == 0) { $dead5 = 0; } else { $dead5 = $battlepart['casualties_attacker'][5]; }
            if($battlepart['casualties_attacker'][6] == 0) { $dead6 = 0; } else { $dead6 = $battlepart['casualties_attacker'][6]; }
            if($battlepart['casualties_attacker'][7] == 0) { $dead7 = 0; } else { $dead7 = $battlepart['casualties_attacker'][7]; }
            if($battlepart['casualties_attacker'][8] == 0) { $dead8 = 0; } else { $dead8 = $battlepart['casualties_attacker'][8]; }
            if($battlepart['casualties_attacker'][9] == 0) { $dead9 = 0; } else { $dead9 = $battlepart['casualties_attacker'][9]; }
            if($battlepart['casualties_attacker'][10] == 0) { $dead10 = 0; } else { $dead10 = $battlepart['casualties_attacker'][10]; }
			if($battlepart['casualties_attacker'][11] == 0) { $dead11 = 0; } else { $dead11 = $battlepart['casualties_attacker'][11]; }

            
			//kill own defence
			$q = "SELECT * FROM ".TB_PREFIX."units WHERE vref='".$data['to']."'";
			$unitlist = $database->query_return($q); 
			$start = ($targettribe-1)*10+1;
			$end = ($targettribe*10);
			//FIX
			for($i=$start;$i<=$end;$i++) {
				if($unitlist){
					$dead[$i] += round($battlepart[2] * $unitlist[0]['u'.$i]);
					$database->modifyUnit($data['to'],$i,round($battlepart[2]*$unitlist[0]['u'.$i]),0);
				}
			}
			$dead['hero'] = 0;
			if($unitlist){
				$dead['hero'] += $battlepart['deadherodef'];
				$database->modifyUnit($data['to'],'hero',$battlepart['deadherodef'],0);
			}
			
			
			//kill other defence in village
			if(count($database->getEnforceVillage($data['to'],0)) > 0) {
				foreach($database->getEnforceVillage($data['to'],0) as $enforce) {
                    $life='';    $notlife=''; $wrong='0';
                    $tribe = $database->getUserField($database->getVillageField($enforce['from'],"owner"),"tribe",0);
                    $start = ($tribe-1)*10+1;

                    if($tribe == 1){ $rom='1'; } else if($tribe == 2){ $ger='1'; }else if($tribe == 3){ $gal='1'; }else if($tribe == 4){ $nat='1'; } else { $natar='1'; }
                        for($i=$start;$i<=($start+9);$i++) {
                            if($enforce['u'.$i]>'0'){
                                $database->modifyEnforce($enforce['id'],$i,round($battlepart[2]*$enforce['u'.$i]),0);
                                $dead[$i]+=round($battlepart[2]*$enforce['u'.$i]);
								$checkpoint=round($battlepart[2]*$enforce['u'.$i]);
                                    if($checkpoint!=$enforce['u'.$i]){
                                    $wrong='1';
                                    }
                            } else {
                                $dead[$i]='0';
                            }
                            if($enforce['hero']>'0'){
                                $database->modifyEnforce($enforce['id'],"hero",$battlepart['deadheroref'][$enforce['id']],0);
                                $dead['hero']+=$battlepart['deadheroref'][$enforce['id']];
                                    if($dead['hero']!=$enforce['hero']){
                                    $wrong='1';
                                    }
                            }
                        }
						$notlife= ''.$dead[$start].','.$dead[$start+1].','.$dead[$start+2].','.$dead[$start+3].','.$dead[$start+4].','.$dead[$start+5].','.$dead[$start+6].','.$dead[$start+7].','.$dead[$start+8].','.$dead[$start+9].'';
						$notlife1 = $dead[$start]+$dead[$start+1]+$dead[$start+2]+$dead[$start+3]+$dead[$start+4]+$dead[$start+5]+$dead[$start+6]+$dead[$start+7]+$dead[$start+8]+$dead[$start+9];
						$life= ''.$enforce['u'.$start.''].','.$enforce['u'.($start+1).''].','.$enforce['u'.($start+2).''].','.$enforce['u'.($start+3).''].','.$enforce['u'.($start+4).''].','.$enforce['u'.($start+5).''].','.$enforce['u'.($start+6).''].','.$enforce['u'.($start+7).''].','.$enforce['u'.($start+8).''].','.$enforce['u'.($start+9).''].'';
						$life1 = $enforce['u'.$start.'']+$enforce['u'.($start+1).'']+$enforce['u'.($start+2).'']+$enforce['u'.($start+3).'']+$enforce['u'.($start+4).'']+$enforce['u'.($start+5).'']+$enforce['u'.($start+6).'']+$enforce['u'.($start+7).'']+$enforce['u'.($start+8).'']+$enforce['u'.($start+9).''];
						$lifehero = $enforce['hero'];
						$notlifehero = $dead['hero'];
						$totallife = $enforce['hero']+$life1;
						$totalnotlife = $dead['hero']+$notlife1;
						$totalsend_att = $data['t1']+$data['t2']+$data['t3']+$data['t4']+$data['t5']+$data['t6']+$data['t7']+$data['t8']+$data['t9']+$data['t10']+$data['t11'];
                        $totaldead_att = $dead1+$dead2+$dead3+$dead4+$dead5+$dead6+$dead7+$dead8+$dead9+$dead10+$dead11;
						//NEED TO SEND A RAPPORTAGE!!!
                        $data2 = ''.$database->getVillageField($enforce['from'],"owner").','.$to['wref'].','.addslashes($to['name']).','.$tribe.','.$life.','.$notlife.','.$lifehero.','.$notlifehero.'';
						if($scout){
						if($totaldead_att > 0){
						if($totaldead_att == $totalsend_att){
                        $database->addNotice($database->getVillageField($enforce['from'],"owner"),$from['wref'],$ownally,15,'Reinforcement in '.addslashes($to['name']).' was attacked',$data2,$AttackArrivalTime);
						}else{
						$database->addNotice($database->getVillageField($enforce['from'],"owner"),$from['wref'],$ownally,16,'Reinforcement in '.addslashes($to['name']).' was attacked',$data2,$AttackArrivalTime);
						}
						}
						}else{
						if($totalnotlife == 0){
                        $database->addNotice($database->getVillageField($enforce['from'],"owner"),$from['wref'],$ownally,15,'Reinforcement in '.addslashes($to['name']).' was attacked',$data2,$AttackArrivalTime);
						}else if($totallife > $totalnotlife){
						$database->addNotice($database->getVillageField($enforce['from'],"owner"),$from['wref'],$ownally,16,'Reinforcement in '.addslashes($to['name']).' was attacked',$data2,$AttackArrivalTime);
						}else{
						$database->addNotice($database->getVillageField($enforce['from'],"owner"),$from['wref'],$ownally,17,'Reinforcement in '.addslashes($to['name']).' was attacked',$data2,$AttackArrivalTime);
						}
					//delete reinf sting when its killed all.
					if($wrong=='0'){
						$database->deleteReinf($enforce['id']);
					}
				}
			}
			}
			
			$unitsdead_def[1] = ''.$dead[1].','.$dead[2].','.$dead[3].','.$dead[4].','.$dead[5].','.$dead[6].','.$dead[7].','.$dead[8].','.$dead[9].','.$dead[10].','.$dead['hero'].'';
			$unitsdead_def[2] = ''.$dead['11'].','.$dead['12'].','.$dead['13'].','.$dead['14'].','.$dead['15'].','.$dead['16'].','.$dead['17'].','.$dead['18'].','.$dead['19'].','.$dead['20'].','.$dead['hero'].'';
			$unitsdead_def[3] = ''.$dead['21'].','.$dead['22'].','.$dead['23'].','.$dead['24'].','.$dead['25'].','.$dead['26'].','.$dead['27'].','.$dead['28'].','.$dead['29'].','.$dead['30'].','.$dead['hero'].'';
			$unitsdead_def[4] = ''.$dead['31'].','.$dead['32'].','.$dead['33'].','.$dead['34'].','.$dead['35'].','.$dead['36'].','.$dead['37'].','.$dead['38'].','.$dead['39'].','.$dead['40'].','.$dead['hero'].'';
			$unitsdead_def[5] = ''.$dead['41'].','.$dead['42'].','.$dead['43'].','.$dead['44'].','.$dead['45'].','.$dead['46'].','.$dead['47'].','.$dead['48'].','.$dead['49'].','.$dead['50'].','.$dead['hero'].'';
			
			$unitsdead_deff[1] = '?,?,?,?,?,?,?,?,?,?,?,';
			$unitsdead_deff[2] = '?,?,?,?,?,?,?,?,?,?,?,';
			$unitsdead_deff[3] = '?,?,?,?,?,?,?,?,?,?,?,';
			$unitsdead_deff[4] = '?,?,?,?,?,?,?,?,?,?,?,';
			$unitsdead_deff[5] = '?,?,?,?,?,?,?,?,?,?,?,';
			
			$deadhero = $dead['hero'];

				$totaldead_alldef[1] = $dead['1']+$dead['2']+$dead['3']+$dead['4']+$dead['5']+$dead['6']+$dead['7']+$dead['8']+$dead['9']+$dead['10'];
				$totaldead_alldef[2] = $dead['11']+$dead['12']+$dead['13']+$dead['14']+$dead['15']+$dead['16']+$dead['17']+$dead['18']+$dead['19']+$dead['20'];
				$totaldead_alldef[3] = $dead['21']+$dead['22']+$dead['23']+$dead['24']+$dead['25']+$dead['26']+$dead['27']+$dead['28']+$dead['29']+$dead['30'];
				$totaldead_alldef[4] = $dead['31']+$dead['32']+$dead['33']+$dead['34']+$dead['35']+$dead['36']+$dead['37']+$dead['38']+$dead['39']+$dead['40'];
				$totaldead_alldef[5] = $dead['41']+$dead['42']+$dead['43']+$dead['44']+$dead['45']+$dead['46']+$dead['47']+$dead['48']+$dead['49']+$dead['50'];

				$totaldead_alldef =  $totaldead_alldef[1]+$totaldead_alldef[2]+$totaldead_alldef[3]+$totaldead_alldef[4]+$totaldead_alldef[5]+$deadhero;
				$totalattackdead += $totaldead_alldef;

            // Set units returning from attack 
            $database->modifyAttack($data['ref'],1,$dead1);
            $database->modifyAttack($data['ref'],2,$dead2);
            $database->modifyAttack($data['ref'],3,$dead3);
            $database->modifyAttack($data['ref'],4,$dead4);
            $database->modifyAttack($data['ref'],5,$dead5);
            $database->modifyAttack($data['ref'],6,$dead6);
            $database->modifyAttack($data['ref'],7,$dead7);
            $database->modifyAttack($data['ref'],8,$dead8);
            $database->modifyAttack($data['ref'],9,$dead9);
            $database->modifyAttack($data['ref'],10,$dead10);
			$database->modifyAttack($data['ref'],11,$dead11);
            $unitsdead_att = ''.$dead1.','.$dead2.','.$dead3.','.$dead4.','.$dead5.','.$dead6.','.$dead7.','.$dead8.','.$dead9.','.$dead10.','.$dead11.'';

			$database->modifyAttack($data['ref'],1,$traped1);
			$database->modifyAttack($data['ref'],2,$traped2);
			$database->modifyAttack($data['ref'],3,$traped3);
			$database->modifyAttack($data['ref'],4,$traped4);
			$database->modifyAttack($data['ref'],5,$traped5);
			$database->modifyAttack($data['ref'],6,$traped6);
			$database->modifyAttack($data['ref'],7,$traped7);
			$database->modifyAttack($data['ref'],8,$traped8);
			$database->modifyAttack($data['ref'],9,$traped9);
			$database->modifyAttack($data['ref'],10,$traped10);
			$database->modifyAttack($data['ref'],11,$traped11);
			$unitstraped_att = ''.$traped1.','.$traped2.','.$traped3.','.$traped4.','.$traped5.','.$traped6.','.$traped7.','.$traped8.','.$traped9.','.$traped10.','.$traped11.'';
			if ($herosend_att>0){
				$unitsdead_att_check = $unitsdead_att.','.$dead11;
			}else{
				$unitsdead_att_check = $unitsdead_att;
			}

            
            //top 10 attack and defence update
            $totaldead_att = $dead1+$dead2+$dead3+$dead4+$dead5+$dead6+$dead7+$dead8+$dead9+$dead10+$dead11;
			$totalattackdead += $totaldead_att;
						if($totaldead_att > 0 && $dead11 == 0){
						$smallbandageID = $database->getHeroItemID($AttackerID, 7);
						if($smallbandageID != 0){
						$smallbandage = $database->getItemData($smallbandageID);
						$healmax = floor($totalsend_att/4);
						$totalheal = 0;
						for($i=1;$i<=10;$i++){
						${heal.$i} = 0;
						}
						while($smallbandage['type'] > 0 && $totalheal < $healmax && $totalheal < $totaldead_att){
						for($i=1;$i<=10;$i++){
						if(${heal.$i} < ${dead.$i} && $totalheal < $healmax && $totalheal < $totaldead_att){
						${heal.$i}++;
						$smallbandage['type']--;
						$smallbandage['num']--;
						$totalheal++;
						}
						}
						}
						$database->editHeroType($smallbandageID, $smallbandage['type'], 2);
						$database->editHeroNum2($smallbandageID, $smallbandage['num'], 2);
						if($smallbandage['type'] == 0){
						$database->setHeroInventory($AttackerID,"bag",0);
						$database->editProcItem($smallbandageID, 0);
						}
						if($smallbandage['num'] == 0){
						$q = "DELETE FROM ".TB_PREFIX."heroitems where id = ".$smallbandageID;
						$database->query($q);
						}
						}
						$bandageID = $database->getHeroItemID($AttackerID, 8);
						if($bandageID != 0){
						$bandage = $database->getItemData($bandageID);
						$healmax = floor($totalsend_att/100*33);
						$totalheal = 0;
						for($i=1;$i<=10;$i++){
						${heal.$i} = 0;
						}
						while($bandage['type'] > 0 && $totalheal < $healmax && $totalheal < $totaldead_att){
						for($i=1;$i<=10;$i++){
						if(${heal.$i} < ${dead.$i} && $totalheal < $healmax && $totalheal < $totaldead_att){
						${heal.$i}++;
						$bandage['type']--;
						$bandage['num']--;
						$totalheal++;
						}
						}
						}
						$database->editHeroType($bandageID, $bandage['type'], 2);
						$database->editHeroNum2($bandageID, $bandage['num'], 2);
						if($bandage['type'] == 0){
						$database->setHeroInventory($AttackerID,"bag",0);
						$database->editProcItem($bandageID, 0);
						}
						if($bandage['num'] == 0){
						$q = "DELETE FROM ".TB_PREFIX."heroitems where id = ".$bandageID;
						$database->query($q);
						}
						}
						if($totalheal > 0){

						$speeds = array();
						
						//find slowest unit.
						$tribeunit = ($targettribe-1)*10;
						for($i=1;$i<=10;$i++){
						if(${heal.$i} > 0){
						if($unitarray) { reset($unitarray); }
						$unitarray = $GLOBALS["u".($tribeunit+$i)];
						$speeds[] = $unitarray['speed'];
						}
						}
						$time = $this->procDistanceTime($from['wref'],$to['wref'],min($speeds),1);
						if($time < (86400 / HEAL_SPEED)){
						$time = 86400 / HEAL_SPEED;
						}
						$reference = $database->addAttack($to['wref'],$heal1,$heal2,$heal3,$heal4,$heal5,$heal6,$heal7,$heal8,$heal9,$heal10,0,3,0,0,0,0);
						$datar = "0,0,0,0,0";
						$database->addMovement(4,$from['wref'],$from['wref'],$reference,$datar,($time+time()));
						}
						}
			for($i=1;$i<=50;$i++) {
            	$totalsend_def += $Defender[''.$i.''];
            }
				$totalsend_def += $Defender['hero'];

            for($i=1;$i<=50;$i++) {
            	$totaldead_def += $dead[''.$i.''];
            }
				$totaldead_def += $dead['hero'];

            $database->modifyPoints($toF['owner'],'dpall',$totaldead_att );
            $database->modifyPoints($from['owner'],'apall',$totaldead_def);
            $database->modifyPoints($toF['owner'],'dp',$totaldead_att );
            $database->modifyPoints($from['owner'],'ap',$totaldead_def);
            $database->modifyPointsAlly($targetally,'Adp',$totaldead_att );
            $database->modifyPointsAlly($ownally,'Aap',$totaldead_def);
            $database->modifyPointsAlly($targetally,'dp',$totaldead_att );
            $database->modifyPointsAlly($ownally,'ap',$totaldead_def);
                    
                
            
            if (!$isoasis){  
				// get toatal cranny value:
				$buildarray = $database->getResourceLevel($data['to']);
				$cranny = 0;    
				for($i=19;$i<39;$i++){
					if($buildarray['f'.$i.'t']==23){
						$cranny += $bid23[$buildarray['f'.$i.'']]['attri']*CRANNY_CAPACITY;
					}
				}

            //cranny efficiency
            $atk_bonus = ($owntribe == 2)? (4/5) : 1;
            $def_bonus = ($targettribe == 3)? 2 : 1;
            
            $cranny_eff = ($cranny * $atk_bonus)*$def_bonus;
            
            // work out available resources.
            $this->updateRes($data['to'],$to['owner']);
            $this->pruneResource();
            
            $totclay = $database->getVillageField($data['to'],'clay');
            $totiron = $database->getVillageField($data['to'],'iron');
            $totwood = $database->getVillageField($data['to'],'wood');
            $totcrop = $database->getVillageField($data['to'],'crop');
            }else{
            $cranny_eff = 0;
            
            // work out available resources.
            $this->updateORes($data['to']);
            $this->pruneOResource();
            
            $totclay = $database->getOasisField($data['to'],'clay');
            $totiron = $database->getOasisField($data['to'],'iron');
            $totwood = $database->getOasisField($data['to'],'wood');
            $totcrop = $database->getOasisField($data['to'],'crop');    
            }            
            $avclay = floor($totclay - $cranny_eff);
            $aviron = floor($totiron - $cranny_eff);
            $avwood = floor($totwood - $cranny_eff);
            $avcrop = floor($totcrop - $cranny_eff);
                        
            $avclay = ($avclay < 0)? 0 : $avclay;
            $aviron = ($aviron < 0)? 0 : $aviron;
            $avwood = ($avwood < 0)? 0 : $avwood;
            $avcrop = ($avcrop < 0)? 0 : $avcrop;
            
            
            $avtotal = array($avwood, $avclay, $aviron,  $avcrop);
            
            $av = $avtotal;
            
            // resources (wood,clay,iron,crop)
            $steal = array(0,0,0,0);
            
            //bounty variables
            $btotal = $battlepart['bounty'];
            $bmod = 0;            
            
            
            for($i = 0; $i<5; $i++)
            {
                for($j=0;$j<4;$j++)
                {
                    if(isset($avtotal[$j]))
                    {
                        if($avtotal[$j]<1)
                            unset($avtotal[$j]);
                    }
                }
                if(!$avtotal)
                {
                     // echo 'array empty'; *no resources left to take.
                    break;
                }
                if($btotal <1 && $bmod <1)
                    break;
                if($btotal<1)
                {
                    while($bmod)
                    {
                        //random select
                        $rs = array_rand($avtotal);
                        if(isset($avtotal[$rs]))
                        {
                            $avtotal[$rs] -= 1;
                            $steal[$rs] += 1;
                            $bmod -= 1;
                        }
                    }
                }
                
                // handle unballanced amounts.
                $btotal +=$bmod;
                $bmod = $btotal%count($avtotal);
                $btotal -=$bmod;
                $bsplit = $btotal/count($avtotal);
        
                $max_steal = (min($avtotal) < $bsplit)? min($avtotal): $bsplit;
            
                for($j=0;$j<4;$j++)
                {
                    if(isset($avtotal[$j]))
                    {
                        $avtotal[$j] -= $max_steal;
                        $steal[$j] += $max_steal;
                        $btotal -= $max_steal;
                    }
                }
            }
            
            
            //work out time of return
            $start = ($owntribe-1)*10+1;
            $end = ($owntribe*10);
            
            $unitspeeds = array(6,5,7,16,14,10,4,3,4,5,
                                7,7,6,9,10,9,4,3,4,5,
                                7,6,17,19,16,13,4,3,4,5,
                                7,7,6,9,10,9,4,3,4,5,
                                7,7,6,9,10,9,4,3,4,5);
            
            $speeds = array();
    
            //find slowest unit.
            for($i=1;$i<=11;$i++){
                if ($data['t'.$i] > $battlepart['casualties_attacker'][$i]) {
					if($i == 11){
						if($heroarray) { reset($heroarray); }
						$getVillage = $database->getVillage($data['vref']);
						$heroarray = $database->getHeroData($getVillage['owner']);
                		$speeds[] = $heroarray['speed'];
					}else{
						if($unitarray) { reset($unitarray); }
                		$unitarray = $GLOBALS["u".(($owntribe-1)*10+$i)];
                		$speeds[] = $unitarray['speed'];
					}
                }
            }


// Data for when troops return.
    
                //catapulten kijken :D
            $info_cat = $info_chief = $info_ram = ",";
            
            if ($type=='3'){
                if ($rams!='0'){
                    if (isset($empty)){
                        $info_ram = "".$ram_pic.", There is no wall to destroy.";
                    } else

                      if ($battlepart[8]>$battlepart[7]){
                            $info_ram = "".$ram_pic.", Wall destroyed.";
                            $database->setVillageLevel($data['to'],"f".$wallid."",'0');
                            $database->setVillageLevel($data['to'],"f".$wallid."t",'0');
                            $pop=$this->recountPop($data['to']);

                    }elseif ($battlepart[8]==0){
                    
                        $info_ram = "".$ram_pic.", Wall was not damaged.";
                    }else{
            
                        $demolish=$battlepart[8]/$battlepart[7];
                        $totallvl = round(sqrt(pow(($walllevel+0.5),2)-($battlepart[8]*8)));
                    $info_ram = "".$ram_pic.",Wall damaged from level <b>".$walllevel."</b> to level <b>".$totallvl."</b>.";
                            $database->setVillageLevel($data['to'],"f".$wallid."",$totallvl);

                    }                  
                }
            }
            if ($type=='3')
{
    if ($catp!='0')
    {
        
        if($toF['pop']<=0)
        {
              
                 $info_cat = ",".$catp_pic.", Village already destroyed.";
        }
        else
        {
			$basearray = $data['to']; 
			if ($data['ctar2']==0)
            {                               
                $bdo2=mysql_query("select * from " . TB_PREFIX . "fdata where vref = $basearray");
                $bdo=mysql_fetch_array($bdo2);
                
                $rand=$data['ctar1'];
                
                if ($rand != 0)
                {
					$_rand=array();
                    $__rand=array();
                    $j=0;
                    for ($i=1;$i<=41;$i++)
                    {
                        if ($i==41) $i=99;
                        if ($bdo['f'.$i.'t']==$rand && $bdo['f'.$i]>0) 
                        {
                            $j++;
                            $_rand[$j]=$bdo['f'.$i];    
                            $__rand[$j]=$i;             
                        }
                    }
                    if (count($_rand)>0)
                    {
                        if (max($_rand)<=0) $rand=0;
                        else
                        {
                            $rand=rand(1, $j);
                            $rand=$__rand[$rand];
                        }  
                    }                                
                    else
                    {
                        $rand=0;
                    }                                 
                }
                
                if ($rand == 0)
                {
                    $list=array();
                    $j=1;
                    for ($i=1;$i<=41;$i++)
                    {
                        if ($i==41) $i=99;
                        if ($bdo['f'.$i] > 0)
                        {
                            $list[$j]=$i;
                            $j++;
                        }
                    }
                    $rand=rand(1, $j);
                    $rand=$list[$rand];
                }
				
				$tblevel = $bdo['f'.$rand];
                $tbgid = $bdo['f'.$rand.'t'];
                $tbid = $rand; 
				if($bid34[$stonemason] == 0){
				$needed_cata = round((($battlepart[5] * (pow($tblevel,2) + $tblevel + 1)) / (8 * (round(200 * pow(1.0205,$battlepart[6]))/200))) + 0.5);
				}else{
                $needed_cata = round((($battlepart[5] * (pow($tblevel,2) + $tblevel + 1)) / (8 * (round(200 * pow(1.0205,$battlepart[6]))/200) / (1 * $bid34[$stonemason]['attri']/100))) + 0.5);
				}
                if ($battlepart[4]>$needed_cata)
                {
                        $info_cat = "".$tbgid.", ".$this->procResType($tbgid)." destroyed.";
						
				$database->setVillageLevel($data['to'],"f".$tbid."",'0');
                    if($tbid>=19) { $database->setVillageLevel($data['to'],"f".$tbid."t",'0'); }
                    $buildarray = $GLOBALS["bid".$tbgid];
                    if ($tbgid==10 || $tbgid==38) {
                        $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                        $t_sql=mysql_fetch_array($tsql);
                        $tmaxstore=$t_sql['maxstore']-$buildarray[$tblevel]['attri'];
                        if ($tmaxstore<800) $tmaxstore=800;
                        $q = "UPDATE ".TB_PREFIX."vdata SET `maxstore`='".$tmaxstore."' WHERE wref=".$data['to'];
                        $database->query($q);
                    }
                       if ($tbgid==11 || $tbgid==39) {                    
                        $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                        $t_sql=mysql_fetch_array($tsql);
                        $tmaxcrop=$t_sql['maxcrop']-$buildarray[$tblevel]['attri'];
                        if ($tmaxcrop<800) $tmaxcrop=800;
                        $q = "UPDATE ".TB_PREFIX."vdata SET `maxcrop`='".$tmaxcrop."' WHERE wref=".$data['to'];
                        $database->query($q);
                    }
					if($tbgid==18) {
						$allyleader = $database->getVillageField($data['to'],"owner");
						$allyvillages = $database->getVillagesID2($allyleader);
						$allymax = 0;
						foreach($allyvillages as $allyvillage){
						$allyfield = $database->getResourceLevel($allyvillage['wref']);
						for($i=19;$i<=40;$i++){
						if($allyfield['f'.$i.'t'] == 18){
						$allylevel = $allyfield['f'.$i];
						$allyattri = $bid18[$allylevel]['attri'];
						}
						}
						if($allyattri > $allymax){
						$allymax = $allyattri;
						}
						}
						$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
						$database->query($q);
					}
                    $pop=$this->recountPop($data['to']);
					if($pop=='0')
                    { 
                        $varray = $database->getProfileVillages($to['owner']);
                        if(count($varray)!='1' AND $to['capital']!='1'){
                                $q = "DELETE FROM ".TB_PREFIX."abdata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."bdata where wid = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."enforcement where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."fdata where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."market where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."movement where to = ".$data['to']." or from = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."odata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."research where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."tdata where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."training where vref =".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."units where vref =".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."vdata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "UPDATE ".TB_PREFIX."wdata set occupied = 0 where id = ".$data['to'];
                                $database->query($q);
                                $logging->VillageDestroyCatalog($data['to']);
                        }
                    }
                }
                elseif ($battlepart[4]==0)
                {    
					$info_cat = "".$tbgid.",".$this->procResType($tbgid)." was not damaged.";
					}
                else
                {   
					$demolish=$battlepart[4]/$needed_cata;
                    $totallvl = round(sqrt(pow(($tblevel+0.5),2)-($battlepart[4]*8)));
                    if ($tblevel==$totallvl) 
                        $info_cata=" was not damaged.";
                    else
                    {
					
					
					
                               
            
                    $info_cata=" damaged from level <b>".$tblevel."</b> to level <b>".$totallvl."</b>.";
                  $buildarray = $GLOBALS["bid".$tbgid];
                        if ($tbgid==10 || $tbgid==38) {
                            $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                            $t_sql=mysql_fetch_array($tsql);
                            $tmaxstore=$t_sql['maxstore']+$buildarray[$totallvl]['attri']-$buildarray[$tblevel]['attri'];
                            if ($tmaxstore<800) $tmaxstore=800;
                            $q = "UPDATE ".TB_PREFIX."vdata SET `maxstore`='".$tmaxstore."' WHERE wref=".$data['to'];
                            $database->query($q);
                        }
                        if ($tbgid==11 || $tbgid==39) {                    
                            $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                            $t_sql=mysql_fetch_array($tsql);
                            $tmaxcrop=$t_sql['maxcrop']+$buildarray[$totallvl]['attri']-$buildarray[$tblevel]['attri'];
                            if ($tmaxcrop<800) $tmaxcrop=800;
                            $q = "UPDATE ".TB_PREFIX."vdata SET `maxcrop`='".$tmaxcrop."' WHERE wref=".$data['to'];
                            $database->query($q);
                        }       
						if($tbgid==18) {
							$allyleader = $database->getVillageField($data['to'],"owner");
							$allyvillages = $database->getVillagesID2($allyleader);
							$allymax = 0;
							foreach($allyvillages as $allyvillage){
							$allyfield = $database->getResourceLevel($allyvillage['wref']);
							for($i=19;$i<=40;$i++){
							if($allyfield['f'.$i.'t'] == 18){
							$allylevel = $allyfield['f'.$i];
							$allyattri = $bid18[$allylevel]['attri'];
							}
							}
							if($allyattri > $allymax){
							$allymax = $allyattri;
							}
							}
							$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
							$database->query($q);
						}
                        $pop=$this->recountPop($data['to']);
                    }
                    $info_cat = "".$tbgid.",".$this->procResType($tbgid).$info_cata;
                    $database->setVillageLevel($data['to'],"f".$tbid."",$totallvl);
                }
            }
			else
            {
                $bdo2=mysql_query("select * from " . TB_PREFIX . "fdata where vref = $basearray");
                $bdo=mysql_fetch_array($bdo2);
                $rand=$data['ctar1'];
                if ($rand != 0)
                {
                    $_rand=array();
                    $__rand=array();
                    $j=0;
                    for ($i=1;$i<=41;$i++)
                    {
                        if ($i==41) $i=99;
                        if ($bdo['f'.$i.'t']==$rand && $bdo['f'.$i]>0)
                        {
                            $j++;
                            $_rand[$j]=$bdo['f'.$i];  
                            $__rand[$j]=$i;           
                        }
                    }
                    if (count($_rand)>0)
                    {
                        if (max($_rand)<=0) $rand=0;
                        else
                        {
                            $rand=rand(1, $j);
                            $rand=$__rand[$rand];
                        }  
                    }                                
                    else
                    {
                        $rand=0;
                    }                                 
                }
                
                if ($rand == 0)
                {
                    $list=array();
                    $j=0;
                    for ($i=1;$i<=41;$i++)
                    {
                        if ($i==41) $i=99;
                        if ($bdo['f'.$i] > 0)
                        {
                            $j++;
                            $list[$j]=$i;
                        }
                    }
                    $rand=rand(1, $j);
                    $rand=$list[$rand];
                }
				$tblevel = $bdo['f'.$rand];
                $tbgid = $bdo['f'.$rand.'t'];
                $tbid = $rand; 
				if($bid34[$stonemason] == 0){
				$needed_cata = round((($battlepart[5] * (pow($tblevel,2) + $tblevel + 1)) / (8 * (round(200 * pow(1.0205,$battlepart[6]))/200))) + 0.5);
				}else{
                $needed_cata = round((($battlepart[5] * (pow($tblevel,2) + $tblevel + 1)) / (8 * (round(200 * pow(1.0205,$battlepart[6]))/200) / (1 * $bid34[$stonemason]['attri']/100))) + 0.5);
				}
                if (($battlepart[4]/2)>$needed_cata)
                {
					$info_cat = "".$catp_pic.", ".$this->procResType($tbgid)." destroyed.";
                    $database->setVillageLevel($data['to'],"f".$tbid."",'0');
                    if($tbid>=19) { $database->setVillageLevel($data['to'],"f".$tbid."t",'0'); }
                    $buildarray = $GLOBALS["bid".$tbgid];
                    if ($tbgid==10 || $tbgid==38) {
                        $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                        $t_sql=mysql_fetch_array($tsql);
                        $tmaxstore=$t_sql['maxstore']-$buildarray[$tblevel]['attri'];
                        if ($tmaxstore<800) $tmaxstore=800;
                        $q = "UPDATE ".TB_PREFIX."vdata SET `maxstore`='".$tmaxstore."' WHERE wref=".$data['to'];
                        $database->query($q);
                    }
                    if ($tbgid==11 || $tbgid==39) {                    
                        $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                        $t_sql=mysql_fetch_array($tsql);
                        $tmaxcrop=$t_sql['maxcrop']-$buildarray[$tblevel]['attri'];
                        if ($tmaxcrop<800) $tmaxcrop=800;
                        $q = "UPDATE ".TB_PREFIX."vdata SET `maxcrop`='".$tmaxcrop."' WHERE wref=".$data['to'];
                        $database->query($q);
                    }                                    
					if($tbgid==18) {
						$allyleader = $database->getVillageField($data['to'],"owner");
						$allyvillages = $database->getVillagesID2($allyleader);
						$allymax = 0;
						foreach($allyvillages as $allyvillage){
						$allyfield = $database->getResourceLevel($allyvillage['wref']);
						for($i=19;$i<=40;$i++){
						if($allyfield['f'.$i.'t'] == 18){
						$allylevel = $allyfield['f'.$i];
						$allyattri = $bid18[$allylevel]['attri'];
						}
						}
						if($allyattri > $allymax){
						$allymax = $allyattri;
						}
						}
						$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
						$database->query($q);
					}
                    $pop=$this->recountPop($data['to']);
                    if($pop=='0')
                    { 
                        $varray = $database->getProfileVillages($to['owner']);
                        if(count($varray)!='1' AND $to['capital']!='1'){
                                $q = "DELETE FROM ".TB_PREFIX."abdata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."bdata where wid = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."enforcement where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."fdata where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."market where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."movement where to = ".$data['to']." or from = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."odata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."research where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."tdata where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."training where vref =".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."units where vref =".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."vdata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "UPDATE ".TB_PREFIX."wdata set occupied = 0 where id = ".$data['to'];
                                $database->query($q);
                                $logging->VillageDestroyCatalog($data['to']);
                        }
                    }
                }
                elseif ($battlepart[4]==0)
                {                        
                    $info_cat = "".$catp_pic.",".$this->procResType($tbgid)." was not damaged.";
                }
                else
                {                
                    $demolish=($battlepart[4]/2)/$needed_cata;
                    $totallvl = round(sqrt(pow(($tblevel+0.5),2)-(($battlepart[4]/2)*8)));
                    if ($tblevel==$totallvl) 
                        $info_cata=" was not damaged.";
                    else
                    {
                        $info_cata=" damaged from level <b>".$tblevel."</b> to level <b>".$totallvl."</b>.";
                        $buildarray = $GLOBALS["bid".$tbgid];
                        if ($tbgid==10 || $tbgid==38) {
                            $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                            $t_sql=mysql_fetch_array($tsql);
                            $tmaxstore=$t_sql['maxstore']+$buildarray[$totallvl]['attri']-$buildarray[$tblevel]['attri'];
                            if ($tmaxstore<800) $tmaxstore=800;
                            $q = "UPDATE ".TB_PREFIX."vdata SET `maxstore`='".$tmaxstore."' WHERE wref=".$data['to'];
                            $database->query($q);
                        }
                        if ($tbgid==11 || $tbgid==39) {                    
                            $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                            $t_sql=mysql_fetch_array($tsql);
                            $tmaxcrop=$t_sql['maxcrop']+$buildarray[$totallvl]['attri']-$buildarray[$tblevel]['attri'];
                            if ($tmaxcrop<800) $tmaxcrop=800;
                            $q = "UPDATE ".TB_PREFIX."vdata SET `maxcrop`='".$tmaxcrop."' WHERE wref=".$data['to'];
                            $database->query($q);
                        }
						if($tbgid==18) {
							$allyleader = $database->getVillageField($data['to'],"owner");
							$allyvillages = $database->getVillagesID2($allyleader);
							$allymax = 0;
							foreach($allyvillages as $allyvillage){
							$allyfield = $database->getResourceLevel($allyvillage['wref']);
							for($i=19;$i<=40;$i++){
							if($allyfield['f'.$i.'t'] == 18){
							$allylevel = $allyfield['f'.$i];
							$allyattri = $bid18[$allylevel]['attri'];
							}
							}
							if($allyattri > $allymax){
							$allymax = $allyattri;
							}
							}
							$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
							$database->query($q);
						}
                        $pop=$this->recountPop($data['to']);
                    }
                    $info_cat = "".$tbgid.",".$this->procResType($tbgid).$info_cata;
                    $database->setVillageLevel($data['to'],"f".$tbid."",$totallvl);
                }
				$bdo2=mysql_query("select * from " . TB_PREFIX . "fdata where vref = $basearray");
                $bdo=mysql_fetch_array($bdo2);
                $rand=$data['ctar2'];
                if ($rand != 99)
                {
                    $_rand=array();
                    $__rand=array();
                    $j=0;
                    for ($i=1;$i<=41;$i++)
                    {
                        if ($i==41) $i=99;
                        if ($bdo['f'.$i.'t']==$rand && $bdo['f'.$i]>0) 
                        {
                            $j++;
                            $_rand[$j]=$bdo['f'.$i];   
                            $__rand[$j]=$i;             
                        }
                    }
                    if (count($_rand)>0)
                    {
                        if (max($_rand)<=0) $rand=99;
                        else
                        {
                            $rand=rand(1, $j);
                            $rand=$__rand[$rand];
                        }  
                    }                                
                    else
                    {
                        $rand=99;
                    }                                 
                }
                
                if ($rand == 99)
                {
                    $list=array();
                    $j=0;
                    for ($i=1;$i<=41;$i++)
                    {
                        if ($i==41) $i=99;
                        if ($bdo['f'.$i] > 0)
                        {
                            $j++;
                            $list[$j]=$i;
                        }
                    }
                    $rand=rand(1, $j);
                    $rand=$list[$rand];
                }
                                            
                $tblevel = $bdo['f'.$rand];
                $tbgid = $bdo['f'.$rand.'t'];
                $tbid = $rand; 
				if($bid34[$stonemason] == 0){
				$needed_cata = round((($battlepart[5] * (pow($tblevel,2) + $tblevel + 1)) / (8 * (round(200 * pow(1.0205,$battlepart[6]))/200))) + 0.5);
				}else{
                $needed_cata = round((($battlepart[5] * (pow($tblevel,2) + $tblevel + 1)) / (8 * (round(200 * pow(1.0205,$battlepart[6]))/200) / (1 * $bid34[$stonemason]['attri']/100))) + 0.5);
				}
                if (($battlepart[4]/2)>$needed_cata)
                {
					$info_cat .= "<br><tbody class=\"goods\"><tr><th>Info</th><td colspan=\"11\">
                    <img class=\"unit u".$tbgid."\" src=\"img/x.gif\" alt=\"catapult\" title=\"catapult\" /> ".$this->procResType($tbgid)." <b>Destroyed</b>.</td></tr></tbody>";
                    $database->setVillageLevel($data['to'],"f".$tbid."",'0');
                    if($tbid>=19) { $database->setVillageLevel($data['to'],"f".$tbid."t",'0'); }
                    $buildarray = $GLOBALS["bid".$tbgid];
                    if ($tbgid==10 || $tbgid==38) {

                        $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                        $t_sql=mysql_fetch_array($tsql);
                        $tmaxstore=$t_sql['maxstore']-$buildarray[$tblevel]['attri'];
                        if ($tmaxstore<800) $tmaxstore=800;
                        $q = "UPDATE ".TB_PREFIX."vdata SET `maxstore`='".$tmaxstore."' WHERE wref=".$data['to'];
                        $database->query($q);
                    }
                    if ($tbgid==11 || $tbgid==39) {                    
                        $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                        $t_sql=mysql_fetch_array($tsql);
                        $tmaxcrop=$t_sql['maxcrop']-$buildarray[$tblevel]['attri'];
                        if ($tmaxcrop<800) $tmaxcrop=800;
                        $q = "UPDATE ".TB_PREFIX."vdata SET `maxcrop`='".$tmaxcrop."' WHERE wref=".$data['to'];
                        $database->query($q);
                    }                                  
					if($tbgid==18) {
						$allyleader = $database->getVillageField($data['to'],"owner");
						$allyvillages = $database->getVillagesID2($allyleader);
						$allymax = 0;
						foreach($allyvillages as $allyvillage){
						$allyfield = $database->getResourceLevel($allyvillage['wref']);
						for($i=19;$i<=40;$i++){
						if($allyfield['f'.$i.'t'] == 18){
						$allylevel = $allyfield['f'.$i];
						$allyattri = $bid18[$allylevel]['attri'];
						}
						}
						if($allyattri > $allymax){
						$allymax = $allyattri;
						}
						}
						$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
						$database->query($q);
					}
                    $pop=$this->recountPop($data['to']);
                    if($pop=='0')
                    { 
                        $varray = $database->getProfileVillages($to['owner']);
                        if(count($varray)!='1' AND $to['capital']!='1'){
                                $q = "DELETE FROM ".TB_PREFIX."abdata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."bdata where wid = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."enforcement where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."fdata where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."market where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."movement where to = ".$data['to']." or from = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."odata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."research where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."tdata where vref = ".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."training where vref =".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."units where vref =".$data['to'];
                                $database->query($q);
                                $q = "DELETE FROM ".TB_PREFIX."vdata where wref = ".$data['to'];
                                $database->query($q);
                                $q = "UPDATE ".TB_PREFIX."wdata set occupied = 0 where id = ".$data['to'];
                                $database->query($q);
                                $logging->VillageDestroyCatalog($data['to']);
                        }
                    }
                }
                elseif ($battlepart[4]==0){                        
                    $info_cat .= "<br><tbody class=\"goods\"><tr><th>اطلاعات</th><td colspan=\"11\">
                    <img class=\"unit u".$tbgid."\" src=\"img/x.gif\" alt=\"منجنیق\" title=\"منجنیق\" /> به ".$this->procResType($tbgid)." آسیبی نرسید.</td></tr></tbody>";
                }else{                
                    $demolish=($battlepart[4]/2)/$needed_cata;
                    $totallvl = round(sqrt(pow(($tblevel+0.5),2)-(($battlepart[4]/2)*8)));
                    if ($tblevel==$totallvl){
                        $info_cata=" was not damaged.";
					}else{
$info_cata=" damaged from level <b>".$tblevel."</b> to level <b>".$totallvl."</b>.";
                        $buildarray = $GLOBALS["bid".$tbgid];
                        if ($tbgid==10 || $tbgid==38) {
                            $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                            $t_sql=mysql_fetch_array($tsql);
                            $tmaxstore=$t_sql['maxstore']+$buildarray[$totallvl]['attri']-$buildarray[$tblevel]['attri'];
                            if ($tmaxstore<800) $tmaxstore=800;
                            $q = "UPDATE ".TB_PREFIX."vdata SET `maxstore`='".$tmaxstore."' WHERE wref=".$data['to'];
                            $database->query($q);
                        }
                        if ($tbgid==11 || $tbgid==39) {                    
                            $tsql=mysql_query("select `maxstore`,`maxcrop` from ".TB_PREFIX."vdata where wref=".$data['to']."");
                            $t_sql=mysql_fetch_array($tsql);
                            $tmaxcrop=$t_sql['maxcrop']+$buildarray[$totallvl]['attri']-$buildarray[$tblevel]['attri'];
                            if ($tmaxcrop<800) $tmaxcrop=800;
                            $q = "UPDATE ".TB_PREFIX."vdata SET `maxcrop`='".$tmaxcrop."' WHERE wref=".$data['to'];
                            $database->query($q);
                        }       
						if($tbgid==18) {
							$allyleader = $database->getVillageField($data['to'],"owner");
							$allyvillages = $database->getVillagesID2($allyleader);
							$allymax = 0;
							foreach($allyvillages as $allyvillage){
							$allyfield = $database->getResourceLevel($allyvillage['wref']);
							for($i=19;$i<=40;$i++){
							if($allyfield['f'.$i.'t'] == 18){
							$allylevel = $allyfield['f'.$i];
							$allyattri = $bid18[$allylevel]['attri'];
							}
							}
							if($allyattri > $allymax){
							$allymax = $allyattri;
							}
							}
							$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
							$database->query($q);
						}
                        $pop=$this->recountPop($data['to']);
                    }
                        
                    $info_cat .= "<br><tbody class=\"goods\"><tr><th>Information</th><td colspan=\"11\">
                    <img class=\"unit u".$tbgid."\" src=\"img/x.gif\" alt=\"catapult\" title=\"catapult\" /> ".$this->procResType($tbgid).$info_cata."</td></tr></tbody>";
                    $database->setVillageLevel($data['to'],"f".$tbid."",$totallvl);
                }
            }
        }    
    }
}  
            
        //chiefing village
        //there are senators
        if(($data['t9']-$dead9)>0){
            $varray = $database->getProfileVillages($to['owner']);
            //kijken of laatste dorp is, of hoofddorp
            if(count($varray)!='1' AND $to['capital']!='1'){
                //if there is no Palace/Residence
                for ($i=18; $i<39; $i++){
                    if ($database->getFieldLevel($data['to'],"".$i."t")==25 or $database->getFieldLevel($data['to'],"".$i."t")==26){
                        $nochiefing='1';
                            $info_chief = "".$chief_pic.",Palace or Residence still exists.";
                    }
                }
                if(!isset($nochiefing)){
                    //$info_chief = "".$chief_pic.",You don't have enought CP to chief a village.";
                    for ($i=0; $i<($data['t9']-$dead9); $i++){
                    $rand+=rand(15,25);
                    }
                    //loyalty is more than 0
                    if(($toF['loyalty']-$rand)>0){
                            $info_chief = "".$chief_pic.", Reduced Loyalty from <b>".$toF['loyalty']."</b> To <b>".($toF['loyalty']-$rand)."</b>";
                        $database->setVillageField($data['to'],loyalty,($toF['loyalty']-$rand));
                    } else {
                    //you took over the village
                        $artifact = $database->getOwnArtefactInfo($data['to']);
                        $info_chief = "".$chief_pic.", You conquered the village!";
                        if ($artifact['vref'] == $data['to']){
                         $database->claimArtefact($data['to'],$data['to'],$database->getVillageField($data['from'],"owner"));
                        }
                        $database->setVillageField($data['to'],loyalty,33);
                        $database->setVillageField($data['to'],owner,$database->getVillageField($data['from'],"owner"));
                        //destroy wall
                        $database->setVillageLevel($data['to'],"f40",0);
                        $database->setVillageLevel($data['to'],"f40t",0);
                        $database->clearExpansionSlot($data['to']);
                        //kill a chief
                        $database->modifyAttack($data['ref'],9,1);
                        
                        
                        $exp1 = $database->getVillageField($data['from'],'exp1');
                        $exp2 = $database->getVillageField($data['from'],'exp2');
                        $exp3 = $database->getVillageField($data['from'],'exp3');
                        
                        if($exp1 == 0){
                            $exp = 'exp1';
                            $value = $data['to'];
                        }
                        elseif($exp2 == 0){
                            $exp = 'exp2';
                            $value = $data['to'];
                        }
                        else{
                            $exp = 'exp3';
                            $value = $data['to'];
                        }
                        $database->setVillageField($data['from'],$exp,$value);
                    }
                }
            } else {
                $info_chief = "".$chief_pic.", You cannot Conquer the Capital!";
            }
        }
        
		if($data['t11']>0) { 
			if ($isoasis != 0) {         
					//count oasis troops: $troops_o 
					$troops_o=0; 
					$o_unit2=mysql_query("select * from ".TB_PREFIX."units where `vref`='".$data['to']."'"); 
					$o_unit=mysql_fetch_array($o_unit2); 
					for ($i=1;$i<=50;$i++) { 
						$troops_o+=$o_unit[$i]; 
					}                         
					 
					$o_unit2 = mysql_query("select * from ".TB_PREFIX."enforcement where `vref`='".$data['to']."'"); 
					while ($o_unit=@mysql_fetch_array($o_unit2)) { 
						for ($i=1;$i<=50;$i++) { 
							$troops_o+=$o_unit[$i]; 
						}                         
						$troops_o+=$o_unit['hero']; 
					}  
										 
					if ($troops_o<=0) { 
						//check hero mansion level 
						$hero_mansion_level=0; 
						$dbo2=mysql_query("select * from ".TB_PREFIX."fdata where `vref`='".$data['from']."'"); 
						$dbo=mysql_fetch_array($dbo2); 
						for ($i=19;$i<=40;$i++) { 
							if ($dbo['f'.$i.'t']==37) { 
								$hero_mansion_level=$dbo['f'.$i]; 
							} 
						} 
						 
						//check number of occupied oasis  
						$dbo2=mysql_query("select * from ".TB_PREFIX."odata where `conqured`='".$data['from']."'"); 
						$number_o=mysql_num_rows($dbo2); 
						 
						if ($number_o<3) {
							$needed_hero_mansion_level=$number_o*5+10; 
							if ($hero_mansion_level>=$needed_hero_mansion_level) { 
								$dbo2=mysql_query("select * from ".TB_PREFIX."odata where `wref`='".$data['to']."'"); 
								$dbo=mysql_fetch_array($dbo2); 
								$o_owner=$dbo['owner']; 
								$o_conqured=$dbo['conqured']; 
								$o_loyalty=$dbo['loyalty']; 
								$a_uid = $database->getVillageField($data['from'],"owner");
								if ($o_conqured=='0' or $o_conqured!=$data['from']) { 
									mysql_query("UPDATE ".TB_PREFIX."odata SET `conqured`='".$data['from']."', `owner`='".$a_uid."', `name`='آبادی تسخیر شده', `lastupdated`='".time()."' WHERE `wref`='".$data['to']."' "); 
									mysql_query("UPDATE ".TB_PREFIX."wdata SET `occupied`='1' WHERE `id`='".$data['to']."' "); 
									$info_chief = "".$hero_pic.", Your hero has conquered this oasis."; 
								} elseif($o_conqured==$data['from']) { 
									$info_chief = "".$hero_pic.", Your hero has already conquered this oasis."; 
								} 
							} else {                                     
								$info_chief = "".$hero_pic.", You need hero mansion level ".$needed_hero_mansion_level." to conquer this oasis."; 
							}
						} else { 
							$info_chief = "".$hero_pic.", Your hero has already conquered 3 oasis."; 
						} 
					}
			}else{
				$artifact = $database->getOwnArtefactInfo($data['to']); 
				if ($artifact['vref'] == $data['to']){ 
					if($database->canClaimArtifact($artifact['vref'],$artifact['size'])) { 
						$database->claimArtefact($data['to'],$data['to'],$database->getVillageField($data['from'],"owner")); 
						$info_chief = "".$hero_pic.", Your hero is carrying home a artefact.";   
					}else{ 
						$info_chief = "";
					} 
				} 
			}
		}  
		if($scout){
			if ($data['spy'] == 1){
				$info_spy = "".$spy_pic.",
<tbody><tr><td class=\"empty\" colspan=\"12\"></td></tr></tbody>
<tbody class=\"goods\">
	<tr><th>Resources</th><td colspan=\"11\"><div class=\"res\"><div class=\"rArea\"><img class=\"r1\" src=\"img/x.gif\" title=\"Wood\">".round($totwood)."</div><div class=\"rArea\"><img class=\"r2\" src=\"img/x.gif\" title=\"Clay\">".round($totclay)."</div><div class=\"rArea\"><img class=\"r3\" src=\"img/x.gif\" title=\"Iron\">".round($totiron)."</div><div class=\"rArea\"><img class=\"r4\" src=\"img/x.gif\" title=\"Crop\">".round($totcrop)."</div></div></td></tr></tbody>
	<tr><th>Resources</th><td colspan=\"11\"><div class=\"res\"><div class=\"rArea\"><img class=\"r1\" src=\"img/x.gif\" title=\"Lumber\">".round($totwood)."</div><div class=\"rArea\"><img class=\"r2\" src=\"img/x.gif\" title=\"Clay\">".round($totclay)."</div><div class=\"rArea\"><img class=\"r3\" src=\"img/x.gif\" title=\"Iron\">".round($totiron)."</div><div class=\"rArea\"><img class=\"r4\" src=\"img/x.gif\" title=\"Crop\">".round($totcrop)."</div></div></td></tr></tbody>

<tbody class=\"goods\"><tr><th></th><td colspan=\"11\"><div class=\"res\"><div class=\"rArea\"><img class=\"gebIcon g23Icon\" src=\"img/x.gif\" title=\"Cranny\">". $cranny ."</div></div></td></tr></tbody>";				
				
			}else if($data['spy'] == 2){
				if ($isoasis == 0){  
					$basearray = $database->getMInfo($data['to']);
					$resarray = $database->getResourceLevel($basearray['wref']);
					$crannylevel =0;
					$rplevel = 0;
					$walllevel = 0;
					$tribe = $database->getUserField($basearray['owner'],'tribe',0);
					
					for($j=19;$j<=40;$j++) {
						if($resarray['f'.$j.'t'] == 25) 
                        {
							$rplevel = $database->getFieldLevel($basearray['wref'],$j);
                            $rptitle = 'Residence';
                            $rpid = 25;
						}
						elseif($resarray['f'.$j.'t'] == 26)
                        {
							$rplevel = $database->getFieldLevel($basearray['wref'],$j);
                            $rptitle = 'Palace';
                            $rpid = 26;
						}
                        else
                        {
                            $rplevel = 0;
                            $rptitle = 'Palace/Residence';
                            $rpid = 25; //Use icon for Residence
                        }
					}
					for($j=19;$j<=40;$j++) {
						if($resarray['f'.$j.'t'] == 31) {
							$walllevel = $database->getFieldLevel($basearray['wref'],$j);
						}
					}
					for($j=19;$j<=40;$j++) {
						if($resarray['f'.$j.'t'] == 23) {
							$crannylevel = $database->getFieldLevel($basearray['wref'],$j);
						}
					}
				} else {
					$crannylevel = 0;
					$walllevel = 0;
					$rplevel = 0;
				}
                if($tribe == 1){
					$walltitle = 'City Wall';
                    $iconClass = 'gebIcon g3' . $tribe . 'Icon';
				}elseif($tribe == 2){
					$walltitle = 'Earth Wall';
                    $iconClass = 'gebIcon g3' . $tribe . 'Icon';
				}elseif($tribe == 3){
					$walltitle = 'Palisade';
                    $iconClass = 'gebIcon g3' . $tribe . 'Icon';
				}
                else
                {
                    /**
                     * @todo Not sure what Natar Wall should be called, also using City Wall for the icon for now
                     */
                    $walltitle = "Natar Wall";
                    $iconClass = 'gebIcon g31Icon';
                }
                                        
                $info_spy = "".$spy_pic.",
<tbody><tr><td class=\"empty\" colspan=\"12\"></td></tr></tbody>
<tbody class=\"goods\">
	<tr><th>Defences</th><td colspan=\"11\"><div class=\"res\">
<div class=\"rArea\">
<img class=\"gebIcon g".$rpid."Icon\" src=\"img/x.gif\" title=\"".$rptitle."\">" . $rptitle . " <b> Level ".$rplevel."</b><Br>
<img class=\"" . $iconClass . "\" src=\"img/x.gif\" title=\"".$walltitle."\">".$walltitle." <b>Level ".$walllevel."</b>
</div>
</div></td></tr></tbody>";
            
			}
                
			$data2 = ''.$from['owner'].','.$from['wref'].','.$owntribe.','.$unitssend_att.','.$unitsdead_att.',0,0,0,0,0,'.$to['owner'].','.$to['wref'].','.addslashes($to['name']).','.$targettribe.',,,'.$rom.','.$unitssend_def[1].','.$unitsdead_def[1].','.$ger.','.$unitssend_def[2].','.$unitsdead_def[2].','.$gal.','.$unitssend_def[3].','.$unitsdead_def[3].','.$nat.','.$unitssend_def[4].','.$unitsdead_def[4].','.$natar.','.$unitssend_def[5].','.$unitsdead_def[5].','.$info_ram.','.$info_cat.','.$info_chief.','.$info_spy.','.$unitstraped_att;
		}else{
			$data2 = ''.$from['owner'].','.$from['wref'].','.$owntribe.','.$unitssend_att.','.$unitsdead_att.','.$steal[0].','.$steal[1].','.$steal[2].','.$steal[3].','.$battlepart['bounty'].','.$to['owner'].','.$to['wref'].','.addslashes($to['name']).','.$targettribe.',,,'.$rom.','.$unitssend_def[1].','.$unitsdead_def[1].','.$ger.','.$unitssend_def[2].','.$unitsdead_def[2].','.$gal.','.$unitssend_def[3].','.$unitsdead_def[3].','.$nat.','.$unitssend_def[4].','.$unitsdead_def[4].','.$natar.','.$unitssend_def[5].','.$unitsdead_def[5].','.$info_ram.','.$info_cat.','.$info_chief.','.$info_spy.','.$unitstraped_att;
		}

            // When all troops die, sends no info.
            $data_fail = ''.$from['owner'].','.$from['wref'].','.$owntribe.','.$unitssend_att.','.$unitsdead_att.','.$steal[0].','.$steal[1].','.$steal[2].','.$steal[3].','.$battlepart['bounty'].','.$to['owner'].','.$to['wref'].','.addslashes($to['name']).','.$targettribe.',,,'.$rom.','.$unitssend_deff[1].','.$unitsdead_deff[1].','.$ger.','.$unitssend_deff[2].','.$unitsdead_deff[2].','.$gal.','.$unitssend_deff[3].','.$unitsdead_deff[3].','.$nat.','.$unitssend_deff[4].','.$unitsdead_deff[4].','.$natar.','.$unitssend_deff[5].','.$unitsdead_deff[5].',,,'.$unitstraped_att;
            
            //Undetected and detected in here.
            if($scout){
                for($i=1;$i<=11;$i++){
                    if($battlepart['casualties_attacker'][$i]){
						$toAlly = $database->getUserField($to['owner'],'alliance',0);
                        $database->addNotice($to['owner'],$to['wref'],$toAlly,0,''.addslashes($from['name']).' scouts '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
                        break;
                    }
                }
            } else {
			if($type == 3 && $totalsend_att - ($totaldead_att+$totaltraped_att) > 0){
			$prisoners = $database->getPrisoners($to['wref']);
			if(count($prisoners) > 0){
			$anothertroops = 0;
			foreach($prisoners as $prisoner){
			$p_owner = $database->getVillageField($prisoner['from'],"owner");
			if($p_owner == $from['owner']){
			$database->modifyAttack2($data['ref'],1,$prisoner['t1']);
			$database->modifyAttack2($data['ref'],2,$prisoner['t2']);
			$database->modifyAttack2($data['ref'],3,$prisoner['t3']);
			$database->modifyAttack2($data['ref'],4,$prisoner['t4']);
			$database->modifyAttack2($data['ref'],5,$prisoner['t5']);
			$database->modifyAttack2($data['ref'],6,$prisoner['t6']);
			$database->modifyAttack2($data['ref'],7,$prisoner['t7']);
			$database->modifyAttack2($data['ref'],8,$prisoner['t8']);
			$database->modifyAttack2($data['ref'],9,$prisoner['t9']);
			$database->modifyAttack2($data['ref'],10,$prisoner['t10']);
			$database->modifyAttack2($data['ref'],11,$prisoner['t11']);
			$mytroops = $prisoner['t1']+$prisoner['t2']+$prisoner['t3']+$prisoner['t4']+$prisoner['t5']+$prisoner['t6']+$prisoner['t7']+$prisoner['t8']+$prisoner['t9']+$prisoner['t10']+$prisoner['t11'];
			$database->modifyUnit($data['to'],"99",$mytroops,0);
			$database->modifyUnit($data['to'],"99o",$mytroops,0);
			}else{
			$p_alliance = $database->getUserField($p_owner,"alliance",0);
			$friendarray = $database->getAllianceAlly($p_alliance,1);
			$neutralarray = $database->getAllianceAlly($p_alliance,2);
			$friend = (($friendarray[0]['alli1']>0 and $friendarray[0]['alli2']>0 and $p_alliance>0) and ($friendarray[0]['alli1']==$ownally or $friendarray[0]['alli2']==$ownally) and ($ownally != $p_alliance and $ownally and $p_alliance)) ? '1':'0';
			$neutral = (($neutralarray[0]['alli1']>0 and $neutralarray[0]['alli2']>0 and $p_alliance>0) and ($neutralarray[0]['alli1']==$ownally or $neutralarray[0]['alli2']==$ownally) and ($ownally != $p_alliance and $ownally and $p_alliance)) ? '1':'0';
			if($p_alliance == $ownally or $friend == 1 or $neutral == 1){
			$p_tribe = $database->getUserField($p_owner,"tribe",0);
            
            $p_eigen = $database->getCoor($prisoner['wref']);
            $p_from = array('x'=>$p_eigen['x'], 'y'=>$p_eigen['y']);
            $p_ander = $database->getCoor($prisoner['from']);
            $p_to = array('x'=>$p_ander['x'], 'y'=>$p_ander['y']);
			$p_tribe = $database->getUserField($p_owner,"tribe",0);
            
            $p_speeds = array();
    
            //find slowest unit.            
            for($i=1;$i<=10;$i++){
                if ($prisoner['t'.$i]){
                    if($prisoner['t'.$i] != '' && $prisoner['t'.$i] > 0){
                        if($p_unitarray) { reset($p_unitarray); }
                        $p_unitarray = $GLOBALS["u".(($p_tribe-1)*10+$i)];
                        $p_speeds[] = $p_unitarray['speed'];
                    }
                }
            }
			
			if ($prisoner['t11']>0){
				$p_qh = "SELECT * FROM ".TB_PREFIX."hero WHERE uid = ".$p_owner."";
				$p_resulth = mysql_query($p_qh);
				$p_hero_f=mysql_fetch_array($p_resulth);
				$p_hero_unit=$p_hero_f['unit'];
				$p_speeds[] = $GLOBALS['u'.$p_hero_unit]['speed'];
			}
            
            $p_artefact = count($database->getOwnUniqueArtefactInfo2($p_owner,2,3,0));
			$p_artefact1 = count($database->getOwnUniqueArtefactInfo2($prisoner['from'],2,1,1));
			$p_artefact2 = count($database->getOwnUniqueArtefactInfo2($p_owner,2,2,0));
			if($p_artefact > 0){
			$p_fastertroops = 3;
			}else if($p_artefact1 > 0){
			$p_fastertroops = 2;
			}else if($p_artefact2 > 0){
			$p_fastertroops = 1.5;
			}else{
			$p_fastertroops = 1;
			}
			$p_time = round($this->procDistanceTime($p_to,$p_from,min($p_speeds),1)/$p_fastertroops);
			$foolartefact1 = $database->getFoolArtefactInfo(2,$prisoner['from'],$p_owner);
			if(count($foolartefact1) > 0){
			foreach($foolartefact1 as $arte){
			if($arte['bad_effect'] == 1){
			$p_time *= $arte['effect2'];
			}else{
			$p_time /= $arte['effect2'];
			$p_time = round($p_time);
			}
			}
			}
			$p_reference = $database->addAttack($prisoner['from'],$prisoner['t1'],$prisoner['t2'],$prisoner['t3'],$prisoner['t4'],$prisoner['t5'],$prisoner['t6'],$prisoner['t7'],$prisoner['t8'],$prisoner['t9'],$prisoner['t10'],$prisoner['t11'],3,0,0,0,0,0,0,0,0,0,0,0);
			$database->addMovement(4,$prisoner['wref'],$prisoner['from'],$p_reference,time(),($p_time+time()));
			$anothertroops += $prisoner['t1']+$prisoner['t2']+$prisoner['t3']+$prisoner['t4']+$prisoner['t5']+$prisoner['t6']+$prisoner['t7']+$prisoner['t8']+$prisoner['t9']+$prisoner['t10']+$prisoner['t11'];
			$database->modifyUnit($data['to'],"99",$anothertroops,0);
			$database->modifyUnit($data['to'],"99o",$anothertroops,0);
			}
			}
			$database->deletePrisoners($prisoner['id']);
			}
			$trapper_pic = "<img src=\"".GP_LOCATE."img/u/98.gif\" alt=\"Trap\" title=\"Trap\" />";
			$p_username = $database->getUserField($from['owner'],"username",0);
			if($mytroops > 0 && $anothertroops > 0){
			$info_trap = "".$trapper_pic." ".$p_username." released <b>".$mytroops."</b> from his troops and <b>".$anothertroops."</b> friendly troops.";
			}elseif($mytroops > 0){
			$info_trap = "".$trapper_pic." ".$p_username." released <b>".$mytroops."</b> from his troops.";
			}elseif($anothertroops > 0){
			$info_trap = "".$trapper_pic." ".$p_username." released <b>".$anothertroops."</b> friendly troops.";
			}
			}
			}
			$data2 = $data2.','.addslashes($info_trap).',,';
                if ($totaldead_def == 0){
					$getu = $database->getUnit($to['wref']);
					$toAlly = $database->getUserField($to['owner'],'alliance',0);
					for($i=1;$i<=50;$i++){ if($getu['u'.$i]!=0){ $eee = $getu['u'.$i]; } }
					if($eee==0){
						$database->addNotice($to['owner'],$to['wref'],$toAlly,7,''.addslashes($from['name']).' attacks '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
					}else{
						$database->addNotice($to['owner'],$to['wref'],$toAlly,4,''.addslashes($from['name']).' attacks '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
					}
					
            	} else {
					$toAlly = $database->getUserField($to['owner'],'alliance',0);
					if($totalsend_def > $totaldead_def){
            		$database->addNotice($to['owner'],$to['wref'],$toAlly,5,''.addslashes($from['name']).' attacks '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
					}else{
					$database->addNotice($to['owner'],$to['wref'],$toAlly,6,''.addslashes($from['name']).' attacks '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
					}
				}
            }    
            //to here
            
            // If the dead units not equal the ammount sent they will return and report
            if($totalsend_att - ($totaldead_att+$totaltraped_att) > 0)
            {
                $endtime = $this->procDistanceTime($from,$to,min($speeds),1) + $AttackArrivalTime;
                //$endtime = $this->procDistanceTime($from,$to,min($speeds),1) + time();
                if($type == 1) {
					$fromAlly = $database->getUserField($from['owner'],'alliance',0);
                    $database->addNotice($from['owner'],$to['wref'],$fromAlly,0,''.addslashes($from['name']).' scouts '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
                }else {
                    if ($totaldead_att == 0 && $totaltraped_att == 0){
					$fromAlly = $database->getUserField($from['owner'],'alliance',0);
                    $database->addNotice($from['owner'],$to['wref'],$fromAlly,1,''.addslashes($from['name']).' attacks '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
                    }else{ 
					$fromAlly = $database->getUserField($from['owner'],'alliance',0);
                    $database->addNotice($from['owner'],$to['wref'],$fromAlly,2,''.addslashes($from['name']).' attacks '.addslashes($to['name']).'',$data2,$AttackArrivalTime);
                    }       
                }
                
				
                $database->setMovementProc($data['moveid']);
				$datar = "".$steal[0].",".$steal[1].",".$steal[2].",".$steal[3].",".$battlepart['bounty']."";
                $database->addMovement(4,$to['wref'],$from['wref'],$data['ref'],$datar,$endtime);
                
                // send the bounty on type 6.
                if($type !== 1)
                {
                    $reference = $database->sendResource($steal[0],$steal[1],$steal[2],$steal[3],0,0);
				if($isoasis==0){
                    $database->modifyResource($to['wref'],$steal[0],$steal[1],$steal[2],$steal[3],0);
				}else{
					$database->modifyOasisResource($to['wref'],$steal[0],$steal[1],$steal[2],$steal[3],0);
				}
                    $database->addMovement(6,$to['wref'],$from['wref'],$reference,$datar,$endtime);
                    //$database->updateVillage($to['wref']);
                    $totalstolentaken=($totalstolentaken-($steal[0]+$steal[1]+$steal[2]+$steal[3]));
                    $database->modifyPoints($from['owner'],'RR',$steal[0]+$steal[1]+$steal[2]+$steal[3]);
                    $database->modifyPoints($to['owner'],'RR',$totalstolentaken);
                    $database->modifyPointsAlly($targetally,'RR',$totalstolentaken );
                }
            }
            else //else they die and don't return or report.
            {
                $database->setMovementProc($data['moveid']);
                if($type == 1){
					$fromAlly = $database->getUserField($from['owner'],'alliance',0);
                    $database->addNotice($from['owner'],$to['wref'],$fromAlly,0,''.addslashes($from['name']).' scouts '.addslashes($to['name']).'',$data_fail,$AttackArrivalTime);
                }else{
					$fromAlly = $database->getUserField($from['owner'],'alliance',0);
                    $database->addNotice($from['owner'],$to['wref'],$fromAlly,3,''.addslashes($from['name']).' attacks '.addslashes($to['name']).'',$data_fail,$AttackArrivalTime); 
                    }
            }
			
			if($type == 3 or $type == 4){
			$database->addGeneralAttack($totalattackdead);
			}
			
			}else{
			$database->setMovementProc($data['moveid']);
			$datar = "0,0,0,0,0";
			$getHero = $database->getHeroData($AttackerID);
			$speed = $getHero['speed'];
			$AttackArrivalTime = $data['endtime']; 
			$endtime = $this->procDistanceTime($from,$to,$speed,1) + $AttackArrivalTime;
            $database->addMovement(4,$to['wref'],$from['wref'],$data['ref'],$datar,$endtime);
			$animals = 0;
				for($i=31; $i<=40; $i++){
				$animals += $Defender['u'.$i];
				$j = $i - 30;
				${captured.$j} = 0;
				}
				while($cage['type'] > 0 && $animals > 0){
				for($i=31; $i<=40; $i++){
				if($Defender['u'.$i] > 0 && $cage['type'] > 0){
				$Defender['u'.$i]--;
				$animals--;
				$cage['type']--;
				$cage['num']--;
				$j = $i - 30;
				${captured.$j}++;
				}
				}
				}
				$database->editHeroType($cageID, $cage['type'], 2);
				$database->editHeroNum2($cageID, $cage['num'], 2);
				if($cage['type'] == 0){
				$database->setHeroInventory($AttackerID,"bag",0);
				$database->editProcItem($cageID, 0);
				}
				if($cage['num'] == 0){
				$q = "DELETE FROM ".TB_PREFIX."heroitems where id = ".$cageID;
				$database->query($q);
				}
				for($i=1; $i<=10; $i++){
				$total_captured += ${captured.$i};
				}
				if($total_captured > 0){

				$speeds = array();
				
				for($i=31; $i<=40; $i++){
				$j = $i - 30;
				$database->modifyUnit($to['wref'],$i,${captured.$j},0);
				}
				
				//find slowest unit.
				for($i=1;$i<=10;$i++){
							if($unitarray) { reset($unitarray); }
							$unitarray = $GLOBALS["u".(30+$i)];
							$speeds[] = $unitarray['speed'];
				}
				$time = $this->procDistanceTime($from['wref'],$to['wref'],min($speeds),1);
				$reference = $database->addAttack($to['wref'],$captured1,$captured2,$captured3,$captured4,$captured5,$captured6,$captured7,$captured8,$captured9,$captured10,0,2,0,0,0,0);
				$database->addMovement(3,0,$from['wref'],$reference,$datar,($time+time()));

				}
			}
				$crop = $database->getCropProdstarv($to['wref']);
				$unitarrays = $this->getAllUnits($to['wref']);
				$getvillage = $database->getVillage($to['wref']);
				$village_upkeep = $getvillage['pop'] + $this->getUpkeep($unitarrays, 0);
				if ($crop < $village_upkeep){
					// add starv data
					$database->setVillageField($to['wref'], 'starv', $village_upkeep);
					$database->setVillageField($to['wref'], 'starvupdate', time());
				}
				unset($crop,$unitarrays,$getvillage,$village_upkeep);

        }
            if(file_exists("GameEngine/Prevention/sendunits.txt")) {
                unlink("GameEngine/Prevention/sendunits.txt");
            }
    }
    
    private function sendreinfunitsComplete() {
	if(file_exists("GameEngine/Prevention/sendreinfunits.txt")) {
                unlink("GameEngine/Prevention/sendreinfunits.txt");
            }
        global $bid23,$database,$battle;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."attacks where ".TB_PREFIX."movement.ref = ".TB_PREFIX."attacks.id and ".TB_PREFIX."movement.proc = '0' and ".TB_PREFIX."movement.sort_type = '3' and ".TB_PREFIX."attacks.attack_type = '2' and endtime < $time";
        $dataarray = $database->query_return($q);
        
        foreach($dataarray as $data) {
		$AttackArrivalTime = $data['endtime'];
			if($data['from']==0){
			$to = $database->getMInfo($data['to']);
				//check if there is defence from town in to town
		        $check = $database->getEnforce($data['to'],$data['from']);
			    if (!isset($check['id'])){
				    //no: 
					 $database->addEnforce($data);
				} else {
					//yes
					 $start = 31;
					 $end = 40;
					//add unit.
					 $j='1';
					 for($i=$start;$i<=$end;$i++){
				        $database->modifyEnforce($check['id'],$i,$data['t'.$j.''],1); $j++;
					 }
				}
			$to = $database->getMInfo($data['to']);
			$targetally = $database->getUserField($from['owner'],'alliance',0);
			$unitssend_att = ''.$data['t1'].','.$data['t2'].','.$data['t3'].','.$data['t4'].','.$data['t5'].','.$data['t6'].','.$data['t7'].','.$data['t8'].','.$data['t9'].','.$data['t10'].','.$data['t11'].'';
			$data_fail = '0,0,4,'.$unitssend_att.','.$to['wref'].','.$to['owner'];
			$database->addNotice($to['owner'],$to['wref'],$targetally,8,'nature reinforced '.addslashes($to['name']).'',$data_fail,$AttackArrivalTime);
			$database->setMovementProc($data['moveid']);
			}else{
            //set base things
            $owntribe = $database->getUserField($database->getVillageField($data['from'],"owner"),"tribe",0);
            $targettribe = $database->getUserField($database->getVillageField($data['to'],"owner"),"tribe",0);
            $to = $database->getMInfo($data['to']);
            $from = $database->getMInfo($data['from']);
            $toF = $database->getVillage($data['to']);
            $fromF = $database->getVillage($data['from']);
			$HeroTransfer = 0;

			//check to see if we're only sending a hero between own villages and there's a Mansion at target village
			if($data['t11'] != 0) {
				if($database->getVillageField($data['from'],"owner") == $database->getVillageField($data['to'],"owner")) {
					$check = $database->getEnforce($data['to'],$data['from']);
					//don't reinforce, addunit instead
					$database->modifyUnit($data['to'],'hero',1,1);
					$database->modifyEnforce($check['id'],'hero',1,1);
					$database->modifyHero2('wref', $data['to'], $database->getVillageField($data['from'],"owner"), 0);
					$HeroTransfer = 1;
				}else{
					$check = $database->getEnforce($data['to'],$data['from']);
					if($database->checkEnforce($data['to'],$data['from'])!=0){
						$database->modifyEnforce($check['id'],'hero',1,1);
					}else{
						$database->addHeroEnforce($data);
					}
					$HeroTransfer = 1;
				}
			}
			if(!$HeroTransfer) {	
	            //check if there is defence from town in to town
		        $check = $database->getEnforce($data['to'],$data['from']);
			    if (!isset($check['id'])){
				    //no: 
					$database->addEnforce($data);
				} else{
				 //yes
					 $start = ($owntribe-1)*10+1;
					 $end = ($owntribe*10);
				 //add unit.
					 $j='1';
					 for($i=$start;$i<=$end;$i++){
				        $database->modifyEnforce($check['id'],$i,$data['t'.$j.''],1); $j++;
					}
				}	
            }
            //send rapport
            $unitssend_att = ''.$data['t1'].','.$data['t2'].','.$data['t3'].','.$data['t4'].','.$data['t5'].','.$data['t6'].','.$data['t7'].','.$data['t8'].','.$data['t9'].','.$data['t10'].','.$data['t11'].'';
            $data_fail = ''.$from['wref'].','.$from['owner'].','.$owntribe.','.$unitssend_att.','.$to['wref'].','.$to['owner'].'';
			$fromAlly = $database->getUserField($from['owner'],'alliance',0);
            $database->addNotice($from['owner'],$to['wref'],$fromAlly,8,''.addslashes($from['name']).' reinforced '.addslashes($to['name']).'',$data_fail,$AttackArrivalTime);
			if($from['owner'] != $to['owner']) {
				$toAlly = $database->getUserField($from['owner'],'alliance',0);
				$database->addNotice($to['owner'],$to['wref'],$toAlly,8,''.addslashes($from['name']).' reinforced '.addslashes($to['name']).'',$data_fail,$AttackArrivalTime);
			}
            //update status
            $database->setMovementProc($data['moveid']); 
			}
        }
		if(file_exists("GameEngine/Prevention/sendreinfunits.txt")) {
                unlink("GameEngine/Prevention/sendreinfunits.txt");
            }
    }
    
    private function returnunitsComplete() {
	if(file_exists("GameEngine/Prevention/returnunits.txt")) {
            unlink("GameEngine/Prevention/returnunits.txt");
        }
        global $database;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."attacks where ".TB_PREFIX."movement.ref = ".TB_PREFIX."attacks.id and ".TB_PREFIX."movement.proc = '0' and ".TB_PREFIX."movement.sort_type = '4' and endtime < $time";
        $dataarray = $database->query_return($q);
        
        foreach($dataarray as $data) {
        
        $tribe = $database->getUserField($database->getVillageField($data['to'],"owner"),"tribe",0);
        
        if($tribe == 1){ $u = ""; } elseif($tribe == 2){ $u = "1"; } elseif($tribe == 3){ $u = "2"; } elseif($tribe == 4){ $u = "3"; } else{ $u = "4"; }
        $database->modifyUnit($data['to'],$u."1",$data['t1'],1);
        $database->modifyUnit($data['to'],$u."2",$data['t2'],1);
        $database->modifyUnit($data['to'],$u."3",$data['t3'],1);
        $database->modifyUnit($data['to'],$u."4",$data['t4'],1);
        $database->modifyUnit($data['to'],$u."5",$data['t5'],1);
        $database->modifyUnit($data['to'],$u."6",$data['t6'],1);
        $database->modifyUnit($data['to'],$u."7",$data['t7'],1);
        $database->modifyUnit($data['to'],$u."8",$data['t8'],1);
        $database->modifyUnit($data['to'],$u."9",$data['t9'],1);
        $database->modifyUnit($data['to'],$tribe."0",$data['t10'],1);
        $database->modifyUnit($data['to'],"hero",$data['t11'],1); 
        $database->setMovementProc($data['moveid']);
        }
        
        // Recieve the bounty on type 6.
        
        $q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."send where ".TB_PREFIX."movement.ref = ".TB_PREFIX."send.id and ".TB_PREFIX."movement.proc = 0 and sort_type = 6 and endtime < $time";
        $dataarray = $database->query_return($q);
        foreach($dataarray as $data) {
            
            if($data['wood'] >= $data['clay'] && $data['wood'] >= $data['iron'] && $data['wood'] >= $data['crop']){ $sort_type = "10"; }
            elseif($data['clay'] >= $data['wood'] && $data['clay'] >= $data['iron'] && $data['clay'] >= $data['crop']){ $sort_type = "11"; }
            elseif($data['iron'] >= $data['wood'] && $data['iron'] >= $data['clay'] && $data['iron'] >= $data['crop']){ $sort_type = "12"; }
            elseif($data['crop'] >= $data['wood'] && $data['crop'] >= $data['clay'] && $data['crop'] >= $data['iron']){ $sort_type = "13"; }

            $to = $database->getMInfo($data['to']);
            $from = $database->getMInfo($data['from']);
            $database->modifyResource($data['to'],$data['wood'],$data['clay'],$data['iron'],$data['crop'],1);
            //$database->updateVillage($data['to']);
            $database->setMovementProc($data['moveid']);
        }
        $this->pruneResource();
		if(file_exists("GameEngine/Prevention/returnunits.txt")) {
            unlink("GameEngine/Prevention/returnunits.txt");
        }
    }           
    
    private function sendSettlersComplete() {
	if(file_exists("GameEngine/Prevention/settlers.txt")) {
                unlink("GameEngine/Prevention/settlers.txt");
            }
        global $database, $building;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."movement where proc = 0 and sort_type = 5 and endtime < $time";
        $dataarray = $database->query_return($q);
            foreach($dataarray as $data) {
                    $to = $database->getMInfo($data['from']);
                    $user = $database->getUserField($to['owner'],'username',0);
                    $taken = $database->getVillageState($data['to']);
                    if($taken['occupied'] == 0){
                        $database->setFieldTaken($data['to']);
                        $database->addVillage($data['to'],$to['owner'],$user,'0');
                        $database->addResourceFields($data['to'],$database->getVillageType($data['to']));
                        $database->addUnits($data['to']);
                        $database->addTech($data['to']);
                        $database->addABTech($data['to']);
                        $database->setMovementProc($data['moveid']);
                        
                        $exp1 = $database->getVillageField($data['from'],'exp1');
                        $exp2 = $database->getVillageField($data['from'],'exp2');
                        $exp3 = $database->getVillageField($data['from'],'exp3');
                        
                        if($exp1 == 0){
                            $exp = 'exp1';
                            $value = $data['to'];
                        }
                        elseif($exp2 == 0){
                            $exp = 'exp2';
                            $value = $data['to'];
                        }
                        else{
                            $exp = 'exp3';
                            $value = $data['to'];
                        }
                        $database->setVillageField($data['from'],$exp,$value);
                    }
                    else{
                        // here must come movement from returning settlers
                        $database->setMovementProc($data['moveid']);
                    }
            }
			if(file_exists("GameEngine/Prevention/settlers.txt")) {
                unlink("GameEngine/Prevention/settlers.txt");
            }
    }
	
	private function sendAdventuresComplete() {
	if(file_exists("GameEngine/Prevention/adventures.txt")) {
                unlink("GameEngine/Prevention/adventures.txt");
            }
        global $database, $building, $session;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."movement where proc = 0 and sort_type = 9 and endtime <= $time";
		$dataarray = $database->query_return($q);
			foreach($dataarray as $data) {
				$from = $database->getMInfo($data['from']);
				$to = $database->getAInfo($data['to']);
                $owner = $database->getUserField($from['owner'],'username',0);
				$ally = $database->getUserField($from['owner'],'alliance',0);
				$tribe = $database->getUserField($from['owner'],'tribe',0);
				$ownerID = $from['owner'];
				$coor = $database->getCoor($data['to']);
				$getHero = $database->getHeroData($ownerID);
				$getAdv = $database->getAdventure($ownerID, $data['to']);
				$heroface = $database->HeroFace($ownerID);
				$helmetID = $database->getHeroItemID($ownerID, 1);
				if($helmetID != 0){
				$helmet = $database->getItemData($helmetID);
				}
				$notroops = rand(0,3);
				if($notroops > 0){
				$nosilver = rand(0,3);
				if($nosilver > 0){
				$btype = rand(0,15);
				
				if($btype==1){
					if($time >= (COMMENCE+604800)){
						$ntype = array(1=>1,2,4,5,7,8,10,11,13,14);
					}
					elseif($time >= (COMMENCE+1209600)){
						$ntype = array(1=>1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
					}
					else{
						$ntype = array(1=>1,4,7,10,13);
					}
				}
				/*elseif($btype==2){
					if($time >= (COMMENCE+604800)){
						$ntype = array(1=>82,83,85,86,88,89,91,92);
					}
					elseif($time >= (COMMENCE+1209600)){
						$ntype = array(1=>82,83,84,85,86,87,88,89,90,91,92,93);
					}
					else{
						$ntype = array(1=>82,85,88,91);
					}
				}*/
				elseif($btype==3){
					if($time >= (COMMENCE+604800)){
						$ntype = array(1=>61,62,64,65,67,68,73,74,79,80);
					}
					elseif($time >= (COMMENCE+1209600)){
						
						$ntype = array(1=>61,62,63,64,65,66,67,68,69,73,74,75,76,77,78,79,80,81);
					}
					else{
						$ntype = array(1=>61,64,67,73,79);
					}
				}
				elseif($btype==4){
					if($time >= (COMMENCE+604800)){
						if($tribe==1){
							$ntype = array(1=>16,17,19,20,22,23,25,26,28,29);
						}elseif($tribe==2){
							$ntype = array(1=>46,47,49,50,52,53,55,56,58,59);
						}elseif($tribe==3){
							$ntype = array(1=>31,32,34,35,37,38,40,41,43,44);
						}
					}
					elseif($time >= (COMMENCE+1209600)){
						if($tribe==1){
							$ntype = array(1=>16,17,18,19,20,21,22,23,24,25,26,27,28,29,30);
						}elseif($tribe==2){
							$ntype = array(1=>46,47,48,49,50,51,52,53,54,55,56,57,58,59,60);
						}elseif($tribe==3){
							$ntype = array(1=>31,32,33,34,35,36,37,38,39,40,41,42,43,44,45);
						}
					}
					else{
						if($tribe==1){
							$ntype = array(1=>16,19,22,25,28);
						}elseif($tribe==2){
							$ntype = array(1=>46,49,52,55,58);
						}elseif($tribe==3){
							$ntype = array(1=>31,34,37,40,43);
						}
					}
				}
				elseif($btype==5){
					if($time >= (COMMENCE+604800)){
						$ntype = array(1=>94,95,97,98,100,101);
					}
					elseif($time >= (COMMENCE+1209600)){
						$ntype = array(1=>94,95,96,98,99,100,101,102);
					}
					else{
						$ntype = array(1=>94,97,100);
					}
				}
				elseif($btype==6){
					if($time >= (COMMENCE+604800)){
						$ntype = array(1=>103,104);
					}
					elseif($time >= (COMMENCE+1209600)){
						$ntype = array(1=>103,104,105);
					}
					else{
						$ntype = array(1=>103);
					}
				}
				elseif($btype>=7){
					$ntype = array(7=>112,113,114,107,106,108,110,109,111);
				}
				if($getAdv['dif']==0){
					$exp = rand(0,40);
					$sgh = 1000;
				}else{
					$exp = rand(10,80);
					$sgh = 2000;
				}
				if($tribe==1){
					$tp = 100;
				}else{
					$tp = 80;
				}
				$health = round((3.007 / ((100+$tp*$getHero['power'])+$hero['itempower'])) * $sgh);
				
				if($helmet['proc'] == 1 && $helmet['type'] <= 3) $exp += $exp * (10 + $helmet['type'] * 5) / 100;
				$database->modifyHero2('experience', $exp, $ownerID, 1);
				$database->setMovementProc($data['moveid']);
				$database->editTableField('adventure', 'end', 1, 'wref', $data['to']);
				
				if(($getHero['health']-$health)<=0){
					$database->modifyHero2('dead', 1, $ownerID, 0);
					$database->modifyHero2('health', $health, $ownerID, 2);
					$database->addNotice($ownerID,$data['to'],$ally,9,''.addslashes($from['name']).' explores ('.addslashes($coor['x']).'|'.addslashes($coor['y']).')',''.$from['wref'].',dead,your hero did not survive the adventure.,,'.$health.','.$exp.'',$data['endtime']);
				}else{
					if($btype>=7){
						$nntype = $ntype[$btype];
						if($btype==9){
							$num = rand(6,20);
						}elseif($btype==12 or $btype==13 or $btype==15){
							$num = 1;
						}else{
							$num = rand(20,50);
						}
						if($btype<=11 or $btype>=14){
							if($database->checkHeroItem($ownerID, $btype)){
								$id = $database->getHeroItemID($ownerID, $btype);
								$database->editHeroNum($id, $num, 1);
							}else{
								$database->addHeroItem($ownerID, $btype, $nntype, $num);
							}
						}else{
							$database->addHeroItem($ownerID, $btype, $nntype, $num);
						}
					}else{
						if($btype==1 or $btype>2){
							$num = 1;
							$s2 = rand(1, count($ntype));
							$nntype = $ntype[$s2];
							$database->addHeroItem($ownerID, $btype, $nntype, $num);
						}
					}
					if($btype==0 or $btype==2){
						$database->addNotice($ownerID,$data['to'],$ally,9,''.addslashes($from['name']).' explores('.addslashes($coor['x']).'|'.addslashes($coor['y']).')',''.$from['wref'].',,Nothing valuable was found,,'.$health.','.$exp.'',$data['endtime']);
					}else{
						$database->addNotice($ownerID,$data['to'],$ally,9,''.addslashes($from['name']).' explores ('.addslashes($coor['x']).'|'.addslashes($coor['y']).')',''.$from['wref'].','.$btype.','.$nntype.','.$num.','.$health.','.$exp.'',$data['endtime']);
					}
					$database->modifyHero2('health', $health, $ownerID, 2);
					$ref = $database->addAttack($from['wref'],0,0,0,0,0,0,0,0,0,0,1,3,0,0,0);
					$AttackArrivalTime = $data['endtime']; 
					$speeds = array();
					$speeds[] = $getHero['speed'];
					$endtime = $this->procDistanceTime($from,$to,min($speeds),1) + $AttackArrivalTime;
					$database->addMovement(4,$data['to'],$data['from'],$ref,'0,0,0,0,0',$endtime);
				}
				}else{
				if($getAdv['dif']==0){
					$exp = rand(0,40);
					$sgh = 1000;
				}else{
					$exp = rand(10,80);
					$sgh = 2000;
				}
				if($tribe==1){
					$tp = 100;
				}else{
					$tp = 80;
				}
				$health = round((3.007 / ((100+$tp*$getHero['power'])+$hero['itempower'])) * $sgh);
				
				if($helmet['proc'] == 1 && $helmet['type'] <= 3) $exp += $exp * (10 + $helmet['type'] * 5) / 100;
				$database->modifyHero2('experience', $exp, $ownerID, 1);
				$database->setMovementProc($data['moveid']);
				$database->editTableField('adventure', 'end', 1, 'wref', $data['to']);
				
				if(($getHero['health']-$health)<=0){
					$database->modifyHero2('dead', 1, $ownerID, 0);
					$database->modifyHero2('health', $health, $ownerID, 2);
					$database->addNotice($ownerID,$data['to'],$ally,9,''.addslashes($from['name']).' explores ('.addslashes($coor['x']).'|'.addslashes($coor['y']).')',''.$from['wref'].',dead,your hero did not survive the adventure.,,'.$health.','.$exp.'',$data['endtime']);
				}else{
					$amt = rand(300,1000);
					$database->addNotice($ownerID,$data['to'],$ally,9,''.addslashes($from['name']).' explores ('.addslashes($coor['x']).'|'.addslashes($coor['y']).')',''.$from['wref'].',17,0,'.$amt.','.$health.','.$exp.'',$data['endtime']);

					$database->modifyHero2('health', $health, $ownerID, 2);
					$database->updateUserField($ownerID, 'silver', $amt, 2);
					$ref = $database->addAttack($from['wref'],0,0,0,0,0,0,0,0,0,0,1,3,0,0,0);
					$AttackArrivalTime = $data['endtime']; 
					$speeds = array();
					$speeds[] = $getHero['speed'];
					$endtime = $this->procDistanceTime($from,$to,min($speeds),1) + $AttackArrivalTime;
					$database->addMovement(4,$data['to'],$data['from'],$ref,'0,0,0,0,0',$endtime);
				}
				}
				}else{
				if($getAdv['dif']==0){
					$exp = rand(0,40);
					$sgh = 1000;
				}else{
					$exp = rand(10,80);
					$sgh = 2000;
				}
				if($tribe==1){
					$tp = 100;
				}else{
					$tp = 80;
				}
				$health = round((3.007 / ((100+$tp*$getHero['power'])+$hero['itempower'])) * $sgh);
				
				if($helmet['proc'] == 1 && $helmet['type'] <= 3) $exp += $exp * (10 + $helmet['type'] * 5) / 100;
				$database->modifyHero2('experience', $exp, $ownerID, 1);
				$database->setMovementProc($data['moveid']);
				$database->editTableField('adventure', 'end', 1, 'wref', $data['to']);
				
				if(($getHero['health']-$health)<=0){
					$database->modifyHero2('dead', 1, $ownerID, 0);
					$database->modifyHero2('health', $health, $ownerID, 2);
					$database->addNotice($ownerID,$data['to'],$ally,9,''.addslashes($from['name']).' explores ('.addslashes($coor['x']).'|'.addslashes($coor['y']).')',''.$from['wref'].',dead,your hero did not survive the adventure.,,'.$health.','.$exp.'',$data['endtime']);
				}else{
					$unit = rand(1,6);
					if(($tribe != 3 && $unit < 4) or ($tribe == 3 && $unit < 3)){
					$amt = rand(20,40);
					}else if(($tribe != 3 && $unit == 4) or ($tribe == 3 && $unit == 3)){
					$amt = rand(10,20);
					}else{
					$amt = rand(5,10);
					}
					$database->addNotice($ownerID,$data['to'],$ally,9,''.addslashes($from['name']).' explores ('.addslashes($coor['x']).'|'.addslashes($coor['y']).')',''.$from['wref'].',16,'.$unit.','.$amt.','.$health.','.$exp.'',$data['endtime']);

					$database->modifyHero2('health', $health, $ownerID, 2);
					$ref = $database->addAttack($from['wref'],0,0,0,0,0,0,0,0,0,0,1,3,0,0,0);
					$AttackArrivalTime = $data['endtime']; 
					$speeds = array();
					$speeds[] = $getHero['speed'];
					$endtime = $this->procDistanceTime($from,$to,min($speeds),1) + $AttackArrivalTime;
					$database->addMovement(4,$data['to'],$data['from'],$ref,'0,0,0,0,0',$endtime);

					$ref = $database->addAttack($from['wref'],0,0,0,0,0,0,0,0,0,0,0,3,0,0,0);
					$database->modifyAttack2($ref, $unit, $amt);
					$speeds1 = array();
					$unitarray = $GLOBALS["u".(($tribe-1)*10+$unit)];
					$speeds1[] = $unitarray['speed'];
					$endtime = $this->procDistanceTime($from,$to,min($speeds1),1) + $AttackArrivalTime;
					$database->addMovement(4,$data['to'],$data['from'],$ref,'0,0,0,0,0',$endtime);
				}
				}
			}
			$q2 = "SELECT * FROM ".TB_PREFIX."adventure where time <= $time";
			$dataarray2 = $database->query_return($q2);
			foreach($dataarray2 as $data2) {
				$database->editTableField('adventure', 'end', 1, 'id', $data2['id']);
			}
			
			if(file_exists("GameEngine/Prevention/adventures.txt")) {
                unlink("GameEngine/Prevention/adventures.txt");
            }
    }
    
    private function researchComplete() {
	if(file_exists("GameEngine/Prevention/research.txt")) {
            unlink("GameEngine/Prevention/research.txt");
        }
        global $database;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."research where timestamp < $time";
        $dataarray = $database->query_return($q);
        foreach($dataarray as $data) {
            $sort_type = substr($data['tech'],0,1);
            switch($sort_type) {
                case "t":
                $q = "UPDATE ".TB_PREFIX."tdata set ".$data['tech']." = 1 where vref = ".$data['vref'];
                break;
                case "a":
                case "b":
                $q = "UPDATE ".TB_PREFIX."abdata set ".$data['tech']." = ".$data['tech']." + 1 where vref = ".$data['vref'];
                break;
            }
            $database->query($q);
            $q = "DELETE FROM ".TB_PREFIX."research where id = ".$data['id'];
            $database->query($q);
        }
		if(file_exists("GameEngine/Prevention/research.txt")) {
            unlink("GameEngine/Prevention/research.txt");
        }
    }
    
    private function updateRes($bountywid,$uid) {
        global $session;
        $this->bountyLoadTown($bountywid);
        $this->bountycalculateProduction($bountywid,$uid);
        $this->bountyprocessProduction($bountywid);
    }
    
    private function updateORes($bountywid) {
        global $session;
        $this->bountyLoadOTown($bountywid);
        $this->bountycalculateOProduction($bountywid);
        $this->bountyprocessOProduction($bountywid);
    }
    private function bountyLoadOTown($bountywid) {
        global $database,$session,$logging,$technology;
        $this->bountyOinfoarray = $database->getOasisV($bountywid);
        $this->bountyOresarray = $database->getResourceLevel($bountywid);
        $this->bountyOpop = 2;
        
    }
    private function bountyLoadTown($bountywid) {
        global $database,$session,$logging,$technology;
        $this->bountyinfoarray = $database->getVillage($bountywid);
        $this->bountyresarray = $database->getResourceLevel($bountywid);
        $this->bountyoasisowned = $database->getOasis($bountywid);
        $this->bountyocounter = $this->bountysortOasis();
        $this->bountypop = $this->bountyinfoarray['pop'];
        
        //$unitarray = $database->getUnit($bountywid);
        //if(count($unitarray) > 0) {
        //    for($i=1;$i<=50;$i++) {
        //        $this->bountyunitall['u'.$i] = $unitarray['u'.$i];
        //    }
        //}
        //$enforcearray = $database->getEnforceVillage($bountywid,0);
        //if(count($enforcearray) > 0) {
        //    foreach($enforcearray as $enforce) {
        //        for($i=1;$i<=50;$i++) {
        //            $this->bountyunitall['u'.$i] += $enforce['u'.$i];
        //        }
        //    }
        //}
    }
    
    private function bountysortOasis() {
        $crop = $clay = $wood = $iron = 0;
        foreach ($this->bountyoasisowned as $oasis) {
        switch($oasis['type']) {
                case 1:
				$wood += 1;
				break;
                case 2:
                $wood += 2;
                break;
                case 3:
                $wood += 1;
                $crop += 1;
                break;
                case 4:
				$clay += 1;
				break;
                case 5:
                $clay += 2;
                break;
                case 6:
                $clay += 1;
                $crop += 1;
                break;
                case 7:
				$iron += 1;
				break;
                case 8:
                $iron += 2;
                break;
                case 9:
                $iron += 1;
                $crop += 1;
                break;
                case 10:
                case 11:
                $crop += 1;
                break;
                case 12:
                $crop += 2;
                break;
            }
        }
        return array($wood,$clay,$iron,$crop);
    }
    
    function getAllUnits($base) {
        global $database;
        $ownunit = $database->getUnit($base);
        $enforcementarray = $database->getEnforceVillage($base,0);
        if(count($enforcementarray) > 0) {
            foreach($enforcementarray as $enforce) {
                for($i=1;$i<=50;$i++) {
                    $ownunit['u'.$i] += $enforce['u'.$i];
                }
					$ownunit['hero'] += $enforce['hero'];
            }
        }
        $movement = $database->getVillageMovement($base);
        if(!empty($movement)) {
            for($i=1;$i<=50;$i++) {
                $ownunit['u'.$i] += $movement['u'.$i];
            }
				$ownunit['hero'] += $movement['hero'];
        }
        return $ownunit;
    }    
    
	public function getUpkeep($array,$type,$vid=0,$prisoners=0) {
		global $database,$session,$village;
		if($vid==0) { $vid=$village->wid; }
		$buildarray = array();
		if($vid!=0){ $buildarray = $database->getResourceLevel($vid); }
		$upkeep = 0;
		$nocrop = 0;
		switch($type) {
			case 0:
			$start = 1;
			$end = 50;
			break;
			case 1:
			$start = 1;
			$end = 10;
			break;
			case 2:
			$start = 11;
			$end = 20;
			break;
			case 3:
			$start = 21;
			$end = 30;
			break;
			case 4:
			$start = 31;
			$end = 40;
			$nocrop = 1;
			break;
			case 5:
			$start = 41;
			$end = 50;
			break;
		}
		if($nocrop == 0){
		for($i=$start;$i<=$end;$i++) {
			$k = $i-$start+1;
			$unit = "u".$i;
			$unit2 = "t".$k;
			global $$unit;
			$dataarray = $$unit;
			for($j=19;$j<=38;$j++) {
			if($buildarray['f'.$j.'t'] == 41) {
			$horsedrinking = $j;
			}
			}
			if($prisoners == 0){
			if(isset($horsedrinking)){
			if(($i==4 && $buildarray['f'.$horsedrinking] >= 10)
			|| ($i==5 && $buildarray['f'.$horsedrinking] >= 15)
			|| ($i==6 && $buildarray['f'.$horsedrinking] == 20)) {
			$upkeep += ($dataarray['pop']-1) * $array[$unit];
			} else {
			$upkeep += $dataarray['pop'] * $array[$unit];
			}}else{
			$upkeep += $dataarray['pop'] * $array[$unit];
			}
			}else{
			if(isset($horsedrinking)){
			if(($i==4 && $buildarray['f'.$horsedrinking] >= 10)
			|| ($i==5 && $buildarray['f'.$horsedrinking] >= 15)
			|| ($i==6 && $buildarray['f'.$horsedrinking] == 20)) {
			$upkeep += ($dataarray['pop']-1) * $array[$unit2];
			} else {
			$upkeep += $dataarray['pop'] * $array[$unit2];
			}}else{
			$upkeep += $dataarray['pop'] * $array[$unit2];
			}
			}
		}
		 //   $unit = "hero";
		 //   global $$unit;
		 //   $dataarray = $$unit;
		 if($prisoners == 0){
			$upkeep += $array['hero'] * 6;
		 }else{
			$upkeep += $array['t11'] * 6;
		 }
		 }
		return $upkeep;
	}
	
	private function bountycalculateOProduction($bountywid) { 
        global $technology,$database;
        $this->bountyOproduction['wood'] = $this->bountyGetOWoodProd();
        $this->bountyOproduction['clay'] = $this->bountyGetOClayProd();
        $this->bountyOproduction['iron'] = $this->bountyGetOIronProd();
        $this->bountyOproduction['crop'] = $this->bountyGetOCropProd();
    }
    private function bountycalculateProduction($bountywid,$uid) { 
        global $technology,$database,$village,$session;
        $normalA = $database->getOwnArtefactInfoByType($bountywid,4);  
        $largeA = $database->getOwnUniqueArtefactInfo($uid,4,2);
        $uniqueA = $database->getOwnUniqueArtefactInfo($uid,4,3);
        $upkeep = $this->getUpkeep($this->getAllUnits($bountywid),0);
		$q = "SELECT * FROM ".TB_PREFIX."hero where uid = $session->uid";
        $heroData = $database->query_return($q);
		
		if($heroData['dead']==0 && $village->capital){
			$hwood = $heroData['r1'];
			$hclay = $heroData['r2'];
			$hiron = $heroData['r3'];
			$hcrop = $heroData['r4'];
			$hproduct = $heroData['r0'];
		}
		
        $this->bountyproduction['wood'] = $this->bountyGetWoodProd()+$hwood+$hproduct;
		$this->bountyproduction['clay'] = $this->bountyGetClayProd()+$hclay+$hproduct;
		$this->bountyproduction['iron'] = $this->bountyGetIronProd()+$hiron+$hproduct;
				
        if ($uniqueA['size']==3 && $uniqueA['owner']==$uid){
        $this->bountyproduction['crop'] = $this->bountyGetCropProd()-$this->bountypop-(($upkeep)-round($upkeep*0.50))+$hcrop+$hproduct;  
        
        }else if ($normalA['type']==4 && $normalA['size']==1 && $normalA['owner']==$uid){
        $this->bountyproduction['crop'] = $this->bountyGetCropProd()-$this->bountypop-(($upkeep)-round($upkeep*0.25))+$hcrop+$hproduct;
        
        }else if ($largeA['size']==2 && $largeA['owner']==$uid){
         $this->bountyproduction['crop'] = $this->bountyGetCropProd()-$this->bountypop-(($upkeep)-round($upkeep*0.25))+$hcrop+$hproduct;   
       
        }else{
        $this->bountyproduction['crop'] = $this->bountyGetCropProd()-$this->bountypop-$upkeep+$hcrop+$hproduct;   
    }
        }
    
    private function bountyprocessProduction($bountywid) {
        global $database;
        $timepast = time() - $this->bountyinfoarray['lastupdate'];
        $nwood = ($this->bountyproduction['wood'] / 3600) * $timepast;
        $nclay = ($this->bountyproduction['clay'] / 3600) * $timepast;
        $niron = ($this->bountyproduction['iron'] / 3600) * $timepast;
        $ncrop = ($this->bountyproduction['crop'] / 3600) * $timepast;
        $database->modifyResource($bountywid,$nwood,$nclay,$niron,$ncrop,1);
        $database->updateVillage($bountywid);
    }
    private function bountyprocessOProduction($bountywid) {
        global $database;
        $timepast = time() - $this->bountyOinfoarray['lastupdated'];
        $nwood = ($this->bountyOproduction['wood'] / 3600) * $timepast;
        $nclay = ($this->bountyOproduction['clay'] / 3600) * $timepast;
        $niron = ($this->bountyOproduction['iron'] / 3600) * $timepast;
        $ncrop = ($this->bountyOproduction['crop'] / 3600) * $timepast;
        $database->modifyOasisResource($bountywid,$nwood,$nclay,$niron,$ncrop,1);
        $database->updateOasis($bountywid);
    }
    
    private function bountyGetWoodProd() {
        global $bid1,$bid5,$session;
        $wood = $sawmill = 0;
        $woodholder = array();
        for($i=1;$i<=38;$i++) {
            if($this->bountyresarray['f'.$i.'t'] == 1) {
                array_push($woodholder,'f'.$i);
            }
            if($this->bountyresarray['f'.$i.'t'] == 5) {
                $sawmill = $this->bountyresarray['f'.$i];
            }
        }
        for($i=0;$i<=count($woodholder)-1;$i++) { $wood+= $bid1[$this->bountyresarray[$woodholder[$i]]]['prod']; }
        if($sawmill >= 1) {
            $wood += $wood /100 * $bid5[$sawmill]['attri'];
        }
        if($this->bountyocounter[0] != 0) {
            $wood += $wood*0.25*$this->bountyocounter[0];
        }
//        $wood += $wood*$this->bountyocounter[0]*0.25;
        $wood *= SPEED;
        return round($wood);
    }
	
    private function bountyGetOWoodProd() {
        global $session;
        $wood = 0;
        $wood += 40;
        $wood *= SPEED;
        return round($wood);
    }
    private function bountyGetOClayProd() {
        global $session;
        $clay = 0;
        $clay += 40;
        $clay *= SPEED;
        return round($clay);
    }
	private function bountyGetOIronProd() {
        global $session;
        $iron = 0;
        $iron += 40; 
        $iron *= SPEED;
        return round($iron);
    }
    
    private function bountyGetOCropProd() {
        global $session;
        $crop = 0;
        $crop += 40;
        $crop *= SPEED;
        return round($crop);
    }
    private function bountyGetClayProd() {
        global $bid2,$bid6,$session;
        $clay = $brick = 0;
        $clayholder = array();
        for($i=1;$i<=38;$i++) {
            if($this->bountyresarray['f'.$i.'t'] == 2) {
                array_push($clayholder,'f'.$i);
            }
            if($this->bountyresarray['f'.$i.'t'] == 6) {
                $brick = $this->bountyresarray['f'.$i];
            }
        }
        for($i=0;$i<=count($clayholder)-1;$i++) { $clay+= $bid2[$this->bountyresarray[$clayholder[$i]]]['prod']; }
        if($brick >= 1) {
            $clay += $clay /100 * $bid6[$brick]['attri'];
        }
        if($this->bountyocounter[1] != 0) {
            $clay += $clay*0.25*$this->bountyocounter[1];
        }
//        $clay += $clay*$this->bountyocounter[1]*0.25;
        $clay *= SPEED;
        return round($clay);
    }
    
    private function bountyGetIronProd() {
        global $bid3,$bid7,$session;
        $iron = $foundry = 0;
        $ironholder = array();
        for($i=1;$i<=38;$i++) {
            if($this->bountyresarray['f'.$i.'t'] == 3) {
                array_push($ironholder,'f'.$i);
            }
            if($this->bountyresarray['f'.$i.'t'] == 7) {
                $foundry = $this->bountyresarray['f'.$i];
            }
        }
        for($i=0;$i<=count($ironholder)-1;$i++) { $iron+= $bid3[$this->bountyresarray[$ironholder[$i]]]['prod']; }
        if($foundry >= 1) {
            $iron += $iron /100 * $bid7[$foundry]['attri'];
        }
        if($this->bountyocounter[2] != 0) {
            $iron += $iron*0.25*$this->bountyocounter[2];
        }
//        $iron += $iron*$this->bountyocounter[2]*0.25;
        $iron *= SPEED;
        return round($iron);
    }
    
    private function bountyGetCropProd() {
        global $bid4,$bid8,$bid9,$session;
        $crop = $grainmill = $bakery = 0;
        $cropholder = array();
        for($i=1;$i<=38;$i++) {
            if($this->bountyresarray['f'.$i.'t'] == 4) {
                array_push($cropholder,'f'.$i);
            }
            if($this->bountyresarray['f'.$i.'t'] == 8) {
                $grainmill = $this->bountyresarray['f'.$i];
            }
            if($this->bountyresarray['f'.$i.'t'] == 9) {
                $bakery = $this->bountyresarray['f'.$i];
            }
        }
        for($i=0;$i<=count($cropholder)-1;$i++) { $crop+= $bid4[$this->bountyresarray[$cropholder[$i]]]['prod']; }
        if($grainmill >= 1) {
            $crop += $crop /100 * $bid8[$grainmill]['attri'];
        }
        if($bakery >= 1) {
            $crop += $crop /100 * $bid9[$bakery]['attri'];
        }
        if($this->bountyocounter[3] != 0) {
            $crop += $crop*0.25*$this->bountyocounter[3];
        }
        
//        $crop += $crop*$this->bountyocounter[3]*0.25;
        $crop *= SPEED;
        return round($crop);
    }

	private function trainingComplete() {
	if(file_exists("GameEngine/Prevention/training.txt")) {
			unlink("GameEngine/Prevention/training.txt");
		}
		global $database;
		$time = time();
		$ourFileHandle = fopen("GameEngine/Prevention/training.txt", 'w');
		fclose($ourFileHandle);
		$trainlist = $database->getTrainingList();
		if(count($trainlist) > 0){
			foreach($trainlist as $train){
					$timepast = $train['timestamp2'] - $time;
					$pop = $train['pop'];
					if($timepast <= 0 && $train['amt'] > 0) {
					$timepast2 = $time - $train['timestamp2'];
					$trained = 1;
					while($timepast2 >= $train['eachtime']){
					$timepast2 -= $train['eachtime'];
					$trained += 1;
					}
					if($trained > $train['amt']){
					$trained = $train['amt'];
					}
					if($train['unit']>60 && $train['unit']!=99){
					$database->modifyUnit($train['vref'],$train['unit']-60,$trained,1);
					}else{
					$database->modifyUnit($train['vref'],$train['unit'],$trained,1);
					}
					$database->updateTraining($train['id'],$trained,$trained*$train['eachtime']);
					}
					$new_amt = $train['amt'] - $trained;
					if($new_amt == 0){
					$database->trainUnit($train['id'],0,0,0,0,1,1);
					}
				$crop = $database->getCropProdstarv($train['vref']);
				$unitarrays = $this->getAllUnits($train['vref']);
				$village = $database->getVillage($train['vref']);
				$upkeep = $village['pop'] + $this->getUpkeep($unitarrays, 0);
				if ($crop < $upkeep){
					// add starv data
					$database->setVillageField($train['vref'], 'starv', $upkeep);
					$database->setVillageField($train['vref'], 'starvupdate', $time);
				}
			}
		}
		if(file_exists("GameEngine/Prevention/training.txt")) {
			unlink("GameEngine/Prevention/training.txt");
		}
	}
    
    private function procDistanceTime($coor,$thiscoor,$ref,$mode) {
        global $bid14,$database,$generator;
        $resarray = $database->getResourceLevel($generator->getBaseID($coor['x'],$coor['y']));
        $xdistance = ABS($thiscoor['x'] - $coor['x']);
        if($xdistance > WORLD_MAX) {
            $xdistance = (2*WORLD_MAX+1) - $xdistance;
        }
        $ydistance = ABS($thiscoor['y'] - $coor['y']);
        if($ydistance > WORLD_MAX) {
            $ydistance = (2*WORLD_MAX+1) - $ydistance;
        }
        $distance = SQRT(POW($xdistance,2)+POW($ydistance,2));
        if(!$mode) {
        	if($ref == 1) {
            	$speed = 16;
        	}
        	else if($ref == 2) {
                $speed = 12;
            }
            else if($ref == 3) {
                $speed = 24;
            }
            else if($ref == 300) {
                $speed = 5;
            }
            else {
                $speed = 1;
            }
        }
        else {
            $speed = $ref;
			for($i=19;$i<=40;$i++){
			if($resarray['f'.$i.'t'] == 14){
			$ts_level = $resarray['f'.$i];
			$ts_attri = $bid14[$ts_level]['attri'];
			}
			}
            if($ts_attri > 0) {
                $speed = $distance <= TS_THRESHOLD ? $speed : $speed * ( ( TS_THRESHOLD + ( $distance - TS_THRESHOLD ) * $ts_attri / 100 ) / $distance ) ;
            }
        }
        
        return round(($distance/$speed) * 3600 / INCREASE_SPEED);

    }
    
    private function getsort_typeLevel($tid,$resarray) {
        global $village;
        $keyholder = array();
        foreach(array_keys($resarray,$tid) as $key) {
            if(strpos($key,'t')) { 
                $key = preg_replace("/[^0-9]/", '', $key);
                array_push($keyholder, $key);
            } 
        }
        $element = count($keyholder);
        if($element >= 2) {
            if($tid <= 4) {
                $temparray = array();
                for($i=0;$i<=$element-1;$i++) {
                    array_push($temparray,$resarray['f'.$keyholder[$i]]);
                }
                foreach ($temparray as $key => $val) {
                    if ($val == max($temparray)) 
                    $target = $key; 
                }
            }
            else {
                for($i=0;$i<=$element-1;$i++) {
                    //if($resarray['f'.$keyholder[$i]] != $this->getsort_typeMaxLevel($tid)) {
                    //    $target = $i;
                    //}
                }
            }
        }
        else if($element == 1) {
            $target = 0;
        }
        else {
            return 0;
        }
        if($keyholder[$target] != "") {
            return $resarray['f'.$keyholder[$target]];
        }
        else {
            return 0;
        }
    }
    
    private function celebrationComplete() {
	if(file_exists("GameEngine/Prevention/celebration.txt")) {
            unlink("GameEngine/Prevention/celebration.txt");
        }
        global $database;
        $varray = $database->getCel(); 
            foreach($varray as $vil){
                $id = $vil['wref'];
                $type = $vil['type'];
                $user = $vil['owner'];
                if($type == 1){$cp = 500;}else if($type == 2){$cp = 2000;}
                $database->clearCel($id);
                $database->setCelCp($user,$cp);
            }
		if(file_exists("GameEngine/Prevention/celebration.txt")) {
            unlink("GameEngine/Prevention/celebration.txt");
        }
    }
    
    private function demolitionComplete() {
	if(file_exists("GameEngine/Prevention/demolition.txt")) {
            unlink("GameEngine/Prevention/demolition.txt");
        }
        global $building,$database;
        $varray = $database->getDemolition();
        foreach($varray as $vil) {
            if ($vil['timetofinish'] <= time()) {
                $type = $database->getFieldType($vil['vref'],$vil['buildnumber']);
                $level = $database->getFieldLevel($vil['vref'],$vil['buildnumber']);
                $buildarray = $GLOBALS["bid".$type];
                if ($type==10 || $type==38) {
                    $q = "UPDATE `".TB_PREFIX."vdata` SET `maxstore`=`maxstore`-".$buildarray[$level]['attri']."+".max(0,$buildarray[$level-1]['attri'])." WHERE wref=".$vil['vref'];
                    $database->query($q);
                    $q = "UPDATE ".TB_PREFIX."vdata SET `maxstore`=".STORAGE_BASE." WHERE `maxstore`<= ".STORAGE_BASE." AND wref=".$vil['vref'];
                    $database->query($q);
                }
                if ($type==11 || $type==39) {
                    $q = "UPDATE `".TB_PREFIX."vdata` SET `maxcrop`=`maxcrop`-".$buildarray[$level]['attri']."+".max(0,$buildarray[$level-1]['attri'])." WHERE wref=".$vil['vref'];
                    $database->query($q);
                    $q = "UPDATE ".TB_PREFIX."vdata SET `maxcrop`=".STORAGE_BASE." WHERE `maxcrop`<=".STORAGE_BASE." AND wref=".$vil['vref'];
                    $database->query($q);
                }
				if($type==18) {
						$allyleader = $database->getVillageField($data['to'],"owner");
						$allyvillages = $database->getVillagesID2($allyleader);
						$allymax = 0;
						foreach($allyvillages as $allyvillage){
						$allyfield = $database->getResourceLevel($allyvillage['wref']);
						for($i=19;$i<=40;$i++){
						if($allyfield['f'.$i.'t'] == 18){
						$allylevel = $allyfield['f'.$i];
						$allyattri = $bid18[$allylevel]['attri'];
						}
						}
						if($allyattri > $allymax){
						$allymax = $allyattri;
						}
						}
						$q = "UPDATE ".TB_PREFIX."alidata set max = $allymax where leader = $allyleader";
						$database->query($q);
				}
                if ($level==1) { $clear=",f".$vil['buildnumber']."t=0"; } else { $clear=""; }
                $q = "UPDATE ".TB_PREFIX."fdata SET f".$vil['buildnumber']."=".($level-1).$clear." WHERE vref=".$vil['vref'];
                $database->query($q);
                $pop=$this->getPop($type,$level-1);
                $database->modifyPop($vil['vref'],$pop[0],1);
				$this->procClimbers($database->getVillageField($vil['vref'],'owner'));
                $database->delDemolition($vil['vref']);
            }
        }
		if(file_exists("GameEngine/Prevention/demolition.txt")) {
            unlink("GameEngine/Prevention/demolition.txt");
        }
    }
	
	private function updateHero(){
	if(file_exists("GameEngine/Prevention/updatehero.txt")) { 
            unlink("GameEngine/Prevention/updatehero.txt"); 
        }
		global $database,$session;
		$time = time();
		$q = "SELECT * FROM ".TB_PREFIX."hero where dead = 0";
		$harray = $database->query_return($q);
		if(!empty($harray)) {
	        foreach($harray as $hdata) {
				if($hdata['health']<100) {
						$health = $hdata['health']+$hdata['autoregen']*SPEED/86400*(time()-$hdata['lastupdate']);
						if($health > 100){
						$health = 100;
						}
						$database->modifyHero("health",$health,$hdata['heroid'],0);
						$database->modifyHero("lastupdate",time(),$hdata['heroid'],0);
				}
				$hero_levels = $GLOBALS["hero_levels"];
				if($hdata['experience']>=$hero_levels[$hdata['level']+1]){
					$database->modifyHero("level",1,$hdata['heroid'],1);
					$database->modifyHero("points",4,$hdata['heroid'],1);
				}
			}
		}
		$q = "SELECT * FROM ".TB_PREFIX."hero where dead = 1";
		$harray = $database->query_return($q);
		if(!empty($harray)) {
	        foreach($harray as $hdata) {
				$hero_levels = $GLOBALS["hero_levels"];
				if($hdata['experience']>=$hero_levels[$hdata['level']+1]){
					$database->modifyHero("level",1,$hdata['heroid'],1);
					$database->modifyHero("points",4,$hdata['heroid'],1);
				}
			}
		}
		$q2 = "SELECT * FROM ".TB_PREFIX."training where unit = 0";
		$dataarray2 = $database->query_return($q2);
		foreach($dataarray2 as $data3) {
			if($data3['eachtime']<=time()){
				$database->trainHero($data3['id'],0,1);
				$getVil = $database->getMInfo($data3['vref']);
				$database->modifyHero2('dead', 0, $getVil['owner'], 0);
    			$database->modifyHero2('health', 100, $getVil['owner'], 0);
    			$database->editTableField('units', 'hero', 1, 'vref', $data3['vref']);
			}
		}
		$q2 = "SELECT * FROM ".TB_PREFIX."units where hero > 1";
		$dataarray2 = $database->query_return($q2);
		foreach($dataarray2 as $data3) {
    		$database->editTableField('units', 'hero', 1, 'vref', $data3['vref']);
		}
		if(file_exists("GameEngine/Prevention/updatehero.txt")) {
			unlink("GameEngine/Prevention/updatehero.txt");
		}
				
	}
	
	private function auctionComplete() {
		if(file_exists("GameEngine/Prevention/auction.txt")) { 
            unlink("GameEngine/Prevention/auction.txt"); 
        }
		global $database;
        $time = time();
        $q = "SELECT * FROM ".TB_PREFIX."auction where finish = 0 and time < $time";
        $dataarray = $database->query_return($q);
            foreach($dataarray as $data) {
					$ownerID = $data['owner'];$biderID = $data['uid'];
					$silver = $data['silver'];$newsilver = $data['newsilver'];
					$btype = $data['btype'];
                    if($data['finish'] != 1){
						if($btype==7 || $btype==8 || $btype==9 || $btype==10 || $btype==11 || $btype==14 || $btype==15){
							if($database->checkHeroItem($biderID, $btype)){
								$database->editHeroNum($database->getHeroItemID($biderID, $btype), $data['num'], 1);
							}else{
								$database->addHeroItem($biderID, $data['btype'], $data['type'], $data['num']);
							}
						}else{
							$database->addHeroItem($biderID, $data['btype'], $data['type'], $data['num']);
						}
						$silver2 = $newsilver - $silver;
						$database->setSilver($ownerID, $silver, 1);
						$database->setSilver($biderID, $silver2, 1);
                    }
			$q = "UPDATE ".TB_PREFIX."auction set finish=1 where id = ".$data['id'];
			$database->query($q);
            }
		if(file_exists("GameEngine/Prevention/auction.txt")) {
        	unlink("GameEngine/Prevention/auction.txt");
        }
    }

	private function addAdventures() {
		global $database;
        $time = time();
		$adv_time = 86400 / ADVENTURE_SPEED;
        $q = "SELECT * FROM ".TB_PREFIX."hero where $time - lastadv > $adv_time";
        $dataarray = $database->query_return($q);
            foreach($dataarray as $data) {
			$database->addAdventure($database->getVFH($data['uid']), $data['uid']);
			$database->modifyHero('lastadv', $time, $data['heroid']);
            }
    }
	
	private function MasterBuilder() {
		global $database;
		$q = "SELECT * FROM ".TB_PREFIX."bdata WHERE master = 1";
		$array = $database->query_return($q);
		foreach($array as $master) {
		$owner = $database->getVillageField($master['wid'],'owner');
		$tribe = $database->getUserField($owner,'tribe',0);
		$villwood = $database->getVillageField($master['wid'],'wood');
		$villclay = $database->getVillageField($master['wid'],'clay');
		$villiron = $database->getVillageField($master['wid'],'iron');
		$villcrop = $database->getVillageField($master['wid'],'crop');
		$type = $master['type'];
		$level = $master['level'];
		$buildarray = $GLOBALS["bid".$type];
		$buildwood = $buildarray[$level]['wood'];
		$buildclay = $buildarray[$level]['clay'];
		$buildiron = $buildarray[$level]['iron'];
		$buildcrop = $buildarray[$level]['crop'];
		$ww = count($database->getBuildingByType($master['wid'],40));
		if($tribe == 1){
		if($master['field'] < 19){
		$bdata = count($database->getDorf1Building($master['wid']));
		$bbdata = count($database->getDorf2Building($master['wid']));
		$bdata1 = $database->getDorf1Building($master['wid']);
		}else{
		$bdata = count($database->getDorf2Building($master['wid']));
		$bbdata = count($database->getDorf1Building($master['wid']));
		$bdata1 = $database->getDorf2Building($master['wid']);
		}
		}else{
		$bdata = $bbdata = $bdata1 = count($database->getDorf1Building($master['wid'])) + count($database->getDorf2Building($master['wid']));
		}
		if($database->getUserField($owner,'plus',0) > time() or $ww > 0){
		if($bbdata < 2){
		$inbuild = 2;
		}else{
		$inbuild = 1;
		}
		}else{
		$inbuild = 1;
		}
		$usergold = $database->getUserField($owner,'gold',0);
		if($bdata < $inbuild && $buildwood < $villwood && $buildclay < $villclay && $buildiron < $villiron && $buildcrop < $villcrop && $usergold > 0){
		$time = $master['timestamp']+time();
		if(!empty($bdata1)){
		foreach($bdata1 as $master1) {
		$time += ($master1['timestamp']-time());
		}
		}
		if($bdata == 0){
		$database->updateBuildingWithMaster($master['id'],$time,0);
		}else{
		$database->updateBuildingWithMaster($master['id'],$time,1);
		}
		$gold = $usergold-1;
		$database->updateUserField($owner,'gold',$gold,1);
		$database->modifyResource($master['wid'],$buildwood,$buildclay,$buildiron,$buildcrop,0);
		}
		}
	}
	
	private function starvation() {
	if(file_exists("GameEngine/Prevention/starvation.txt")) {
			unlink("GameEngine/Prevention/starvation.txt");
		}
		global $database;
		$ourFileHandle = fopen("GameEngine/Prevention/starvation.txt", 'w');
		fclose($ourFileHandle);
		$starvupkeep = array(

			'1'=>1,
			'2'=>1,
			'3'=>1,
			'4'=>2,
			'5'=>3,
			'6'=>4,
			'7'=>3,
			'8'=>6,
			'9'=>5,
			'10'=>1,
			'11'=>1,
			'12'=>1,
			'13'=>1,
			'14'=>1,
			'15'=>2,
			'16'=>3,
			'17'=>6,
			'18'=>4,
			'19'=>1,
			'20'=>1,
			'21'=>1,
			'22'=>1,
			'23'=>2,
			'24'=>2,
			'25'=>2,
			'26'=>3,
			'27'=>3,
			'28'=>6,
			'29'=>4,
			'30'=>1,
			'31'=>1,
			'32'=>1,
			'33'=>1,
			'34'=>2,
			'35'=>2,
			'36'=>3,
			'37'=>3,
			'38'=>3,
			'39'=>3,
			'40'=>5,
			'41'=>1,
			'42'=>1,
			'43'=>1,
			'44'=>1,
			'45'=>2,
			'46'=>3,
			'47'=>6,
			'48'=>5,
			'49'=>1,
			'50'=>1,
			'hero'=>6
		);

		$time = time();

		// load villages with minus prod
		$starvarray = array();
		$starvarray = $database->getStarvation();
		foreach ($starvarray as $starv){
		$unitarrays = $this->getAllUnits($starv['wref']);
		$upkeep = $starv['pop'] + $this->getUpkeep($unitarrays, 0);
			if (($starv['starvupdate']+600) < $time){
				// get enforce
				$enforcearray = $database->getEnforceVillage($starv['wref'],0);
				$maxcount = 0;
				if(count($enforcearray)==0){
					// get units
					$unitarray = $database->getUnit($starv['wref']);
					for($i = 0 ; $i <= 50 ; $i++){
						$units = $unitarray['u'.$i];
						if($unitarray['u'.$i] > $maxcount){
							$maxcount = $unitarray['u'.$i];
							$maxtype = $i;
						}
						$totalunits += $unitarray['u'.$i];
					}
					if($totalunits == 0){
					$maxcount = $unitarray['hero'];
					$maxtype = "hero";
					}
				}else{
					foreach ($enforcearray as $enforce){
						for($i = 0 ; $i <= 50 ; $i++){
							$units = $enforce['u'.$i];
							if($enforce['u'.$i] > $maxcount){
								$maxcount = $enforce['u'.$i];
								$maxtype = $i;
								$enf = $enforce['id'];
							}
							$totalunits += $enforce['u'.$i];
							}
					if($totalunits == 0){
					$maxcount = $enforce['hero'];
					$maxtype = "hero";
					}
					}
					}

				// counting

				$timedif = $time-$starv['starvupdate'];

				$starvsec = ($starv['starv']/3600);

				$difcrop = ($timedif*$starvsec);
				$newcrop = 0;
				$oldcrop = $database->getVillageField($starv['wref'], 'crop');
				if ($oldcrop > 100){
					$difcrop = $difcrop-$oldcrop;
					if($difcrop < 0){
						$difcrop = 0;
						$newcrop = $oldcrop-$difcrop;
						$database->setVillageField($starv['wref'], 'crop', $newcrop);
					}
				}
				if($difcrop > 0){
					$killunits = floor($difcrop/18000);
					if($killunits > 0){
					if (isset($enf)){
						if($killunits < $maxcount){
							$database->modifyEnforce($enf, $maxtype, $killunits, 0);
							$database->setVillageField($starv['wref'], 'starv', $upkeep);
							$database->setVillageField($starv['wref'], 'starvupdate', $time);
						}else{
							$database->deleteReinf($enf);
							$database->setVillageField($starv['wref'], 'starv', $upkeep);
							$database->setVillageField($starv['wref'], 'starvupdate', $time);
						}
					}else{
						if($killunits < $maxcount){
							$database->modifyUnit($starv['wref'], array($maxtype), array($killunits), array(0));
							$database->setVillageField($starv['wref'], 'starv', $upkeep);
							$database->setVillageField($starv['wref'], 'starvupdate', $time);
						}elseif($killunits > $maxcount){
							$killunits = $maxcount;
							$database->modifyUnit($starv['wref'], array($maxtype), array($killunits), array(0));
							$database->setVillageField($starv['wref'], 'starv', $upkeep);
							$database->setVillageField($starv['wref'], 'starvupdate', $time);
						}
					}
					}
				}
			}
				$crop = $database->getCropProdstarv($starv['wref']);
				if ($crop > $upkeep){
					$database->setVillageField($starv['wref'], 'starv', 0);
					$database->setVillageField($starv['wref'], 'starvupdate', 0);
				}

			unset ($starv,$unitarrays,$enforcearray,$enforce,$starvarray);
		}

		if(file_exists("GameEngine/Prevention/starvation.txt")) {
			unlink("GameEngine/Prevention/starvation.txt");
		}
	}

 // by SlimShady95, aka Manuel Mannhardt < manuel_mannhardt@web.de > UPDATED FROM songeriux < haroldas.snei@gmail.com >
	private function updateStore() {
		global $bid10, $bid38, $bid11, $bid39;

		$result = mysql_query('SELECT * FROM `' . TB_PREFIX . 'fdata`');
		while ($row = mysql_fetch_assoc($result))
		{
			$ress = $crop = 0;
			for ($i = 19; $i < 40; ++$i)
			{
				if ($row['f' . $i . 't'] == 10)
				{
					$ress += $bid10[$row['f' . $i]]['attri'] * STORAGE_MULTIPLIER;
				}

				if ($row['f' . $i . 't'] == 38)
				{
					$ress += $bid38[$row['f' . $i]]['attri'] * STORAGE_MULTIPLIER;
				}



				if ($row['f' . $i . 't'] == 11)
				{
					$crop += $bid11[$row['f' . $i]]['attri'] * STORAGE_MULTIPLIER;
				}

				if ($row['f' . $i . 't'] == 39)
				{
					$crop += $bid39[$row['f' . $i]]['attri'] * STORAGE_MULTIPLIER;
				}
			}

			if ($ress == 0)
			{
				$ress = 800 * STORAGE_MULTIPLIER;
			}

			if ($crop == 0)
			{
				$crop = 800 * STORAGE_MULTIPLIER;
			}

			mysql_query('UPDATE `' . TB_PREFIX . 'vdata` SET `maxstore` = ' . $ress . ', `maxcrop` = ' . $crop . ' WHERE `wref` = ' . $row['vref']) or die(mysql_error());
		}
	}
	
	private function oasisResourcesProduce() {
		global $database;
		$time = time();
		$q = "SELECT * FROM ".TB_PREFIX."odata WHERE wood < 800 OR clay < 800 OR iron < 800 OR crop < 800";
		$array = $database->query_return($q);
		foreach($array as $getoasis) {
		$oasiswood = $getoasis['wood'] + (8*SPEED/3600)*(time()-$getoasis['lastupdated']);
		$oasisclay = $getoasis['clay'] + (8*SPEED/3600)*(time()-$getoasis['lastupdated']);
		$oasisiron = $getoasis['iron'] + (8*SPEED/3600)*(time()-$getoasis['lastupdated']);
		$oasiscrop = $getoasis['crop'] + (8*SPEED/3600)*(time()-$getoasis['lastupdated']);
		if($oasiswood > $getoasis['maxstore']){
		$oasiswood = $getoasis['maxstore'];
		}
		if($oasisclay > $getoasis['maxstore']){
		$oasisclay = $getoasis['maxstore'];
		}
		if($oasisiron > $getoasis['maxstore']){
		$oasisiron = $getoasis['maxstore'];
		}
		if($oasiscrop > $getoasis['maxcrop']){
		$oasiscrop = $getoasis['maxcrop'];
		}
		$q = "UPDATE " . TB_PREFIX . "odata set wood = $oasiswood, clay = $oasisclay, iron = $oasisiron, crop = $oasiscrop where wref = ".$getoasis['wref']."";
		$database->query($q);
		$database->updateOasis($getoasis['wref']);
		}
	}

	private function procNewClimbers() {
		if(file_exists("GameEngine/Prevention/climbers.txt")) {
			unlink("GameEngine/Prevention/climbers.txt");
		}
			global $database, $ranking;
					$users = "SELECT * FROM " . TB_PREFIX . "users WHERE access < " . (INCLUDE_ADMIN ? "10" : "8") . " and tribe <= 3";
					if(mysql_num_rows(mysql_query($users)) > 0){
					$q = "SELECT * FROM ".TB_PREFIX."medal order by week DESC LIMIT 0, 1";
					$result = mysql_query($q);
					if(mysql_num_rows($result)) {
						$row=mysql_fetch_assoc($result);
						$week=($row['week']+1);
					} else {
						$week='1';
					}
					$q = "SELECT * FROM ".TB_PREFIX."users where oldrank = 0 and id > 4";
					$array = $database->query_return($q);
					foreach($array as $user){
					$newrank = $ranking->getUserRank($user['id']);
					if($week > 1){
							for($i=$newrank;$i<=mysql_num_rows(mysql_query($users));$i++) {
							$q2 = mysql_query("SELECT * FROM ".TB_PREFIX."users where oldrank = ".$i);
							$climber2 = mysql_fetch_array($q2);
							$oldrank = $ranking->getUserRank($climber2['id']);
							$totalpoints = $oldrank - $climber2['oldrank'];
							$database->removeclimberrankpop($climber2['id'], $totalpoints);
							$database->updateoldrank($climber2['id'], $oldrank);
							}
							$database->updateoldrank($user['id'], $newrank);
					}else{
							$totalpoints = mysql_num_rows(mysql_query($users)) - $newrank;
							$database->setclimberrankpop($user['id'], $totalpoints+1);
							$database->updateoldrank($user['id'], $newrank);
							for($i=1;$i<=$newrank;$i++){
							$q2 = mysql_query("SELECT * FROM ".TB_PREFIX."users where oldrank = ".$i);
							$climber2 = mysql_fetch_array($q2);
							$oldrank = $ranking->getUserRank($climber2['id']);
							$totalpoints = mysql_num_rows(mysql_query($users)) - $oldrank;
							$database->setclimberrankpop($climber2['id'], $totalpoints+1);
							$database->updateoldrank($climber2['id'], $oldrank);
							}
							for($i=$newrank;$i<mysql_num_rows(mysql_query($users));$i++){
							$q2 = mysql_query("SELECT * FROM ".TB_PREFIX."users where oldrank = ".$i);
							$climber2 = mysql_fetch_array($q2);
							$oldrank = $ranking->getUserRank($climber2['id']);
							$totalpoints = mysql_num_rows(mysql_query($users)) - $oldrank;
							$database->setclimberrankpop($climber2['id'], $totalpoints+1);
							$database->updateoldrank($climber2['id'], $oldrank);
							}
					}
					}
					}
		if(file_exists("GameEngine/Prevention/climbers.txt")) {
			unlink("GameEngine/Prevention/climbers.txt");
		}
	}

	private function procClimbers($uid) {
			global $database, $ranking;
					$users = "SELECT * FROM " . TB_PREFIX . "users WHERE access < " . (INCLUDE_ADMIN ? "10" : "8") . " and tribe <= 3";
					$climber = $database->getUserArray($uid,1);
					if(mysql_num_rows(mysql_query($users)) > 0){
					$q = "SELECT * FROM ".TB_PREFIX."medal order by week DESC LIMIT 0, 1";
					$result = mysql_query($q);
					if(mysql_num_rows($result)) {
						$row=mysql_fetch_assoc($result);
						$week=($row['week']+1);
					} else {
						$week='1';
					}
					$myrank = $ranking->getUserRank($uid);
					if($climber['oldrank'] > $myrank){
					for($i=$myrank;$i<=$climber['oldrank'];$i++) {
					$q2 = mysql_query("SELECT * FROM ".TB_PREFIX."users where oldrank = ".$i);
					$climber2 = mysql_fetch_array($q2);
					$oldrank = $ranking->getUserRank($climber2['id']);
					if($week > 1){
							$totalpoints = $oldrank - $climber2['oldrank'];
							$database->removeclimberrankpop($climber2['id'], $totalpoints);
							$database->updateoldrank($climber2['id'], $oldrank);
					}else{
							$totalpoints = mysql_num_rows(mysql_query($users)) - $oldrank;
							$database->setclimberrankpop($climber2['id'], $totalpoints);
							$database->updateoldrank($climber2['id'], $oldrank);
					}
					}
					if($week > 1){
							$totalpoints = $climbers[$myrank]['oldrank'] - $myrank;
							$database->addclimberrankpop($climbers[$myrank]['id'], $totalpoints);
							$database->updateoldrank($climbers[$myrank]['id'], $myrank);
					}else{
							$totalpoints = mysql_num_rows(mysql_query($users)) - $myrank;
							$database->setclimberrankpop($climbers[$myrank]['id'], $totalpoints);
							$database->updateoldrank($climbers[$myrank]['id'], $myrank);
					}
					}else if($climber['oldrank'] < $myrank){
					for($i=$climber['oldrank'];$i<=$myrank;$i++) {
					$q2 = mysql_query("SELECT * FROM ".TB_PREFIX."users where oldrank = ".$i);
					$climber2 = mysql_fetch_array($q2);
					$oldrank = $ranking->getUserRank($climber2['id']);
					if($week > 1){
							$totalpoints = $climber2['oldrank'] - $oldrank;
							$database->addclimberrankpop($climber2['id'], $totalpoints);
							$database->updateoldrank($climber2['id'], $oldrank);
					}else{
							$totalpoints = mysql_num_rows(mysql_query($users)) - $oldrank;
							$database->setclimberrankpop($climber2['id'], $totalpoints);
							$database->updateoldrank($climber2['id'], $oldrank);
					}
					}
					if($week > 1){
							$totalpoints = $myrank - $climbers[$myrank-1]['oldrank'];
							$database->removeclimberrankpop($climbers[$myrank-1]['id'], $totalpoints);
							$database->updateoldrank($climbers[$myrank-1]['id'], $myrank);
					}else{
							$totalpoints = mysql_num_rows(mysql_query($users)) - $myrank;
							$database->setclimberrankpop($climbers[$myrank-1]['id'], $totalpoints);
							$database->updateoldrank($climbers[$myrank-1]['id'], $myrank);
					}
					}
					}
					$aid = $database->getUserField($uid,"alliance",0);
					if(mysql_num_rows(mysql_query($users)) > 0 && $aid != 0){
					$ally = $database->getAlliance($aid);
					$memberlist = $database->getAllMember($ally['id']);
					$oldrank = 0;
					foreach($memberlist as $member) {
						$oldrank += $database->getVSumField($member['id'],"pop");
					}
					if($ally['oldrank'] != $oldrank){
						if($ally['oldrank'] < $oldrank) {
							$totalpoints = $oldrank - $ally['oldrank'];
							$database->addclimberrankpopAlly($ally['id'], $totalpoints);
							$database->updateoldrankAlly($ally['id'], $oldrank);
						} else
							if($ally['oldrank'] > $oldrank) {
								$totalpoints = $ally['oldrank'] - $oldrank;
								$database->removeclimberrankpopAlly($ally['id'], $totalpoints);
								$database->updateoldrankAlly($ally['id'], $oldrank);
							}
					}
					}
	}
	
	private function regenerateOasisTroops() {
		global $database;
		$time = time();
		$q = "SELECT * FROM " . TB_PREFIX . "odata where conqured = 0 and $time - lastupdated2 > 86400";
		$array = $database->query_return($q);
		foreach($array as $oasis) {
			$database->populateOasisUnitsLow2($oasis['wref']);
			$database->updateOasis2($oasis['wref']);
		}
	}

}

$automation = new Automation;
?>