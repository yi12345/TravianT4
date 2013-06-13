<?php
$displayarray = $database->getUserArray($_GET['uid'],1);
$varmedal = $database->getProfileMedal($_GET['uid']);

$profiel="".$displayarray['desc1']."".md5(skJkev3)."".$displayarray['desc2']."";
require("medal.php");
$profiel=explode("".md5(skJkev3)."", $profiel);

$varray = $database->getProfileVillages($_GET['uid']);
$totalpop = 0;
foreach($varray as $vil) {
	$totalpop += $vil['pop'];
}
		
?>

<h4 class="round">Information</h4>
<?php
    if($_GET['uid']==2){
    echo '<img src="gpack/travian_Travian_4.0_41/img/t/t10_2.jpg" border="0">';
    } else {
    echo '<img class="heroImage" style="width:160px;height:205px;" src="hero_body.php?uid='.$_GET['uid'].'&size=profile&'.md5($_GET['uid']).'" alt="hero">';
    }
?>
<table cellpadding="1" cellspacing="1" id="details" class="transparent">
	<tr>
		<th>Rank</th>
		<td><?php echo $ranking->getUserRank($displayarray['id']); ?></td>
	</tr>
	<tr>
		<th>Tribe</th>
		<td><?php 
                if($displayarray['tribe'] == 1) {
                echo "Roman";
                }
                else if($displayarray['tribe'] == 2) {
                echo "Teuton";
                }
                else if($displayarray['tribe'] == 3) {
                echo "Gaul";
                }
				else if($displayarray['tribe'] == 4) {
                echo "Nature";
                
                }else if($displayarray['tribe'] == 5) {
                echo "Natar";
                }				?></td>
	</tr>
	<tr>
		<th>Alliance</th>
		<td><?php if($displayarray['alliance'] == 0) {
                echo "-";
                }
                else {
                $displayalliance = $database->getAllianceName($displayarray['alliance']);
                echo "<a href=\"allianz.php?aid=".$displayarray['alliance']."\">".$displayalliance."</a>";
                } ?></td>
	</tr>
	<tr>
		<th>Villages</th>
		<td><?php echo count($varray);?></td>
	</tr>
	<tr>
		<th>Population</th>
		<td><?php echo $totalpop;?></td>
	</tr>
    <?php 
			//Date of Birth
            if(isset($displayarray['birthday']) && $displayarray['birthday'] != 0) {
			$age = date('Y') - substr($displayarray['birthday'],0,4);
				if ((date('m') - substr($displayarray['birthday'],5,2)) < 0){$age --;}
				elseif ((date('m') - substr($displayarray['birthday'],5,2)) == 0){
					if(date('d') < substr($displayarray['birthday'],8,2)){$age --;}
				}
            echo "<tr><th>Age</th><td>$age</td></tr>";
            }
			//Gender
            if(isset($displayarray['gender']) && $displayarray['gender'] != 0) {
            $gender = ($displayarray['gender']== 1)? "Male" : "Female";
            echo "<tr><th>Gender</th><td>".$gender."</td></tr>";
            }
			//Location
            if($displayarray['location'] != "") {
            echo "<tr><th>Location:</th><td>".$displayarray['location']."</td></tr>";
            }
            ?>
    		<tr>
        	<?php
            	if($_GET['uid'] == $session->uid) {
                	if($session->is_sitter){
            			echo "<td colspan=\"2\"> <span class=\"a arrow disabled\">Edit Profile</span></td>";
                    }else{
                    	echo "<td colspan=\"2\"> <a class=\"arrow\" href=\"spieler.php?s=1\">Edit Profile</a></td>";
                    }
                } else {
            		echo "<td colspan=\"2\"> <a class=\"message messageStatus messageStatusUnread\" href=\"nachrichten.php?t=1&amp;id=".$_GET['uid']."\">Send message</a></td>";
			 	}
             ?>
	</tr>
</table>

	
<div class="clear"></div>
<br />

<h4 class="round">Description</h4>

<div class="description description1"><?php echo nl2br($profiel[1]); ?></div>
<div class="description description2"><?php echo nl2br($profiel[0]); ?></div>

<div class="clear"></div>


<h4 class="round">Villages</h4>

<table cellpadding="1" cellspacing="1" id="villages">
	<thead>
		<tr>
			<th class="name">Name</th>
            <th>Oasis</th>
			<th>Population</th>
			<th>Location</th>
		</tr>
	</thead>
	<tbody>
        <?php 
    foreach($varray as $vil) {
    	$coor = $database->getCoor($vil['wref']);
    	echo "<tr><td class=\"name\"><a href=\"position_details.php?x=".$coor['x']."&amp;y=".$coor['y']."\">".$vil['name']."</a> ";
        if($vil['capital'] == 1) {
        echo "<span class=\"mainVillage\">(Capital)</span>";
        }
        echo "</td><td class=\"oases\">";
        
$prefix = "".TB_PREFIX."odata";
$uid = $_GET['uid']; $wref = $vil['wref'];
$sql2 = mysql_query("SELECT * FROM $prefix WHERE owner = $uid AND conqured = $wref");
while($row = mysql_fetch_array($sql2)){
$type = $row["type"];
switch($type) {
case 1:
case 2:
echo  "<img class='r1' src='img/x.gif' title='Lumber'>";
break;
case 3:
echo  "<img class='r1' src='img/x.gif' title='Lumber'> <img class='r4' src='img/x.gif' title='Crop'>";
break;
case 4:
case 5:
echo  "<img class='r2' src='img/x.gif' title='Clay'>";
break;
case 6:
echo  "<img class='r2' src='img/x.gif' title='Clay'> <img class='r4' src='img/x.gif' title='Crop'>";
case 7:
case 8:
echo  "<img class='r3' src='img/x.gif' title='Iron'>";
break;
case 9:
echo  "<img class='r3' src='img/x.gif' title='Iron'> <img class='r4' src='img/x.gif' title='Crop'>";
break;
case 10:
case 11:
case 12:
echo  "<img class='r4' src='img/x.gif' title='Crop'>";
break;
}
}
        echo "</td>";
        echo "<td class=\"inhabitants\">".$vil['pop']."</td><td class=\"coords\">";
        echo "<a href=\"position_details.php?x=".$coor['x']."&amp;y=".$coor['y']."\">
        <span class=\"coordinates coordinatesAligned\">
        <span class=\"coordinateY\">(".$coor['x']."</span>
        <span class=\"coordinatePipe\">|</span>
        <span class=\"coordinateX\">".$coor['y'].")</span>
        </span><span class=\"clear\">‎</span>
        </td></tr>";
    }
    ?>
</tbody>
</table>

