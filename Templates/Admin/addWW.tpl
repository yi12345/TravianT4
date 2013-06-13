<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       natarnature.tpl                                             ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<form action="../GameEngine/Admin/Mods/addWW.php" method="POST">
	<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
	
	<br />
	<h3>WW Village Troop Formula</h3>
	<p>The actual troop numbers are randomly generated. The first text box in the column, is the low range of the random number and the second is the high range of the number.<br />
	Then the random number is multiplied by the speed of the server.<br /><br />
	If server speed is, 1x, 2x, or 3x, the troops are multiplied by the speed. Else the troops are multiplied 5 times.</p>
	
	<table id="member" cellpadding="1" cellspacing="1" >
		<thead>
			<tr>
				<th colspan="3">Add WW Villages</th>
			</tr>
			<tr>
				<td class="on">Low Range</td>
				<td class="on">High Range</td>
			</tr>
		</thead>
		<tbody>
			<?php
				$wwrnd1 = array(1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,);
				$wwrnd2 = array(10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,);
				for($i=41; $i<51; $i++)
				{
					$p = $i - 41;
					echo '
					<tr>
						<td>
							<img src="../../gpack/travian_default/img/u/'.$i.'.gif" ><input class="fm" name="ww1u'.$i.'" value="'.$wwrnd1[$p].'" maxlength="6" style="width: 50%;">
						</td>
						<td>
							<input class="fm" name="ww2u'.$i.'" value="'.$wwrnd2[$p].'" maxlength="6" style="width: 50%;"> <img src="../../gpack/travian_default/img/u/'.$i.'.gif">
						</td>
					</tr>';
				}
				echo '<td colspan="2">
					<center>
						WW Villages: <input class="fm" name="amount" value="13" maxlength="6"><br /><br />
						<input type="image" value="submit" src="../../img/admin/b/ok1.gif">
					</center>
				</td>';
			?>
		</tbody>
	</table>
</form>
<?php
if(isset($_GET['g']))
{
	if(isset($_GET['amt']))
	{
		echo ''.$_GET['amt'].' WW Villages Added';
	}
}
?>