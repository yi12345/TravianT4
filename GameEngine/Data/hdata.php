<?php

$heroinfo = $database->getHeroData($session->uid);

$herounit = array('atk'=>$heroinfo['power'],'off'=>$heroinfo['offBonus'],'def'=>$heroinfo['defBonus'],'product'=>$heroinfo['r0'],'wood'=>$heroinfo['r1'],'clay'=>$heroinfo['r2'],'iron'=>$heroinfo['r3'],'crop'=>$heroinfo['r4'],'pop'=>6,'speed'=>$heroinfo['speed']);

?>
