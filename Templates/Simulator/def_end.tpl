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
                    <img src="img/x.gif" class="unit uhab" alt="<?php echo WARSIM_POP; ?>">
                </td>
	<td class="desc"><?php echo WARSIM_POP; ?></td>
	<td class="value"><input class="text" type="text" name="ew2" value="<?php echo $form->getValue('ew2')==""? 1 : $form->getValue('ew2'); ?>" maxlength="5"></td>
	<td class="research">
            </td>
</tr>
<tr>
	<td class="ico">
                    <img src="img/x.gif" class="gebIcon g34Icon" alt="<?php echo WARSIM_STONEMASON; ?>">
                </td>
	<td class="desc"><?php echo WARSIM_STONEMASON; ?></td>
	<td class="value"><input class="text" type="text" name="stonemason" value="<?php echo $form->getValue('stonemason')==""? 0 : $form->getValue('stonemason'); ?>" maxlength="2"></td>
	<td class="research">
            </td>
</tr>
				<?php
                    if(in_array(1,$target)) {
                    	$title = "دیوار شهر";
                        $class = "g31Icon";
                        $name = "wall1";
                    }
                    if(in_array(2,$target)) {
                    	$title = "دیوار گلی";
                        $class = "g32Icon";
                        $name = "wall2";
                    }
                    if(in_array(3,$target)) {
                    	$title = "پرچین";
                        $class = "g33Icon";
                        $name = "wall3";
                    }
                    echo "<tr>
						    <td class=\"ico\"><img src=\"img/x.gif\" class=\"gebIcon ".$class."\" title=\"".$title."\" /></td>
						    <td class=\"desc\">".$title."</td>
						    <td class=\"value\"><input class=\"text\" type=\"text\" name=\"".$name."\" value=\"0\" maxlength=\"2\" title=\"سطح ".$title."\" /></td>
						    <td class=\"research\"></td>

					    </tr>";
                    ?>
<tr>
	<td class="ico">
                    <img src="img/x.gif" class="gebIcon g26Icon" title="<?php echo WARSIM_PALACE; ?>">
                </td>
	<td class="desc"><?php echo WARSIM_PALACE; ?></td>
	<td class="value"><input class="text" type="text" name="palast" value="<?php echo $form->getValue('palast')==""? 0 : $form->getValue('palast'); ?>" maxlength="2"></td>
	<td class="research">
            </td>
</tr>
		                </tbody></table>
			</td>
		</tr>
	</tbody>
</table>
</div>

