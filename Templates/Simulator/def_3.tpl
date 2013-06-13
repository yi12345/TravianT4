<div class="border">
<table class="fill_in transparent" cellpadding="1" cellspacing="0">
	<tbody>
		<tr>
			<th><?php echo TRIBE3; ?></th>
		</tr>
		<tr>
			<td class="details">
				<table cellpadding="1" cellspacing="1">
					<tbody>
                
<?php
$u = '21';
for($i=21;$i<=30;$i++){
echo "
	<tr>
		<td class=\"ico\">
    		<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$u.",1);\">
				<img src=\"img/x.gif\" class=\"unit u".$u."\" title=\"".$technology->unarray[$u]."\">
            </a>
		</td>
        <td class=\"desc\">".$technology->unarray[$u]."</td>
        <td class=\"value\">
        	<input class=\"text\" type=\"text\" name=\"a2_".$i."\" value=\"".$form->getValue('a2_'.$i)."\" maxlength=\"6\">
        </td>
        <td class=\"research\">
        	<input class=\"text\" type=\"text\" name=\"f2_".$i."\" value=\"".$form->getValue('f2_'.$i)."\" maxlength=\"2\">
        </td>
	</tr>
";
	$u++;
}
?>
					</tbody>
                </table>
			</td>
		</tr>
	</tbody>
</table>
</div>