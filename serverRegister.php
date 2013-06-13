<?php
#################################################################################
##                                                                             ##
##              -= YOU MUST NOT REMOVE OR CHANGE THIS NOTICE =-                ##
##                                                                             ##
## --------------------------------------------------------------------------- ##
##                                                                             ##
##  Project:       ZravianX                                                    ##
##  Version:       2011.11.01                                                  ##
##  Filename:      serverRegister.php                                          ##
##  Developed by:  Advocaite                                                   ##
##  Edited by:     ZZJHONS                                                     ##
##  License:       Creative Commons BY-NC-SA 3.0                               ##
##  Copyright:     ZravianX (c) 2011 - All rights reserved                     ##
##  URLs:          http://zravianx.zzjhons.com                                 ##
##  Source code:   http://www.github.com/ZZJHONS/ZravianX                      ##
##                                                                             ##
#################################################################################
error_reporting(E_ALL);
if (!file_exists('GameEngine/config.php')) {
header("Location: install/");
}
       include ("GameEngine/Database.php");
       include ("GameEngine/Lang/".$result['lang'].".php");
	   $users = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users"));
	   $online = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users WHERE " . time() . "-timestamp < (60*5) AND tribe!=5 AND tribe!=0"));
?>
<h3 class="pop popgreen bold">Welcome to the new TRAVIAN 4!</h3>
<h3>Please choose a server.</h3>
<br />
<div class="server serverA serverbig servernormal serverbignormal ">
    <a class="link" onclick="" href="anmelden.php" title="Register on Server 1.">
    <span class="name">Server 1</span>
    <span class="player" title="Players in total: <?php echo $users-4; ?>"><?php echo $users-4; ?></span>
    <span class="online" title="Players online: <?php echo $online; ?>"><?php echo $online; ?></span>
    <span class="start">The server started <?php echo round((time()-COMMENCE)/86400);?> days ago.</span>
    <span class="mark"></span>
    <img class="hover" src="img/x.gif">
</a>
</div>