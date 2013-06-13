<h1>Send Troops</h1>
<?php
if(isset($_GET['bid'])) {
	$bid = $_GET['bid'];
    $dbarray = $database->getNoticeData($bid);
    $dataarray = explode(",",$dbarray);
	$U11 = $dataarray['3'];
    $U12 = $dataarray['4'];
    $U13 = $dataarray['5'];
    $U14 = $dataarray['6'];
    $U15 = $dataarray['7'];
    $U16 = $dataarray['8'];
    $U17 = $dataarray['9'];
    $U18 = $dataarray['10'];
    $U19 = $dataarray['11'];
    $U20 = $dataarray['12'];
}
?>
<form method="POST" name="snd" action="a2b.php">
<input name="timestamp" value="1278280730" type="hidden">
<input name="timestamp_checksum" value="597fa8" type="hidden">
<input name="b" value="1" type="hidden">


		<table id="troops" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="line-first column-first large"><img class="unit u11" src="img/x.gif" title="<?php echo U11; ?>" onclick="document.snd.t1.value=''; return false;" alt="<?php echo U11; ?>"> <input <?php if ($village->unitarray['u11']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t1" value="<?php if($U11 > $village->unitarray['u11']){ echo $village->unitarray['u11']; }elseif($U11 <= $village->unitarray['u11']){ echo $U11; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u11']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u11']."; return false;\">".$village->unitarray['u11']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		
        <td class="line-first large"><img class="unit u14" src="img/x.gif" title="<?php echo U14; ?>" alt="<?php echo U14; ?>"> <input <?php if ($village->unitarray['u14']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t4" value="<?php if($U14 > $village->unitarray['u14']){ echo $village->unitarray['u14']; }elseif($U14 <= $village->unitarray['u14']){ echo $U14; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u14']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u14']."; return false;\">".$village->unitarray['u14']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
        <td class="line-first regular"><img class="unit u17" src="img/x.gif" title="<?php echo U17; ?>" alt="<?php echo U17; ?>"> <input <?php if ($village->unitarray['u17']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t7" value="<?php if($U17 > $village->unitarray['u17']){ echo $village->unitarray['u17']; }elseif($U17 <= $village->unitarray['u17']){ echo $U17; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u17']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u17']."; return false;\">".$village->unitarray['u17']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>

		
        <td class="line-first column-last small"><img class="unit u19" src="img/x.gif" title="<?php echo U19; ?>" alt="<?php echo U19; ?>"> <input <?php if ($village->unitarray['u19']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t9" value="<?php if($U19 > $village->unitarray['u19']){ echo $village->unitarray['u19']; }elseif($U19 <= $village->unitarray['u19']){ echo $U19; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u19']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u19']."; return false;\">".$village->unitarray['u19']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="column-first large"><img class="unit u12" src="img/x.gif" title="<?php echo U12; ?>" alt="<?php echo U12; ?>"> <input <?php if ($village->unitarray['u12']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t2" value="<?php if($U12 > $village->unitarray['u12']){ echo $village->unitarray['u12']; }elseif($U12 <= $village->unitarray['u12']){ echo $U12; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u12']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u12']."; return false;\">".$village->unitarray['u12']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>

		<td class="large"><img class="unit u15" src="img/x.gif" title="<?php echo U15; ?>" alt="<?php echo U15; ?>"> <input <?php if ($village->unitarray['u15']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t5" value="<?php if($U15 > $village->unitarray['u15']){ echo $village->unitarray['u15']; }elseif($U15 <= $village->unitarray['u15']){ echo $U15; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u15']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u15']."; return false;\">".$village->unitarray['u15']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="regular"><img class="unit u18" src="img/x.gif" title="<?php echo U18; ?>" alt="<?php echo U18; ?>"> <input  <?php if ($village->unitarray['u18']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t8" value="<?php if($U18 > $village->unitarray['u18']){ echo $village->unitarray['u18']; }elseif($U18 <= $village->unitarray['u18']){ echo $U18; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u18']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u18']."; return false;\">".$village->unitarray['u18']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="column-last small"><img class="unit u20" src="img/x.gif" title="<?php echo U20; ?>" alt="<?php echo U20; ?>"> <input <?php if ($village->unitarray['u20']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t10" value="<?php if($U20 > $village->unitarray['u20']){ echo $village->unitarray['u20']; }elseif($U20 <= $village->unitarray['u20']){ echo $U20; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u20']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u20']."; return false;\">".$village->unitarray['u20']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="line-last column-first large"><img class="unit u13" src="img/x.gif" title="<?php echo U13; ?>" alt="<?php echo U13; ?>"> <input <?php if ($village->unitarray['u13']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t3" value="<?php if($U13 > $village->unitarray['u13']){ echo $village->unitarray['u13']; }elseif($U13 <= $village->unitarray['u13']){ echo $U13; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u13']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u13']."; return false;\">".$village->unitarray['u13']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="line-last large"><img class="unit u16" src="img/x.gif" title="<?php echo U16; ?>" alt="<?php echo U16; ?>"> <input <?php if ($village->unitarray['u16']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; } ?> name="t6" value="<?php if($U16 > $village->unitarray['u16']){ echo $village->unitarray['u16']; }elseif($U16 <= $village->unitarray['u16']){ echo $U16; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u16']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u16']."; return false;\">".$village->unitarray['u16']."</a></td>";
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