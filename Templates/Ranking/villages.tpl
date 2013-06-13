<h4 class="round">Biggest Villages</h4>
<table cellpadding="1" cellspacing="1" id="villages" class="row_table_data">
	<thead><tr><td></td><td>Village</td><td>Owner</td><td>Population</td><td>Coordinate</td></tr></thead>
<tbody>
<?php
if($_POST['rank'] > 0){
$myrank = $_POST['rank'];
}else if(trim($_POST['name']) != ""){
$wid = $database->getVillageByName(stripslashes($_POST['name']));
$myrank = $ranking->getVillageRank($wid);
}else{
$myrank = $ranking->getVillageRank($village->wid);
}
if(!isset($_GET['page'])){
    if($myrank > 20){
        $_GET['page'] = intval(($myrank/20)+1);
    }else{
        $_GET['page'] = 1;
    }
}
$sql = $ranking->procVillagesRanking();
$query = mysql_num_rows($sql);

if (isset($_GET['page'])) {
    $page = preg_replace('#[^0-9]#i', '', $_GET['page']);
} else {
    $page = 1;
} 

$itemsPerPage = 20;
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
    $centerPages .= '<a class="number" href="?tid=2&page=2">2</a>';
	
}elseif ($page == 1 && $lastPage == 3) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?tid=2&page=2">2</a> ';
    $centerPages .= '<a class="number" href="?tid=2&page=3">3</a>';
	
}elseif ($page == 1) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?tid=2&page=' . $add1 . '">' . $add1 . '</a> ';
	$centerPages .= '<a class="number" href="?tid=2&page=' . $add2 . '">' . $add2 . '</a> ... ';
	$centerPages .= '<a class="number" href="?tid=2&page=' . $lastPage . '">' . $lastPage . '</a>';
	
} else if ($page == $lastPage && $lastPage == 2) {
	$centerPages .= '<a class="number" href="?tid=2&page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage && $lastPage == 3) {
	$centerPages .= '<a class="number" href="?tid=2&page=1">1</a> ';
    $centerPages .= '<a class="number" href="?tid=2&page=2">2</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage) {
	$centerPages .= '<a class="number" href="?tid=2&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="?tid=2&page=' . $sub2 . '">' . $sub2 . '</a> ';
	$centerPages .= '<a class="number" href="?tid=2&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == ($lastPage - 1) && $lastPage == 3) {
    $centerPages .= '<a class="number" href="?tid=2&page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="?tid=2&page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 2 && $page < ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="?tid=2&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="?tid=2&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?tid=2&page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="?tid=2&page=' . $lastPage . '">' . $lastPage . '</a>';
	
}else if ($page == ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="?tid=2&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="?tid=2&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="?tid=2&page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 1 && $page < $lastPage && $lastPage == 3) {
    $centerPages .= '<a class="number" href="?tid=2&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?tid=2&page=' . $add1 . '">' . $add1 . '</a>';
    
} else if ($page > 1 && $page < $lastPage) {
    $centerPages .= '<a class="number" href="?tid=2&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?tid=2&page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="?tid=2&page=' . $lastPage . '">' . $lastPage . '</a>';
}



$paginationDisplay = "";
$nextPage = $_GET['page'] + 1;
$previous = $_GET['page'] - 1;

if ($page == "1" && $lastPage == "1"){
$paginationDisplay .=  '<img alt="Első oldal" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="Előző oldal" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="Következő oldal" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="Utolsó oldal" src="img/x.gif" class="last disabled">';

}elseif ($lastPage == 0){
$paginationDisplay .=  '<img alt="Első oldal" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="Előző oldal" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="Következő oldal" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="Utolsó oldal" src="img/x.gif" class="last disabled">';

}elseif ($page == "1" && $lastPage != "1"){
$paginationDisplay .=  '<img alt="Első oldal" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="Előző oldal" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="?tid=2&page=' . $nextPage . '"><img alt="Következő oldal" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="?tid=2&page=' . $lastPage . '"><img alt="Utolsó oldal" src="img/x.gif"></a>';

}elseif ($page != "1" && $page != $lastPage){
$paginationDisplay .=  '<a class="first" href="?tid=2&page=1"><img alt="Első oldal" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="?tid=2&page=' . $previous . '"><img alt="Előző oldal" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="?tid=2&page=' . $nextPage . '"><img alt="Következő oldal" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="?tid=2&page=' . $lastPage . '"><img alt="Utolsó oldal" src="img/x.gif"></a>';

}elseif ($page == $lastPage){
$paginationDisplay .=  '<a class="first" href="?tid=2&page=1"><img alt="Első oldal" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="?tid=2&page=' . $previous . '"><img alt="Előző oldal" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="Következő oldal" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="Utolsó oldal" src="img/x.gif" class="last disabled">';
}

	$limit = 'LIMIT ' .($page - 1) * $itemsPerPage .',' .$itemsPerPage; 
	$sql2 = $ranking->procVillagesRanking($limit);
    if(isset($_GET['page']) && $_GET['page'] > 1){
		$rank = ($_GET['page']-1)*20+1;
    }else{
    	$rank = 1;
    }
	while($row = mysql_fetch_array($sql2)){ 
    	$coor = $database->getCoor($row['wref']);
		if($myrank == $rank) {
			echo "<tr class=\"hl\"><td class=\"ra fc\" >".$rank.".</td>";
		}else {
			echo "<tr class=\"hover\"><td class=\"ra \" >".$rank.".</td>";
		}
        echo "<td class=\"vil \" ><a href=\"position_details.php?x=".$coor['x']."&amp;y=".$coor['y']."\">".$row['name']."</a></td>";
		echo "<td class=\"pla \" ><a href=\"spieler.php?uid=".$row['owner']."\">".$database->getUserField($row['owner'], 'username', 0)."</a></td>"; 
		echo "<td class=\"hab \" >".$row['pop']."</td>";
        
        echo "<td class=\"coords \"><a class=\"\" href=\"position_details.php?x=".$coor['x']."&amp;y=".$coor['y']."\"><span class=\"coordinates coordinatesAligned\"><span class=\"coordinatesWrapper\"><span class=\"coordinateY\">(".$coor['x']."</span><span class=\"coordinatePipe\">|</span><span class=\"coordinateX\">".$coor['y'].")</span></span></span><span class=\"clear\"> </span></a></td></tr>";
    
		$rank++;
	}


?>
	</tbody>
</table>

<?php
if(!isset($_GET['tid'])){ $_GET['tid']='1'; }
?>
<div id="search_navi">
	<form method="post" action="statistiken.php?tid=<?php echo isset($_GET['tid'])? $_GET['tid'] : 1; ?>">
		<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents w292">
            <table class="transparent">
                <tbody><tr>
                    <td>
                        <span>Rank <input type="text" class="text ra" maxlength="5" name="rank" value="" /></span>
                    </td>
                    <td>
                        <span>Name <input type="text" class="text name" maxlength="20" name="name" value="" /></span>
                    </td>
                    <td>
                        <input type="hidden" name="ft" value="r<?php echo isset($_GET['tid'])? $_GET['tid'] : 1; ?>" />
                        <button type="submit" value="submit" name="submit" id="btn_ok" class="dynamic_img" src="img/x.gif">
            <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">OK</div></div></button>
                    </td>
                </tr>
                </tbody>
            </table>
		</div>
		</div>
	</form>
<div class="paginator"><?php echo $paginationDisplay; ?></div>
</div>
<div class="clear">&nbsp;</div>