<?php
	rename("include/constant.php","../GameEngine/config.php");
    rename("include/connection.php","../GameEngine/Database/connection.php");
	$time = time();
?>
<div id="content" class="login">

<style>

    span.c3 {position: absolute;right:10%}
    span.c2 {position: absolute;left:10%}
    
</style>
<form action="include/multihunter.php" method="post" id="dataform">
    <span>Choose a password for Multihunter:</span>
    <span >
        <input type="text" name="mhpw" id="mhpw" value="123456789" dir="rtl" class="text">
    </span><br /><br />
   	<center>
    <button type="submit" value="Upgrade level" class="build">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div>
<div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div>
</div><div class="button-contents">Submit</div></div></button>
    </center>
</form>
    
</div>