<?php
include("../GameEngine/Database/connection.php");
include("../GameEngine/config.php");
$time = time();
rename("../install/","../installed_".$time);
?>
<div id="content" class="login">
<div class="headline"><h2>TravianT4 Installation Script</h2></div><br>
<br>
&nbsp;&nbsp;The installation was completed
    <h4>&nbsp;&nbsp;For security installation folder name is automatically changed.<br/><br/>
    &nbsp;&nbsp;The file config.php was replaced.</h4>
  
<br /><br />

<div align="center"><font size="4"><a href="<?php echo HOMEPAGE; ?>"> My TravianT4 homepage</font></a>
</div></div>
