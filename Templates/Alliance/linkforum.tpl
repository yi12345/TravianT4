<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>".$allianceinfo['tag']." - ".$allianceinfo['name']."</h1>";
include("alli_menu.tpl"); 
?>
<form method="post" action="allianz.php">
<input type="hidden" name="a" value="5">
<input type="hidden" name="o" value="5">
<input type="hidden" name="s" value="5">

<tr>
<th colspan="2"><b>لینک به فروم</b></th>
</tr>

</thead><tbody>
<br />
<tr><th>URL:</th>
<td><input class="link text" type="text" name="f_link" value="" maxlength="200"></td>
</tr>
<br />
<tr>
<td colspan="2" class="info">اگر شما فروم خارج از بازی دارید، میتوانید اینجا لینکش را بذارید</td>
</tr></tbody>
</table>

<p><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></form></p>