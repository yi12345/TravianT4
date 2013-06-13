<h1 class="titleInHeader">Residence <span class="level"> Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid25">
<div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(25,4, 'gid');" class="build_logo">
        <img class="building big white g25" src="img/x.gif" alt="Residence" title="Residence" /> </a>
        The residence is a small palace, where the king or queen lives when (s)he visits the village. The residence protects the village against enemies who want to conquer it.
.</div>

<?php
include("upgrade.tpl");
include("25_menu.tpl"); ?>

<p>In order to expand your nation you need culture points. These accumulate over time from your buildings, and faster at higher levels..</p>

<table cellpadding="1" cellspacing="1" id="build_value">
<tr>
        <th>This Village is producing</th>
        <td><b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> Culture Points</td>
</tr>
<tr>
        <th>All Villages are Producing </th>
        <td><b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> Culture Points</td>
</tr>
</table><p>In order to settle a new village you need <b><?php $mode = CP; $total = count($database->getProfileVillages($session->uid)); echo ${'cp'.$mode}[$total+1]; ?></b> Culture Points. You have <b><?php echo $database->getUserField($session->uid, 'cp',0); ?></b> Culture Points. </p>
</div><div class="clear">&nbsp;</div>
    <div class="clear"></div>