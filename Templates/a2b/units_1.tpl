<h1>Send Troops</h1>
<?php
if(isset($_GET['bid'])) {
	$bid = $_GET['bid'];
    $dbarray = $database->getNoticeData($bid);
    $dataarray = explode(",",$dbarray);
	$U1 = $dataarray['3'];
    $U2 = $dataarray['4'];
    $U3 = $dataarray['5'];
    $U4 = $dataarray['6'];
    $U5 = $dataarray['7'];
    $U6 = $dataarray['8'];
    $U7 = $dataarray['9'];
    $U8 = $dataarray['10'];
    $U9 = $dataarray['11'];
    $U10 = $dataarray['12'];
    $too = $database->getOasisField($dataarray['1'],"conqured");
    if($too['conqured'] == 0){$disabledr ="disabled=disabled";}else{
    $disabledr ="";
    }
    $disabled ="disabled=disabled";
    $checked  ="checked=checked";
}
?>
<form method="POST" name="snd" action="a2b.php">
<input name="timestamp" value="1278280730" type="hidden">
<input name="timestamp_checksum" value="597fa8" type="hidden">
<input name="b" value="1" type="hidden">


		<table id="troops" cellpadding="1" cellspacing="1">
	<tbody><tr>

		<td class="line-first column-first large"><img class="unit u1" src="img/x.gif" title="<?php echo U1; ?>" onclick="document.snd.t1.value=''; return false;" alt="<?php echo U1; ?>"> <input  <?php if ($village->unitarray['u1']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t1" value="<?php if($U1 > $village->unitarray['u1']){ echo $village->unitarray['u1']; }elseif($U1 <= $village->unitarray['u1']){ echo $U1; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u1']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u1']."; return false;\">".$village->unitarray['u1']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		
        <td class="line-first large"><img class="unit u4" src="img/x.gif" title="<?php echo U4; ?>" alt="<?php echo U4; ?>"> <input  <?php if ($village->unitarray['u4']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t4" value="<?php if($U4 > $village->unitarray['u4']){ echo $village->unitarray['u4']; }elseif($U4 <= $village->unitarray['u4']){ echo $U4; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u4']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u4']."; return false;\">".$village->unitarray['u4']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
        <td class="line-first regular"><img class="unit u7" src="img/x.gif" title="<?php echo U7; ?>" alt="<?php echo U7; ?>"> <input  <?php if ($village->unitarray['u7']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t7" value="<?php if($U7 > $village->unitarray['u7']){ echo $village->unitarray['u7']; }elseif($U7 <= $village->unitarray['u7']){ echo $U7; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u7']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u7']."; return false;\">".$village->unitarray['u7']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>

		
        <td class="line-first column-last small"><img class="unit u9" src="img/x.gif" title="<?php echo U9; ?>" alt="<?php echo U9; ?>"> <input  <?php if ($village->unitarray['u9']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t9" value="<?php if($U9 > $village->unitarray['u9']){ echo $village->unitarray['u9']; }elseif($U9 <= $village->unitarray['u9']){ echo $U9; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u9']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u9']."; return false;\">".$village->unitarray['u9']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="column-first large"><img class="unit u2" src="img/x.gif" title="<?php echo U2; ?>" alt="<?php echo U2; ?>"> <input  <?php if ($village->unitarray['u2']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t2" value="<?php if($U2 > $village->unitarray['u2']){ echo $village->unitarray['u2']; }elseif($U2 <= $village->unitarray['u2']){ echo $U2; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u2']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u2']."; return false;\">".$village->unitarray['u2']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>

		<td class="large"><img class="unit u5" src="img/x.gif" title="<?php echo U5; ?>" alt="<?php echo U5; ?>"> <input  <?php if ($village->unitarray['u5']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t5" value="<?php if($U5 > $village->unitarray['u5']){ echo $village->unitarray['u5']; }elseif($U5 <= $village->unitarray['u5']){ echo $U5; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u5']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u5']."; return false;\">".$village->unitarray['u5']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="regular"><img class="unit u8" src="img/x.gif" title="<?php echo U8; ?>" alt="<?php echo U8; ?>"> <input  <?php if ($village->unitarray['u8']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t8" value="<?php if($U8 > $village->unitarray['u8']){ echo $village->unitarray['u8']; }elseif($U8 <= $village->unitarray['u8']){ echo $U8; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u8']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u8']."; return false;\">".$village->unitarray['u8']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="column-last small"><img class="unit u10" src="img/x.gif" title="<?php echo U10; ?>" alt="<?php echo U10; ?>"> <input  <?php if ($village->unitarray['u10']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t10" value="<?php if($U10 > $village->unitarray['u10']){ echo $village->unitarray['u10']; }elseif($U10 <= $village->unitarray['u10']){ echo $U10; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u10']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u10']."; return false;\">".$village->unitarray['u10']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="line-last column-first large"><img class="unit u3" src="img/x.gif" title="<?php echo U3; ?>" alt="<?php echo U3; ?>"> <input  <?php if ($village->unitarray['u3']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t3" value="<?php if($U3 > $village->unitarray['u3']){ echo $village->unitarray['u3']; }elseif($U3 <= $village->unitarray['u3']){ echo $U3; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u3']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u3']."; return false;\">".$village->unitarray['u3']."</a></td>";
        }else{ 
       		echo  "<span class=\"none\">/ 0</span></td>";
		}
        ?>
		<td class="line-last large"><img class="unit u6" src="img/x.gif" title="<?php echo U6; ?>" alt="<?php echo U6; ?>"> <input  <?php if ($village->unitarray['u6']<=0) {echo 'class="text disabled" disabled="disabled"';} else {echo 'class="text"'; }?> name="t6" value="<?php if($U6 > $village->unitarray['u6']){ echo $village->unitarray['u6']; }elseif($U6 <= $village->unitarray['u6']){ echo $U6; }else{ echo '0'; } ?>" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u6']>0){
        	echo "/ <a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u6']."; return false;\">".$village->unitarray['u6']."</a></td>";
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
