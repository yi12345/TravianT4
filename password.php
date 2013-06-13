<?php
include('GameEngine/config.php');
include('GameEngine/database.php');
include('GameEngine/lang/'.LANG.'.php');
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);
include "Templates/html.tpl";
?>
<body class="v35 webkit chrome activate">
<div id="wrapper">
<img id="staticElements" src="img\x.gif" alt="" />
<div class="bodyWrapper">
					
<img style="filter:chroma();" src="img\x.gif" id="msfilter" alt="" />
<div id="header">
<div id="mtop">
<a id="logo" href="<?php echo HOMEPAGE; ?>" target="_blank" title="Trafian"></a>
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
		
		<li class='support' >
			<a href="contact.php" title="<?php echo SUPPORT; ?>"><?php echo SUPPORT; ?></a>
		</li>
	</ul>
</div>
<div class="clear"></div>
						<div id="contentOuterContainer">

							<div class="contentTitle">&nbsp;</div>
							<div class="contentContainer">
								<div id="content" class="activate">
<h1 class="titleInHeader">ورود</h1>
<div id="passwordForgotten">
<?php
$npw = $_GET['npw'];
$act = $_GET['code'];
$user = $_GET['user'];
$pagehide = false;
if($database->checkExist($user, 0)){
	$getUser = $database->getUserArray($user, 0);
    $getProc = $database->getNewProc($getUser['id']);
    if($npw == $getProc['npw']){
    	if($act == $getProc['act']){
        	$newPassword = md5($npw);
        	$database->updateUserField($user, password, $newPassword, 0);
            $database->editTableField('newproc', 'proc', 1, 'uid', $getUser['id']);
			echo 'رمز عبور با موفقیت تغییر یافت.<br /><br />این لینک را ادامه دهید تا <a class="a arrow" href="login.php?user='.$user.'&pw='.$npw.'">ورود</a>';
			$database->removeProc($getUser['id']);
        }else{
        	echo '<font color="#FF0000">کد استاندارد اشتباه است!</font>';
        }
    }else{
        	echo '<font color="#FF0000">رمز عبور اشتباه است!</font>';
        }
}else{
	echo '<font color="#FF0000">این کاربر ثبت نشده است.</font>';
}
?>

</div>

<div class="clear">&nbsp;</div></div>
<div class="clear"></div></div>
<div class="contentFooter">&nbsp;</div></div>
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

