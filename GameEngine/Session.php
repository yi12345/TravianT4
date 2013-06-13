<?php
ob_start(); //this is enough 
        if(!file_exists('GameEngine/config.php') && !file_exists('GameEngine/Database/connection.php')) {
        	header("Location: install/");
        }
        
        include ("Database/connection.php");
        include ("config.php");
        include ("Database.php");
		include ("Data/buidata.php");
        include ("Data/cp.php");
        include ("Data/cel.php");
        include ("Data/resdata.php");
        include ("Data/unitdata.php");
        include ("Data/hero_full.php");
        include ("Mailer.php");
        include ("Battle.php");
        include ("Form.php");
        include ("Generator.php");
		include ("Multisort.php");
		include ("Ranking.php");
        include ("Automation.php");
        include ("Lang/" . LANG . ".php");
        include ("Logging.php");
        include ("Message.php");
        include ("Alliance.php");
        include ("Profile.php");
        include ("Protection.php");


        class Session {

        	private $time;
        	var $logged_in = false;
        	var $referrer, $url;
        	var $username, $uid, $access, $plus, $tribe, $isAdmin, $alliance, $gold, $oldrank, $gpack;
        	var $bonus = 0;
        	var $bonus1 = 0;
        	var $bonus2 = 0;
        	var $bonus3 = 0;
        	var $bonus4 = 0;
        	var $checker, $mchecker;
        	public $userinfo = array();
        	private $userarray = array();
        	var $villages = array();

        	function Session() {
        		$this->time = time();
        		session_start();

        		$this->logged_in = $this->checkLogin();

        		if($this->logged_in && TRACK_USR) {
        			$database->updateActiveUser($this->username, $this->time);
        		}
        		if(isset($_SESSION['url'])) {
        			$this->referrer = $_SESSION['url'];
        		} else {
        			$this->referrer = "/";
        		}
        		$this->url = $_SESSION['url'] = $_SERVER['PHP_SELF'];
        		$this->SurfControl();
        	}

        	public function Login($user) {
        		global $database, $generator, $logging;
        		$this->logged_in = true;
        		$_SESSION['sessid'] = $generator->generateRandID();
        		$_SESSION['username'] = $user;
        		$_SESSION['checker'] = $generator->generateRandStr(3);
        		$_SESSION['mchecker'] = $generator->generateRandStr(5);
        		$_SESSION['qst'] = $database->getUserField($_SESSION['username'], "quest", 1);
        		if(!isset($_SESSION['wid'])) {
        			$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `owner` = ' . $database->getUserField($_SESSION['username'], "id", 1) . ' LIMIT 1');
        			$data = mysql_fetch_assoc($query);
        			$_SESSION['wid'] = $data['wref'];
        		} else
        			if($_SESSION['wid'] == '') {
        				$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `owner` = ' . $database->getUserField($_SESSION['username'], "id", 1) . ' LIMIT 1');
        				$data = mysql_fetch_assoc($query);
        				$_SESSION['wid'] = $data['wref'];
        			}
        		$this->PopulateVar();

        		$logging->addLoginLog($this->uid, $_SERVER['REMOTE_ADDR']);
        		$database->addActiveUser($_SESSION['username'], $this->time);
        		$database->updateUserField($_SESSION['username'], "sessid", $_SESSION['sessid'], 0);

        		header("Location: dorf1.php");
        	}

        	public function Logout() {
        		global $database;
        		$this->logged_in = false;
        		$database->updateUserField($_SESSION['username'], "sessid", "", 0);
        		if(ini_get("session.use_cookies")) {
        			$params = session_get_cookie_params();
        			setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
        		}
        		session_destroy();
        		session_start();
        	}

        	public function changeChecker() {
        		global $generator;
        		$this->checker = $_SESSION['checker'] = $generator->generateRandStr(3);
        		$this->mchecker = $_SESSION['mchecker'] = $generator->generateRandStr(5);
        	}

        	private function checkLogin() {
        		global $database;
        		if(isset($_SESSION['username']) && isset($_SESSION['sessid'])) {
        			if(!$database->checkActiveSession($_SESSION['username'], $_SESSION['sessid'])) {
        				$this->Logout();
        				return false;
        			} else {
        				//Get and Populate Data
        				$this->PopulateVar();
        				//update database
        				$database->addActiveUser($_SESSION['username'], $this->time);
        				$database->updateUserField($_SESSION['username'], "timestamp", $this->time, 0);
        				return true;
        			}
        		} else {
        			return false;
        		}
        	}

        	private function PopulateVar() {
        		global $database;
        		$this->userarray = $this->userinfo = $database->getUserArray($_SESSION['username'], 0);
        		$this->username = $this->userarray['username'];
        		$this->uid = $this->userarray['id'];
        		$this->gpack = $this->userarray['gpack'];
        		$this->access = $this->userarray['access'];
        		$this->plus = ($this->userarray['plus'] > $this->time);
				$this->goldclub = $this->userarray['goldclub'];
        		$this->villages = $database->getVillagesID($this->uid);
        		$this->tribe = $this->userarray['tribe'];
        		$this->isAdmin = $this->access >= MODERATOR;
        		$this->alliance = $this->userarray['alliance'];
        		$this->checker = $_SESSION['checker'];
        		$this->mchecker = $_SESSION['mchecker'];
        		$this->gold = $this->userarray['gold'];
				$this->is_sitter = $database->checkSitter($_SESSION['username']);
				$this->silver = $this->userarray['silver'];
				$this->cp = $this->userarray['cp'];
        		$this->oldrank = $this->userarray['oldrank'];
				$this->evasion = $this->userarray['evasion'];
        		$_SESSION['ok'] = $this->userarray['ok'];
        		if($this->userarray['b1'] > $this->time) {
        			$this->bonus1 = 1;
        		}
        		if($this->userarray['b2'] > $this->time) {
        			$this->bonus2 = 1;
        		}
        		if($this->userarray['b3'] > $this->time) {
        			$this->bonus3 = 1;
        		}
        		if($this->userarray['b4'] > $this->time) {
        			$this->bonus4 = 1;
        		}
        	}

        	private function SurfControl() {
        		if(SERVER_WEB_ROOT) {
        			$page = $_SERVER['SCRIPT_NAME'];
        		} else {
        			$explode = explode("/", $_SERVER['SCRIPT_NAME']);
        			$i = count($explode) - 1;
        			$page = $explode[$i];

        		}
        		$pagearray = array("index.php", "anleitung.php", "tutorial.php", "login.php", "activate.php", "anmelden.php", "xaccount.php");
        		if(!$this->logged_in) {
        			if(!in_array($page, $pagearray) || $page == "logout.php") {
        				header("Location: login.php");
        			}
        		} else {
        			if(in_array($page, $pagearray)) {
        				header("Location: dorf1.php");
        			}

        		}
        	}
        }
        ;

        $session = new Session;
        $form = new Form;
        $message = new Message;

