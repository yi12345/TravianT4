<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       unitdata.php                                                ##
##  Developed by:  Akakori                                                     ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
$heroinfo = $database->getHeroData($session->uid);

$herounit = array('atk'=>$heroinfo['power'],'off'=>$heroinfo['offBonus'],'def'=>$heroinfo['defBonus'],'product'=>$heroinfo['r0'],'wood'=>$heroinfo['r1'],'clay'=>$heroinfo['r2'],'iron'=>$heroinfo['r3'],'crop'=>$heroinfo['r4'],'pop'=>6,'speed'=>$heroinfo['speed']);

?>
