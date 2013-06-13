<?php
ob_start();
session_start();
error_reporting(0);
include ("../GameEngine/Database/connection.php");
include ("../GameEngine/config.php");
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

// Liberty reverse Settings
$conf_merchantAccountNumber = 'U8035881';
$conf_merchantSecurityWord = "SecurityWord";


$serverUrlAndPath = "http://".$_SERVER["HTTP_HOST"].dirname($_SERVER["REQUEST_URI"]);
$serverUrlAndPath = str_replace("\\", "/", $serverUrlAndPath);
$succesUrl = $serverUrlAndPath."/payment_success.php";
$failUrl = $serverUrlAndPath."/payment_fail.php";

$username = $_SESSION['username'];

if ($_GET[gold])
{
	$gold = $_GET[gold];
	
	$Desc = ''.$gold.' Gold';
	$PageTitle = 'Buy '.$gold.' gold';
	if ($gold=='250')
		$Price = '5';
	elseif ($gold=='600')
		$Price = '10';
	elseif ($gold=='2000')
		$Price = '16';
	elseif ($gold=='25000')
		$Price = '40';
	elseif ($gold=='100000')
		$Price = '95';
	else
		die('Undefiend Gold Count !');
		
	$orderid = time().rand(1000,9999);
	$query = mysql_query("INSERT INTO `transactions` (`username`, `amunt`, `gold`, `orderid`, `time`) VALUES ('".$username."', '".$Price."', '".$gold."', '".$orderid."', '".time()."')");
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><? echo $PageTitle;?></title>
</head>
<body onload="javascript:document.payform.submit();">
	<?
    	if ($_GET[gold])
		{
		?>
        <div style="text-align:center; padding:8px;">
        	Connecting to payment gateway , Please wait ...
        </div>
        <form name="payform" method="post" action="https://sci.libertyreserve.com">
            <input type="hidden" name="lr_acc" value="<?=$conf_merchantAccountNumber?>">
            <input type="hidden" name="lr_amnt" value="<? echo $Price;?>">      
            <input type="hidden" name="lr_currency" value="LRUSD">
            <input type="hidden" name="lr_comments" value="<? echo $Desc;?>">
            <input type="hidden" name="lr_merchant_ref" value="">
            <input type="hidden" name="lr_success_url" value="<? echo $succesUrl?>">
            <input type="hidden" name="lr_fail_url" value="<? echo $failUrl?>">
            <input type="hidden" name="order_id" value="<? echo $orderid;?>" />
            <input type="hidden" name="item_name" value="<? echo $Desc;?>" />      
        </form>
        <?
		}
ob_end_flush();		
	?>
</body>
</html>


