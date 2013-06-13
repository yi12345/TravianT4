<?php

include('menu.tpl');

?>
<?php

$varray = $database->getProfileVillages($session->uid);  

$tribe = $session->tribe;

if($tribe == 1){$t = 1;}elseif($tribe == 2){$t = 11;}elseif($tribe == 3){$t = 21;}elseif($tribe == 4){$t = 41;} 

?>
<div class="contentNavi tabNavi">
	<div class="container active">
		<div class="background-start">&nbsp;</div>
		<div class="background-end">&nbsp;</div>
		<div class="content"><span class="tabItem">Own Troops</span></div>
	</div>
    <div class="container normal">
		<div class="background-start">&nbsp;</div>
		<div class="background-end">&nbsp;</div>
		<div class="content"><span class="tabItem">Troops in Villages</span></div>
	</div>
	<div class="clear"></div>
</div>
<table cellpadding="1" cellspacing="1" id="troops">
<thead>
<tr>

<th>Village</th>

	<?php        

  for ($i = $t; $i <= $t+9; $i++) {

    echo '<td><img class="unit u'.$i.'" src="img/x.gif"></td>';

  }
  echo '<td><img class="unit uhero" src="img/x.gif"></td>';

  ?>

</tr></thead>
<tbody>

<?php

foreach($varray as $vil){

$vid = $vil['wref'];

if($vil['capital'] == 1){$class = 'hl';}else{$class = 'hover';}        

  $unit = $database->getUnit($vid);            

  echo '<tr class="'.$class.'">
  <th class="vil fc"><a href="dorf1.php?newdid='.$vid.'">'.$vil['name'].'</a></th>';

  for ($i = $t; $i <= $t+9; $i++) {

    $uni[$i] += $unit['u'.$i];

    if($unit['u'.$i] !=0){$cl = '';}else{$cl = 'none';}

    echo '<td class="'.$cl.'">'.$unit['u'.$i].'</td>';

  }       
  echo '<td class="'.$cl.'">'.$unit['u50'].'</td>';
  echo '</tr>';    

}

?>



<tr><td colspan="12" class="empty"></td></tr>

<th>Total</th>

<?php

foreach($uni as $u){

if($u !=0){$cl = '';}else{$cl = 'none';}

echo '<td class="'.$cl.'">'.$u.'</td>';

}
if($unit['u50'] == 0){
echo '<td class="none">0</td>';
}else{
echo '<td class="">1</td>';
}

?>

</tr></tbody></table>