<?php
session_start();

include("../GameEngine/Database.php");
include("../GameEngine/Ranking.php");
include("../GameEngine/Admin/database.php");
include("jdf.php");

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="fa">
<link rel="stylesheet" type="text/css" href="../img/admin/main.css">

<script language="javascript" src="../crypt.js" type="text/javascript"></script>
<script language="javascript" src="ajax.js" type="text/javascript"></script>

<title>ACP :: <?php echo SERVER_NAME; ?></title>
<script>
var editing = false;
var CurrentStep = 1;
function SetCurrent(val){
	if(CurrentStep!=val){
		$('div_'+CurrentStep).style.display = 'none';
		$('a_title_'+CurrentStep).className = '';
		$('div_'+val).style.display = 'block';
		$('a_title_'+val).className = 'current';
	}
	CurrentStep = val;
}
</script>
</head>
<body>
<div align="center">

<?php
if($funct->CheckLogin()){
		include('tpl/admin.php');
}else{
	include('tpl/login.php');
}
?>
<div id="ce"></div>
</div>
</body>
</html>

