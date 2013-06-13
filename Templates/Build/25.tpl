<h1 class="titleInHeader">Residence <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid25">
<div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(25,4, 'gid');" class="build_logo">
        <img class="building big white g25" src="img/x.gif" alt="Residence" title="Residence" /> </a>
       The residence is a small palace, where the king or queen lives when (s)he visits the village. The residence protects the village against enemies who want to conquer it.</div>

<?php
include("upgrade.tpl");
include("25_menu.tpl");
if ($village->capital == 1) {
        echo "<p class=\"none\">This is the Capital</p>";
}
if($village->resarray['f'.$id] >= 10){
        include ("25_train.tpl");
}
else{
        echo '<div class="c">In order to found a new village you need a level 10 or 20 residence and 3 settlers. In order to conquer a new village you need a level 10 or 20 residence and a senator, chief or chieftain.</div>';
}



?>
</div><div class="clear">&nbsp;</div>
    <div class="clear"></div>