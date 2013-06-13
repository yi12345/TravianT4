<h1>Send Troops</h1>
<?php
if(isset($_GET['bid'])) {
	$bid = $_GET['bid'];
    $dbarray = $database->getNoticeData($bid);
    $dataarray = explode(",",$dbarray);
	$U21 = $dataarray['3'];
    $U22 = $dataarray['4'];
    $U23 = $dataarray['5'];
    $U24 = $dataarray['6'];
    $U25 = $dataarray['7'];
    $U26 = $dataarray['8'];
    $U27 = $dataarray['9'];
    $U28 = $dataarray['10'];
    $U29 = $dataarray['11'];
    $U30 = $dataarray['12'];
}
?>
<form method="POST" name="snd" action="a2b.php">
<input name="timestamp" value="1278280730" type="hidden">
<input name="timestamp_checksum" value="597fa8" type="hidden">
<input name="b" value="1" type="hidden">


		<table id="troops" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="line-first column-first large"><img class="unit u21" src="img/x.gif" title="<?php echo U21; ?>" onclick="document.snd.t1.value=''; return false;" alt="<?php echo U21; ?>"> <input <?php if ($village->unitarray['u21']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t1" value="<?php if($U21 > $village->unitarray['u21']){ echo $village->unitarray['u21']; }elseif($U21 <= $village->unitarray['u21']){ echo $U21; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u21']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u21']."; return false;\">".$village->unitarray['u21']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		
        <td class="line-first large"><img class="unit u24" src="img/x.gif" title="<?php echo U24; ?>" alt="<?php echo U24; ?>"> <input <?php if ($village->unitarray['u24']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t4" value="<?php if($U24 > $village->unitarray['u24']){ echo $village->unitarray['u24']; }elseif($U24 <= $village->unitarray['u24']){ echo $U24; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u24']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u24']."; return false;\">".$village->unitarray['u24']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
        <td class="line-first regular"><img class="unit u27" src="img/x.gif" title="<?php echo U27; ?>" alt="<?php echo U27; ?>"> <input <?php if ($village->unitarray['u27']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t7" value="<?php if($U27 > $village->unitarray['u27']){ echo $village->unitarray['u27']; }elseif($U27 <= $village->unitarray['u27']){ echo $U27; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u27']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u27']."; return false;\">".$village->unitarray['u27']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>

		
        <td class="line-first column-last small"><img class="unit u29" src="img/x.gif" title="<?php echo U29; ?>" alt="<?php echo U29; ?>"> <input <?php if ($village->unitarray['u29']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t9" value="<?php if($U29 > $village->unitarray['u29']){ echo $village->unitarray['u29']; }elseif($U29 <= $village->unitarray['u29']){ echo $U29; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u29']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u29']."; return false;\">".$village->unitarray['u29']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="column-first large"><img class="unit u22" src="img/x.gif" title="<?php echo U22; ?>" alt="<?php echo U22; ?>"> <input <?php if ($village->unitarray['u22']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t2" value="<?php if($U22 > $village->unitarray['u22']){ echo $village->unitarray['u22']; }elseif($U22 <= $village->unitarray['u22']){ echo $U22; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u22']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u22']."; return false;\">".$village->unitarray['u22']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>

		<td class="large"><img class="unit u25" src="img/x.gif" title="<?php echo U25; ?>" alt="<?php echo U25; ?>"> <input <?php if ($village->unitarray['u25']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t5" value="<?php if($U25 > $village->unitarray['u25']){ echo $village->unitarray['u25']; }elseif($U25 <= $village->unitarray['u25']){ echo $U25; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u25']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u25']."; return false;\">".$village->unitarray['u25']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="regular"><img class="unit u28" src="img/x.gif" title="<?php echo U28; ?>" alt="<?php echo U28; ?>"> <input <?php if ($village->unitarray['u28']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t8" value="<?php if($U28 > $village->unitarray['u28']){ echo $village->unitarray['u28']; }elseif($U28 <= $village->unitarray['u28']){ echo $U28; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u28']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u28']."; return false;\">".$village->unitarray['u28']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="column-last small"><img class="unit u30" src="img/x.gif" title="<?php echo U30; ?>" alt="<?php echo U30; ?>"> <input <?php if ($village->unitarray['u30']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t10" value="<?php if($U30 > $village->unitarray['u30']){ echo $village->unitarray['u30']; }elseif($U30 <= $village->unitarray['u30']){ echo $U30; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u30']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u30']."; return false;\">".$village->unitarray['u30']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="line-last column-first large"><img class="unit u23" src="img/x.gif" title="<?php echo U23; ?>" alt="<?php echo U23; ?>"> <input <?php if ($village->unitarray['u23']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t3" value="<?php if($U23 > $village->unitarray['u23']){ echo $village->unitarray['u23']; }elseif($U23 <= $village->unitarray['u23']){ echo $U23; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u23']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u23']."; return false;\">".$village->unitarray['u23']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="line-last large"><img class="unit u26" src="img/x.gif" title="<?php echo U26; ?>" alt="<?php echo U26; ?>"> <input <?php if ($village->unitarray['u26']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t6" value="<?php if($U26 > $village->unitarray['u26']){ echo $village->unitarray['u26']; }elseif($U26<= $village->unitarray['u26']){ echo $U26; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u26']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u26']."; return false;\">".$village->unitarray['u26']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
						<td class="line-last regular"></td>
						<td class="line-last column-last small"><img class="unit u<?php echo hero; ?>" src="img/x.gif" onclick="document.snd.t11.value=''; return false;" alt="Hős" title="Hős"> <input <?php if ($village->unitarray['hero']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; } ?> type="text" name="t11" value="" maxlength="1">
		<?php 
        if ($village->unitarray['hero']>0){
              echo "/ <a href=\"#\" onclick=\"document.snd.t11.value=".$village->unitarray['hero']."; return false;\">".$village->unitarray['hero']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		</tr>
</tbody></table>

