<?php
        class Ranking {
			
			public function getUserRank($uid) {
        		$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, (

				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY totalpop DESC, userid DESC";
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			public function getUserAttRank($uid) {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.apall apall
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY apall DESC, userid DESC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			public function getUserDefRank($uid) {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.dpall dpall
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY dpall DESC, userid DESC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			public function getAllianceRank($id) {
				$this->procAllianceRanking();
				while(1) {
					if(count($this->rankarray) > 1) {
						$key = key($this->rankarray);
						if($this->rankarray[$key]["id"] == $id) {
							return $key;
							break;
						} else {
							if(!next($this->rankarray)) {
								return false;
								break;
							}
						}
					} else {
						return 1;
					}
				}
        	}
			
			public function getAllianceAttRank($id) {
				$this->procAllianceAttRanking();
				while(1) {
					if(count($this->rankarray) > 1) {
						$key = key($this->rankarray);
						if($this->rankarray[$key]["id"] == $id) {
							return $key;
							break;
						} else {
							if(!next($this->rankarray)) {
								return false;
								break;
							}
						}
					} else {
						return 1;
					}
				}
        	}
			
			public function getAllianceDefRank($id) {
				$this->procAllianceDefRanking();
				while(1) {
					if(count($this->rankarray) > 1) {
						$key = key($this->rankarray);
						if($this->rankarray[$key]["id"] == $id) {
							return $key;
							break;
						} else {
							if(!next($this->rankarray)) {
								return false;
								break;
							}
						}
					} else {
						return 1;
					}
				}
        	}
			
			
			
			
			public function procUsersRanking($limit="") {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.oldrank oldrank, " . TB_PREFIX . "users.alliance alliance, (
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop, (

				SELECT SUM( " . TB_PREFIX . "users.RR ) 
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id = userid
				)totalraid, (
				
				SELECT COUNT( " . TB_PREFIX . "vdata.wref ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalvillages, (
		
				SELECT " . TB_PREFIX . "alidata.tag
				FROM " . TB_PREFIX . "alidata, " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "alidata.id = " . TB_PREFIX . "users.alliance
				AND " . TB_PREFIX . "users.id = userid
				)allitag
					
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY totalpop DESC, totalraid DESC, userid DESC $limit";
				return mysql_query($q);
			}
						
			public function procUsersAttRanking($limit="") {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.apall apall, (
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop, (
					
				SELECT COUNT( " . TB_PREFIX . "vdata.wref ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalvillages
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY apall DESC, userid DESC $limit";
				return mysql_query($q);
			}
			
			
			public function procUsersDefRanking($limit="") {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.dpall dpall, (
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop, (
						
				SELECT COUNT( " . TB_PREFIX . "vdata.wref ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalvillages
					
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY dpall DESC, userid DESC $limit";
				return mysql_query($q);
			}
						
			
			
			
			
			public function procAllianceRanking($limit="") {
				global $database, $multisort;
				$array = $database->getARanking($limit);
				$holder = array();

				foreach($array as $value) {
					$memberlist = $database->getAllMember($value['id']);
					$totalpop = 0;
					foreach($memberlist as $member) {
						$totalpop += $database->getVSumField($member['id'], "pop");
					}
					$value['players'] = count($memberlist);
					$value['totalpop'] = $totalpop;
					if(!isset($value['avg'])) {
						$value['avg'] = @round($totalpop / count($memberlist));
					} else {
						$value['avg'] = 0;
					}

					array_push($holder, $value);
				}
				$holder = $multisort->sorte($holder, "'totalpop'", false, 2);
				$newholder = array("pad");
				foreach($holder as $key) {
					array_push($newholder, $key);
				}
				$this->rankarray = $newholder;
			}
			
			
			public function procAllianceAttRanking($limit="") {
				global $database, $multisort;
				$array = $database->getARanking($limit);
				$holder = array();
				foreach($array as $value) {
					$memberlist = $database->getAllMember($value['id']);
					$totalap = $value['Aap'];
					$value['players'] = count($memberlist);
					$value['totalap'] = $totalap;
					if($value['avg'] > 0) {
						$value['avg'] = round($totalap / count($memberlist));
					} else {
						$value['avg'] = 0;
					}

					array_push($holder, $value);
				}
				$holder = $multisort->sorte($holder, "'totalap'", false, 2);
				$newholder = array("pad");
				foreach($holder as $key) {
					array_push($newholder, $key);
				}
				$this->rankarray = $newholder;
			}
			
			public function procAllianceDefRanking($limit="") {
				global $database, $multisort;
				$array = $database->getARanking($limit);
				$holder = array();
				foreach($array as $value) {
					$memberlist = $database->getAllMember($value['id']);
					$totaldp = $value['Adp'];
					$value['players'] = count($memberlist);
					$value['totaldp'] = $totaldp;
					if($value['avg'] > 0) {
						$value['avg'] = round($totaldp / count($memberlist));
					} else {
						$value['avg'] = 0;
					}

					array_push($holder, $value);
				}
				$holder = $multisort->sorte($holder, "'totaldp'", false, 2);
				$newholder = array("pad");
				foreach($holder as $key) {
					array_push($newholder, $key);
				}
				$this->rankarray = $newholder;
			}
						
			public function getATop10AttRank($id) {
				$q = "SELECT " . TB_PREFIX . "alidata.id allyid, " . TB_PREFIX . "alidata.ap ap
				FROM " . TB_PREFIX . "alidata
				WHERE " . TB_PREFIX . "alidata.id > 0
				ORDER BY ap DESC, allyid ASC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['allyid'] == $id){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			
			public function getATop10DefRank($id) {
				$q = "SELECT " . TB_PREFIX . "alidata.id allyid, " . TB_PREFIX . "alidata.dp dp
				FROM " . TB_PREFIX . "alidata
				WHERE " . TB_PREFIX . "alidata.id > 0
				ORDER BY dp DESC, allyid ASC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['allyid'] == $id){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			
			public function getATop10ClpRank($id) {
				$q = "SELECT " . TB_PREFIX . "alidata.id allyid, " . TB_PREFIX . "alidata.clp clp
				FROM " . TB_PREFIX . "alidata
				WHERE " . TB_PREFIX . "alidata.id > 0
				ORDER BY clp DESC, allyid ASC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['allyid'] == $id){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			public function getATop10RobbersRank($id) {
				$q = "SELECT " . TB_PREFIX . "alidata.id allyid, " . TB_PREFIX . "alidata.RR RR
				FROM " . TB_PREFIX . "alidata
				WHERE " . TB_PREFIX . "alidata.id > 0
				ORDER BY RR DESC, allyid ASC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['allyid'] == $id){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			
			
			
			
			public function getVillageRank($wid) {
        		$q = "SELECT * FROM ".TB_PREFIX."vdata WHERE wref != 0 AND owner != 2 ORDER BY pop DESC, owner DESC, lastupdate DESC";
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['wref'] == $wid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			public function procVillagesRanking($limit="") {				
				$q = "SELECT * FROM ".TB_PREFIX."vdata WHERE wref != 0 AND owner != 2 ORDER BY pop DESC, owner DESC, lastupdate DESC $limit";
				return mysql_query($q);
			}
			
			
			
			
			
			public function getHeroRank($uid) {
        		$q = "SELECT " . TB_PREFIX . "users.id userid, (
				
				SELECT SUM( " . TB_PREFIX . "hero.experience ) 
				FROM " . TB_PREFIX . "hero
				WHERE " . TB_PREFIX . "hero.uid = userid
				)experience, (
				
				SELECT SUM( " . TB_PREFIX . "hero.level ) 
				FROM " . TB_PREFIX . "hero
				WHERE " . TB_PREFIX . "hero.uid = userid
				)hlevel, (
				
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalpop
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY experience DESC, totalpop ASC, userid DESC";
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			public function procHeroesRanking($limit="") {
				$q = "SELECT " . TB_PREFIX . "users.id userid, (
				
				SELECT SUM( " . TB_PREFIX . "hero.experience ) 
				FROM " . TB_PREFIX . "hero
				WHERE " . TB_PREFIX . "hero.uid = userid
				)experience, (
				
				SELECT SUM( " . TB_PREFIX . "hero.level ) 
				FROM " . TB_PREFIX . "hero
				WHERE " . TB_PREFIX . "hero.uid = userid
				)hlevel, (
				
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalpop
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY experience DESC, totalpop ASC, userid DESC $limit";
				
				return mysql_query($q);
			}



			
			public function getTop10AttRank($uid) {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.ap ap, (
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop, (
					
				SELECT COUNT( " . TB_PREFIX . "vdata.wref ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalvillages
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY ap DESC, userid DESC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			
			public function getTop10DefRank($uid) {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.dp dp, (
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop, (
					
				SELECT COUNT( " . TB_PREFIX . "vdata.wref ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalvillages
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY dp DESC, userid DESC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			
			public function getTop10ClpRank($uid) {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.clp clp, (
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop, (
					
				SELECT COUNT( " . TB_PREFIX . "vdata.wref ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalvillages
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4
				ORDER BY clp DESC, userid DESC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
			
			public function getTop10RobbersRank($uid) {
				$q = "SELECT " . TB_PREFIX . "users.id userid, " . TB_PREFIX . "users.username username, " . TB_PREFIX . "users.RR RR, (
				SELECT SUM( " . TB_PREFIX . "vdata.pop ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid
				)totalpop, (
					
				SELECT COUNT( " . TB_PREFIX . "vdata.wref ) 
				FROM " . TB_PREFIX . "vdata
				WHERE " . TB_PREFIX . "vdata.owner = userid AND type != 99
				)totalvillages
				
				FROM " . TB_PREFIX . "users
				WHERE " . TB_PREFIX . "users.id > 4 AND RR >= 0
				ORDER BY RR DESC, userid DESC";
					
				$result = mysql_query($q);
				$i = 1;
				$myrank = 0;
				while($row = mysql_fetch_array($result)) {
					if($row['userid'] == $uid){
						$myrank = $i;
					}
					$i++;
				}
				return $myrank;
        	}
        }
        ;

        $ranking = new Ranking;

?>