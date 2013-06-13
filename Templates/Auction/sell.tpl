<div id="auction">
<div class="silverAmount">
<div id="filter">
	<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents cf">		<div class="wrapper">
			<div class="silver">
				<img title="Silver" class="silver" src="img/x.gif"> <?php $now = $database->getAuctionSilver($session->uid); echo ($session->silver - $now['silver']); ?> / <?php echo $session->silver; ?> </div>

						<div class="clear"></div>
		</div>
		</div>
				</div></div></div>
<div class="clear"></div>
<?php

$prefix = "".TB_PREFIX."auction";

$sql = mysql_query("SELECT * FROM $prefix WHERE finish = 0 AND owner = $session->uid ORDER BY time ASC");
$query = mysql_num_rows($sql); // Get the number of items already in auction

$typeArray = array("","helmet","body","leftHand","rightHand","shoes","horse","bandage25","bandage33","cage","scroll","ointment","bucketOfWater","bookOfWisdom","lawTables","artWork");

$outputList = '';
$timer = 1;
if($query == 0) {        
    $outputList .= "<td colspan=\"6\" class=\"none\"><center>No Items</center></td>";
}else{
	while($row = mysql_fetch_array($sql)){ 
$id = $row["id"];$owner = $row["owner"];$btype = $row["btype"];$type = $row["type"];$num = $row["num"];$uid = $row["uid"];$bids = $row["bids"];$silver = $row["silver"];$time = $row["time"];
include "Templates/Auction/alt.tpl";
    if($bids!=0){
    $outputList .= "<tr><td class=\"delete\"><img class=\"del inactive\" src=\"img/x.gif\" title=\"Cancel\"></td><td class=\"icon\"><img class=\"itemCategory itemCategory_".$typeArray[$btype]."\" src=\"img/x.gif\" title=\"".$title."\"></td>";
    }else{
    $outputList .= "<tr><td class=\"delete\"><a href=\"?action=sell&abort=".$id."\"><img class=\"del\" src=\"img/x.gif\" title=\"Cancel\"></a></td><td class=\"icon\"><img class=\"itemCategory itemCategory_".$typeArray[$btype]."\" src=\"img/x.gif\" title=\"".$title."\"></td>";
    }
	
	$outputList .= "<td class=\"name\">".$num." x ".$name."</td>";
	$outputList .= "<td class=\"bids\">";
    if($bids==0){ $outputList .= "<span class=\"none\">".$bids."</span>"; }else{ $outputList .= $bids; }
    $outputList .= "</td>";
	$outputList .= "<td class=\"silver\" title=\"".round($silver/$num, 2)." For each unit\">".$silver."</td>";
	$outputList .= "<td class=\"time\"><span id=\"timer".$timer."\">".$generator->getTimeFormat($time-time())."</span></td>";
	$outputList .= "";
   	$outputList .= "</tr>";
    
    $timer++;
	}
}
echo 'You currently have ' . $query . ' items for sale in the auction (Maximum allowed at the same time is 5)<br><br>';
$maxReached = ($query == 5 ? true : false);
?>
<table class="sellings" cellspacing="1" cellpadding="1">
	<thead>
		<tr>
			<th class="name" colspan="3">Description</th>
			<th class="bids"><img title="Bids" class="bids" src="img/x.gif"></th>
			<th class="silver"><img title="Silver" class="silver" src="img/x.gif"></th>
			<th class="time"><img title="Time" class="clock" src="img/x.gif"></th>
		</tr>
	</thead>
	
    <tbody>
		<?php echo $outputList; ?> 
	</tbody>
</table>


<?php
$prefix = "".TB_PREFIX."heroitems";

$sql2 = mysql_query("SELECT * FROM $prefix WHERE proc = 0 AND uid = $session->uid");
$query2 = mysql_num_rows($sql2);

$outputList = '';
if($query2==0){
	$outputList .= "<span class='none'>Finished auctions.</span>";
}else{
while($row = mysql_fetch_array($sql2)){ 
$id = $row["id"];$uid = $row["uid"];$btype = $row["btype"];$type = $row["type"];$num = $row["num"];$proc = $row["proc"];

include "Templates/Auction/alt.tpl";

   	$outputList .= "<div class=\"\" title=\"".$name."||".$title."\" id=\"item_".$id."\">";
	$outputList .= "<div class=\"itemInInventory item item_".$item." inventory\">";
	$outputList .= "<div class=\"amount\">".$num."</div>";
	$outputList .= "</div></div>";
	
}
}
?>

