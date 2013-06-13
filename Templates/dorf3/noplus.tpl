<div class="contentNavi subNavi">
				<div class="container active">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><a href="dorf3.php"><span class="tabItem">Overview</span></a></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">Resource</span></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">Warehouse</span></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">Culture Points</span></div>
				</div>
				<div class="container normal">
					<div class="background-start">&nbsp;</div>
					<div class="background-end">&nbsp;</div>
					<div class="content"><span class="tabItem">Troops</span></div>
				</div><div class="clear"></div>
</div>
<table cellpadding="1" cellspacing="1" id="overview">
<thead>
<tr>
	<td>Village</td>
	<td>Attacks</td>
	<td>Building</td> 
	<td>Troops</td>
	<td>Merchants</td>
</tr></thead><tbody>
<?php
$varray = $database->getProfileVillages($session->uid);  
foreach($varray as $vil){  
  $vid = $vil['wref'];
  $vdata = $database->getVillage($vid);
  if($vdata['capital'] == 1){$class = 'hl';}else{$class = '';}
  echo '
  <tr class="'.$class.'">
		   <td class="vil fc"><a href="dorf1.php?newdid='.$vid.'">'.$vdata['name'].'</a></td>
		   <td class="att"><span class="none">?</span></td>
		   <td class="bui"><span class="none">?</span></td> 
		   <td class="tro"><span class="none">?</span></td>
		   <td class="tra lc"><a href="build.php?gid=17">?/?</a></td>
	</tr> 
  ';
}
?>   
     </tbody>
</table>