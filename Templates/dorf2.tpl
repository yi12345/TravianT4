<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       dorf2.tpl                                                   ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<div id="village_map">
<?php
if($building->walling()) {
	$wtitle = $building->procResType($building->walling())." Level ".$village->resarray['f40'];
}
else {
	$wtitle = ($village->resarray['f40'] == 0)? "Outer building site" : $building->procResType($village->resarray['f40t'],0)." Level ".$village->resarray['f40'];
}
?>
<map name="clickareas" id="clickareas">
<?php
$coords = array(19=>"110,135,132,120,132,121,160,122,179,136,179,151,158,163,128,163,109,149",
"202,93,223,79,223,79,251,80,271,95,271,109,249,121,220,121,200,108",
"290,76,311,61,311,62,339,63,359,77,359,92,337,104,308,104,289,90",
"384,105,406,91,406,91,434,92,453,106,453,121,432,133,402,133,383,120",
"458,147,479,133,479,133,507,134,527,149,527,164,505,175,476,175,457,162",
"71,184,92,170,92,171,120,172,140,186,139,201,118,213,88,213,69,199",
"516,196,538,182,538,182,566,183,585,198,585,212,564,224,534,224,515,211",
"280,113,301,98,301,99,329,100,349,114,348,169,327,181,298,181,278,168",
"97,320,118,306,118,307,146,308,166,322,165,337,144,349,114,349,95,335",
"59,244,80,230,80,230,108,231,128,246,128,260,106,272,77,272,57,259",
"477,249,498,235,498,235,526,236,546,251,545,265,524,277,494,277,475,264",
"181,259,202,245,202,245,230,246,250,261,250,275,228,287,199,287,180,274",
"182,189,203,175,203,175,231,176,251,190,251,205,229,217,200,217,181,204",
"254,308,276,294,276,294,304,295,324,309,323,324,302,336,272,336,253,323",
"505,317,526,303,526,303,554,304,574,319,573,333,552,345,522,345,503,332",
"182,379,204,365,204,365,232,366,251,380,251,395,230,407,200,407,181,394",
"324,370,345,356,345,357,373,358,393,372,392,387,371,398,341,398,322,385",
"433,334,454,320,454,321,482,322,502,336,502,351,480,362,451,362,432,349",
"271,412,292,398,292,399,320,400,340,414,339,429,318,440,289,440,269,427",
"396,396,417,381,417,382,445,383,465,397,464,412,443,424,413,424,394,410",
"398,212,412,250,369,301,394,323,445,286,453,233,427,183",
"71,450,2,374,3,374,-10,243,13,142,120,81,214,34,340,18,500,43,615,130,641,239,643,350,601,425,534,494,358,534,282,532,180,526,77,456,117,378,163,413,242,442,331,454,425,443,499,417,576,344,596,304,598,221,571,157,481,90,385,61,313,56,217,72,135,113,77,165,46,217,44,269,65,326,119,379");
for($t=19;$t<=40;$t++) {
	if(($village->resarray['f99t'] == 40 AND ($t)=='26') or ($village->resarray['f99t'] == 40 AND ($t)=='30') or ($village->resarray['f99t'] == 40 AND ($t)=='31') or ($village->resarray['f99t'] == 40 AND ($t)=='32')) {
	echo "<area href=\"build.php?id=99\" title=\"<div style=color:#FFF><b>WorldWonder</b></div> Level ".$village->resarray['f99']."\" coords=\"$coords[$t]\" shape=\"poly\"/>";
	} else {
if($village->resarray['f'.$t.'t'] != 0) {
$title = "<div style=color:#FFF><b>".$building->procResType($village->resarray['f'.$t.'t'])."</b></div> Level ".$village->resarray['f'.$t];
}
else {
    $title = "Building Site";
    if(($t == 39) && ($village->resarray['f'.$t] == 0)) {
        $title = "Rally Point building site";
        }
}
	echo "<area href=\"build.php?id=$t\" alt= \"$title\" title=\"$title\" coords=\"$coords[$t]\" shape=\"poly\"/>";
}
}
?>
<?php
 if($village->resarray['f40'] == 0) { 
if($building->walling()) {
    $wtitle = $building->procResType($building->walling())." Level ".$village->resarray['f40'];
    echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."Top \" alt=\"$wtitle level ".$village->resarray['f40']."\">";
     echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."bBottom \" alt=\"$wtitle level ".$village->resarray['f40']."\">";

    }
}else {
          $wtitle = $building->procResType($building->walling())." Level ".$village->resarray['f40'];
    echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."Top \" alt=\"$wtitle level ".$village->resarray['f40']."\">";
    echo "<img src=\"img/x.gif\" class=\"wall g3".$session->tribe."Bottom \" alt=\"$wtitle level ".$village->resarray['f40']."\">";
}
?>
</map>

