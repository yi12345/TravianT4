<?php
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

if(isset($_GET['c']) && $_GET['c'] == 1) {
echo "<div class=\"headline\"><span class=\"f10 c5\">Error creating wdata. Check configuration or file.</span></div><br>";
}
?>
<div id="content" class="login">
<form action="process.php" method="post" id="dataform">
<div class="lbox">
<tr>
<td><span class="f9 c6">Create World Data:</span></td><td> <button type="submit" value="Upgrade level" class="build">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div>
<div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div>
</div><div class="button-contents">Create</div></div></button></td></tr>

<br /><br /><font color="Red"><b>Warning:</b> This can take some time. Do not click, just wait till the next page has been loaded!</font>
</div>
<input type="hidden" name="subwdata" value="1">
</form>
</div>
