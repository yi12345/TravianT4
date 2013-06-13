<div class="border">
<table class="fill_in transparent" cellpadding="1" cellspacing="0">
	<tbody>
		<tr>
			<th><?php echo TRIBE4; ?></th>
		</tr>
		<tr>
			<td class="details">
				<table cellpadding="1" cellspacing="1">
					<tbody>
                
<?php
$u = '31';
for($i=31;$i<=40;$i++){
echo "
	<tr>
		<td class=\"ico\">
				<img src=\"img/x.gif\" class=\"unit u".$u."\" title=\"".$technology->unarray[$u]."\">
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