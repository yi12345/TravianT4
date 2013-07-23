<?php

include("GameEngine/Village.php");
include("GameEngine/Data/cp.php");

$uArray = $database->getUserArray($_SESSION['username'],0);
$dataarray = explode(",",$database->getUserField($_SESSION['username'],'fquest','username'));

if($message->unread && !$message->nunread) { $messagelol = "i2"; }
else if(!$message->unread && $message->nunread) { $messagelol = "i3"; }
else if($message->unread && $message->nunread) { $messagelol = "i1"; }
else { $messagelol = "i4"; }

if (isset($qact)){
 switch($qact) {
	case 'enter':
	$database->updateUserField($_SESSION['username'],'quest','1',0);
	$_SESSION['qst']= 1;
	break;
	
	case 'skip':
	$database->updateUserField($_SESSION['username'],'quest','23',0);
	$_SESSION['qst']= 23;
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=25;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	$skiped=true;
	break;

	case '2':
	$database->updateUserField($_SESSION['username'],'quest','2',0);		
	$_SESSION['qst']= 2;
	
	//Give Reward
	$database->FinishWoodcutter($session->villages[0]);
	break;

	case '3':
	$database->updateUserField($_SESSION['username'],'quest','3',0);
	$_SESSION['qst']= 3;
    $today = date("mdHi");
	mysql_query("UPDATE ".TB_PREFIX."users set plus = ('".mktime(date("H"),date("i"), date("s"),date("m") , date("d"), date("Y"))."')+3600*24 where `id`='".$session->uid."'") or die(mysql_error());
	break;

	case '4':
	$database->updateUserField($_SESSION['username'],'quest','4',0);
	$_SESSION['qst']= 4;
	
	//Give Reward
	$database->modifyResource($session->villages[0],130,160,130,100,1);		
	break;
	
	case '5':
    $database->updateUserField($_SESSION['username'],'quest','5',0);
	$_SESSION['qst']= 5;
    
	$rSubmited=$qact2;
    //Give Reward
	$database->FinishRallyPoint($session->villages[0]);
	break;
	
	case '6':
	$database->updateUserField($_SESSION['username'],'quest','6',0);
	$_SESSION['qst']= 6;
	//Give Reward
	$database->modifyResource($session->villages[0],80,110,60,40,1);	
	
	break;

	case '7':
	$database->updateUserField($_SESSION['username'],'quest','7',0);
	$_SESSION['qst']= 7;
	$Subject="Message From The Taskmaster";
	$Message="You are to be informed that a nice reward is waiting for you at the taskmaster.<br /><br />Hint: The message has been generated automatically. An answer is not necessary.";
	$database->sendMessage($session->userinfo['id'],0,$Subject,$Message,0,0,0,0,0);
	$RB=true;
		
	//Give Reward
	$database->modifyResource($session->villages[0],150,160,130,130,1);	
	break;
	
	case '8':
	$database->updateUserField($_SESSION['username'],'quest','8',0);
	$_SESSION['qst']= 8;
		
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=20;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
	
	case '9':
	$database->updateUserField($_SESSION['username'],'quest','9',0);
	$_SESSION['qst']= 9;	
	//Give Reward
	$database->modifyUnit($session->villages[0],100,120,40,40,1);
	break;
	
	case 'coor':
	$x=$qact2;
	$y=$qact3;
	break;
	
	case '10':
	$database->updateUserField($_SESSION['username'],'quest','10',0);
	$_SESSION['qst']= 10;
	
	//Give Reward
	$database->modifyResource($session->villages[0],60,30,40,90,1);	
	break;
	
	case '11':
	$database->updateUserField($_SESSION['username'],'quest','11',0);
	$_SESSION['qst']= 11;
		
	//Give Reward
	$database->modifyResource($session->villages[0],75,120,30,50,1);	
	break;
	
	case '12':
	$database->updateUserField($_SESSION['username'],'quest','12',0);
	$_SESSION['qst']= 12;
			
	//Give Reward
	$database->modifyResource($session->villages[0],120,200,140,100,1);
	break;
	
	case '13':
	$database->updateUserField($_SESSION['username'],'quest','13',0);
	$_SESSION['qst']= 13;
			
	//Give Reward
	$database->modifyResource($session->villages[0],150,180,30,130,1);
	break;
    
    case '14':
	$database->updateUserField($_SESSION['username'],'quest','14',0);
	$_SESSION['qst']= 14;
			
	//Give Reward
	$database->modifyResource($session->villages[0],60,50,40,30,1);
	break;
	
	case 'lumber':
	$lSubmited=$qact2;
	break;
	
	case '15':
	$database->updateUserField($_SESSION['username'],'quest','15',0);
	$_SESSION['qst']= 15;
			
	//Give Reward
	$database->modifyResource($session->villages[0],50,30,60,20,1);
	break;
	
	case '16':
	$database->updateUserField($_SESSION['username'],'quest','16',0);
	$_SESSION['qst']= 16;
	
	//Give Reward
	$database->modifyResource($session->villages[0],75,75,40,40,1);
	break;
    
    case 'rank':
	$rSubmited=$qact2;
	break;
	
	case '17':
	$database->updateUserField($_SESSION['username'],'quest','17',0);
	$_SESSION['qst']= 17;
	
	//Give Reward
	$database->modifyResource($session->villages[0],100,90,100,60,1);
	break;
	
	case '18':
	$database->updateUserField($_SESSION['username'],'quest','18',0);
	$_SESSION['qst']= 18;
	break;

	case '19':
	$database->updateUserField($_SESSION['username'],'quest','19',0);
	$_SESSION['qst']= 19;
    
    //Give Reward
	$database->modifyResource($session->villages[0],70,100,90,100,1);
	break;
	
	case '20':
	$database->updateUserField($_SESSION['username'],'quest','20',0);
	$_SESSION['qst']= 20;
	break;
	
	case '21':
	$database->updateUserField($_SESSION['username'],'quest','21',0);
	$_SESSION['qst']= 21;
    
    //Give Reward
    $database->modifyResource($session->villages[0],80,90,60,40,1);
	break;
	
	case '22':
	$database->updateUserField($_SESSION['username'],'quest','22',0);
	$_SESSION['qst']= 22;
	
	//Give Reward
	$database->modifyResource($session->villages[0],70,120,90,50,1);
	break;
	
    case '23':
    $database->updateUserField($_SESSION['username'],'quest','23',0);
    $_SESSION['qst']= 23;
    
    //Give Reward
    $database->modifyResource($session->villages[0],1200,200,200,450,1);
    break;
    
    case '24':
    $database->updateUserField($_SESSION['username'],'quest','24',0);
    $_SESSION['qst']= 24;
    
    //Give Reward
    $database->modifyResource($session->villages[0],80,90,60,40,1);
    break;
    
	case '225':
	$_SESSION['qst']= 25;
	break;
    case '226':
	$_SESSION['qst']= 26;
	break;
    case '227':
	$_SESSION['qst']= 27;
	break;
    case '228':
	$_SESSION['qst']= 28;
	break;
    case '229':
	$_SESSION['qst']= 29;
	break;
    case '330':
	$_SESSION['qst']= 30;
	break;
    case '331':
	$_SESSION['qst']= 31;
	break;
    case '332':
	$_SESSION['qst']= 32;
	break;
    case '333':
	$_SESSION['qst']= 33;
	break;
    case '334':
	$_SESSION['qst']= 34;
	break;
    case '335':
	$_SESSION['qst']= 35;
	break;
    
	case '25':
	$dataarray[0] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=15;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
    
    case '26':
	$dataarray[1] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],140,200,180,200,1);
	break;
    
    case '27':
	$dataarray[2] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],200,120,180,80,1);
	break;
    
    case '28':
	$dataarray[3] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],240,280,180,100,1);
	break;
    
    case '29':
	$dataarray[4] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],600,750,600,300,1);
	break;
    
    case '30':
	$dataarray[5] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],900,850,600,300,1);
	break;
    
    case '31':
	$dataarray[6] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1800,2000,1650,800,1);
	break;
    
    case '32':
	$dataarray[7] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1600,1800,1950,1200,1);
	break;
    
    case '33':
	$dataarray[8] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],3400,2800,3600,2200,1);
	break;
    
    case '34':
	$dataarray[9] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1050,800,900,750,1);
	break;
    
    case '35':
	$dataarray[10] = 1;
	$database->updateUserField($_SESSION['username'],'fquest',''.$dataarray[0].','.$dataarray[1].','.$dataarray[2].','.$dataarray[3].','.$dataarray[4].','.$dataarray[5].','.$dataarray[6].','.$dataarray[7].','.$dataarray[8].','.$dataarray[9].','.$dataarray[10].'',0);

    $database->updateUserField($_SESSION['username'],'quest','',0);
	$_SESSION['qst']= 24;
	
	//Give Reward
	$database->modifyResource($session->villages[0],1600,2000,1800,1300,1);
	break;
    
    
}

}

