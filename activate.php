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
<body class="v35 activate" onLoad="initCounter()">

<div id="wrapper">
<img id="staticElements" src="img\x.gif" alt="" />
<div class="bodyWrapper">
					
<img style="filter:chroma();" src="img\x.gif" id="msfilter" alt="" />
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


<h1 class="titleInHeader"><?php echo REG; ?></h1>

<?php
if(isset($_GET['e'])) {
	switch($_GET['e']) {
		case 1:
		include("Templates/activate/delete.tpl");
		break;
		case 2:
		include("Templates/activate/activated.tpl");
		break;
		case 3:
		include("Templates/activate/cantfind.tpl");
		break;
	}
} else if(isset($_GET['id']) && isset($_GET['c'])) {
	$c=$database->getActivateField($_GET['id'],"email",0);
	if($_GET['c'] == $generator->encodeStr($c,5)){
		include("Templates/activate/delete.tpl");
	} else { include("Templates/activate/activate.tpl"); }
} else {
include("Templates/activate/activate.tpl");
}


?>
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
        
				<?php include "Templates/footer.tpl"; ?>
			</div>

			<div id="ce"></div>
														</div>

			</body>
</html>