<div align="center">
	<ul class="tabs">
		<li><a id="a_title_1" onclick="SetCurrent(1);" class="current" href="#">مديـريـت خـبرها</a></li>
	</ul>
</div><Br>			
<div id="div_1">
<div id="succes" class="MsgHead success" style="display:none;"><div class="MsgBody">Operation was successful.</div></div><br>
<table width="350" border="1" align="center" class="tbl" id="tabs_2_content_in">
    <tbody>
        <tr>
            <td bgcolor="#d1dde0" height="26" align="center"><b>Address</b></td>
            <td bgcolor="#d1dde0" height="26" align="center"><b>Status</b></td>
            <td bgcolor="#d1dde0" height="26" align="center"><b>Show</b></td>
            <td align="center" bgcolor="#d1dde0"><b>Operations</b></td>
        </tr>
	<tr>
        <td bgcolor="#f3f7f8" height="26" align="center">News No. 1</td>
        <td bgcolor="#f3f7f8" height="26" align="center"><?php if(NEWSBOX1){ echo "<div id='nsts1'><font color='green'>فعال</font></div>"; }else{ echo "<div id='nsts1'><font color='red'>غیر فعال</font></div>"; } ?></td>
        <td bgcolor="#f3f7f8" height="26" align="center">
        بلی &nbsp; خیر<p>
        <input type="radio" name="news1" onclick="newsManage(1,1)" id="radio" <?php if(NEWSBOX1){ echo "checked='checked'"; } ?>/>
        <input type="radio" name="news1" onclick="newsManage(1,0)" id="radio" <?php if(!NEWSBOX1){ echo "checked='checked'"; } ?>/>
        </td>
		<td align="center" bgcolor="#f3f7f8">
        	<a href="?p=News&n=1"><img border="0" src="images/edit.gif" /></a></td>
	</tr>
    <tr>
        <td bgcolor="#f3f7f8" height="26" align="center">News No. 2</td>
        <td bgcolor="#f3f7f8" height="26" align="center"><?php if(NEWSBOX2){ echo "<div id='nsts2'><font color='green'>فعال</font></div>"; }else{ echo "<div id='nsts2'><font color='red'>غیر فعال</font></div>"; } ?></td>
        <td height="26" align="center" bgcolor="#f3f7f8"> بلی &nbsp; خیر
          <p>
        <input type="radio" name="news2" onclick="newsManage(2,1)" id="radio" <?php if(NEWSBOX2){ echo "checked='checked'"; } ?>/>
        <input type="radio" name="news2" onclick="newsManage(2,0)" id="radio" <?php if(!NEWSBOX2){ echo "checked='checked'"; } ?>/>
          </p></td>
        <td align="center" bgcolor="#f3f7f8">
        	<a href="?p=News&n=2"><img border="0" src="images/edit.gif" /></a></td>
	</tr>
    <tr>
    	<td bgcolor="#f3f7f8" height="26" align="center">News No. 3</td>
        <td bgcolor="#f3f7f8" height="26" align="center"><?php if(NEWSBOX3){ echo "<div id='nsts3'><font color='green'>فعال</font></div>"; }else{ echo "<div id='nsts3'><font color='red'>غیر فعال</font></div>"; } ?></td>
        <td height="26" align="center" bgcolor="#f3f7f8"> بلی &nbsp; خیر
          <p>
        <input type="radio" name="news3" onclick="newsManage(3,1)" id="radio" disabled="disabled" <?php if(NEWSBOX3){ echo "checked='checked'"; } ?>/>
        <input type="radio" name="news3" onclick="newsManage(3,0)" id="radio" disabled="disabled" <?php if(!NEWSBOX3){ echo "checked='checked'"; } ?>/>
          </p></td>
    	<td align="center" bgcolor="#f3f7f8">
   	    <img border="0" src="images/edit.gif" /></td>
   	    <b>ssssss</b>
	</tr>
</tbody>
</table>
</div>