<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents cf">

<div class="hero_inventory">

<div id="itemsToSale">
<?php echo $outputList; ?>			
		<div class="clear"></div>
</div>
</div>

	</div>
				</div><div class="clear"></div>
<?php
$prefix = "".TB_PREFIX."auction";

$sql = mysql_query("SELECT * FROM $prefix WHERE finish = 1 and owner = $session->uid ORDER BY time ASC");
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
    $centerPages .= '<a class="number" href="?action=sell&page=2">2</a>';
	
}elseif ($page == 1 && $lastPage == 3) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?action=sell&page=2">2</a> ';
    $centerPages .= '<a class="number" href="?action=sell&page=3">3</a>';
	
}elseif ($page == 1) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?action=sell&page=' . $add1 . '">' . $add1 . '</a> ';
	$centerPages .= '<a class="number" href="?action=sell&page=' . $add2 . '">' . $add2 . '</a> ... ';
	$centerPages .= '<a class="number" href="?action=sell&page=' . $lastPage . '">' . $lastPage . '</a>';
	
} else if ($page == $lastPage && $lastPage == 2) {
	$centerPages .= '<a class="number" href="?action=sell&page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage && $lastPage == 3) {
	$centerPages .= '<a class="number" href="?action=sell&page=1">1</a> ';
    $centerPages .= '<a class="number" href="?action=sell&page=2">2</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage) {
	$centerPages .= '<a class="number" href="?action=sell&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="?action=sell&page=' . $sub2 . '">' . $sub2 . '</a> ';
	$centerPages .= '<a class="number" href="?action=sell&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == ($lastPage - 1) && $lastPage == 3) {
    $centerPages .= '<a class="number" href="?action=sell&page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="?action=sell&page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 2 && $page < ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="?action=sell&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="?action=sell&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?action=sell&page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="?action=sell&page=' . $lastPage . '">' . $lastPage . '</a>';
	
}else if ($page == ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="?action=sell&page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="?action=sell&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="?action=sell&page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 1 && $page < $lastPage && $lastPage == 3) {
    $centerPages .= '<a class="number" href="?action=sell&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?action=sell&page=' . $add1 . '">' . $add1 . '</a>';
    
} else if ($page > 1 && $page < $lastPage) {
    $centerPages .= '<a class="number" href="?action=sell&page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="?action=sell&page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="?action=sell&page=' . $lastPage . '">' . $lastPage . '</a>';
}



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
$paginationDisplay .=  '<a class="next" href="?action=sell&page=' . $nextPage . '"><img alt="صفحه بعد" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="?action=sell&page=' . $lastPage . '"><img alt="صفحه آخر" src="img/x.gif"></a>';

}elseif ($page != "1" && $page != $lastPage){
$paginationDisplay .=  '<a class="first" href="?action=sell&page=1"><img alt="صفحه اول" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="?action=sell&page=' . $previous . '"><img alt="صفحه قبل" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="?action=sell&page=' . $nextPage . '"><img alt="صفحه بعد" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="?action=sell&page=' . $lastPage . '"><img alt="صفحه آخر" src="img/x.gif"></a>';

}elseif ($page == $lastPage){
$paginationDisplay .=  '<a class="first" href="?action=sell&page=1"><img alt="صفحه اول" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="?action=sell&page=' . $previous . '"><img alt="صفحه قبل" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="صفحه بعد" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="صفحه آخر" src="img/x.gif" class="last disabled">';
}

$limit = 'LIMIT ' .($page - 1) * $itemsPerPage .',' .$itemsPerPage; 
$sql2 = mysql_query("SELECT * FROM $prefix WHERE finish = 1 and owner = $session->uid ORDER BY time DESC $limit");

$typeArray = array("","helmet","body","leftHand","rightHand","shoes","horse","bandage25","bandage33","cage","scroll","ointment","bucketOfWater","bookOfWisdom","lawTables","artWork");