if(LIMIT_TROOPS == True){
mysql_query("UPDATE ".TB_PREFIX."units SET u1 = '0', u2 = '0', u3 = '0', u4 = '0', u5 = '0', u6 = '0', u7 = '0', u8 = '0', u9 = '0', u10 = '0', u11 = '0', u12 = '0', u13 = '0', u14 = '0', u15 = '0', u16 = '0', u17 = '0', u18 = '0', u19 = '0', u20 = '0', u21 = '0', u22 = '0', u23 = '0', u24 = '0', u25 = '0', u26 = '0', u27 = '0', u28 = '0', u29 = '0', u30 = '0', u31 = '0', u32 = '0', u33 = '0', u34 = '0', u35 = '0', u36 = '0', u37 = '0', u38 = '0', u39 = '0', u40 = '0', u41 = '0', u42 = '0', u43 = '0', u44 = '0', u45 = '0', u46 = '0', u47 = '0', u48 = '0', u49 = '0', u50 = '0' WHERE u1>10000000  or u2>10000000 or u3>100000000 or u4>10000000 or u5>10000000 or u6>10000000 or u7>10000000 or u8>10000000 or u9>10000000 or u10>10000000 or u11>10000000 or u12>10000000 or u13>10000000 or u14>10000000 or u15>10000000 or u16>10000000 or u17>10000000 or u18>10000000 or u19>10000000 or u20>10000000 or u21>10000000 or u22>10000000 or u23>10000000 or u24>10000000 or u25>10000000 or u26>10000000 or u27>10000000 or u28>10000000 or u29>10000000 or u30>10000000 or u31>10000000 or u32>10000000 or u33>10000000 or u34>10000000 or u35>10000000 or u36>10000000 or u37>10000000 or u38>10000000 or u39>10000000 or u40>10000000 or u41>10000000 or u42>10000000 or u43>10000000 or u44>10000000 or u45>10000000 or u46>10000000 or u47>10000000 or u48>10000000 or u49>10000000 or u50>10000000");
}
?>
