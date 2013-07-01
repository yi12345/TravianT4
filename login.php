<?php

include("GameEngine/Account.php");
if(isset($_GET['del_cookie'])) {
	setcookie("COOKUSR","",time()-3600*24,"/");
	header("Location: login.php");
}
if(!isset($_COOKIE['COOKUSR'])) {
	$_COOKIE['COOKUSR'] = "";
}
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome login qualificationServerLogin">
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

		<li class="active">
			<a href="login.php" title="<?php echo LOGIN; ?>"><?php echo LOGIN; ?></a>
		</li>

		<li>
			<a href="anmelden.php" title="<?php echo REG; ?>"><?php echo REG; ?></a>
		</li>

		<li>
			<a href="#" target="_blank" title="<?php echo FORUM; ?>"><?php echo FORUM; ?></a>
		</li>
		
		<li class="support">
			<a href="contact.php" title="<?php echo SUPPORT; ?>"><?php echo SUPPORT; ?></a>
		</li>
	</ul>
</div>
<div class="clear"></div>
						<div id="contentOuterContainer">
							<div class="contentTitle">&nbsp;</div>
							<div class="contentContainer">
								<div id="content" class="login">
<h1 class="titleInHeader"><?php echo LOGIN; ?></h1>
<script type="text/javascript">
Element.implement({
	 //imgid: falls zu dem link ein pfeil gehört kann dieser "auf/zugeklappt" werden
	 showOrHide: function(imgid) {
		 //einblenden
		 if (this.getStyle('display') == 'none')
		 {
			 if (imgid != '')
			 {
				 $(imgid).className = 'open';
			 }
		 }
		 //ausblenden
		 else
		 {
			 if (imgid != '')
			 {
				 $(imgid).className = 'close';
			 }
		 }
		 this.toggleClass('hide');
	}
});
</script>
<?php
$stime = strtotime(START_DATE)-strtotime(date('m/d/Y'))+strtotime(START_TIME);
if($stime > time()){
	$loginform = "hide";
}else{
	$startin = "hide";
}
?>
<script type="text/javascript">
Element.implement({
	 //imgid: falls zu dem link ein pfeil gehört kann dieser "auf/zugeklappt" werden
	 showOrHide: function(imgid) {
		 //einblenden
		 if (this.getStyle('display') == 'none')
		 {
			 if (imgid != '')
			 {
				 $(imgid).className = 'open';
			 }
		 }
		 //ausblenden
		 else
		 {
			 if (imgid != '')
			 {
				 $(imgid).className = 'close';
			 }
		 }
		 this.toggleClass('hide');
	}
});
</script>
<div class="outerLoginBox <?php echo $loginform; ?>">
	<h2><?php echo LOGIN_WELCOME; ?></h2>
<noscript>
<div class="noJavaScript"><?php echo LOGIN_NO_JAVASCRIPT; ?></div>
	</noscript>
		<div class="innerLoginBox">
<form method="post" name="snd" action="login.php" class="<?php echo $loginform; ?>">
<input type="hidden" name="ft" value="a4" />
			<table class="transparent loginTable">
				<tbody>
                <tr class="account">
					<td class="accountNameOrEmailAddress"><?php echo LOGIN_USERNAME; ?></td>
					<td>
						<input type="text" name="user" value="<?php echo stripslashes(stripslashes(stripslashes($form->getDiff("user",$_COOKIE['COOKUSR'])))); ?>" class="text">
						<div class="error RTL"><?php echo $form->getError("user"); ?></div>
					</td>
					<td>
					</td>
				</tr>
				<tr class="pass">
					<td><?php echo LOGIN_PASSWORD; ?></td>
					<td>
						<input type="password" maxlength="20" name="pw" value="<?php echo $form->getValue("pw");?>" class="text"><br>
						<div class="error RTL"><?php echo $form->getError("pw"); ?></div>
					</td>
					<td>
					</td>
				</tr>
                <tr class="lowResOption">
					<td><?php echo LOGIN_LOWRES_OPTION; ?></td>
					<td colspan="2">
						<input type="checkbox" class="checkbox" id="lowRes" name="lowRes" value="1">
						<label for="lowRes"><?php echo LOGIN_LOWRES_DESC; ?></label>

					</td>
				</tr>
				<tr class="lowResInfo">
					<td colspan="3"><?php echo LOGIN_LOWRES_NOTICE; ?></td>
				</tr>
				<tr>
				  <td>
				    </td>
				  <td>
				    <button type="submit" value="<?php echo LOGIN; ?>" name="s1" id="s1" onClick="document.login.w.value=screen.width+':'+screen.height;"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents"><?php echo LOGIN; ?></div></div></button>
      				<input type="hidden" name="w" value="">
				    <input type="hidden" name="login" value="<?php echo time(); ?>">
				    </td>
				  <td>
				    </td>
				  </tr>
			</tbody></table>
		</form>
	</div>
	
			<div class="greenbox passwordForgotten">
				<div class="greenbox-top"></div>
				<div class="greenbox-content">
