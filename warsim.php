<?php

include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
$battle->procSim($_POST);
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome warsim">
	<div id="wrapper"> 
		<img id="staticElements" src="img/x.gif" alt="" /> 
		<div id="logoutContainer"> 
			<a id="logout" href="logout.php" title="<?php echo LOGOUT; ?>">&nbsp;</a> 
		</div> 
		<div class="bodyWrapper"> 
			<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" /> 
			<div id="header"> 
				<div id="mtop">
					<a id="logo" href="<?php echo HOMEPAGE; ?>" target="_blank" title="<?php echo SERVER_NAME ?>"></a>
					<ul id="navigation">
						<li id="n1" class="resources">
							<a class="" href="dorf1.php" accesskey="1" title="<?php echo HEADER_DORF1; ?>"></a>
						</li>
						<li id="n2" class="village">
							<a class="" href="dorf2.php" accesskey="2" title="<?php echo HEADER_DORF2; ?>"></a>
						</li>
						<li id="n3" class="map">
							<a class="" href="karte.php" accesskey="3" title="<?php echo HEADER_MAP; ?>"></a>
						</li>
						<li id="n4" class="stats">
							<a class="" href="statistiken.php" accesskey="4" title="<?php echo HEADER_STATS; ?>"></a>
						</li>
<?php
    	if(count($database->getMessage($session->uid,9)) >= 1000) {
			$unmsg = "+1000";
		} else { $unmsg = count($database->getMessage($session->uid,9)); }
		
    	if(count($database->getNotice5($session->uid)) >= 1000) {
			$unnotice = "+1000";
		} else { $unnotice = count($database->getNotice5($session->uid)); }
?>
<li id="n5" class="reports"> 
<a href="berichte.php" accesskey="5" title="<?php echo HEADER_NOTICES; ?><?php if($message->nunread){ echo' ('.count($database->getNotice5($session->uid)).')'; } ?>"></a>
<?php
if($message->nunread){
	echo "<div class=\"ltr bubble\" title=\"".$unnotice." ".HEADER_NOTICES_NEW."\" style=\"display:block\">
			<div class=\"bubble-background-l\"></div>
			<div class=\"bubble-background-r\"></div>
			<div class=\"bubble-content\">".$unnotice."</div></div>";
}
?>
</li>
<li id="n6" class="messages"> 
<a href="nachrichten.php" accesskey="6" title="<?php echo HEADER_MESSAGES; ?><?php if($message->unread){ echo' ('.count($database->getMessage($session->uid,9)).')'; } ?>"></a> 
<?php
if($message->unread) {
	echo "<div class=\"ltr bubble\" title=\"".$unmsg." ".HEADER_MESSAGES_NEW."\" style=\"display:block\">
			<div class=\"bubble-background-l\"></div>
			<div class=\"bubble-background-r\"></div>
			<div class=\"bubble-content\">".$unmsg."</div></div>";
}
?>
</li>

</ul>
<div class="clear"></div> 
</div> 
</div>
					<div id="mid">

												<div class="clear"></div> 
						<div id="contentOuterContainer"> 
							<div class="contentTitle">&nbsp;</div>
