<div class="contentNavi tabNavi">
				<div <?php if(!isset($_GET['t'])) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=<?php echo $id; ?>"><span class="tabItem">Overview</span></a></div>
				</div>
				<div <?php if(isset($_GET['t']) && $_GET['t'] == 1) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=<?php echo $id; ?>&amp;t=1"><span class="tabItem">Buy</span></a></div>
				</div>
				<div <?php if(isset($_GET['t']) && $_GET['t'] == 2) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=<?php echo $id; ?>&amp;t=2"><span class="tabItem">Sell</span></a></div>
				</div>
                <?php if($session->userinfo['gold'] >= 3) { ?>
                <div <?php if(isset($_GET['t']) && $_GET['t'] == 3) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=<?php echo $id; ?>&amp;t=3"><span class="tabItem">NPC Merchant</span></a></div>
				</div>
                <?php } ?>
				<?php if($session->goldclub == 1 && count($database->getProfileVillages($session->uid)) > 1) {
				?>
				<div <?php if(isset($_GET['t']) && $_GET['t'] == 4) { echo "class=\"container active\""; } else { echo "class=\"container normal\""; } ?>>
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="build.php?id=<?php echo $id; ?>&amp;t=4"><span class="tabItem">Trade Routes</span></a></div>
				</div>
				<?php
				}
				?>
</div>