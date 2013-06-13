<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       msg.tpl                                                     ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<?php
$msg = $database->getMessage($_GET['nid'],3);;
if($msg){
?>
<table id="member" style="width:520px">

  <thead>

    <tr>

        <th colspan="2">Messages</th>

    </tr>

  </thead> 

    <tr>

        <td>From:</td>

        <td><a href="admin.php?p=player&uid=<?php echo $database->getUserField($msg[0]['owner'],'id',0);?>"><?php echo $database->getUserField($msg[0]['owner'],'username',0);?></a></td>

    </tr>

    <tr>

        <td>To:</td>

        <td><a href="admin.php?p=player&uid=<?php echo $database->getUserField($msg[0]['target'],'id',0);?>"><?php echo $database->getUserField($msg[0]['target'],'username',0);?></a></td>

    </tr>
    
    <tr>

        <td>Topic:</td>

        <td><?php echo $msg[0]['topic'];?><div style="float:right;"><?php echo date('d/m/Y H:i',$msg[0]['time']);?></div></td>

    </tr>
    

        <td colspan="2">
        <br />
        <?php echo $msg[0]['message'];?>
        <br /><br />
        </td>




</table>
</form>  
</div>
<?php
}else{
echo "Message id ".$_GET['nid']." wasn´t found.";
}
?>