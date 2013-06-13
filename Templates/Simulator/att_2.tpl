<div id="attacker">
<div class="fighterType">
		<div class="boxes boxesColor red"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><?php echo WARSIM_ATTACKER; ?></div>
				</div>	</div>
<div class="clear"></div>

<div class="border">
<table class="fill_in transparent" cellpadding="1" cellspacing="0">
	<tbody>
		<tr>
			<th><?php echo TRIBE2; ?></th>
		</tr>
		<tr>
			<td class="details">
				<table cellpadding="1" cellspacing="1">
					<tbody>
                
<?php
$u = '11';
for($i=1;$i<=10;$i++){
echo "
	<tr>
		<td class=\"ico\">
    		<a href=\"#\" onclick=\"return Travian.Game.iPopup(".$u.",1);\">
				<img src=\"img/x.gif\" class=\"unit u".$u."\" title=\"".$technology->unarray[$u]."\">
            </a>
		</td>
        <td class=\"desc\">".$technology->unarray[$u]."</td>
        <td class=\"value\">
        	<input class=\"text\" type=\"text\" name=\"a1_".$i."\" value=\"".$form->getValue('a1_'.$i)."\" maxlength=\"6\">
        </td>
        <td class=\"research\">
        	<input class=\"text\" type=\"text\" name=\"f1_".$i."\" value=\"".$form->getValue('f1_'.$i)."\" maxlength=\"2\">
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

<div class="border">
<table class="fill_in transparent" cellpadding="1" cellspacing="0">
	<tbody>
		<tr>
			<th><?php echo WARSIM_ETC; ?></th>
		</tr>
		<tr>
			<td class="details">
			<table cellpadding="1" cellspacing="1">
		                    <tbody><tr>
	<td class="ico">
                    <img src="img/x.gif" class="unit uhab" title="<?php echo WARSIM_POP; ?>">
                </td>
	<td class="desc"><?php echo WARSIM_POP; ?></td>
	<td class="value"><input class="text" type="text" name="ew1" value="<?php echo $form->getValue('ew1')==""? 1 : $form->getValue('ew1'); ?>" maxlength="5"></td>
	<td class="research">
            </td>
</tr>
<tr>
	<td class="ico">
                    <img src="img/x.gif" class="unit ucata" title="<?php echo WARSIM_KATA; ?>">
                </td>
	<td class="desc"><?php echo WARSIM_KATA; ?></td>
	<td class="value"><input class="text" type="text" name="kata" value="<?php echo $form->getValue('kata')==""? 0 : $form->getValue('kata'); ?>" maxlength="2"></td>
	<td class="research">
            </td>
</tr>
<tr>
	<td class="ico">
                    <img src="img/x.gif" class="unit uhero" title="<?php echo WARSIM_HEROPOWER; ?>">
                </td>
	<td class="desc"><?php echo WARSIM_HEROPOWER; ?></td>
	<td class="value"><input class="text" type="text" name="h_off_bonus" value="<?php echo $form->getValue('h_off_bonus')==""? 0 : $form->getValue('h_off_bonus'); ?>" maxlength="4"></td>
	<td class="research">
            </td>
</tr>
<tr>
		                </tbody></table>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>