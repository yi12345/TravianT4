<?php
#################################################################################
##                                                                             ##
##              -= YOU MUST NOT REMOVE OR CHANGE THIS NOTICE =-                ##
##                                                                             ##
## --------------------------------------------------------------------------- ##
##                                                                             ##
##  Project:       ZravianX                                                    ##
##  Version:       2011.11.20                                                  ##
##  Filename:      Templates/admin_menu.tpl                                    ##
##  Developed by:  ZZJHONS                                                     ##
##  License:       Creative Commons BY-NC-SA 3.0                               ##
##  Copyright:     ZravianX (c) 2011 - All rights reserved                     ##
##  URLs:          http://www.xtravian.com & http://zravianx.zzjhons.com       ##
##  Source code:   http://www.github.com/ZZJHONS/ZravianX                      ##
##                                                                             ##
#################################################################################

include_once ("GameEngine/Database/db_MYSQL.php");
include_once ("GameEngine/Ranking.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <style type="text/css">
	div.c1 {text-align: center}
    </style>
</head>
<body>
    <div id="side_navi">
        <a id="logo" href="<?php echo HOMEPAGE; ?>" name="logo"><img src="img/x.gif" class="logo" alt="Travian"></a>
        <?php     
          if($funct->CheckLogin()){ 
          	if($_SESSION['access'] == ADMIN){
		?>
            <p>
                <a href="admin.php"><b>ACP Home</b></a> 
                <a href="<?php echo HOMEPAGE; ?>">Homepage</a>
                <a href="login.php">Server</a>
            </p>
            <p>
                <a href="?p=server_info">Statistics</a>
                <a href="?p=online">Online users</a>
                <a href="?p=news">Game News</a>
                <a href="?p=homenews">Home News</a>     
                <a href="?p=search">Search</a>
                <a href="?p=message">Msg/Rep</a>
                <a href="?p=ban">Ban</a>
                <a href="?p=gold">Give gold</a>
                <a href="?p=config">Server config</a>
                <a href="massmessage.php">Mass message</a>
                <a href="sysmsg.php">System message</a>
                <a href="medal.php">Update top 10</a>
                <a href="?p=other">Other</a>
            </p>
            <p>
                <a href="?p=admin_log"><font color="Red"><b>Admin Log</b></font></a>
            </p>
            <p>
                <a href="?action=logout">Logout</a>
            </p> 
            <?php } else if($_SESSION['access'] == MULTIHUNTER){ ?>
            <p>
                <a href="admin.php">MCP Home</a> 	
                <a href="<?php echo HOMEPAGE; ?>">Homepage</a>
                <a href="dorf1.php">Server</a>
            </p>
            <p>
                <a href="?p=server_info">Server Info</a>
                <a href="?p=online">Online users</a>    
                <a href="?p=search">Search</a>
                <a href="?p=message">Msg/Rep</a>
                <a href="?p=ban">Ban</a>
            </p>
            <p>
            <a href="?action=logout">Logout</a>	  
            </p>
        <?php } } if(!$funct->CheckLogin()){ ?>
        	<p>
            	<a href="<?php echo HOMEPAGE; ?>">Homepage</a>
            	<a href="login.php">Server</a>
            </p>
        <?php }?>
    </div>
</body>
</html>