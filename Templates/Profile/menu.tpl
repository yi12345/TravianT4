<?php if(!$session->is_sitter){ ?>
<div class="contentNavi subNavi">
				<div title="" class="container <?php if(isset($_GET['uid'])) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="spieler.php?uid=<?php if(isset($_GET['uid'])) { echo $_GET['uid']; } else { echo $session->uid; } ?>"><span class="tabItem">Overview</span></a></div>
				</div>
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 1) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="spieler.php?s=1"><span class="tabItem">Edit Profile</span></a></div>
				</div>
                 <?php if($session->plus) { ?>
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 2) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="spieler.php?s=2"><span class="tabItem">Links</span></a></div>
				</div>
                <?php } ?>
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 3) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="spieler.php?s=3"><span class="tabItem">Account</span></a></div>
				</div>
                <div class="clear"></div>
</div>
<?php } ?>