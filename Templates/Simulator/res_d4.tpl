<div class="fighterType">
				<div class="boxes boxesColor green"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">مدافع: طبیعت	</div>
				</div>			</div>
<div class="clear"></div>
<table class="results defender" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<td class="role">
						</td><td>
								<img src="img/x.gif" class="unit u31" alt="موش صحرایی">
							</td><td>
								<img src="img/x.gif" class="unit u32" alt="عنکبوت">
							</td><td>
								<img src="img/x.gif" class="unit u33" alt="مار">
							</td><td>
								<img src="img/x.gif" class="unit u34" alt="خفاش">
							</td><td>
								<img src="img/x.gif" class="unit u35" alt="گراز">
							</td><td>
								<img src="img/x.gif" class="unit u36" alt="گرگ">
							</td><td>
								<img src="img/x.gif" class="unit u37" alt="خرس">
							</td><td>
								<img src="img/x.gif" class="unit u38" alt="تمساح">
							</td><td>
								<img src="img/x.gif" class="unit u39" alt="ببر">
							</td><td>
								<img src="img/x.gif" class="unit u40" alt="فیل">
							</td></tr>
				</thead>
				<tbody>
					<tr>
						<th>
							لشکریان
						</th><td <?php if (!$form->getValue('a2_31')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_31');} ?></td>
                                <td <?php if (!$form->getValue('a2_32')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_32');} ?></td>
                                <td <?php if (!$form->getValue('a2_33')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_33');} ?></td>
                                <td <?php if (!$form->getValue('a2_34')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_34');} ?></td>
                                <td <?php if (!$form->getValue('a2_35')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_35');} ?></td>
                                <td <?php if (!$form->getValue('a2_36')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_36');} ?></td>
                                <td <?php if (!$form->getValue('a2_37')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_37');} ?></td>
                                <td <?php if (!$form->getValue('a2_38')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_38');} ?></td>
                                <td <?php if (!$form->getValue('a2_39')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_39');} ?></td>
                                <td <?php if (!$form->getValue('a2_40')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_40');} ?></td></tr>
					<tr>
						<th>
							تلفات
						</th><td <?php if (!$troops = $form->getValue('a2_31')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_32')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_33')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_34')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_35')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_36')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_37')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_38')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_39')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_40')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td></tr>
				</tbody>
			</table>
