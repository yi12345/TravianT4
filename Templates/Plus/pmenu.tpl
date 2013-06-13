<h1 class="titleInHeader"><?php echo SERVER_NAME ?> <font color="#71D000"> Plus</font></h1>
<div class="contentNavi subNavi">
				<div title="" class="container <?php if(!isset($_GET['id'])) {echo "active";}else{echo "normal";} ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="plus.php"><span class="tabItem">Buy Gold</span></a></div>
				</div>
				<div title="" class="container <?php if(isset($_GET['id']) && $_GET['id'] == 2) {echo "active";}else{echo "normal";} ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="plus.php?id=2"><span class="tabItem">Advantages </span></a></div>
				</div>
				<div title="" class="container <?php if(isset($_GET['id']) && $_GET['id'] == 3) {echo "active";}else{echo "normal";} ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="plus.php?id=3"><span class="tabItem"> Plus</span></a></div>
				</div>
				<div title="" class="container <?php if(isset($_GET['id']) && $_GET['id'] == 5) {echo "active";}else{echo "normal";} ?>">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="plus.php?id=5"><span class="tabItem"> Free Gold</span></a></div>
				</div>
<div class="clear"></div>
		</div>