<div class="contentContainer">
<div id="content"  class="warsim">
<h1>Harcszimulátor</h1>
<form action="warsim.php" method="post">
<?php
if(isset($_POST['result'])) {
    $target = isset($_POST['target'])? $_POST['target'] : array();
    $tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
    echo '<h4 class="round">Harctípus ';
    echo $form->getValue('ktyp') == 0? "Normál" : "Rablótámadás";
    echo "</h4>";
    include("Templates/Simulator/res_a".$tribe.".tpl");
    foreach($target as $tar) {
        include("Templates/Simulator/res_d".$tar.".tpl");
    }
    echo '<h4 class="round">Raid konfiguráció</h4>';
    if (isset($_POST['result'][3])&&isset($_POST['result'][4])){
        if ($_POST['result'][4]>$_POST['result'][3]){
            echo "";
        }elseif ($_POST['result'][4]==0){
            echo "";
        }else{
            $demolish=$_POST['result'][4]/$_POST['result'][3];
            //$Katalife=round($_POST['result'][4]-($_POST['result'][4]*$_POST['result'][1]));
            //$totallvl = round($form->getValue('kata')-($form->getValue('kata') * $demolish));
            $totallvl = round(sqrt(pow(($form->getValue('kata')+0.5),2)-($_POST['result'][4]*8)));
            echo "<p>Építése <b>".$form->getValue('kata')."</b> Level <b>".$totallvl."</b> Sérült.</p>";
        }
    }
}
$target = isset($_POST['target'])? $_POST['target'] : array();
$tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
if(count($target) > 0) {
    include("Templates/Simulator/att_".$tribe.".tpl");
	echo '<div id="defender"><div class="fighterType"><div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">Védők</div></div></div><div class="clear"></div>';

    foreach($target as $tar) {
        include("Templates/Simulator/def_".$tar.".tpl");
    }
    include("Templates/Simulator/def_end.tpl");
    echo "</div><div class=\"clear\"></div>";
}
?>
<table id="select" cellpadding="1" cellspacing="1">
		<tbody>
			<tr>
				<td>
					<div class="fighterType">
						<div class="boxes boxesColor red"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">Támadók	</div>
				</div>
					</div>
					<div class="clear"></div>

					<div class="choice">
                    <label><input class="radio" type="radio" name="a1_v" value="1" <?php if($tribe == 1) { echo "checked"; } ?>> Római</label><br/>
        <label><input class="radio" type="radio" name="a1_v" value="2" <?php if($tribe == 2) { echo "checked"; } ?>> Germán </label><br/>
        <label><input class="radio" type="radio" name="a1_v" value="3" <?php if($tribe == 3) { echo "checked"; } ?>> Gall</label>
					</div>
				</td>

				<td>
					<div class="fighterType">
						<div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">Védők	</div>
				</div>
					</div>
					<div class="clear"></div>

					<div class="choice">
						<label><input class="check" type="checkbox" name="a2_v1" value="1" <?php if(in_array(1,$target)) { echo "checked"; } ?>> Római</label><br>
						<label><input class="check" type="checkbox" name="a2_v2" value="1" <?php if(in_array(2,$target)) { echo "checked"; } ?>> Germán</label><br>
						<label><input class="check" type="checkbox" name="a2_v3" value="1" <?php if(in_array(3,$target)) { echo "checked"; } ?>> Gall</label><br>
						<label><input class="check" type="checkbox" name="a2_v4" value="1" <?php if(in_array(4,$target)) { echo "checked"; } ?>> Természet</label>
					</div>
				</td>

				<td>
					<div class="fighterType">
						<div class="boxes boxesColor darkgray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">Harctípus	</div>
				</div>
					</div>
					<div class="clear"></div>

					<div class="choice">
                    <label><input class="radio" type="radio" name="ktyp" value="0" <?php if($form->getValue('ktyp') == 0 || $form->getValue('ktyp') == "") { echo "checked"; } ?>> Normál</label><br/>

        <label><input class="radio" type="radio" name="ktyp" value="1" <?php if($form->getValue('ktyp') == 1) { echo "checked"; } ?>> Rablótámadás</label><br/>
						<input type="hidden" name="uid" value="<?php echo $session->uid; ?>">
					</div>
				</td>
			</tr>
		</tbody>
	</table>


<p class="btn"><button type="submit" value="Támadás szimulálása" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Támadás szimulálása</div></div></button></p>
</form>
</div>
<div class="clear">&nbsp;</div>

<div class="clear"></div>
</div>
<div class="contentFooter">&nbsp;</div>
</div>

                    
<?php
include("Templates/sideinfo.tpl");
include("Templates/footer.tpl");
include("Templates/header.tpl");
include("Templates/res.tpl");
include("Templates/vname.tpl");
include("Templates/quest.tpl");
?>

</div>
<div id="ce"></div>
</div>
</body>
</html>
