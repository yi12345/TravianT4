<?php 
include("GameEngine/Database.php");
if(isset($_GET['uid'])){
    $uid =  $_GET['uid'];
} else {
    $uid = "1";
}
if(isset($_GET['size'])){
	if($_GET['size']=='profile'){
    	$size =  '31x40';
	}elseif($_GET['size']=='inventory'){
    	$size =  '64x82';
	}elseif($_GET['size']=='sideinfo'){
    	$size =  '119x136';
	}
} else {
    $size = "119x136";
}
$herodetail = $database->HeroFace($uid);
if($herodetail['color']==0){
	$color = "black";
}
if($herodetail['color']==1){
	$color = "brown";
}
if($herodetail['color']==2){
	$color = "darkbrown";
}
if($herodetail['color']==3){
	$color = "yellow";
}
if($herodetail['color']==4){
	$color = "red";
}
$geteye = $herodetail['eye'];
$geteyebrow = $herodetail['eyebrow'];
$getnose = $herodetail['nose'];
$getear = $herodetail['ear'];
$getmouth = $herodetail['mouth'];
$getbeard = $herodetail['beard'];
$gethair = $herodetail['hair'];
$getface = $herodetail['face'];



// USAGE EXAMPLE: 
$body = imagecreatefrompng('img/hero/head/'.$size.'/face0.png');
if($getbeard!=5){
	$beard = imagecreatefrompng('img/hero/head/'.$size.'/beard/beard'.$getbeard.'-'.$color.'.png');
}
$ear = imagecreatefrompng('img/hero/head/'.$size.'/ear/ear'.$getear.'.png');
$eye = imagecreatefrompng('img/hero/head/'.$size.'/eye/eye'.$geteye.'.png');
$eyebrow = imagecreatefrompng('img/hero/head/'.$size.'/eyebrow/eyebrow'.$geteyebrow.'-'.$color.'.png');
if($gethair!=5){
	$hair = imagecreatefrompng('img/hero/head/'.$size.'/hair/hair'.$gethair.'-'.$color.'.png');
}
$mouth = imagecreatefrompng('img/hero/head/'.$size.'/mouth/mouth'.$getmouth.'.png');
$nose = imagecreatefrompng('img/hero/head/'.$size.'/nose/nose'.$getnose.'.png');
$face = imagecreatefrompng('img/hero/head/'.$size.'/face/face'.$getface.'.png');



// SAME COMMANDS: 
$database->imagecopymerge_alpha($body, $face, 0, 0, 0, 0, imagesx($face), imagesy($face),100); 
$database->imagecopymerge_alpha($body, $ear, 0, 0, 0, 0, imagesx($ear), imagesy($ear),100);
$database->imagecopymerge_alpha($body, $eye, 0, 0, 0, 0, imagesx($eye), imagesy($eye),100);
$database->imagecopymerge_alpha($body, $eyebrow, 0, 0, 0, 0, imagesx($eyebrow), imagesy($eyebrow),100);
if($gethair!=5){
$database->imagecopymerge_alpha($body, $hair, 0, 0, 0, 0, imagesx($hair), imagesy($hair),100);
}
$database->imagecopymerge_alpha($body, $mouth, 0, 0, 0, 0, imagesx($mouth), imagesy($mouth),100);
$database->imagecopymerge_alpha($body, $nose, 0, 0, 0, 0, imagesx($nose), imagesy($nose),100);
if($getbeard!=5){
$database->imagecopymerge_alpha($body, $beard, 0, 0, 0, 0, imagesx($beard), imagesy($beard),100);
}


// OUTPUT IMAGE: 
header("Content-Type: image/png"); 
imagesavealpha($body, true); 
imagepng($body, NULL); 

?>