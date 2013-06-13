<?php			   
	//gp link
	if($session->gpack == null || GP_ENABLE == false) {
	$gpack= GP_LOCATE;
	} else {
	$gpack= $session->gpack;
	}

	
//de bird
if($displayarray['protect'] > time()){
$uurover=date('H:i:s', ($displayarray['protect'] - time()));
$profiel = preg_replace("/\[#0]/is",'<img src="'.$gpack.'img/t/tn.gif" border="0" title="Player '.$uurover.' Time is no longer supported." >', $profiel, 1);
} else {
$geregistreerd=date('Y/m/d', ($displayarray['timestamp']));
$tregistreerd=date('H:i', ($displayarray['timestamp']));
$profiel = preg_replace("/\[#0]/is",'<img src="'.$gpack.'img/t/tnd.gif" border="0" title="Players on '.$geregistreerd.' '.$tregistreerd.' is enrolled">', $profiel, 1);
}

//natar image
if($displayarray['username'] == "Natars"){
$profiel = preg_replace("/\[#natars]/is",'<img src="gpack/travian_Travian_4.0_41/img/t/t10_2.jpg" border="0">', $profiel, 1);
$profiel = preg_replace("/\[#natars]/is",'<img src="gpack/travian_Travian_4.0_41/img/t/t10_2.jpg" border="0">', $profiel, 1);
}

//de lintjes
/******************************
INDELING CATEGORIEEN:
===============================
== 1. Attackers top 10       ==
== 2. Defence top 10         ==
== 3. Climbers top 10        ==
== 4. Raiders top 10 	     ==
== 5. attackers and defences ==
== 6. in top 3 - Attackers   ==
== 7. in top 3 - Defence 	 ==
== 8. in top 3 - Climbers    ==
== 9. in top 3 - Raiders     ==
******************************/

foreach($varmedal as $medal) {

switch ($medal['categorie']) {
    case "1":
        $titel="Top 10 Attackers of the Week";
		$woord="Score";
        break;
    case "2":
        $titel="Top 10 Defenders of the Week";
 		$woord="Score";
       break;
    case "3":
        $titel="Top 10 Climbers of the Week";
 		$woord="Score";
       break;
    case "4":
        $titel="Top 10 Raiders of the Week";
		$woord="Score";
        break;
	 case "5":
        $titel="Top 10 in both attackers and defenders of the week";
        $bonus[$medal['id']]=1;
		break;
	 case "6":
        $titel="Top Attackers of the Week ".$medal['points']." top 3.";
        $bonus[$medal['id']]=1;
		break;
	 case "7":
        $titel="Top Defenders of the Week ".$medal['points']." top 3.";
        $bonus[$medal['id']]=1;
		break;
	 case "8":
        $titel="Top Climbers of the Week ".$medal['points']." top 3.";
        $bonus[$medal['id']]=1;
		break;
	 case "9":
        $titel="Top Raiders of the Week  ".$medal['points']." top 3.";
        $bonus[$medal['id']]=1;
		break;
     case "10":
        $titel="Climbers of the Week";
        $woord="Score"; 
        break;
     case "11":
        $titel="Climbers of the Week".$medal['points']." top 3.";
        $bonus[$medal['id']]=1;
        break;
     case "12":
        $titel="Attackers of the Week ".$medal['points']." top 10.";
        $bonus[$medal['id']]=1;
        break;
        case "13":
        $titel="Defenders of the Week ".$medal['points']." top 10.";
        $bonus[$medal['id']]=1;
        break;
        case "14":
        $titel="Climbers of the Week ".$medal['points']." top 10.";
        $bonus[$medal['id']]=1;
        break;
        case "15":
        $titel="Raiders of the Week ".$medal['points']." top 10.";
        $bonus[$medal['id']]=1;
        break;
        case "16":
        $titel="Climbers of the Week ".$medal['points']." top 10.";
        $bonus[$medal['id']]=1;
        break;
        

}

if(isset($bonus[$medal['id']])){

	$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img class="medal '.$medal['img'].'" src="img/x.gif" title="'.$titel.'
<br />Week: '.$medal['week'].'">', $profiel, 1);
} else {
	$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img class="medal '.$medal['img'].'" src="img/x.gif" title="Category: '.$titel.'<br />Week: '.$medal['week'].'<br />Rank: '.$medal['plaats'].'<br />'.$woord.': '.$medal['points'].'<br />">', $profiel, 1);
}
}



?>

