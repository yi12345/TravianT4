                                <map name="rx" id="rx">
                                <?php 
    $coorarray = array(1=>"180,80,28","269,81,28","338,93,28","122,119,28","235,132,28","292,139,28","377,137,28","62,170,28","143,171,28","333,171,28","420,171,28","70,231,28","143,221,28","279,257,28","401,226,28","174,311,28","265,316,28","355,293,28");
        for($i=1;$i<=18;$i++) {
            echo "<area href=\"build.php?id=$i\" coords=\"$coorarray[$i]\" shape=\"circle\" title=\"<div style=color:#FFF><b>".$building->procResType($village->resarray['f'.$i.'t'])."</b></div> Level ".$village->resarray['f'.$i]."\"/>";
        }
    ?>
<area href="dorf2.php" coords="250,191,32" shape="circle" title="Fields">
</map>

<div id="village_map" class="f<?php echo $village->type; ?>">
    <div id="village_circles"></div>

<?php 
for($i=1;$i<=18;$i++) {
    if($village->resarray['f'.$i.'t'] != 0) {
    $text = "";
    switch($i) {
    case 1:
    $style = "left:180px;top:80px;";
    break;
    case 2:
    $style = "left:269px;top:81px;";
    break;
    case 3:
     $style = "left:338px;top:93px;";
    break;
    case 4:
    $style = "left:122px;top:119px;";
    break;
    case 5:
    $style = "left:235px;top:132px;";
    break;
    case 6:
    $style = "left:292px;top:139px;";
    break;
    case 7:
     $style = "left:377px;top:137px;";
    break;
    case 8:
    $style = "left:62px;top:170px;";
    break;
    case 9:
    $style = "left:143px;top:171px;";
    break;
    case 10:
    $style = "left:333px;top:171px;";
    break;
    case 11:
    $style = "left:420px;top:171px;";
    break;
    case 12:
    $style = "left:70px;top:231px;";
    break;
    case 13:
    $style = "left:143px;top:221px;";
    break;
    case 14:
     $style = "left:279px;top:257px;";
    break;
    case 15:
    $style = "left:401px;top:226px;";
    break;
    case 16:
    $style = "left:174px;top:311px;";
    break;
    case 17:
    $style = "left:265px;top:316px;";
    break;
    case 18:
    $style = "left:355px;top:293px;";
    break;
    }
    if($village->resarray['f'.$i] != 0) {
    echo "<div class=level style=\"".$style." ".$cstyle."\">".$village->resarray['f'.$i]."</div> ";
    }
    }
   }
  ?>     



    <img id="resfeld" usemap="#rx" src="img/x.gif" alt="">

</div> 