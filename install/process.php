<?php

date_default_timezone_set('Asia/Tehran');
        if(file_exists("include/constant.php") && file_exists("include/connection.php")) {
        	include ("include/database.php");
        }
        class Process {

        	function Process() {
        		if(isset($_POST['subconst'])) {
        			$this->constForm();
        		} else
        			if(isset($_POST['substruc'])) {
        				$this->createStruc();
        			} else
        				if(isset($_POST['subwdata'])) {
        					$this->createWdata();
        				} else
        					if(isset($_POST['subacc'])) {
        						$this->createAcc();
        						} else {
        							header("Location: index.php");
        						}
        	}

        	function constForm() {
				global $database;
        		$myFile = "include/constant.php";
        		$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Can't open file: install\include\constant.php");
        		$text = file_get_contents("data/constant_format.tpl");
				$text = preg_replace("'%TRADERCAP%'", $_POST['tradercap'], $text);
				$text = preg_replace("'%CRANNYCAP%'", $_POST['crannycap'], $text);
				$text = preg_replace("'%TRAPPERCAP%'", $_POST['trappercap'], $text);
        		$text = preg_replace("'%UTRACK%'", $_POST['trackusers'], $text);
        		$text = preg_replace("'%UTOUT%'", $_POST['timeout'], $text);
        		$text = preg_replace("'%AUTOD%'", $_POST['autodel'], $text);
        		$text = preg_replace("'%AUTODT%'", $_POST['autodeltime'], $text);
        		$text = preg_replace("'%MAX%'", $_POST['wmax'], $text);
        		$text = preg_replace("'%ANAME%'", $_POST['aname'], $text);
        		$text = preg_replace("'%ARANK%'", $_POST['admin_rank'], $text);
        		$text = preg_replace("'%STARTTIME%'", time(), $text);
        		$text = preg_replace("'%LIMIT_MAILBOX%'", $_POST['limit_mailbox'], $text);
        		$text = preg_replace("'%MAX_MAILS%'", $_POST['max_mails'], $text);
        		$text = preg_replace("'%VILLAGE_EXPAND%'", $_POST['village_expand'], $text);
        		$text = preg_replace("'%ERROR%'", $_POST['error'], $text);
        		$text = preg_replace("'%GREAT_WKS%'", $_POST['great_wks'], $text);
        		$text = preg_replace("'%TS_THRESHOLD%'", $_POST['ts_threshold'], $text);
				$text = preg_replace("'%SSTARTDATE%'", $_POST['start_date'], $text);
				$text = preg_replace("'%SSTARTTIME%'", $_POST['start_time'], $text);
				$text = preg_replace("'%REG_OPEN%'", $_POST['reg_open'], $text);
				$text = preg_replace("'%PEACE%'", $_POST['peace'], $text);
				$text = preg_replace("'%LIMIT_TROOPS%'", $_POST['limit_troops'], $text);
				$text = preg_replace("'%STORAGE_MULTIPLIER%'", $_POST['storage_multiplier'], $text);
        		fwrite($fh, $text);
				fclose($fh);
				
				$myFile = "include/connection.php";
        		$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Can't open file: install\include\connection.php");
        		$text = file_get_contents("data/connection.tpl");
        		$text = preg_replace("'%SSERVER%'", $_POST['sserver'], $text);
        		$text = preg_replace("'%SUSER%'", $_POST['suser'], $text);
        		$text = preg_replace("'%SPASS%'", $_POST['spass'], $text);
        		$text = preg_replace("'%SDB%'", $_POST['sdb'], $text);
        		$text = preg_replace("'%PREFIX%'", $_POST['prefix'], $text);
        		$text = preg_replace("'%CONNECTT%'", $_POST['connectt'], $text);

        		fwrite($fh, $text);
				
        		if(file_exists("include/constant.php") && file_exists("include/connection.php")) {
					include 'include/database.php';
					$str = file_get_contents("data/config.sql");
        			$str = preg_replace("'%PREFIX%'", TB_PREFIX, $str);
					if(DB_TYPE) {
        				$database->connection->multi_query($str);
        			} else {
        				$database->mysql_exec_batch($str);
        			}
					mysql_query("INSERT into ".$_POST['prefix']."config values ('".$_POST['servername']."', '".$_POST['lang']."', '".$_POST['speed']."', 'gpack/travian_Travian_4.0_41/', '".$_POST['incspeed']."', '".$_POST['evaspeed']."', '".$_POST['advspeed']."', '".$_POST['demolish']."', '".$_POST['quest']."', '".$_POST['beginner']."', '".$_POST['auction_time']."', '".$_POST['ww']."', '".$_POST['activate']."', '".$_POST['plus_time']."', '".$_POST['plus_production']."', '".$_POST['log_build']."', '".$_POST['log_tech']."', '".$_POST['log_login']."', '".$_POST['log_gold_fin']."', '".$_POST['log_admin']."', '".$_POST['log_war']."', '".$_POST['log_market']."', '".$_POST['log_illegal']."', '".$_POST['box1']."', '".$_POST['box2']."', '".$_POST['box3']."', '".$_POST['aemail']."', '".$_POST['homepage']."')");
					
        			header("Location: index.php?s=2");
        		} else {
        			header("Location: index.php?s=1&c=1");
        		}

        		fclose($fh);
        	}

        	function createStruc() {
        		global $database;
        		$str = file_get_contents("data/sql.sql");
        		$str = preg_replace("'%PREFIX%'", TB_PREFIX, $str);
        		if(DB_TYPE) {
        			$result = $database->connection->multi_query($str);
        		} else {
        			$result = $database->mysql_exec_batch($str);
        		}
        		if($result) {
        			header("Location: index.php?s=3");
        		} else {
        			header("Location: index.php?s=2&c=1");
        		}
        	}

        	function createWdata() {
        		header("Location: include/wdata.php");
        	}
            
        }
        ;

        $process = new Process;

?>