<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>Alliance - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl"); 
?>
<h4 class="round">Options</h4>
<form method="POST" action="allianz.php">
<input type="hidden" name="s" value="5">
<ul class="options">

<?php
if ($alliance->userPermArray['opt3']==1){
?>        
		<label><li><input class="radio" type="radio" name="o" value="100">  Change name</li></label>
<?php
}
if ($alliance->userPermArray['opt3']==1){
?>        

		<label><li><input class="radio" type="radio" name="o" value="3">  Change alliance description</li></label>
<?php
}
if ($alliance->userPermArray['opt1']==1){
?>		
        <label><li><input class="radio" type="radio" name="o" value="1">  Assign Position</li></label>
<?php
} 
if ($alliance->userPermArray['opt4']==1){
?>        
		<label><li><input class="radio" type="radio" name="o" value="4">  Invite a player into the alliance</li></label>
<?php
}
if ($alliance->userPermArray['opt6']==1){
?>         
		<label><li><input class="radio" type="radio" name="o" value="6">  Diplomacy</li></label>
<?php
}
if ($alliance->userPermArray['opt2']==1){
?>        
		<label><li><input class="radio" type="radio" name="o" value="2">  Kick Player</li></label>

<?php
}
?>                
		<label><li><input class="radio" type="radio" name="o" value="11">  Leave Alliance</li></label>
        
</ul>

	<p><button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Go</div></div></button></p></form>