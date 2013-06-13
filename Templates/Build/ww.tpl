<h1 class="titleInHeader">Wonder of the World <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid40">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(40,4);" class="build_logo">
        <img class="building big white g40" src="img/x.gif" alt="Wonder of the World" title="Wonder of the World"></a>
        The World Wonder (otherwise known as a Wonder of the World) is as wonderful as it sounds. "This building" is built in order to win the server. Each level of the World Wonder costs hundreds of thousands (even millions) of resources to build.</div>

<?php include "upgrade.tpl"; ?>
<div class="clear"></div><br />
<form action="GameEngine/Game/WorldWonderName.php" method="POST">
<input type="hidden" name="vref" value="<?php echo $_SESSION['wid']; ?>" />
<?php
$vref = $_SESSION['wid'];
$wwname = $database->getWWName($vref);

if($village->resarray['f99'] < 5){
echo 'WW name. 
			<center>Wonder of the World Name <input class="text" name="wwname" id="wwname" disabled="disabled" value="'.$wwname.'" maxlength="20"> 
<button type="submit" value="ok" name="s1" id="btn_train" value="ok" class="startTraining" disabled="disabled">
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">OK</div></div>
                    </button>
</center>';
} else if($village->resarray['f99'] >= 5) {
echo '<center><br />Wonder of the World Name: <input class="text" name="wwname" id="wwname" value="'.$wwname.'" maxlength="20"> <button type="submit" value="ok" name="s1" id="btn_train" value="ok" class="startTraining">
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">OK</div></div>
                    </button></center>'; 
} ?>
    </form>
	<?php
    if(isset($_GET['n'])) {
		echo '<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="Red"><b>Wonder of the World name changed succesfully</b></font>';
		  }
		  ?>

</p></div>