<?php if($session->goldclub == 1 && count($database->getProfileVillages($session->uid)) > 1) { ?>
<h1 class="titleInHeader">Market <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid17">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(17,4);" class="build_logo"> 
	<img class="building big white g17" src="img/x.gif" alt="Piac" title="Piac" /> 
</a> 
At the marketplace you can trade resources with other players. The higher its level, the more resources can be transported at the same time.</div>  
<?php
include("upgrade.tpl");
include("17_menu.tpl"); 

if(isset($_GET['create']) && $session->gold > 1){
include("17_create.tpl");
}else if($_GET['action'] == 'editRoute' && isset($_GET['routeid']) && $_GET['routeid'] != ""){
$traderoute = $database->getTradeRouteUid($_GET['routeid']);
if($traderoute == $session->uid){
include("17_edit.tpl");
}
}else{
?>

<table id="npc" cellpadding="1" cellspacing="1"> 
<thead>
<tr>
<th colspan="2">Description</th>
<th>Start</th>
<th>Merchants</th>
<th>Action</th>
</tr></thead><tbody>
<?php
$routes = $database->getTradeRoute($session->uid);
    if(count($routes) == 0) {
    echo "<td colspan=\"5\" class=\"none\">No active trade routes.</td></tr>";
    }else{
foreach($routes as $route){
?>
<tr>
<th><a href="build.php?action=delRoute&routeid=<?php echo $route['id']; ?>"><img class="del" src="img/x.gif" alt="delete" title="delete"></a></th>
<th>
<?php
echo "Trade route to <a href=karte.php?d=".$route['wid']."&c=".$generator->getMapCheck($route['wid']).">".$database->getVillageField($route['wid'],"name")."</a></br>";
?>
<img src="<?php echo GP_LOCATE; ?>img/r/1.gif" alt="Wood" title="Wood"> <?php echo $route['wood']; ?>  <img src="<?php echo GP_LOCATE; ?>img/r/2.gif" alt="Clay" title="Clay"> <?php echo $route['clay']; ?>  <img src="<?php echo GP_LOCATE; ?>img/r/3.gif" alt="Iron" title="Iron"> <?php echo $route['iron']; ?>  <img src="<?php echo GP_LOCATE; ?>img/r/4.gif" alt="Crop" title="Crop"> <?php echo $route['crop']; ?>
<img src="<?php echo GP_LOCATE; ?>img/r/1.gif" alt="Lumber" title="Lumber"> <?php echo $route['wood']; ?>  <img src="<?php echo GP_LOCATE; ?>img/r/2.gif" alt="Clay" title="Clay"> <?php echo $route['clay']; ?>  <img src="<?php echo GP_LOCATE; ?>img/r/3.gif" alt="Iron" title="Iron"> <?php echo $route['iron']; ?>  <img src="<?php echo GP_LOCATE; ?>img/r/4.gif" alt="Crop" title="Crop"> <?php echo $route['crop']; ?>

</th>
<th><?php if($route['start'] > 9){ echo $route['start'];}else{ echo "0".$route['start'];} echo ":00"; ?></th>
<th><?php echo $route['deliveries']."x".$route['merchant']; ?></th>
<th><a href="build.php?id=<?php echo $id; ?>&t=4&action=editRoute&routeid=<?php echo $route['id']; ?>">» edit</a></th>
</tr>
<?php }} ?>
        </tbody></table>
<br>
<div class="options">
    <a class="arrow" href="build.php?gid=17&t=4&create"> Create new trade route</a>
</div>
	</div>
<?php
}}else{
header("Location: build.php?id=".$_GET['id']."");
}
?>