$outputList = '';
$timer = 1;
if($query == 0) {        
    $outputList .= "<td colspan=\"6\" class=\"none\"><center>No sales found.</center></td>";
}else{
	while($row = mysql_fetch_array($sql2)){ 
$id = $row["id"];$owner = $row["owner"];$btype = $row["btype"];$type = $row["type"];$num = $row["num"];$uid = $row["uid"];$bids = $row["bids"];$silver = $row["silver"];$time = $row["time"];
include "Templates/Auction/alt.tpl";
    if($bids!=0){ $inac=" inactive"; }
    $outputList .= "<tr><td class=\"icon\"><img class=\"itemCategory itemCategory_".$typeArray[$btype]."\" src=\"img/x.gif\" title=\"".$name."||".$title."\"></td>";
	
	$outputList .= "<td class=\"name\">".$num." x ".$name."</td>";
	$outputList .= "<td class=\"bids\">";
    if($bids==0){ $outputList .= "<span class=\"none\">".$bids."</span>"; }else{ $outputList .= $bids; }
    $outputList .= "</td>";
	$outputList .= "<td class=\"silver\" title=\"".round($silver/$num, 2)." برای هر واحد\">".$silver."</td>";
	$outputList .= "<td class=\"time\">".date('y/m/d',$time)." ".date('H:i',$time)."</td>";
	$outputList .= "";
   	$outputList .= "</tr>";
    
    $timer++;
	}
 }


?>
<h4 class="auctionEnded spacer">Finished Auctions</h4>
<table cellspacing="1" cellpadding="1">
	<thead>
		<tr>
			<th class="name" colspan="2">Description</th>
			<th class="bids"><img title="Bids" class="bids" src="img/x.gif"></th>
			<th class="silver"><img title="Silver" class="silver" src="img/x.gif"></th>
			<th class="time"><img title="Time" class="clock" src="img/x.gif"></th>
		</tr>
	</thead>
	<tbody>
    <?php echo $outputList; ?>
	</tbody>
</table>

<div class="footer">
	<div class="paginator">
    <?php echo $paginationDisplay; ?>
    </div>
    <div class="clear"></div>
</div>
<form id="sellForm" method="post" action="hero_auction.php?action=sell">
	<input type="hidden" name="a" value="e45">
	<input type="hidden" name="id" value="<?php echo $_POST['id']; ?>">
	<input type="hidden" name="amount" value="<?php echo $_POST['amount']; ?>">
</form>
<script type="text/javascript">
	Travian.Game.HeroAuction = new (new Class(
	{
		alreadyOpen: false,
		textSingle: 'Really sell this item?',
		textMulti: 'Sell &lt;input class=\"text\" id=\"sellAmount\" style=\"width:30px\" type=\"text\" value=\"0\" /&gt; Amount'.unescapeHtml(),
		initialize: function() {
			var $this = this;
<?php
$prefix = "".TB_PREFIX."heroitems";

$sql2 = mysql_query("SELECT * FROM $prefix WHERE proc = 0 AND uid = $session->uid");

while($row = mysql_fetch_array($sql2)){ 
$id = $row["id"];$num = $row["num"];
?>
				$('item_<?php echo $id; ?>').addEvent('click', function() { $this.sellItem(<?php echo $id; ?>,<?php echo $num; ?>); });
<?php } ?>
						
							},
		sellItem: function (id, amount)
        {
            var maxReached = "<?php echo $maxReached; ?>";
            if (maxReached)
            {
                return;
            }
            var html = '';
			var $this = this;
			if (this.alreadyOpen)
			{
				return;
			}
			this.alreadyOpen = true;
			$('sellForm').id.value = id;
			$('sellForm').amount.value = amount;
			if (amount == 1)
			{
				html = $this.textSingle;
			}
			else
			{
				html = $this.textMulti;
			}
			html.dialog(
			{
				relativeTo:			$('content'),
				elementFoucs:		'sellAmount',
				buttonTextOk:		'OK',
				buttonTextCancel:	'CANCEL',
				title:				'Confirm Sale:',
				onOpen: function(dialog, contentElement)
				{
					if ($('sellAmount'))
					{
						$('sellAmount').value = amount;
						$('sellAmount').addEvent('change', function()
						{
							$('sellForm').amount.value = $('sellAmount').value;
						});
					}
				},
				onOkay: function(dialog, contentElement)
				{
					if ($('sellAmount'))
					{
						$('sellForm').amount.value = $('sellAmount').value;
					}
					$('sellForm').submit();
				},
				onClose: function(dialog, contentElement)
				{
					$this.alreadyOpen = false;
				}
			});
		}
	}));
</script>
</div>