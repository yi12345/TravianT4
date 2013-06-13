
<?php
$noticeClass = array("Scout Report","Won as attacker without losses","Won as attacker with losses","Lost as attacker with losses","Won as defender without losses","Won as defender with losses","Lost as defender with losses","Lost as defender without losses","Reinforcement arrived","","Wood Delivered","Clay Delivered","Iron Delivered","Crop Delivered","","Won as defender without losses","Won as defender with losses","Lost as defender with losses","Won scouting as attacker","Lost scouting as attacker","Won scouting as defender","Lost scouting as defender","Scout Report");
$prefix = "".TB_PREFIX."ndata";
$limit2 = "and (ntype = 0 or ntype = 9 or ntype >= 15)";
$sql = mysql_query("SELECT * FROM $prefix WHERE uid = $session->uid and archive = 0 $limit2 and del = 0 ORDER BY time DESC");
$query = mysql_num_rows($sql);

if (isset($_GET['page'])) {
    $page = preg_replace('#[^0-9]#i', '', $_GET['page']);
} else {
    $page = 1;
} 

$itemsPerPage = 10;
$lastPage = ceil($query / $itemsPerPage);

if ($page < 1) {
    $page = 1;
} else if ($page > $lastPage) {
    $page = $lastPage;
} 

$centerPages = "";
$sub1 = $page - 1;
$sub2 = $page - 2;
$sub3 = $page - 3;
$add1 = $page + 1;
$add2 = $page + 2;
$add3 = $page + 3;

if ($page <= 1 && $lastPage <= 1) {
    $centerPages .= '<span class="number currentPage">1</span>';
	
}elseif ($page == 1 && $lastPage == 2) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=2">2</a>';
	
}elseif ($page == 1 && $lastPage == 3) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=2">2</a> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=3">3</a>';
	
}elseif ($page == 1) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $add1 . '">' . $add1 . '</a> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $add2 . '">' . $add2 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $lastPage . '">' . $lastPage . '</a>';
	
} else if ($page == $lastPage && $lastPage == 2) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage && $lastPage == 3) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1">1</a> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=2">2</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $sub2 . '">' . $sub2 . '</a> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == ($lastPage - 1) && $lastPage == 3) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 2 && $page < ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $lastPage . '">' . $lastPage . '</a>';
	
}else if ($page == ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 1 && $page < $lastPage && $lastPage == 3) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $add1 . '">' . $add1 . '</a>';
    
} else if ($page > 1 && $page < $lastPage) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $lastPage . '">' . $lastPage . '</a>';
}




$limit = 'LIMIT ' .($page - 1) * $itemsPerPage .',' .$itemsPerPage;

$sql2 = mysql_query("SELECT * FROM $prefix WHERE uid = $session->uid and archive=0 $limit2 and del = 0 ORDER BY time DESC $limit");
$paginationDisplay = "";
$nextPage = $_GET['page'] + 1;
$previous = $_GET['page'] - 1;

if ($page == "1" && $lastPage == "1"){
$paginationDisplay .=  '<img alt="Első" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="Előző" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="Következő" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="Utolsó" src="img/x.gif" class="last disabled">';

}elseif ($lastPage == 0){
$paginationDisplay .=  '<img alt="Első" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="Előző" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="Következő" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="Utolsó" src="img/x.gif" class="last disabled">';

}elseif ($page == "1" && $lastPage != "1"){
$paginationDisplay .=  '<img alt="Első" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="Előző" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=2"><img alt="Következő" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=3"><img alt="Utolsó" src="img/x.gif"></a>';

}elseif ($page != "1" && $page != $lastPage){
$paginationDisplay .=  '<a class="first" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1"><img alt="Első" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $previous . '"><img alt="Előző" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $nextPage . '"><img alt="Következő" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $lastPage . '"><img alt="Utolsó" src="img/x.gif"></a>';

}elseif ($page == $lastPage){
$paginationDisplay .=  '<a class="first" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=1"><img alt="Első" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="' . $_SERVER['PHP_SELF'] . '?t=' . $_GET['t'] . '&page=' . $previous . '"><img alt="Előző" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="Következő" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="Utolsó" src="img/x.gif" class="last disabled">';
}


