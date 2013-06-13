<?php
include('GameEngine/Account.php');
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome signup">
	<div id="wrapper">
		<img id="staticElements" src="img/x.gif" alt="">
		<div class="bodyWrapper">
			<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="">
			<div id="header">
				<div id="mtop">
					<a id="logo" href="<?php echo HOMEPAGE; ?>" target="_blank" title="<?php echo SERVER_NAME; ?>"></a>
					<div class="clear"></div>
				</div>
			</div>
			<div id="mid">

<div id="side_navi">
	<ul>
		<li>
			<a href="<?php echo HOMEPAGE; ?>" title="<?php echo HOME; ?>"><?php echo HOME; ?></a>
		</li>

		<li>
			<a href="login.php" title="<?php echo LOGIN; ?>"><?php echo LOGIN; ?></a>
		</li>

		<li class="active">
			<a href="anmelden.php" title="<?php echo REG; ?>"><?php echo REG; ?></a>
		</li>

		<li>
			<a href="#" target="_blank" title="<?php echo FORUM; ?>"><?php echo FORUM; ?></a>
		</li>
		
		<li class="support">
			<a href="contact.php" title="<?php echo SUPPORT; ?>"><?php echo SUPPORT; ?></a>
		</li>
	</ul>
</div>												<div class="clear"></div>
						<div id="contentOuterContainer">
							<div class="contentTitle">&nbsp;</div>
							<div class="contentContainer">
								<div id="content" class="signup"><h1 class="titleInHeader"><?php echo REG; ?></h1>
