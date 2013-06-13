<div align="center">
	<ul class="tabs">
		<li><a id="a_title_1" onclick="SetCurrent(1);" class="current" href="#">اخبار سرور</a></li>
		<li>اخبار صفحه اصلی</li>
	</ul>
</div>
<br>
<div id="div_1">

<form method="POST">
<input name="action" type="hidden" value="News">
<table align="center" width="404" cellpadding="1" cellspacing="1" border="1">
	<thead>
		<tr>
			<th height="21" colspan="2" valign="top">ویرایش خبرها</th>
		</tr>                                       
	</thead>
	<tr>
		<td height="24" align="center">انتخاب شمارۀ خبر:</td>                                    
		<td valign="top">
        	<center>                                                   
                <font size=3>
                    <label>1 <input type="radio" name="n" value="1" <?php if(isset($_GET['n'])){ if($_GET['n']==1){ echo 'checked="checked"'; } }else{ echo 'checked="checked"'; } ?>/></label>
                    <label>2 <input type="radio" name="n" value="2" <?php if(isset($_GET['n'])){ if($_GET['n']==2){ echo 'checked="checked"'; } } ?>/></label>
                    <label>3 <input type="radio" name="n" value="3" disabled="disabled"/></label>
                </font>
            </center>
        </td>      
    </tr>
    <tr>
        <td height="24" align="center">موضوع:</td>
        <td valign="top"><center><input type="text" name="title" value="" size=30></td>
    </tr>       
    <tr>
        <td align="center"><strong>متن خبر:</strong></td>
        <td valign="top"><center><textarea name="txt" cols="40" rows="10"></textarea></td>      
    </tr>
    <tr>
        <td height="26" valign="top" colspan="2"><br />
            <center>
            	<button name="submit" type="submit" value="submit" id="submit" class="submit"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">تایید</div></div></button>
                <button name="reset" type="reset" value="reset" id="reset" class="reset"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">بازنویسی</div></div></button>
            </center>
        </td>     
    </tr>
</table>
<br><br>
</form>


<?php
if($_POST['action']=='News'){
	$number = $_POST['n'];$title = $_POST['title'];$text = $_POST['txt'];$delete = $_POST['delete'];
	
	if ($text){
		if (!$title){
			$st = "";
		}else{
			$st = "<b>".$title."</b><br>";
		}
		unlink ('../Templates/News/newsbox'.$number.'.tpl');
		$file = fopen('../Templates/News/newsbox'.$number.'.tpl','w+');
		fwrite($file,''.$st.''.$text.'');
		echo '<center><font size="5">خبر با موفقیت ایجاد شد</font>';
	}else{
		echo "<center><font size='5' color='red'>متن خبر خالی است!</font>";
	}
}
?>
</div>