$outputList = '';
$name = 1;
if($query == 0) {        
    $outputList .= "<td colspan=\"4\" class=\"none\">There are no reports available.</td>";
}else{
while($row = mysql_fetch_array($sql2)){ 
    $id = $row["id"];
    $toWref = $row["toWref"];
    $topic = $row["topic"];
    $ntype = $row["ntype"];
    $data = $row["data"];
    $time = $row["time"];
    $viewed = $row["viewed"];
    $archive = $row["archive"];
	$type = (isset($_GET['t']) && $_GET['t'] == 5)? $archive : $ntype;
    $dataarray = explode(",",$data);
    
    
    $outputList .= "<tr><td class=\"sel\"><input class=\"check\" type=\"checkbox\" name=\"n".$name."\" value=\"".$id."\" /></td><td class=\"sub\">";
    
    if($type==9){
    	$outputList .= "<img src=\"img/x.gif\" class=\"iReport iReport21\" alt=\"".$noticeClass[$ntype]."\" title=\"".$noticeClass[$ntype]."\" /> <div>";
    }else{
		$newtype = $type;
		if($type >= 15) $newtype = $type - 11;
    	$outputList .= "<img src=\"img/x.gif\" class=\"iReport iReport$newtype\" alt=\"".$noticeClass[$type]."\" title=\"".$noticeClass[$type]."\" /> <div>";
    }

if($type==1 || $type==2 || $type==5 || $type==6 || $type==7){
    if ($dataarray[24]+$dataarray[25]+$dataarray[26]+$dataarray[27] == 0) {
    $style = "empty";
	} elseif ($dataarray[24]+$dataarray[25]+$dataarray[26]+$dataarray[27] != $dataarray[28]) {
    $style = "half";
    } else {
    $style = "full";
    }
    $carry = ($dataarray[24]+$dataarray[25]+$dataarray[26]+$dataarray[27])."/".$dataarray[28];
    
    $outputList .= "<div class=\"reportInfoIcon\"><img title=\"".$carry."\" src=\"img/x.gif\" class=\"reportInfo carry ".$style."\"></div>";
    
}elseif($type==9){
$btype = $dataarray[1];
$type = $dataarray[2];
if($btype < 16){
include "Templates/Auction/alt.tpl";
$typeArray = array("","helmet","body","leftHand","rightHand","shoes","horse","bandage25","bandage33","cage","scroll","ointment","bucketOfWater","bookOfWisdom","lawTables","artWork");
	if($dataarray[1]!='dead'){
    	if($dataarray[1]!=''){
			$outputList .= "<div class=\"reportInfoIcon\"><img title=\"".$name." (".$dataarray[3]."x)\" src=\"img/x.gif\" class=\"reportInfo itemCategory itemCategory_".$typeArray[$dataarray[1]]."\"></div>";
        }
    }else{
		$outputList .= "<div class=\"reportInfoIcon\"><img src=\"img/x.gif\" class=\"reportInfo adventureDifficulty0\" title=\"Your hero is dead\"></div>";
	}
}else if($btype == 16){
	if($dataarray[1]!='dead'){
    	if($dataarray[1]!=''){
			$outputList .= "<div class=\"reportInfoIcon\"><img title=\"".$technology->getUnitName($type)." (".$dataarray[3]."x)\" src=\"img/x.gif\" class=\"unit u".$type."\"\"></div>";
        }
    }else{
		$outputList .= "<div class=\"reportInfoIcon\"><img src=\"img/x.gif\" class=\"reportInfo adventureDifficulty0\" title=\"Your hero is dead\"></div>";
	}
}else{
	if($dataarray[1]!='dead'){
    	if($dataarray[1]!=''){
			$outputList .= "<div class=\"reportInfoIcon\"><img title=\"silver (".$dataarray[3]."x)\" src=\"img/x.gif\" class=\"silver\"\"></div>";
        }
    }else{
		$outputList .= "<div class=\"reportInfoIcon\"><img src=\"img/x.gif\" class=\"reportInfo adventureDifficulty0\" title=\"Your hero is dead\"></div>";
	}
}
}
    $outputList .= "<a href=\"berichte.php?id=".$id."\">".$topic." </a> ";
    if($viewed == 0) { $outputList .= "(New)"; }
    $date = $generator->procMtime($time);
    $outputList .= "</div><div class=\"clear\"></div></td>
			<td class=\"dat\">".$date[0]." ".date('H:i',$time)."</td></tr>";
	$name++;
}
 }


?>
<form method="post" action="berichte.php" name="msg">
<input type="hidden" name="t" id="t" value="<?php echo $_GET['t']; ?>">
	<table cellpadding="1" cellspacing="1" id="overview" class="row_table_data">
		<thead><tr><th colspan="2">Subject:</th><th class="sent">Sent:</th></tr></thead>
        <tbody>
   <?php 

    if(isset($_GET['s'])) {
    $s = $_GET['s'];
    }
    else {
    $s = 0;
    }
    
    print "$outputList";
    
    ?>

      
      
</tbody>
</table>

<div class="footer">
<?php if($session->plus) { ?>
			<div id="markAll">
			<input class="check" type="checkbox" id="sAll" onclick="
				$(this).up('form').getElements('input[type=checkbox]').each(function(element)
				{
					element.checked = this.checked;
				}, this);
			">
			<span><label for="sAll">Check all</label></span>
		</div>
<?php } ?>

	  <div class="paginator">
	  <?php echo $paginationDisplay; ?>
      </div>

    <div class="clear"></div>
</div>
<button name="delntc" type="submit" value="del" id="del" class="delete">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Delete</div></div>
</button>
                    
<?php if($session->plus) { ?>
<button name="archive" type="submit" value="archive" id="archive" class="delete">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Archive</div></div>
</button>
<?php } ?>
</form>