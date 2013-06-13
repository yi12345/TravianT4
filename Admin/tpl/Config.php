<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       config.tpl                                                  ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<?php
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);

mysql_select_db(SQL_DB);

if ($_SESSON['access'] == MULTIHUNTER) die("<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><b><font color='Red'><center>Access Denied: You are not admin</b></font></center>");

?>
<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);} 
</style>  
<form action="process.php" method="post">
<table id="member">
  <thead>
    <tr>
        <th>~ Server Settings ~</th>
    </tr>
  </thead> 

</table>
<table id="profile">    
    <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
    <tr>
        <td>Server Name</td>
        <td><input type="text" dir="ltr" class="text" name="servername" id="servername" value="<?php echo SERVER_NAME;?>"></td>    
    </tr> 
 <tr>

        <td>Server Started</td>

        <td><?php echo date("d.m.y H:i",COMMENCE);?></td>   

    </tr>  
    <tr>
        <td>Language</td>
        <td>
        <?php if(LANG == en){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(LANG == fa){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="lang" class="text">
		<option value="en" <?php echo $sts; ?>>English</option>
		<option value="fa" <?php echo $sts2; ?>>Persian</option>
        </select>
        
        </td>  
    </tr>  
    <tr>  
        <td>Server Speed</td>
        <td><?php echo ''.SPEED.'x';?></td>    
    </tr>  
    <tr>
        <td>Map Size</td>
        <td><?php echo WORLD_MAX;?> x <?php echo WORLD_MAX;?></td>    
    </tr>  
	<tr>
        <td>Troop Speed</td>
        <td><?php echo INCREASE_SPEED;?>x</td>    
    </tr> 
		<tr>

        <td>Village Expanding Speed</td>

        <td><?php if(CP == 0){
				echo "Fast";
				}
				else if(CP == 1){
				echo "Slow";
				} ?></td> 

    </tr>   
    <tr>

        <td>Beginners Protection</td>

        <td><?php echo (PROTECTION/3600*SPEED);?> hour/s</td> 

    </tr>    	
	<tr>

        <td>Activation Mail</td>

        <td>
        <?php if(AUTH_EMAIL == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(AUTH_EMAIL == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="activate" class="text">
		<option value="true" <?php echo $sts; ?>>Enabled</option>
		<option value="false" <?php echo $sts2; ?>>Disabled</option>
        </select>
        </td> 
				

    </tr> 
	<tr>

        <td>Quest</td>
		
        <td>
        <?php if(QUEST == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(QUEST == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="quest" class="text">
		<option value="true" <?php echo $sts; ?>>Enabled</option>
		<option value="false" <?php echo $sts2; ?>>Disabled</option>
        </select>
        </td> 
       

    </tr>    
	
	<tr>

        <td>Demolish - Level required</td>

        <td><?php echo DEMOLISH_LEVEL_REQ; ?></td> 

    </tr>  
	
	<tr>

        <td>World Wonder - Statistics</td>

        <td>
        <?php if(WW == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(WW == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="ww" class="text">
		<option value="true" <?php echo $sts; ?>>Enabled</option>
		<option value="false" <?php echo $sts2; ?>>Disabled</option>
        </select>
        </td> 

    </tr>  
	<tr>

        <td><b><font color='#71D000'>P</font><font color='#FF6F0F'>l</font><font color='#71D000'>u</font><font color='#FF6F0F'>s</font></b> account duration</td>

        <td><?php if(PLUS_TIME >= 86400){
			echo ''.(PLUS_TIME/86400).' Days';
			} else if(PLUS_TIME < 86400){
			echo ''.(PLUS_TIME/3600).' Hours';
			} ?></td> 

    </tr>  
	
	<tr>

        <td>+25% production duration</td>

        <td><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' Days';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' Hours';
			} ?></td> 

    </tr>  
	</table>
	
<table id="member">
  <thead>
    <tr>
        <th>~ Log Settings ~</th>
    </tr>
  </thead>
</table>  
  
  <table id="profile">  
  <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
    <tr>
        <td>Log Build</td>
        <td><?php if(LOG_BUILD == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(LOG_BUILD == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>    
    <tr>
        <td>Log Technology</td>
        <td><?php if(LOG_TECH == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(LOG_TECH == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>    
    <tr>
        <td>Log Login</td>
        <td><?php if(LOG_LOGIN == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(LOG_LOGIN == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>    
    <tr>
        <td>Log Gold</td>
        <td><?php if(LOG_GOLD_FIN == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(ALOG_GOLD_FIN == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>    
    <tr>
        <td>Log Admin</td>
        <td><?php if(LOG_ADMIN == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(LOG_ADMIN == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>     
    <tr>
        <td>Log War</td>
        <td><?php if(LOG_WAR == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(LOG_WAR == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>     
    <tr>
        <td>Log Market</td>
        <td><?php if(LOG_MARKET == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(LOG_MARKET == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>     
    <tr>
        <td>Log Illegal</td>
        <td><?php if(LOG_ILLEGAL == true) {
				echo "<b><font color='Green'>Enabled</font></b>";
				}
				else if(LOG_ILLEGAL == false){
				echo "<b><font color='Red'>Disabled</font></b>"; 
				}
				?></td> 
    </tr>     
       	</table>
	
<table id="member">
  <thead>
    <tr>
        <th>~ Newsbox Settings ~</th>
    </tr>
  </thead>
</table>  
  
  <table id="profile">  
  <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
	
	<tr>
		
		<td>Newsbox 1</td>
		
		<td>
        <?php if(NEWSBOX1 == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(NEWSBOX1 == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="box1" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
        </td>
	</tr>
	<tr>
		
		<td>Newsbox 2</td>
		
		<td>
        <?php if(NEWSBOX2 == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(NEWSBOX2 == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="box2" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
      </td>
				
	</tr>
	<tr>
		
		<td>Newsbox 3</td>
		
		<td>
        <?php if(NEWSBOX3 == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(NEWSBOX3 == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="box3" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
      </td>
				
	</tr>
	
	<td>Home 1</td>
		
	<td>
        <?php if(HOME1 == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(HOME1 == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="home1" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
      </td>
        </tr>
	
	<td>Home 2</td>
		
		<td>
        <?php if(HOME2 == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(HOME2 == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="home2" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
      </td>
				
	</tr>
	
	<td>Home 3</td>
		
		<td>
        <?php if(HOME3 == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(HOME3 == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="home3" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
      </td>
				
	</tr>
  </table>
	
<table id="member">
  <thead>
    <tr>
        <th>~ SQL Settings ~</th>
    </tr>
  </thead>
<table id="profile">  
  <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
    <tr>
        <td>Hostname</td>
        <td><?php echo SQL_SERVER;?></td> 
    </tr>    
	<tr>
        <td>DB Username</td>
        <td><?php echo SQL_USER;?></td> 
    </tr>  
	<tr>
        <td>DB Password</td>
        <td>*********</td> 
    </tr>  
	<tr>
        <td>DB Name</td>
        <td><?php echo SQL_DB;?></td> 
    </tr>  
	<tr>
        <td>Table Prefix</td>
        <td><?php echo TB_PREFIX;?></td> 
    </tr> 
	<tr>
        <td>DB Type</td>
        <td><?php 
                if(DB_TYPE == 0) {
                echo "MYSQL";
                }
                else if(DB_TYPE == 1) {
                echo "MYSQLi";
                } ?></td> 
    </tr> 
	</table>
	
<table id="member">

  <thead>

    <tr>

        <th>~ Extra Settings ~</th>

    </tr>

  </thead>

<table id="profile">  

  <tr>

        <td class="b">Variable</td>

        <td class="b">Value</td> 

    </tr> 

    <tr>

        <td>Limit Mailbox</td>

		<td>
        <?php if(LIMIT_MAILBOX == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(LIMIT_MAILBOX == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="limit_mailbox" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
        </td>
        
</tr>    
	<tr>

        <td>Max number of mails</td>

        <td><?php if(LIMIT_MAILBOX == true){
				echo "<input name=\"max_mails\" dir=\"rtl\" class=\"text\" type=\"number\" id=\"max_mails\" value=\"".MAX_MAIL."\" size=\"15\">";
				}
				else if(LIMIT_MAILBOX == false){
				echo "<font color='Gray'>Limit mailbox disabled</font>";
				} ?></td> 

    </tr>    
	<tr>

        <td>Include Admin in rank</td>
        
        <td>
        <?php if(INCLUDE_ADMIN == true){
				$sts = "selected=\"selected\"";
				} else { $sts = ""; }
				if(INCLUDE_ADMIN == false){
				$sts2 = "selected=\"selected\"";
                } else { $sts2 = ""; }
				?>
        <select name="admin_rank" class="text">
		<option value="true" style="color:Green;" <?php echo $sts; ?>>Enabled</option>
		<option value="false" style="color:Red;" <?php echo $sts2; ?>>Disabled</option>
        </select>
        </td>


</tr>    
	</table>
	
	<table id="member">

  <thead>

    <tr>

        <th>~ Admin Information ~</th>

    </tr>

  </thead>

<table id="profile">  

  <tr>

        <td class="b">Variable</td>

        <td class="b">Value</td> 

    </tr> 

    <tr>

        <td>Admin Email</td>

        <td><?php if(ADMIN_EMAIL == ''){
				echo "<b><font color='Red'>No admin email defined!</b></font>";
				}
				else if(ADMIN_EMAIL != ''){
				echo "<input name=\"aemail\" class=\"text\" type=\"text\" id=\"aemail\" value=\"".ADMIN_EMAIL."\">";
				} ?></td> 

    </tr>  
	 <tr>

        <td>Admin Name</td>

        <td><?php if(ADMIN_NAME == ''){
				echo "<b><font color='Red'>No admin name defined!</b></font>";
				}
				else if(ADMIN_NAME != ''){
				echo "<input type=\"text\" value=\"".ADMIN_NAME."\" class=\"text\" name=\"aname\" id=\"aname\">";
				} ?></td> 

    </tr>
</table><Br /><center><button type="submit" value="Submit" class="build">Submit</button></center>	
	</form>
<?php

function define_array( $array, $keys = NULL )
{
    foreach( $array as $key => $value )
    {
        $keyname = ($keys ? $keys . "_" : "") . $key;
        if( is_array( $array[$key] ) )
            define_array( $array[$key], $keyname );
        else
            define( $keyname, $value );
    }
}

//define_array($array);

?>
