<?php

include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
}
else {
	$building->procBuild($_GET);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo SERVER_NAME ?></title> 
    <link REL="shortcut icon" HREF="favicon.ico"/>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link href="gpack/travian_Travian_4.0_41/lang/ir/compact.css?asd423" rel="stylesheet" type="text/css" />
        <link href="gpack/travian_Travian_4.0_41/lang/ir/lang.css?asd423" rel="stylesheet" type="text/css" />
        <link href="img/travian_basics2.css" rel="stylesheet" type="text/css" />
        <script src="crypt.js?1314084856" type="text/javascript"></script>
        
<script type="text/javascript">

		window.addEvent('domready', start);
	</script>
</head>
 
 
<body class="v35 webkit chrome map qualificationServerMap" onload="start()">

<?php
if(isset($_GET['d']) && isset($_GET['c'])) {
	if($generator->getMapCheck($_GET['d']) == $_GET['c']) {
	include("Templates/Map/vilview.tpl");
	}
	else {
		header("Location: dorf1.php");
	}
} 
else {
	include("Templates/Map/mapviewlarge.tpl");
}
?>
<script type="text/javascript"> 
	Travian.Translation.add(
	{
		'close' : 'بستن'
	});
</script> 
</div>
<div id="ce"></div>
</div>
</body>
</html>