<?php if(REG_OPEN == true){ ?>
		<h4 class="round"><?php echo REGISTER_USERINFO; ?></h4>
		<form name="snd" method="post" action="anmelden.php">
		<input type="hidden" name="invited" value="<?php echo filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT); ?>" />
		<input type="hidden" name="ft" value="a1" />
			<table cellpadding="1" cellspacing="1" id="sign_input" class="transparent">
			<tbody>
				<tr class="top">
					<th><label for="userName"><?php echo REGISTER_USERNAME; ?></label></th>
					<td>
						<input id="userName" class="text" type="text" name="name" value="<?php echo stripslashes(stripslashes(stripslashes($form->getValue('name')))); ?>" maxlength="15" />
						<span class="error"><?php echo $form->getError('name'); ?></span>
					</td>
				</tr>
				<tr>
					<th><label for="userEmail"><?php echo REGISTER_EMAIL; ?></label></th>
					<td>
						<input id="userEmail" class="text" type="text" name="email" value="<?php echo $form->getValue('email'); ?>" maxlength="40" />
						<span class="error"><?php echo $form->getError('email'); ?></span>
					</td>
				</tr>
				<tr class="btm">
					<th><label for="userPassword"><?php echo REGISTER_PASSWORD; ?></label></th>
					<td>
						<input id="userPassword" class="text" type="password" name="pw" value="<?php echo $form->getValue('pw'); ?>" maxlength="20" />
						<span class="error"><?php echo $form->getError('pw'); ?></span>
					</td>
				</tr>
			</tbody>
		</table>

		<h4 class="round"><?php echo REGISTER_SELECT_TRIBE; ?></h4>
		<p class="tribeInfo"><?php echo BEFORE_REGISTER; ?>
<br /><br /><?php echo REGISTER_STARTER; ?></p>
		<div class="tribeSelect">
			<div class="tribe romans">
				<div class="selection">
					<input id="tribeRomans" class="radio" type="radio" name="vid" value="1" <?php echo $form->getRadio('vid',1); ?>>&nbsp;<label for="tribeRomans"><?php echo TRIBE1; ?></label>
				</div>
				<label for="tribeRomans"><img src="img/x.gif" class="tribeImage romans" alt="<?php echo TRIBE1; ?>" title="<?php echo TRIBE1; ?>" /></label>
			</div>

			<div class="tribe teutons">
				<div class="selection">
					<input id="tribeTeutons" class="radio" type="radio" name="vid" value="2" <?php echo $form->getRadio('vid',2); ?>>&nbsp;<label for="tribeTeutons"><?php echo TRIBE2; ?></label>
				</div>
				<label for="tribeTeutons"><img src="img/x.gif" class="tribeImage teutons" alt="<?php echo TRIBE2; ?>" title="<?php echo TRIBE2; ?>" /></label>
			</div>


			<div class="tribe gauls">
				<div class="selection">
					<input id="tribeGauls" class="radio" type="radio" name="vid" value="3" <?php echo $form->getRadio('vid',3); ?>>&nbsp;<label for="tribeGauls"><?php echo TRIBE3; ?></label>
				</div>
				<label for="tribeGauls"><img src="img/x.gif" class="tribeImage gauls" alt="<?php echo TRIBE3; ?>" title="<?php echo TRIBE3; ?>" /></label>
			</div>

			<div class="clear"></div>
		</div>

		<h4 class="round"><?php echo REGISTER_LOCATION; ?></h4>
		<table cellpadding="1" cellspacing="1" id="sign_select" class="transparent">
			<tbody>
				<tr>
					<td>
						<input class="radio" type="radio" id="positionRandom" name="kid" value="0" checked="checked"  />&nbsp;<label for="positionRandom"><?php echo REGISTER_RANDOM; ?></label>
					</td>
					<td>
						<input class="radio" type="radio" id="positionNW" name="kid" value="4" <?php echo $form->getRadio('kid',4); ?>>&nbsp;<label for="positionNW"><?php echo REGISTER_NW; ?></label>
					</td>
					<td>
						<input class="radio" type="radio" id="positionNE" name="kid" value="3" <?php echo $form->getRadio('kid',3); ?>>&nbsp;<label for="positionNE"><?php echo REGISTER_NE; ?></label>
					</td>
				</tr>
				<tr>
					<td class="pos2">&nbsp;
						
					</td>
					<td>
						<input class="radio" type="radio" id="positionSW" name="kid" value="1" <?php echo $form->getRadio('kid',1); ?>>&nbsp;<label for="positionSW"><?php echo REGISTER_SW; ?></label>
					</td>
					<td>
						<input class="radio" type="radio" id="positionSE" name="kid" value="2" <?php echo $form->getRadio('kid',2); ?>>&nbsp;<label for="positionSE"><?php echo REGISTER_SE; ?></label>
					</td>
				</tr>
			</tbody>
		</table>
	
			<h4 class="round"><?php echo REGISTER_MOREINFO; ?></h4>
			<div class="checks">
				<input class="check" type="checkbox" id="agb" name="agb" value="1" <?php echo $form->getRadio('agb',1); ?>/>
				<label for="agb"><?php echo ACCEPT_RULES; ?></label>
			</div>
        <ul class="important">
<?php
echo $form->getError('tribe');
echo $form->getError('agree');
?>
		</ul>
		<div class="btn">
			<button type="submit" value="anmelden" name="s1" id="btn_signup" title="Register">
            <div class="button-container">
            <div class="button-position">
            <div class="btl">
            <div class="btr">
            <div class="btc"></div></div></div>
            <div class="bml">
            <div class="bmr">
            <div class="bmc"></div></div></div>
            <div class="bbl">
            <div class="bbr">
            <div class="bbc"></div></div></div></div>
            <div class="button-contents"><?php echo REG; ?></div></div>
            </button>
		</div>
	</form>
    <div class="clear">&nbsp;</div>
<?php }else{ ?>
<p><?php echo REGISTER_CLOSED; ?></p>
<?php } ?>   
    </div>  
    <div class="clear"></div>
						</div>
                        <div class="contentFooter">&nbsp;</div>
					</div>       
		<div id="side_info">
        
	<?php if(NEWSBOX1) { ?>
                <div class="news news1">
                <?php include("Templates/News/newsbox1.tpl"); ?>
                </div>
                <?php } ?>
				<?php if(NEWSBOX2) { ?>
                <div class="news news2">
                <?php include("Templates/News/newsbox2.tpl"); ?>
                </div>
               <?php } ?>
            
		</div>
        
				<?php
				include("Templates/footer.tpl");
				?>
															</div>

			<div id="ce"></div>
														</div>

			</body>
</html>