<h1 class="titleInHeader">Cranny <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>

<div id="build" class="gid23"><div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(23,4);" class="build_logo">
	<img class="building big white g23" src="img/x.gif" alt="Rejtekhely" title="Rejtekhely" />
</a>
The cranny is used to hide some of your resources when the village is attacked. These resources cannot be stolen.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Cranny Size</th>
		<td><b>
        <?php
		if($session->tribe == 3) {
		echo $bid23[$village->resarray['f'.$id]]['attri']*2*CRANNY_CAPACITY;
        } else {
        echo $bid23[$village->resarray['f'.$id]]['attri']*CRANNY_CAPACITY;
        }
        ?>        
        </b> Units</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Cranny Capacity at level  <?php echo $village->resarray['f'.$id]+1; ?></th>
		<td><b>
        <?php
		if($session->tribe == 3) {
		echo $bid23[$village->resarray['f'.$id]+1]['attri']*2*CRANNY_CAPACITY;
        } else {
        echo $bid23[$village->resarray['f'.$id]+1]['attri']*CRANNY_CAPACITY;
        }
        ?>
        
        </b> Units</td>
        <?php
            }
            ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>