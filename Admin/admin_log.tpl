<table id="member" border="1" cellpadding="3"> 
    <tr>
        <td><b>Log ID</b></td>
        <td><b>Admin</b></td>
        <td><b>LOG</b></td> 
        <td><b>Date</b></td>
        <td><b>عملیات</b></td>
    </tr>
<?php
	$no = count($database->getAdminLog());
	$log = $database->getAdminLog();
	if($no>0){
        for($i=0;$i<9;$i++) {
            $admid = $log[$i]['user'];
            $user = $database->getUserField($admid,"username",0);
			if($user == 'Multihunter') {
				$admin = '<b>CONTROL PANEL</b>';
			} else {
            	$admin = '<a href="admin.php?p=player&uid='.$admid.'">'.$user.'</a>';
            }
        	echo '
            <tr>
        		<td>'.$log[$i]['id'].'</td>
                <td>'.$admin.'</td>
                <td>'.$log[$i]['log'].'</td>
                <td>'. date("d.m.Y H:i:s",$log[$i]['time']+3600*2).'</td>
                <td><a onclick="dellog('.$log[$i]['id'].')" href="javascript:void(0)"><img border="0" src="../img/admin/delete.png"></a></td>
			</tr>  
            
            ';
		}
	}
?>