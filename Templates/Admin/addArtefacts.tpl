<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       addArtefacts.tpl                                            ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<form action="../GameEngine/Admin/Mods/addArtefacts.php" method="POST">
	<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
	<table id="member" cellpadding="1" cellspacing="1" >
		<thead>
			<tr>
				<th colspan="2">Add Artefacts</th>
			</tr>
			<tr>
				<td>Artefact Name</td>
				<td>Artefact Description</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>The Architects</td>
				<td>All buildings in the area of effect are stronger. This means that you will need more catapults to damage buildings protected by this artifacts powers.</td>
			</tr>
			<tr>
				<td>Military Haste</td>
				<td>All troops in the area of effect move faster.</td>
			</tr>
			<tr>
				<td>Hawk's Eyesight</td>
				<td>All spies (Scouts, Pathfinders, and Equites Legati) increase their spying ability. In addition, with all versions of this artifact you can see the incoming TYPE of troops but not how many there are.</td>
			</tr>
			<tr>
				<td>The Diet</td>
				<td>All troops in the artifacts range consume less wheat, making it possible to maintain a larger army.</td>
			</tr>
			<tr>
				<td>Academic Advancement</td>
				<td>Troops are built a certain percentage faster within the scope of the artifact.</td>
			</tr>
			<tr>
				<td>Storage Master Plan</td>
				<td>With this building plan you are able to build the Great Granary or Great Warehouse in the Village with the artifact, or the whole account depending on the artifact. As long as you posses that artifact you are able to build and enlarge those buildings.</td>
			</tr>
			<tr>
				<td>Rivals Confusion</td>
				<td>Cranny capacity is increased by a certain amount for each type of artifact. Catapults can only shoot random on villages within this artifacts power. Exceptions are the WW which can always be targeted and the treasure chamber which can always be targeted, except with the unique artifact. When aiming at a resource field only random resource fields can be hit, when aiming at a building only random buildings can be hit.</td>
			</tr>
			<tr>
				<td>Artefact of the Fool</td>
				<td>Every 24 hours it gets a random effect, bonus, or penalty (all are possible with the exception of great warehouse, great granary and WW building plans). They change effect AND scope every 24 hours. The unique artifact will always take positive bonuses.</td>
			</tr>
		</tbody>
	</table>
	
	<br /><br />
	
	<h3>Artefact Formula</h3>
	
	<p>The actual troop numbers are randomly generated. The first text box in the column, is the low range of the random number and the second is the high range of the number.<br />
	Then the random number is multiplied by the speed of the server.<br /><br />
	If server speed is, 1x, 2x, or 3x, the troops are multiplied by the speed. Else the troops are multiplied 5 times.</p>

	<table id="member">
		<thead>
			<tr>
				<th colspan="6">Edit Troops</th>
			</tr>
			<tr>
				<td class="hab" colspan="2">Small</td>
				<td class="hab" colspan="2">Large</td>
				<td class="hab" colspan="2">Unique</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<?php
				$rndsmall1 = array(1000,1500,2300,25,1200,1500,500,100,1,1);
				$rndsmall2 = array(2000,2000,2800,75,1900,2000,900,300,5,5);
				
				$rndlrg1 = array(2000,3000,4600,50,2400,3000,1000,200,2,2);
				$rndlrg2 = array(4000,4000,5600,150,3800,4000,1800,600,10,10);
				
				$rndunq1 = array(4000,6000,9200,100,4800,6000,2000,400,4,4);
				$rndunq2 = array(8000,8000,11200,300,7600,8000,3600,1200,20,20);
				
					for($i=41; $i<51; $i++)
					{
						$p = $i - 41;
						echo 
						'
							<tr>
								<td><img src="../../gpack/travian_default/img/u/'.$i.'.gif"></td>
								<td><input class="fm" name="small1u'.$i.'" value="'.$rndsmall1[$p].'" maxlength="6" style="width: 50%;"><input class="fm" name="small2u'.$i.'" value="'.$rndsmall2[$p].'" maxlength="6" style="width: 50%;"></td>
								<td><img src="../../gpack/travian_default/img/u/'.$i.'.gif"></td>
								<td><input class="fm" name="large1u'.$i.'" value="'.$rndlrg1[$p].'" maxlength="6" style="width: 50%;"><input class="fm" name="large2u'.$i.'" value="'.$rndlrg2[$p].'" maxlength="6" style="width: 50%;"></td>
								<td><img src="../../gpack/travian_default/img/u/'.$i.'.gif"></td>
								<td><input class="fm" name="unique1u'.$i.'" value="'.$rndunq1[$p].'" maxlength="6" style="width: 50%;"><input class="fm" name="unique2u'.$i.'" value="'.$rndunq2[$p].'" maxlength="6" style="width: 50%;"></td>
							</tr>
						';
					}
					echo "</tr>";
				?>
			</tr>
		</tbody>
	</table>
	
	<br /><br />
	
	<center><input type="image" src="../img/admin/b/ok1.gif" value="submit"></center>
</form>
<?php
if(isset($_GET['g']))
{
	echo 'Artefacts Added';
}
?>