<?php
ob_start();
session_start();
error_reporting(0);
include ("../GameEngine/Database/connection.php");
include ("../GameEngine/config.php");
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

$serverUrlAndPath = "http://".$_SERVER["HTTP_HOST"].dirname($_SERVER["REQUEST_URI"]);
$serverUrlAndPath = str_replace("\\", "/", $serverUrlAndPath);
$succesUrl = $serverUrlAndPath."/payment_success.php";
$failUrl = $serverUrlAndPath."/payment_fail.php";

$username = $_SESSION['username'];
$orderid = $_REQUEST["order_id"];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Payment Success</title>
</head>
<body>
	<?
    	if ($orderid)
		{
			$query = mysql_query("SELECT * FROM `transactions` WHERE `orderid`='".$orderid."' AND status='0'");
			$row = mysql_fetch_array($query);
			
			if ($row)
			{
				$gold = $row['gold'];
				$query = mysql_query("UPDATE `s1_users` SET `gold` = `gold` + '".$gold."' WHERE username = '".$_SESSION['username']."'");
				$query = mysql_query("UPDATE `transactions` SET `status` = '1' WHERE `orderid`='".$orderid."'");
				
				?>
				<div style="text-align:center; padding:8px;">
				Payment Successfull
				</div>
				<script>setTimeout('location.href="../dorf1.php"', 3000)</script>
				<?
			}
			else
			{
			?>
					<div style="text-align:center; padding:8px;">
					Redirecting ...
					</div>
				<script>setTimeout('location.href="../dorf1.php"', 3000)</script>
			<?
			}
		}
		else
		{
		?>
        		<div style="text-align:center; padding:8px;">
				Redirecting ...
				</div>
        		<script>setTimeout('location.href="../dorf1.php"', 3000)</script>
        <?
		}
	?>
</body>
</html>
<?php ob_end_flush(); ?>