<div class="passwordForgottenLink">
	 	<a onClick="$('showPasswordForgotten').showOrHide('arrow');" href="<?php if(isset($_GET['action'])){ echo'#'; }else{ echo'?action=forgotPassword'; }?>" class="showPWForgottenLink">
	 		<img class="close" id="arrow" src="img/x.gif"><?php echo LOGIN_PW_FORGOTTEN; ?></a>
	 </div>
	 		<div class="showPasswordForgotten <?php if(isset($_GET['action']) && $_GET['action']=='forgotPassword'){}else{ echo'hide'; }?>" id="showPasswordForgotten">
<?php if(isset($_GET['finish'])){ ?>
<font color="#008000"><?php echo LOGIN_PW_SENT; ?></font>
<?php }else{ ?>
			 	<form method="POST" action="">
					<input type="hidden" name="forgotPassword" value="1">

<div class="forgotPasswordDescription"><?php echo LOGIN_PW_REQUEST; ?></div>
					<table class="transparent pwForgottenTable" id="pw_forgotten_form" cellpadding="0" cellspacing="0">
						<tbody><tr class="mail">
							<th><?php echo LOGIN_PW_EMAIL; ?></th>
							<td><input class="text" type="text" name="pw_email" value=""><br><div class="error RTL"><?php echo $form->getError("pw_email"); ?></div>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td colspan="2">
								<button type="submit" value="<?php echo LOGIN_PW_BTN; ?>" name="s2" id="s2"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents"><?php echo LOGIN_PW_BTN; ?></div></div></button>
                                </td>
						</tr>
					</tbody></table>
				</form>
                <?php } ?>
						</div>
				</div>
				<div class="greenbox-bottom"></div>
				<div class="clear"></div>
			</div>
		</div>
<div class="startsIn <?php echo $startin; ?>"><BR /><BR /><BR />
<?php echo LOGIN_SERVER_START; ?>
<script language="JavaScript">
TargetDate = "<?php echo START_DATE; ?> <?php echo START_TIME; ?>";
CountActive = true;
CountStepper = -1;
LeadingZero = true;
DisplayFormat = "%%H%%:%%M%%:%%S%%";
FinishMessage = "START NOW";

function calcage(secs, num1, num2) {
  s = ((Math.floor(secs/num1))%num2).toString();
  if (LeadingZero && s.length < 2)
    s = "0" + s;
  return "" + s + "";
}

function CountBack(secs) {
  if (secs < 0) {
    document.getElementById("cntdwn").innerHTML = FinishMessage;
    return;
  }
  DisplayStr = DisplayFormat.replace(/%%D%%/g, calcage(secs,86400,100000));
  DisplayStr = DisplayStr.replace(/%%H%%/g, calcage(secs,3600,100000));
  DisplayStr = DisplayStr.replace(/%%M%%/g, calcage(secs,60,60));
  DisplayStr = DisplayStr.replace(/%%S%%/g, calcage(secs,1,60));

  document.getElementById("cntdwn").innerHTML = DisplayStr;
  if (CountActive)
    setTimeout("CountBack(" + (secs+CountStepper) + ")", SetTimeOutPeriod);
}

function putspan(backcolor, forecolor) {
  document.write("<div class='activation_time' id='cntdwn'></div>");
}

if (typeof(BackColor)=="undefined")
  BackColor = "white";
if (typeof(ForeColor)=="undefined")
  ForeColor= "black";
if (typeof(TargetDate)=="undefined")
  TargetDate = "12/31/2020 5:00 AM";
if (typeof(DisplayFormat)=="undefined")
  DisplayFormat = "%%H%%:%%M%%:%%S%%";
if (typeof(CountActive)=="undefined")
  CountActive = true;
if (typeof(FinishMessage)=="undefined")
  FinishMessage = "";
if (typeof(CountStepper)!="number")
  CountStepper = -1;
if (typeof(LeadingZero)=="undefined")
  LeadingZero = true;


CountStepper = Math.ceil(CountStepper);
if (CountStepper == 0)
  CountActive = false;
var SetTimeOutPeriod = (Math.abs(CountStepper)-1)*1000 + 990;
putspan(BackColor, ForeColor);
var dthen = new Date(TargetDate);
var dnow = new Date();
if(CountStepper>0)
  ddiff = new Date(dnow-dthen);
else
  ddiff = new Date(dthen-dnow);
gsecs = Math.floor(ddiff.valueOf()/1000);
CountBack(gsecs);

</script>
 <?php echo LOGIN_SERVER_START2; ?></div>
<div class="clear">&nbsp;</div>
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