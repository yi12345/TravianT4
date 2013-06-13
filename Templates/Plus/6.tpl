<?php
if($_POST){
$gold = $_POST['gold'];
$silver = $_POST['silver'];
$uid = $session->uid;
	if($gold==0 || $silver>=200 || $session->silver==$silver){
		$silvers = "- ".$silver."";
		$golds = "+ ".$silver/200;
	}elseif($gold>=1 || $silver==0 || $session->gold==$gold){
		$silvers = "+ ".$gold*100;
		$golds = "- ".$gold;
	}
	if($session->gold<$gold || $session->silver<$silver){  
		mysql_query("UPDATE " . TB_PREFIX ."users SET gold = ".$gold.", silver = ".$silver." WHERE id = '".$uid."'");
	}else{
		mysql_query("UPDATE ".TB_PREFIX."users SET gold = gold ".$golds." WHERE id = '".$uid."'");
		mysql_query("UPDATE ".TB_PREFIX."users SET silver = silver ".$silvers." WHERE id = '".$uid."'");
	}
    header("Location: plus.php?id=6");
}
?>

<div id="silverExchange">
	
	<h3>Exchange Office</h3>
	<p>Enter the amount of Gold or Silver you want to exchange.</p>

	<h4>Exchange rates</h4>
	<p>1 Gold : 100 Silver<br>200 Silver : 1 Gold</p>
<?php $id = $_SESSION['id']; ?>
<form action="plus.php?id=6" method="post">
<input type="hidden" name="id" id="id" value="<?php echo $id; ?>">
	<div class="boxes boxesColor gray exchange"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">		<table cellpadding="1" cellspacing="1" class="exchangeOffice transparent">
			<tbody>
				<tr>
					<td>
						<img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">
						<?php echo $session->gold; ?>
                        </td>
					<td>
						<img src="img/x.gif" class="silver" alt="سکۀ نقرۀ تراوین">
						<?php echo $session->silver; ?>
                        </td>
				</tr>

				<tr>
					<td>
						<input name="gold" id="goldInput" type="text" class="text" value="">
					</td>
					<td>
						<input name="silver" id="silverInput" type="text" class="text" value="">
					</td>
				</tr>
			</tbody>
		</table>
			</div>
				</div>
		<p>
			<input type="hidden" name="a" value="84">
			<input type="hidden" name="c" value="18a">

			<button type="submit" value="exchange"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">exchange</div></div></button>
            
            </p>


		<div class="boxes boxesColor gray exchange"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
        <table cellpadding="1" cellspacing="1" class="exchangeOffice transparent">
			<tbody>
				<tr>
					<td>
						<img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">
						<span id="goldResult">0</span>
					</td>
					<td>
						<img src="img/x.gif" class="silver" alt="سکۀ نقرۀ تراوین">
						<span id="silverResult">0</span>
					</td>
				</tr>
			</tbody>
		</table>
			</div>
				</div>	</form>
                
</div>
<script type="text/javascript">
	window.addEvent('domready', function(){
		new Travian.Game.GoldToSilver({
			elementInputGold: 'goldInput',
			elementInputSilver: 'silverInput',
			elementResultGold: 'goldResult',
			elementResultSilver: 'silverResult',
			gold: <?php echo $session->gold; ?>,
			silver: <?php echo $session->silver; ?>,
			rateGoldToSilver: 100,
			rateSilverToGold: 200
		});
	});
</script>