<?php
for ($i=1;$i<=20;$i++) {
	if(($village->resarray['f99t'] == 40 AND ($i+18)=='26') or ($village->resarray['f99t'] == 40 AND ($i+18)=='30') or ($village->resarray['f99t'] == 40 AND ($i+18)=='31') or ($village->resarray['f99t'] == 40 AND ($i+18)=='32')) {
		} else {
	$text = "Construction Site";
	$img = "iso";
    	if($village->resarray['f'.($i+18).'t'] != 0) {
        	$text = $building->procResType($village->resarray['f'.($i+18).'t'])." Level ".$village->resarray['f'.($i+18)];
            $img = "g".$village->resarray['f'.($i+18).'t'];
       }
    foreach($building->buildArray as $job) {
    	if($job['field'] == ($i+18)) {
        	$img = 'g'.$job['type'].'b';
            $text = $building->procResType($job['type'])." Level ".$village->resarray['f'.$job['field']];
        }
    }
	echo "<img src=\"img/x.gif\" class=\"building d$i $img\" alt=\"$text\" />";
	}
}
    if($village->resarray['f39'] == 0) {
            if($building->rallying()) {
            echo "<img src=\"img/x.gif\" class=\"dx1 g16b\" alt=\"Rally Point ".$village->resarray['f39']."\" />";
            }
            else {
            echo "<img src=\"img/x.gif\" class=\"dx1 g16e\" alt=\"Rally Point \" />";
            }
        }
      else {
      	echo "<img src=\"img/x.gif\" class=\"dx1 g16\" alt=\"Rally Point ".$village->resarray['f39']."\" />";
      }
?>
<?php
if($village->resarray['f99t'] == 40) {
if($village->resarray['f99'] >= 0 && $village->resarray['f99'] <= 9) {
echo '<img class="ww g40 g40_0" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 10 && $village->resarray['f99'] <= 19) {
echo '<img class="ww g40 g40_1" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 20 && $village->resarray['f99'] <= 29) {
echo '<img class="ww g40 g40_2" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 30 && $village->resarray['f99'] <= 39) {
echo '<img class="ww g40 g40_3" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 40 && $village->resarray['f99'] <= 49) {
echo '<img class="ww g40 g40_4" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 50 && $village->resarray['f99'] <= 59) {
echo '<img class="ww g40 g40_5" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 60 && $village->resarray['f99'] <= 69) {
echo '<img class="ww g40 g40_6" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 70 && $village->resarray['f99'] <= 79) {
echo '<img class="ww g40 g40_7" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 80 && $village->resarray['f99'] <= 89) {
echo '<img class="ww g40 g40_8" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 90 && $village->resarray['f99'] <= 94) {
echo '<img class="ww g40 g40_9" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] >= 95 && $village->resarray['f99'] <= 99) {
echo '<img class="ww g40 g40_10" src="img/x.gif" alt="Wonder of the World">'; }
if($village->resarray['f99'] == 100) {
echo '<img class="ww g40 g40_11" src="img/x.gif" alt="Wonder of the World">'; }
}
?>
    <div id="levels" <?php if(isset($_COOKIE['t4level'])) { echo "class=\"on\""; } ?>>
<?php
for($i=1;$i<=20;$i++) {
if ($village->resarray['f'.($i+18)] != 0) {
echo "<div class=\"l$i\">".$village->resarray['f'.($i+18)]."</div>";
}
}
if($village->resarray['f39'] != 0) {
echo "<div class=\"l39\">".$village->resarray['f39']."</div>";
}
if($village->resarray['f40'] != 0) {
echo "<div class=\"aid40\">".$village->resarray['f40']."</div>";

}
?>

		</div>
        
<img src="img/x.gif" id="lswitch" <?php if(isset($_COOKIE['t4level'])) { echo "class=\"lswitchMinus\""; }else{ echo "class=\"lswitchPlus\""; } ?> onclick=" 
				$('lswitch').toggleClass('lswitchMinus');
				$('lswitch').toggleClass('lswitchPlus');
				if ($('levels').toggleClass('on').hasClass('on'))
				{
					document.cookie = 't4level=1; expires=Wed, 1 Jan 2020 00:00:00 GMT';
				}
				else
				{
					document.cookie = 't4level=1; expires=Thu, 01-Jan-1970 00:00:01 GMT';
				}
			" />
	<img class="clickareas" usemap="#clickareas" src="img/x.gif" alt="" />
            </div><div class="clear">&nbsp;</div>
            
           