header("Content-Type: application/json;");

      if($_SESSION['qst']== 0){
      if($session->userinfo['tribe'] == 1) {
                $tribes = "Romans";
                }
                else if($session->userinfo['tribe'] == 2) {
                $tribes = "Teutons";
                }
                else if($session->userinfo['tribe'] == 3) {
                $tribes = "Gauls";
                }
	  ?>

{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Welcome to <?php echo SERVER_NAME; ?>!<\/h1><br \/><i>&rdquo;As I see you have been made senator of this little village. I will be your counselor for the first few days and never leave your (left) side.&rdquo;<\/i><br \/><br \/><span id=\"qst_accpt\"><a class=\"qle\" href=\"javascript: qst_next('','enter'); \">To the first task.<\/a><a class=\"qri\" href=\"javascript: qst_fhandle();\">Look\u00a0around\u00a0on\u00a0your\u00a0own.<\/a><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><br \/><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"intro\"><\/div>\n\t\t","number":null,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":1}

<?php } elseif($_SESSION['qst']== 1){

//Check one of Woodcutters is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$woodL=$tRes['f1']+$tRes['f3']+$tRes['f14']+$tRes['f17'];
	//check if you are building a woodcutter to level 1
	foreach($building->buildArray as $jobs) {
			if($jobs['type']==1){
				$woodL="99";
			}	
      	}
if ($woodL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 1: Woodcutter<\/h1><br \/><i>&rdquo;There are four green forests around your village. Construct a woodcutter on one of them. Lumber is an important resource for our new settlement.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a woodcutter.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 1: Woodcutter<\/h1><br \/><i>&rdquo;Yes, that way you gain more lumber.I helped a bit and completed the order instantly.&rdquo;<\/i><br \/><br \/><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><div class=\"rew\"><p class=\"ta_aw\">Your reward:<\/p>Woodcutter instantly completed.<br \/><\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','2');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php }?>

<?php } elseif($_SESSION['qst']== 2){ 

//Check one of Croplands is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$cropL=$tRes['f2']+$tRes['f8']+$tRes['f9']+$tRes['f12']+$tRes['f13']+$tRes['f15'];
	//check if you are building a cropland to level 1
	foreach($building->buildArray as $jobs) {
			if($jobs['type']==4){
				$cropL="99";
			}	
      	}
if ($cropL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 2: Crop<\/h1><br \/><i>&rdquo;Now your subjects are hungry from working all day. Extend a cropland to improve your subjects' supply. Come back here once the building is complete.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend one cropland.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":"-2","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 2: Crop<\/h1><br \/><i>&rdquo;Very good. Now your subjects have enough to eat again...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p>1 day Travian <b><span class=\"plus_g\">P</span><span class=\"plus_o\">l</span><span class=\"plus_g\">u</span><span class=\"plus_o\">s</span></b><\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','3');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":2,"reward":{"plus":1},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php }?>

<?php } elseif($_SESSION['qst']== 3){ 

$vName=$village->vname;
if ($vName==$session->userinfo['username']."'s village"){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/>Task 3: Your Village's Name<\/h1><br \/><i>&rdquo;Creative as you are you can grant your village the ultimate name.\r\n<br \/><br \/>\r\nClick on 'profile' in the left hand menu and then select 'change profile'...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Change your village's name to something nice.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":"-3","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/>Task 3: Your Village's Name<\/h1><br \/><i>&rdquo;Wow, a great name for their village. It could have been the name of my village!...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>20&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','4');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":3,"reward":{"wood":30,"clay":60,"iron":30,"crop":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":99}
<?php }?>

<?php } elseif($_SESSION['qst']== 4){ 

$rallypoint = $building->getTypeLevel(16);
	foreach($building->buildArray as $jobs) {
			if($jobs['type']==16){
				$rallypoint += 1;
			}	
      	}
if ($rallypoint == 0){
?>
{"markup":"\n\t\<div id=\"popup3\"><div id=\"qstd\"><h4>Task 4: Rally Point<\/h4><div class=\"spoken\">&rdquo;In your surroundings, there are many mysterious places for you to explore. To prepare for these adventures, you need a rally point. <br> The rally point must be built on a specific building site in your village centre. The <a href=\"build.php?id=39\">building site<\/a> itself is curved.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build the rally point.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rally\"><\/div>\n\t\t","number":"-4","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 4: Rally Point<\/h4><div class=\"spoken\">&rdquo;Your rally point has been erected! A good move towards world domination!&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p>Rally Point instantly completed.<\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','5');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rally\"><\/div>\n\t\t","number":4,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php }?>

<?php } elseif($_SESSION['qst']== 5){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
$displayarray = $database->getUserArray($temp['uid'],1);
$rRes=$ranking->getUserRank($displayarray['username']);
if ($rRes!=$rSubmited){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 5: Other Players<\/h4><div class=\"spoken\">&rdquo;In Travian, you play with a lot of other players. Click 'statistics' in the top menu to look up your rank and enter it here.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Look for your rank in the statistics and enter it here.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" \/><button type=\"button\" value=\"Task completion\" /> <input onclick=\"qst_next('','rank',document.getElementById('qst_val').value)\" type=\"button\" value=\"complete task\"\/><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"rank1\"><\/div>\n\t\t","number":5,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 5: Other Players<\/h4><div class=\"spoken\">&rdquo;Exactly! That's your rank.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">80<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">110<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">40<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','6');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank1\"><\/div>\n\t\t","number":5,"reward":{"wood":80,"clay":110,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 6){ 

//Check one of Iron Mines and one of Clay Pites are level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=$tRes['f4']+$tRes['f7']+$tRes['f10']+$tRes['f11'];
$clayL=$tRes['f5']+$tRes['f6']+$tRes['f16']+$tRes['f18'];
if ($ironL<1 || $clayL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 6: Two Building Orders<\/h4><div class=\"spoken\">&rdquo;Build an iron mine and a clay pit. Of iron and clay one can never have enough. Thanks to the Plus account I gave you a short while ago, you can give both orders right away&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><b>Order:<\/b><\/p><ul><li> Extend one iron mine.<\/li><li>Extend one clay pit.<\/li><\/ul><\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":-6,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 6: Two Building Orders<\/h4><div class=\"spoken\">&rdquo;As you noticed, building orders take rather long. The world of <?php echo SERVER_NAME; ?> will continue to spin even if you are offline. Even in a few months there will be many new things for you to discover.\r\n<br \/><br \/>\r\nThe best thing to do is occasionally checking your village and giving you subjects new tasks to do.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"1Fa\">150<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">160<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">130<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">130<\/span><\/div><br \/><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','7');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":6,"reward":{"wood":150,"clay":160,"iron":130,"crop":130},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 7){ 

//Check message is viewed or no
if ($message->unread || $RB==true){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 7: Messages<\/h4><div class=\"spoken\">&rdquo;You can talk to other players using the messaging system. I sent a message to you. Read it and come back here.\r\n<br \/><br \/>\r\nP.S. Don't forget: on the left the reports, on the right the messages.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Read your new message.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":"-6","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"i2","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 7: Messages<\/h4><div class=\"spoken\">&rdquo;You received it? Very good.\r\n<br \/><br \/>\r\nHere is some Gold. With Gold you can do several things, e.g. extend your <b><font color=\"#71D000\">P<\/font><font color=\"#FF6F0F\">l<\/font><font color=\"#71D000\">u<\/font><font color=\"#FF6F0F\">s<\/font><\/b>-Account or increase your resource production.To do so click <a href=\"plus.php?id=3\"><font color=\"#000000\"><?php echo SERVER_NAME; ?><\/font> <b><font color=\"#71D000\">P<\/font><font color=\"#FF6F0F\">l<\/font><font color=\"#71D000\">u<\/font><font color=\"#FF6F0F\">s<\/font><\/b><\/a> in the left hand menu.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"gold\"><img src=\"img\/x.gif\" class=\"gold\" title=\"Arany\"> 20<\/span><\/div><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','8');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":6,"reward":{"gold":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 8){

$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;

if($tRes['f1']>0){$woodL++;};
if($tRes['f3']>0){$woodL++;};
if($tRes['f14']>0){$woodL++;};
if($tRes['f17']>0){$woodL++;};
if($tRes['f5']>0){$clayL++;};
if($tRes['f6']>0){$clayL++;};
if($tRes['f16']>0){$clayL++;};
if($tRes['f18']>0){$clayL++;};
if($tRes['f4']>0){$ironL++;};
if($tRes['f7']>0){$ironL++;};
if($tRes['f10']>0){$ironL++;};
if($tRes['f11']>0){$ironL++;};
if($tRes['f2']>0){$cropL++;};
if($tRes['f8']>0){$cropL++;};
if($tRes['f9']>0){$cropL++;};
if($tRes['f12']>0){$cropL++;};
if($tRes['f13']>0){$cropL++;};
if($tRes['f15']>0){$cropL++;};

if ($ironL<2 || $clayL<2 || $woodL<2 || $cropL<2){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 8: One Each!<\/h4><div class=\"spoken\">&rdquo;In Travian there is always something to do! While you are waiting for the result of your adventure, build an additional woodcutter, clay pit, iron mine and cropland to level 1.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend one more of each resource tile to level 1.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_one_of_each\"><\/div>\n\t\t","number":-8,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 8: One Each!<\/h4><div class=\"spoken\">&rdquo;Very good, great develop of resources production.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">100<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">40<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','9');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_one_of_each\"><\/div>\n\t\t","number":8,"reward":{"wood":100,"clay":120,"iron":40,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>


<?php } elseif($_SESSION['qst']== 9){

$getvID = $database->getVillageID($session->uid);
$nvillage = $database->getFieldDistance($getvID);
$ncoor = $database->getCoor($nvillage);
$nvillagename = $database->getVillageField($nvillage,"name");
if ($x!=$ncoor['x'] or $y!=$ncoor['y']){

?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 9: Neighbours!<\/h4><div class=\"spoken\">&rdquo;Around you, there are many different villages. One of them is named <b><?php echo $nvillagename; ?><\/b>. Click on 'map' in the header menu and look for that village. The name of your neighbours' villages can be seen when hovering your mouse over any of them.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Look for the coordinates of <b><?php echo $nvillagename; ?><\/b> and enter them here.<\/div><div class=\"coordinatesInput\"><div class=\"xCoord\"><label for=\"xCoordInputQuest\">X:<\/label><input maxlength=\"4\" value=\"\" id=\"qst_val\" name=\"qstin\" id=\"xCoordInputQuest\" class=\"text coordinates x \"><\/div><div class=\"yCoord\"><label for=\"yCoordInputQuest\">Y:<\/label><input maxlength=\"4\" value=\"\" name=\"qstin\" id=\"yCoordInputQuest\" class=\"text coordinates y \"><\/div><div class=\"clear\"><\/div><\/div><button type=\"button\" value=\"complete task\" class=\"coordinatesButton\" onclick=\"qst_next2('','coor',document.getElementById('qst_val').value,document.getElementById('yCoordInputQuest').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">complete task<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"neighbour\"><\/div>\n\t\t","number":-9,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 9: Neighbours!<\/h4><div class=\"spoken\">&rdquo;Exactly, there <b> <?php echo $nvillagename;?> <\/b> Village! As many resources as you reach this village. Well, almost as much ...”&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">60<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">30<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">90<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','10');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"neighbour\"><\/div>\n\t\t","number":9,"reward":{"wood":60,"clay":30,"iron":40,"crop":90},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 10){

//Check additional of each resource upgraded to lvl1 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>0){$ironL++;};if($tRes['f7']>0){$ironL++;};if($tRes['f10']>0){$ironL++;};if($tRes['f11']>0){$ironL++;}
if($tRes['f5']>0){$clayL++;};if($tRes['f6']>0){$clayL++;};if($tRes['f16']>0){$clayL++;};if($tRes['f18']>0){$clayL++;}
if($tRes['f1']>0){$woodL++;};if($tRes['f3']>0){$woodL++;};if($tRes['f14']>0){$woodL++;};if($tRes['f17']>0){$woodL++;}
if($tRes['f2']>0){$cropL++;};if($tRes['f8']>0){$cropL++;};if($tRes['f9']>0){$cropL++;};if($tRes['f12']>0){$cropL++;};if($tRes['f13']>0){$cropL++;};if($tRes['f15']>0){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 10: Everything to 1!<\/h4><div class=\"spoken\">&rdquo;Now we should increase your resource production a bit. Extend all your resource tiles to level 1.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend all resource tiles to level 1.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_all_one\"><\/div>\n\t\t","number":-12,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 10: Everything to 1!<\/h4><div class=\"spoken\">&rdquo;Very good, your resource production just thrives. <br><br>Soon we can start with constructing buildings in the village.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">75<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">30<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">50<\/span><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','11');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_all_one\"><\/div>\n\t\t","number":12,"reward":{"wood":75,"clay":120,"iron":30,"crop":50},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 11){ 

//Check player Descriptions for [#0]
$Dave= strrpos ($uArray['desc1'],'[#0]');
$Dave2=strrpos ($uArray['desc2'],'[#0]');
if (!is_numeric($Dave) and !is_numeric($Dave2)){?>
{"markup":"\n\t\t<div id=\"qstd\"><h4>Task 11: Dove of Peace<\/h4><div class=\"spoken\">&rdquo;The first few days after signing up, you are protected from attacks by your fellow players. You can see how long this protection lasts by adding the code  <b>[#0]<\/b> to your profile.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Write the code [#0] into your profile by adding it to one of the two description fields.<\/div><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":"-11","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 11: Dove of Peace<\/h4><div class=\"spoken\">&rdquo;Well done! Now everyone can see what a great warrior the world is approached by.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">120<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">140<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">100<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','12');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":11,"reward":{"wood":120,"clay":200,"iron":140,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 12){

//Check cranny builded or no
$cranny = $building->getTypeLevel(23);
if ($cranny == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 12: Cranny<\/h4><div class=\"spoken\">&rdquo;It's time to construct a cranny. The world of Travian is dangerous. Many players live by stealing other players' resources. Build a cranny to hide some of your resources from enemies.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a cranny.</div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"cranny\"><\/div>\n\t\t","number":-12,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 12: Cranny<\/h4><div class=\"spoken\">&rdquo;Well done, now it's way harder for your mean fellow players to plunder your village.\r\n<br \/><br \/>\r\nIf under attack, your villagers will hide the resources in the Cranny all on their own.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">150<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">180<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">30<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">130<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','13');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"cranny\"><\/div>\n\t\t","number":12,"reward":{"wood":150,"clay":180,"iron":30,"crop":130},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 13){

//Check one of each resource is lvl2 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<1 || $clayL<1 || $woodL<1 || $cropL<1){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 13: To Two!<\/h4><div class=\"spoken\">&rdquo;In Travian, there is always something to do! Extend one woodcutter, one clay pit, one iron mine and one cropland to level 2 each.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend one of each resource tile to level 2.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"res_two_of_each\"><\/div>\n\t\t","number":"-13","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 13: To Two!<\/h4><div class=\"spoken\">&rdquo;Very good, your village grows and thrives!&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">60<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">50<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">30<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','14');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"res_two_of_each\"><\/div>\n\t\t","number":13,"reward":{"wood":60,"clay":50,"iron":40,"crop":30},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 14){ 

//Check player submited number Barracks cost lumber
if ($lSubmited!=210){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 14: Instructions<\/h4><div class=\"spoken\">&rdquo;In the in-game instructions, you can find short information texts about different buildings and types of units. Click on the black book down in the left corner to find out how much lumber is required for the barracks.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Enter how much lumber the barracks costs.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" onkeypress=\"if (event.keyCode==13) {qst_next('','lumber',document.getElementById('qst_val').value);}\"> <button type=\"button\" value=\"complete task\" onclick=\"qst_next('','lumber',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">complete task<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"cost\"><\/div>\n\t\t","number":"-14","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 14: Instructions<\/h4><div class=\"spoken\">&rdquo;Exactly! Barracks cost 210 lumber.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">50<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">30<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">20<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','15');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"cost\"><\/div>\n\t\t","number":14,"reward":{"wood":50,"clay":30,"iron":60,"crop":20},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 15){

//Check main building lvl is 3 or upper
$mainbuilding = $building->getTypeLevel(15);
if ($mainbuilding<3){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 15: Main Building<\/h4><div class=\"spoken\">&rdquo;Your master builders need a main building level 3 to erect important buildings such as the marketplace or barracks.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend your main building to level 3.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":-15,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 15: Main Building<\/h4><div class=\"spoken\">&rdquo;Well done. The main building level 3 has been completed.\r\n<br><br>\r\nWith this upgrade your master builders cannot only construct more types of buildings but also do so faster.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">75<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">75<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">40<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">40<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','16');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":15,"reward":{"wood":75,"clay":75,"iron":40,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 16){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
$displayarray = $database->getUserArray($temp['uid'],1);
$rRes=$ranking->getUserRank($displayarray['username']);
if ($rRes!=$rSubmited){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 16: Advanced!<\/h4><div class=\"spoken\">&rdquo;Look up your rank in the player statistics again and enjoy your progress.&rdquo;</div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Look for your rank in the statistics and enter it here.<\/div><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" onkeypress=\"if (event.keyCode==13) {qst_next('','rank',document.getElementById('qst_val').value);}\"> <button type=\"button\" value=\"complete task\" onclick=\"qst_next('','rank',document.getElementById('qst_val').value)\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">complete task<\/div><\/div><\/button><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"rank2\"><\/div>\n\t\t","number":"-16","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 16: Advanced!<\/h4><div class=\"spoken\">&rdquo;Well done! That's your current rank.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">100<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">90<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">100<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img/x.gif\" alt=\"Crop\">60<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','17');\">Continue with the next task<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank2\"><\/div>\n\t\t","number":16,"reward":{"wood":100,"clay":90,"iron":100,"crop":60},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 17){

// Ask from plyer ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 17: Weapons or Dough<\/h4><div class=\"spoken\">&rdquo;Now you have to make a decision: either trade peacefully or become a dreaded warrior. <br><br> or the marketplace you need a granary, for troops you need a barracks.&rdquo;<\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><button type=\"button\" value=\"Gazdaság\" class=\"qb1 granary_barracks\" onclick=\"javascript: qst_next('','21');\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">Economy<\/div><\/div><\/button><button type=\"button\" value=\"Katonaság\" class=\"qb2 granary_barracks\" onclick=\"javascript: qst_next('','18');\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"><\/div><\/div><\/div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"><\/div><\/div><\/div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"><\/div><\/div><\/div><\/div><div class=\"button-contents\">Military<\/div><\/div><\/button><div class=\"clear\"><\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks\"><\/div>\n\t\t","number":"-17","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}

<?php } elseif($_SESSION['qst']== 18){
$database->updateUserField($_SESSION['username'],'quest_choose','1',0);
// Checking barracks builded or no
$barrack = $building->getTypeLevel(19);
if ($barrack==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Barracks<\/h4><div class=\"spoken\">&rdquo;A brave choice. To build troops you need a barracks.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build barracks.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":"-18","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Barracks<\/h4><div class=\"spoken\">&rdquo;Well done... The best instructors from the whole country have gathered to train your men\u2019s fighting skills to top form.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">100<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">100<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','19');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":18,"reward":{"wood":70,"clay":100,"iron":90,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 19){

// Checking 2 warrior trained or no
$units = $village->unitall;
$unarray=array("","Legionnaire", "Clubswinger","Phalanx");
$unarray2=array("","u1", "u11","u21");
if ($units[$unarray2[$session->userinfo['tribe']]]<2){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 19: Train!<\/h4><div class=\"spoken\">&rdquo;Now that you have barracks you can start training troops. Train two <?php echo $unarray[$session->userinfo['tribe']];?>.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Please train 2 <?php echo $unarray[$session->userinfo['tribe']];?>..<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":"-19","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 19: Train!<\/h4><div class=\"spoken\">&rdquo;The foundation for your glorious army has been laid.<br \/><br \/>\r\nBefore sending your army off to plunder you should check with the <a href=\"warsim.php\">Combat-Simulator<\/a> to see how many troops you need to successfully fight one rat without losses.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">300<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">320<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">360<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">570<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','20');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":19,"reward":{"wood":300,"clay":320,"iron":360,"crop":570},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 20){

$unarray=array("","city wall", "earth wall","palisade");


$wall = $village->resarray['f40'];
if ($wall==0){?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 20: Build a <?php echo $unarray[$session->userinfo['tribe']];?><\/h4><div class=\"spoken\">&rdquo;Now that you have trained some soldiers, you should build a <?php echo $unarray[$session->userinfo['tribe']];?> too. It increases the base defence and your soldiers will receive a defensive bonus.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build a <?php echo $unarray[$session->userinfo['tribe']];?> .<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"wall<?php echo $session->userinfo['tribe'];?>\"><\/div>\n\t\t","number":"-23","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\<div id=\"popup3\"><div id=\"qstd\"><h4>Task 20: Build a <?php echo $unarray[$session->userinfo['tribe']];?><\/h4><div class=\"spoken\">&rdquo;That's what I'm talking about. A <?php echo $unarray[$session->userinfo['tribe']];?> Very useful. It increases the defence of the troops in the village.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">80<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','24');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wall<?php echo $session->userinfo['tribe'];?>\"><\/div>\n\t\t","number":23,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']==21){
$database->updateUserField($_SESSION['username'],'quest_choose','2',0);
// Checking granary builded or no
$granary = $building->getTypeLevel(11);
if ($granary ==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Trade & economy<\/h4><div class=\"spoken\">&rdquo;Trade & economy was your choice. Golden times await you for sure!&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a granary.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks1\"><\/div>\n\t\t","number":"-20","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Trade & economy<\/h4><div class=\"spoken\">&rdquo;Well done! With the Granary you can store more wheat.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">80<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">90<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">60<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">40<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','22');\">Continue with the next task<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks1\"><\/div>\n\t\t","number":20,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 22){

// Checking warehouse builded or no
$warehouse = $building->getTypeLevel(10);
if ($warehouse==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 19: Warehouse<\/h4><div class=\"spoken\">&rdquo;Crop isn't the only resource which must be saved; other resources can go to waste as well if they are not stored correctly. Construct a warehouse!&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build a warehouse.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":"-21","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 19: Warehouse<\/h4><div class=\"spoken\">&rdquo;Well done, your Warehouse is complete...&rdquo;<\/i><br \/>Now you have fulfilled all prerequisites required to construct a Marketplace.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">50<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','23');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":21,"reward":{"wood":70,"clay":120,"iron":90,"crop":50},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 23){

// Checking market builded or no
$market = $building->getTypeLevel(17);
if ($market==0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 20: Marketplace<\/h4><div class=\"spoken\">&rdquo;Build a marketplace so you can trade with other players.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build a marketplace.<\/div><span id=\"qst_accpt\"><\/span><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":"-22","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 20: Marketplace<\/h4><div class=\"spoken\">&rdquo;The Marketplace has been completed. Now you can make offers of your own and accept foreign offers! When creating your own offers, you should think about offering what other players need most to get more profit.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">200<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">450<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a class=\"arrow\" href=\"javascript: qst_next('','24');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":22,"reward":{"wood":1200,"clay":200,"iron":200,"crop":450},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } ?>

<?php } ?>

<?php
if ($dataarray[0]==1){
$ff25 = "<div class=none><b>Everything to 2!<\/b><\/div>";
} else { $ff25 = "<a onclick=qst_next('','225')>Everything to 2!<\/a>"; }

if($uArray['quest_choose'] == 2){
if ($dataarray[1]==1){
$ff26 = "<div class=none><b>Barracks to level 1.<\/b><\/div>";
} else { $ff26 = "<a onclick=qst_next('','226')>Barracks to level 1.<\/a>"; }
}else{
if ($dataarray[1]==1){
$ff26 = "<div class=none><b>Marketplace to level 1.<\/b><\/div>";
} else { $ff26 = "<a onclick=qst_next('','226')>Marketplace to level 1.<\/a>"; }
}
if ($dataarray[2]==1){
$ff27 = "<div class=none><b>Embassy<\/b><\/div>";
} else { $ff27 = "<a onclick=qst_next('','227')>Embassy<\/a>"; }

if ($dataarray[3]==1){
$ff28 = "<div class=none><b>Alliance<\/b><\/div>";
} else { $ff28 = "<a onclick=qst_next('','228')>Alliance<\/a>"; }

if ($dataarray[4]==1){
$ff29 = "<div class=none><b>Main Building to Level 5<\/b><\/div>";
} else { $ff29 = "<a onclick=qst_next('','229')>Main Building to Level 5<\/a>"; }

if ($dataarray[5]==1){
$ff30 = "<div class=none><b>Granary to Level 3<\/b><\/div>";
} else { $ff30 = "<a onclick=qst_next('','330')>Granary to Level 3<\/a>"; }

if ($dataarray[6]==1){
$ff31 = "<div class=none><b>Warehouse to Level 7<\/b><\/div>";
} else { $ff31 = "<a onclick=qst_next('','331')>Warehouse to Level 7<\/a>"; }

if ($dataarray[7]==1){
$ff32 = "<div class=none><b>All to five!<\/b><\/div>";
} else { $ff32 = "<a onclick=qst_next('','332')>All to five!<\/a>"; }

if ($dataarray[8]==1){
$ff33 = "<div class=none><b>Palace or Residence?<\/b><\/div>";
} else { $ff33 = "<a onclick=qst_next('','333')>Palace or Residence?<\/a>"; }

if ($dataarray[9]==1){
$ff34 = "<div class=none><b>3 settlers<\/b><\/div>";
} else { $ff34 = "<a onclick=qst_next('','334')>3 settlers<\/a>"; }

if ($dataarray[10]==1){
$ff35 = "<div class=none><b>New Village<\/b><\/div>";
} else { $ff35 = "<a onclick=qst_next('','335')>New Village<\/a>"; }


if($_SESSION['qst']== 24){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div><b>There are still many tasks to be completed; you may finish them at your own pace:</b><ul><input type=\"hidden\" id=\"qst_val\" value=\"\"><li><?php echo $ff25;?><\/li><li><?php echo $ff26;?><\/li><li><?php echo $ff27;?><\/li><li><?php echo $ff28;?><\/li><li><?php echo $ff29;?><\/li><li><?php echo $ff30;?><\/li><li><?php echo $ff31;?><\/li><li><?php echo $ff32;?><\/li><li><?php echo $ff33;?><\/li><li><?php echo $ff34;?><\/li><li><?php echo $ff35;?><\/li><\/ul><\/div><\/div>\n\t\t\n\t\t","number":"-24","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}


<?php } elseif($_SESSION['qst']== 25){

$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Everything to 2!<\/h4><div class=\"spoken\">&rdquo;Now it's time again to extend the cornerstones of might and wealth! This time level 1 is not enough... it will take a while but in the end it will be worth it. Expand all your resource tiles to level 2...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Expand all resource tiles to level 2.<\/div><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_res_all_two\" id=\"qstbg\"><\/div>\n\t\t","number":"-25","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Everything to 2!<\/h4><div class=\"spoken\">&rdquo;Congratulations! Your village grows and thrives...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources gold\" alt=\"سکۀ طلای تراوین\"><img alt=\"سکۀ طلای تراوین\" class=\"gold\" src=\"img/x.gif\">15<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','25');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_res_all_two\"><\/div>\n\t\t","number":25,"reward":{"gold":15},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 26){

if($uArray['quest_choose'] == 2){

// Checking barracks builded or no
$barrack = $building->getTypeLevel(19);
if ($barrack == 0){ ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Barracks<\/h4><div class=\"spoken\">&rdquo;To build troops you need a barracks.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build barracks.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">100<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">100<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":"-26","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Task 18: Barracks<\/h4><div class=\"spoken\">&rdquo;Well done... The best instructors from the whole country have gathered to train your men\u2019s fighting skills to top form.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">70<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">100<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">90<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">100<\/span><\/div><div class=\"clear\"><\/div><br><span id=\"qst_accpt\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','26');\" class=\"qri arrow\">Take Reward<\/a></br><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_barracks2\"><\/div>\n\t\t","number":26,"reward":{"wood":70,"clay":100,"iron":90,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }

}else{

$market = $building->getTypeLevel(17);
if ($market == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Marketplace to level 1.<\/h4><div class=\"spoken\">&rdquo;Build a level 1 marketplace.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build a marketplace.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">140<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_market_barracks1\" id=\"qstbg\"><\/div>\n\t\t","number":"-26","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Marketplace to level 1.<\/h4><div class=\"spoken\">&rdquo;The Marketplace has been completed. Now you can make offers of your own and accept foreign offers! When creating your own offers, you should think about offering what other players need most to get more profit.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">140<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">200<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','26');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_market_barracks1\"><\/div>\n\t\t","number":26,"reward":{"wood":140,"clay":200,"iron":180,"crop":200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php }}$_SESSION['qst'] = 24; ?>

<?php } elseif($_SESSION['qst']== 27){

$embassy = $building->getTypeLevel(18);
if ($embassy == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Embassy<\/h4><div class=\"spoken\">&rdquo;The world of Travian is dangerous. You already built a Cranny to protect your resources against attackers. A good alliance will give you even better protection. To accept invitations from alliances, build an embassy.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build an embassy.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">80<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_dispatch\" id=\"qstbg\"><\/div>\n\t\t","number":"-27","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Embassy<\/h4><div class=\"spoken\">&rdquo;Well done, the construction of your embassy is finished. Now you can accept invitations from alliances. To do so, just click on the embassy.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">200<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">120<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">80<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','27');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_dispatch\"><\/div>\n\t\t","number":27,"reward":{"wood":200,"clay":120,"iron":180,"crop":80},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 28){

$aid = $session->alliance;
$allianceinfo = $database->getAlliance($aid);
if ($aid['alliance'] == 0){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Alliance<\/h4><div class=\"spoken\">&rdquo;Teamwork is important in Travian. Players who work together organise themselves in alliances. Get an invitation from an alliance in your region and join this alliance. Alternatively, you can found your own alliance. To do this, you need a level 3 embassy.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Join an alliance or found one on your own.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">240<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">280<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">100<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_alliance\" id=\"qstbg\"><\/div>\n\t\t","number":"-28","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Alliance<\/h4><div class=\"spoken\">&rdquo;Is good! Now you're in a union called <b><?php echo $allianceinfo['tag'];?><\/b>, and you're a member of their alliance with the faster you'll progress...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">240<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">280<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">180<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">100<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','28');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_alliance\"><\/div>\n\t\t","number":28,"reward":{"wood":240,"clay":280,"iron":180,"crop":100},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 29){

$mainbuilding = $building->getTypeLevel(15);
if ($mainbuilding < 5){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Main Building to Level 5<\/h4><div class=\"spoken\">&rdquo;To be able to build a palace or residence, you´ll need a main building at level 5.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Upgrade your main building to level 5.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">750<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_main_on_five\" id=\"qstbg\"><\/div>\n\t\t","number":"-29","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Main Building to Level 5<\/h4><div class=\"spoken\">&rdquo;The main building is level 5 now and you can build palace or residence...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">750<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','29');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_main_on_five\"><\/div>\n\t\t","number":29,"reward":{"wood":600,"clay":750,"iron":600,"crop":300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 30){

$granary = $building->getTypeLevel(11);
if ($granary < 3){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Granary to Level 3<\/h4><div class=\"spoken\">&rdquo;That you don´t lose crop, you should upgrade your granary.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Upgrade your granary to level 3.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">900<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">850<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_granary_on_three\" id=\"qstbg\"><\/div>\n\t\t","number":"-30","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Granary to Level 3<\/h4><div class=\"spoken\">&rdquo;Granary is level 3 now...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">900<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">850<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','30');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_granary_on_three\"><\/div>\n\t\t","number":30,"reward":{"wood":900,"clay":850,"iron":600,"crop":300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 31){

$warehouse = $building->getTypeLevel(10);
if ($warehouse < 7){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Warehouse to Level 7<\/h4><div class=\"spoken\">&rdquo;To make sure your resources won't overflow, you should upgrade your warehouse.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Upgrade your warehouse to level 7.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1800<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">1650<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">800<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_warehouse_on_seven\" id=\"qstbg\"><\/div>\n\t\t","number":"-31","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Warehouse to Level 7<\/h4><div class=\"spoken\">&rdquo;Warehouse has upgraded to level 7...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1800<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">1650<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">800<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','31');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_warehouse_on_seven\"><\/div>\n\t\t","number":31,"reward":{"wood":1800,"clay":2000,"iron":1650,"crop":800},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 32){

//Check one of each resource is lvl5 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>4){$ironL++;};if($tRes['f7']>4){$ironL++;};if($tRes['f10']>4){$ironL++;};if($tRes['f11']>4){$ironL++;}
if($tRes['f5']>4){$clayL++;};if($tRes['f6']>4){$clayL++;};if($tRes['f16']>4){$clayL++;};if($tRes['f18']>4){$clayL++;}
if($tRes['f1']>4){$woodL++;};if($tRes['f3']>4){$woodL++;};if($tRes['f14']>4){$woodL++;};if($tRes['f17']>4){$woodL++;}
if($tRes['f2']>4){$cropL++;};if($tRes['f8']>4){$cropL++;};if($tRes['f9']>4){$cropL++;};if($tRes['f12']>4){$cropL++;};if($tRes['f13']>4){$cropL++;};if($tRes['f15']>4){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>All to five!<\/h4><div class=\"spoken\">&rdquo;You will always need more resources. Resource tiles are quite expensive but will always pay out in the long term.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Upgrade all resources tiles to level 5.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">1800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">1950<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">1200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_res_all_five\" id=\"qstbg\"><\/div>\n\t\t","number":"-32","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>All to five!<\/h4><div class=\"spoken\">&rdquo;All resources were to level 5, the village's products have gone up and take a step forward...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">1800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">1950<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">1200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','32');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_res_all_five\"><\/div>\n\t\t","number":32,"reward":{"wood":1600,"clay":1800,"iron":1950,"crop":1200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 33){

$residence = $building->getTypeLevel(25);
$palace = $building->getTypeLevel(26);
if($palace >= 10){
$text = "Palace ";
}else if($residence >= 10){
$text = "Residence ";
}
if ($residence<10 && $palace<10){?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Palace or Residence?<\/h4><div class=\"spoken\">&rdquo;To found a new village, you´ll need settlers. Those you can train in either a palace or a residence.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Build a palace or residence to level 10.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">3400<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">2800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">3600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">2200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_palace_or_residence\" id=\"qstbg\"><\/div>\n\t\t","number":"-33","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>Palace or Residence?<\/h4><div class=\"spoken\">&rdquo;<?php echo $text; ?> had reached to level 10, you can now train settlers and found your second village. Notice the cultural points...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">3400<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">2800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">3600<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">2200<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','33');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_palace_or_residence\"><\/div>\n\t\t","number":33,"reward":{"wood":3400,"clay":2800,"iron":3600,"crop":2200},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 34){

// Checking 3 settlers trained or no
$units = $village->unitall;
$unarray2=array("","u10", "u20","u30");
if ($units[$unarray2[$session->userinfo['tribe']]]<3){ $cp = CP;?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>3 settlers<\/h4><div class=\"spoken\">&rdquo;To found a new village, you´ll need settlers. You can train them in the palace or residence.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Train 3 settlers.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1050<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">900<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">750<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_three_settlers\" id=\"qstbg\"><\/div>\n\t\t","number":"-34","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>3 settlers<\/h4><div class=\"spoken\">&rdquo;3 settlers were trained. To found new village you need at least <?php echo ${cp.$cp}[2];?>culture points...&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1050<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">800<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">900<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">750<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','34');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_three_settlers\"><\/div>\n\t\t","number":34,"reward":{"wood":1050,"clay":800,"iron":900,"crop":750},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>

<?php } elseif($_SESSION['qst']== 35){

$vil = $database->getProfileVillages($session->uid);
if (count($vil)<2){ ?>

{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>New Village<\/h4><div class=\"spoken\">&rdquo;There are a lot of empty tiles on the map. Find one that suits you and found a new village.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Found a new village.<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">1800<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">1300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"javascript: qst_next('','24');\" class=\"qle arrow\">Back to overview.<\/a><div class=\"clear\"><\/div><\/div><\/div>\n\t\t<div class=\"quest_new_village\" id=\"qstbg\"><\/div>\n\t\t","number":"-35","reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php $_SESSION['qstnew']='0'; }else{ $_SESSION['qstnew']='1'; ?>
{"markup":"\n\t\t<div id=\"popup3\"><div id=\"qstd\"><h4>New Village<\/h4><div class=\"spoken\">&rdquo;I´m proud of you! Now you have two villages and have all the possibilities to build a mighty empire. I wish you luck with this.&rdquo;<\/div><div class=\"rew\"><p class=\"ta_aw\">Task reward:<\/p><span class=\"resources r1\"><img class=\"r1\" title=\"Lumber\" src=\"img\/x.gif\" alt=\"Lumber\">1600<\/span><span class=\"resources r2\"><img class=\"r2\" title=\"Clay\" src=\"img\/x.gif\" alt=\"Clay\">2000<\/span><span class=\"resources r3\"><img class=\"r3\" title=\"Iron\" src=\"img\/x.gif\" alt=\"Iron\">1800<\/span><span class=\"resources r4\"><img class=\"r4\" title=\"Crop\" src=\"img\/x.gif\" alt=\"Crop\">1300<\/span><div class=\"clear\"><\/div><\/div><input type=\"hidden\" id=\"qst_val\" value=\"\"><a href=\"#\" onclick=\"qst_next('','24')\" class=\"qle arrow\">Back to overview.<\/a><a href=\"javascript: qst_next('','35');\" class=\"qri arrow\">Take Reward<\/a><div class=\"clear\"><\/div><\/div>\n\t\t<div id=\"qstbg\" class=\"quest_new_village\"><\/div>\n\t\t","number":35,"reward":{"wood":1600,"clay":2000,"iron":1800,"crop":1300},"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"<?php echo $messagelol; ?>","altstep":0}
<?php } $_SESSION['qst'] = 24;?>




// End tasks message
<?php } ?>
