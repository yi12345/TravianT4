<?php
$prefix = "".TB_PREFIX."mdata";
$sql = mysql_query("SELECT * FROM $prefix WHERE owner = $session->uid  AND delowner = 0 ORDER BY time DESC");
$query = mysql_num_rows($sql); // دریافت تعداد کوئری ها از دیتابیس

if (isset($_GET['page'])) { // دریافت شماره صفحه
    $page = preg_replace('#[^0-9]#i', '', $_GET['page']); // فیلتر کردن همه چیز به جز اعداد
} else {
    $page = 1;
} 

$itemsPerPage = 10; //تعداد آیتم های قابل نمایش در هر صفحه
$lastPage = ceil($query / $itemsPerPage); // دریافت مقدار آخرین صفحه

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
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=2">2</a>';
	
}elseif ($page == 1 && $lastPage == 3) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=2">2</a> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=3">3</a>';
	
}elseif ($page == 1) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add2 . '">' . $add2 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';
	
} else if ($page == $lastPage && $lastPage == 2) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage && $lastPage == 3) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=2">2</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub2 . '">' . $sub2 . '</a> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == ($lastPage - 1) && $lastPage == 3) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 2 && $page < ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';
	
}else if ($page == ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 1 && $page < $lastPage && $lastPage == 3) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a>';
    
} else if ($page > 1 && $page < $lastPage) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';
}




$limit = 'LIMIT ' .($page - 1) * $itemsPerPage .',' .$itemsPerPage; 
$sql2 = mysql_query("SELECT * FROM $prefix WHERE owner = $session->uid AND delowner = 0 ORDER BY time DESC $limit");
$paginationDisplay = "";
$nextPage = $_GET['page'] + 1;
$previous = $_GET['page'] - 1;

if ($page == "1" && $lastPage == "1"){
$paginationDisplay .=  '<img alt="صفحه اول" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="صفحه قبل" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="صفحه بعد" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="صفحه آخر" src="img/x.gif" class="last disabled">';

}elseif ($lastPage == 0){
$paginationDisplay .=  '<img alt="صفحه اول" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="صفحه قبل" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="صفحه بعد" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="صفحه آخر" src="img/x.gif" class="last disabled">';

}elseif ($page == "1" && $lastPage != "1"){
$paginationDisplay .=  '<img alt="صفحه اول" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="صفحه قبل" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="' . $_SERVER['PHP_SELF'] . '?page=' . $nextPage . '"><img alt="صفحه بعد" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '"><img alt="صفحه آخر" src="img/x.gif"></a>';

}elseif ($page != "1" && $page != $lastPage){
$paginationDisplay .=  '<a class="first" href="' . $_SERVER['PHP_SELF'] . '?page=1"><img alt="صفحه اول" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="' . $_SERVER['PHP_SELF'] . '?page=' . $previous . '"><img alt="صفحه قبل" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="' . $_SERVER['PHP_SELF'] . '?page=' . $nextPage . '"><img alt="صفحه بعد" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '"><img alt="صفحه آخر" src="img/x.gif"></a>';

}elseif ($page == $lastPage){
$paginationDisplay .=  '<a class="first" href="' . $_SERVER['PHP_SELF'] . '?page=1"><img alt="صفحه اول" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="' . $_SERVER['PHP_SELF'] . '?page=' . $previous . '"><img alt="صفحه قبل" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="صفحه بعد" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="صفحه آخر" src="img/x.gif" class="last disabled">';
}


$outputList = '';
$name = 1;
if($query == 0) {        
    $outputList .= "<td colspan=\"4\" class=\"none\">There are no sent messages available.</td>";
}else{
while($row = mysql_fetch_array($sql2)){ 
    $id = $row["id"];
    $target = $row["target"];
    $owner = $row["owner"];
    $topic = $row["topic"];
    $message = $row["message"];
    $viewed = $row["viewed"];
    $archived = $row["archived"];
    $send = $row["send"];
    $time = $row["time"];
	
    
    $outputList .= "<tr><td class=\"sel\"><input class=\"check\" type=\"checkbox\" name=\"n".$name."\" value=\"".$id."\" /></td><td class=\"subject\"><div class=\"subjectWrapper\">";
    if($viewed == 0) {
			$viewed = "Unread";
			} else { $viewed = "Read"; }
    $outputList .= "<img src=\"img/x.gif\" class=\"messageStatus messageStatus".$viewed."\" alt=\"خوانده شده\">
				<a href=\"nachrichten.php?id=".$id."\">".$topic."</a></div></td>";
    $date = $generator->procMtime($time);
    if($owner <= 1) {
    $outputList .= "<td class=\"send\"><a><u>".$database->getUserField($target,'username',0)."</u></a></td><td class=\"dat\">".$date[0]." ".$date[1]."</td>";
    }else {
    $outputList .= "<td class=\"send\"><a href=\"spieler.php?uid=".$owner."\">".$database->getUserField($target,'username',0)."</a></td><td class=\"dat\">".$date[0]." ".date('H:i',$time)."</td>";
    }
    
	$name++;
}
 }


?>
<form method="post" action="nachrichten.php" name="msg">

<table cellpadding="1" cellspacing="1" id="overview" class="inbox">
		<thead>
			<tr>
				<th colspan="2">Subject</th>
				<th class="send">Reciever</th>
				<th class="dat"><b>Sent</b></th>
			</tr>
		</thead>
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

<div class="administration">
<?php if($session->plus) { ?>
			<div class="checkAll">
			<input class="check" type="checkbox" id="sAll" onclick="
				$(this).up('form').getElements('input[type=checkbox]').each(function(element)
				{
					element.checked = this.checked;
				}, this);
			">
			<span><label for="sAll">Check All</label></span>
            </div>
<?php } ?>

	  <div class="paginator">
	  <?php echo $paginationDisplay; ?>
      </div>
    <div class="clear"></div>
</div><p><?php if(!$session->is_sitter) { ?>
<button name="delmsg" type="submit" value="del" id="del" class="delete">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Delete</div></div>
</button>
                    
<?php if($session->plus) { ?>
<button name="archive" type="submit" value="archive" id="archive" class="delete">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Archive</div></div>
</button>

<?php } } ?>
<input name="ft" value="m3" type="hidden" />

</form>