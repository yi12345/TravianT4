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
<form action="../GameEngine/Admin/Mods/createNatarAccount.php" method="POST">
	<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
	<table id="member" cellpadding="1" cellspacing="1" >
		<thead>
			<tr>
				<th colspan="2">Create NPC Tribe Natar and Capital Village</th>
			</tr> 
		</thead>
		<tbody> 
			<tr>
				<td class="hab"><center><input type="image" src="../img/admin/b/ok1.gif" value="submit"></center></td>
			</tr>
		</tbody>
	</table>
</form>
<?php
if(isset($_GET['g']))
{
	echo '<font color="red"><a href="admin.php?p=player&uid='.$_GET['uid'].'">Natar</a> account and <a href="admin.php?p=village&did='.$_GET['did'].'">Capital</a> Created</font>';
}
?>