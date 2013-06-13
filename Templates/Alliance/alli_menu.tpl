<?php if($session->alliance == $aid) {
?>
<div class="contentNavi subNavi">
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 4) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="allianz.php?s=4"><span class="tabItem">Overview</span></a></div>
				</div>
				<div title="" class="container <?php if(!isset($_GET['s'])) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="allianz.php"><span class="tabItem">Profile</span></a></div>
				</div>
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 3) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="allianz.php?s=3"><span class="tabItem">Attacks</span></a></div>
				</div>
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 2) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="allianz.php?s=2"><span class="tabItem">Forum</span></a></div>
				</div>
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 6) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="allianz.php?s=6"><span class="tabItem">Chat</span></a></div>
				</div>
				<?php if($session->is_sitter == 0){?>
				<div title="" class="container <?php if(isset($_GET['s']) && $_GET['s'] == 5) { echo "active"; }else{ echo "normal"; } ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="allianz.php?s=5"><span class="tabItem">options</span></a></div>
				</div><?php } ?><div class="clear"></div>
		</div>

<?php 
}
?>