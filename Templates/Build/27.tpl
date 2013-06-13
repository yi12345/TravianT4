<h1 class="titleInHeader">Treasure Chamber <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid27">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(27,4);" class="build_logo">
        <img class="building big white g27" src="img/x.gif" alt="Kincstár" title="Kincstár"></a>
        The riches of your empire are kept in the treasure chamber. In each treasure chamber level 10 or higher, there is room for one artifact. After you have captured an artifact it takes 24 hours to be effective, except on speed servers where it only takes 12 hours </div>
        <?php
        include("upgrade.tpl");
        include("27_menu.tpl");
        if(isset($_GET['show'])){  include("27_show.tpl");  }else{
        if(!isset($_GET['t'])){
            include("27_1.tpl");     
        }elseif(isset($_GET['t']) && $_GET['t'] == 2){
            include("27_2.tpl"); 
        }elseif(isset($_GET['t']) && $_GET['t'] == 3){
            include("27_3.tpl");
        }
        }
        
        
        ?>
    </div>