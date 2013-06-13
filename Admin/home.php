<div align="center">
	<ul class="tabs">
		<li><a id="a_title_1" onclick="SetCurrent(1);" class="current" href="#">First</a></li>
		<li><a id="a_title_2" onclick="SetCurrent(2);" href="#">Check Statistics</a></li>
		<li><a id="a_title_3" onclick="SetCurrent(3);" href="#">Profile server</a></li>
	</ul>
</div>
				
<div id="div_1">
	<table style="width:100%;">
		<tr>
			<td align="center"><a href="index.php?p=News"><img title="Edit News" src="images/icon/edit-icon.png"></a></td>
			<td align="center"><img title="Edit Post" src="images/icon/floppy-icon.png"></td>
			<td align="center"><img title="Management Comments" src="images/icon/fav-b-add-icon.png"></td>
			<td align="center"><img title="Categories" src="images/icon/documents-or-copy-icon.png"></td>
		</tr>
		<tr>
			<td align="center"><a href="index.php?p=News">Edit News</a></td>
			<td align="center">
			<a href="postmgr.php">Archive</a></td>
			<td align="center"><a href="comment.php">Management Comments</a></td>
			<td align="center"><a href="cat.php">Categories</a></td>
		</tr>
		<tr>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
		</tr>
				<tr>
			<td align="center"><img title="مديريت لينك ها" longdesc="مديريت لينك ها" src="images/icon/web-search-icon.png"></td>
			<td align="center"><img title="بلوك ها" longdesc="بلوك ها" src="images/icon/window-b-icon.png"></td>
			<td align="center"><img title="صفحات اضافي" longdesc="صفحات اضافي" src="images/icon/documents-or-copy-icon.png"></td>
			<td align="center"><img title="Members of Management" longdesc="Members of Management" src="images/icon/group-of-users-icon.png"></td>
		</tr>

		<tr>
			<td align="center"><a href="simplelink.php">Link Here</a></td>
			<td align="center"><a href="block.php">بلوك ها</a></td>
			<td align="center"><a href="extra.php">صفحات اضافي</a></td>
			<td align="center"><a href="member.php">Members of Management</a></td>
		</tr>
		<tr>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
		</tr>
				<tr>
			<td align="center"><img title="صندوق پيام ها" longdesc="صندوق پيام ها" src="images/icon/mail-send-icon.png"></td>
			<td align="center"><img title="File Manager" longdesc="File Manager" src="images/icon/folder-open-icon.png"></td>
			<td align="center"><img title="ليست سياه" longdesc="ليست سياه " src="images/icon/delete-user-icon.png"></td>
			<td align="center"><img title="Newsletter" longdesc="Newsletter" src="images/icon/fav-add-icon.png"></td>
		</tr>

		<tr>
			<td align="center"><a href="inbox.php">Messages</a></td>
			<td align="center"><a href="uc.php">File Manager</a></td>
			<td align="center"><a href="banned.php">ليست سياه</a></td>
			<td align="center"><a href="newsletter.php">Newsletter</a></td>
		</tr>
		<tr>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
		</tr>
				<tr>
			<td align="center"><img title="Regulations" longdesc="Regulations" src="images/icon/window-icon.png"></td>
			<td align="center"><img title="Theme" longdesc="Theme" src="images/icon/paint-icon.png"></td>
			<td align="center"><img title="Backup" longdesc="Backup" src="images/icon/refresh-icon.png"></td>
			<td align="center"><img title="Updated" longdesc="Updated" src="images/icon/wizard-icon.png"></td>
		</tr>

		<tr>
			<td align="center"><a href="setting.php">Regulations</a></td>
			<td align="center"><a href="template.php">Theme</a></td>
			<td align="center"><a href="backup.php">Backup</a></td>
			<td align="center"><a href="update.php">Updated</a></td>
		</tr>
		<tr>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
			<td align="center" style="height: 8px"></td>
		</tr>

		<tr>
			<td align="center"><a href="ymsgr:sendim?westehran"><img title="Support" src="images/icon/help-icon.png"></a></td>
			<td align="center"></td>
			<td align="center"><a href="<?php echo HOMEPAGE; ?>" target="_blank"><img title="View Website" src="images/icon/web-icon.png"></a></td>
			<td align="center"><a href="?action=logout"><img title="Exit" src="images/icon/close-icon.png"></a></td>
		</tr>

		<tr>
			<td align="center"><a href="ymsgr:sendim?trafian_ir">Support</a></td>
			<td align="center"></td>
			<td align="center"><a href="<?php echo HOMEPAGE; ?>" target="_blank">View Server</a></td>
			<td align="center"><a href="?action=logout">Exit</a></td>
		</tr>

	</table>
</div>
<div id="div_2" style="display:none;">
    <table id="member" border="1" cellpadding="3"> 
        <tr>
            <td><b>Log ID</b></td>
            <td><b>Admin</b></td>
            <td><b>LOG</b></td> 
            <td><b>Date</b></td>
            <td><b>Operations</b></td>
        </tr>
    <?php
    
    $sql = mysql_query("SELECT * FROM ".TB_PREFIX."admin_log ORDER BY id DESC LIMIT 10");
    $query = count($sql);
        if($query>0){
            while($row = mysql_fetch_array($sql)){
                $admid = $row['user'];
                $user = $database->getUserField($admid,"username",0);
                if($user == 'Multihunter') {
                    $admin = '<b>Control Panel</b>';
                } else {
                    $admin = '<a href="admin.php?p=player&uid='.$admid.'">'.$user.'</a>';
                }
                echo '
                <tr id="log'.$row['id'].'">
                    <td>'.$row['id'].'</td>
                    <td>'.$admin.'</td>
                    <td>'.$row['log'].'</td>
                    <td>'. date("d.m.Y H:i:s",$row['time']+3600*2).'</td>
                    <td><a onclick="dellog('.$row['id'].')" href="javascript:void(0)"><img border="0" src="../img/admin/delete.png"></a></td>
                </tr>
                ';
            }
        }
    ?>
    </table>
</div>
<div id="div_3" style="display:none;">
	<?php
    $tribe1 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE tribe = 1 and id>3");
    $tribe2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE tribe = 2 and id>3");
    $tribe3 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE tribe = 3 and id>3");
    $tribes = array(mysql_num_rows($tribe1),mysql_num_rows($tribe2),mysql_num_rows($tribe3));
    $users = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id>3"));
    $actives = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."active"));
    $onlines = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE ".time()." - timestamp < 300"));
    $banned = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE access = 0"));
    $villages = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."vdata"));
    $alliances = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."alidata"));
    $adventures = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."adventure"));
    $auctions = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."auction WHERE finish = 0"));
    $notices = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."ndata"));
    $movements = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."movement WHERE proc = 0"));
    $allvillages = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."wdata WHERE oasistype = 0"));
    $alloasis = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."wdata WHERE fieldtype = 0"));
    $occoasis = mysql_num_rows(mysql_query("SELECT * FROM ".TB_PREFIX."wdata WHERE fieldtype = 0 and occupied!=0"));
    ?><br />
    <table id="server_info" width="170" border="1" bgcolor="#E5E5E5" cellpadding="2">
            <tbody>
                <tr>
                    <td align="center" colspan="2"><b>اطلاعات سرور</b><br /><br /></td>
                </tr>
                <tr>
                    <td>Registered players:</td>
                    <td><?php echo $users; ?></td>
                </tr>
                <tr>
                    <td>Active players:</td>
                    <td><?php echo $actives; ?></td>
                </tr>
                <tr>
                    <td>Online:</td>
                    <td><?php echo $onlines; ?></td>
                </tr>
                <tr>
                    <td>Arrested for:</td>
                    <td><?php echo $banned; ?></td>
                </tr>
                <tr>
                    <td>Alliances:</td>
                    <td><?php echo $alliances; ?></td>
                </tr>
                <tr>
                    <td>Adventures:</td>
                    <td><?php echo $adventures; ?></td>
                </tr>
                <tr>
                    <td>Auctions:</td>
                    <td><?php echo $auctions; ?></td>
                </tr>
                <tr>
                    <td>Reports:</td>
                    <td><?php echo $notices; ?></td>
                </tr>
                <tr>
                    <td>حرکت ها:</td>
                    <td><?php echo $movements; ?></td>
                </tr>
            </tbody>
    </table>
    <br /><br />
    <div style="margin-right:200px;margin-top:-220px;">
    <table id="server_info" width="170" border="1" bgcolor="#E5E5E5" cellpadding="2">
        <thead align="center">
            <tr>
                <td colspan="3" align="center"><b>Info playersن</b><br><br></td>
            </tr>
            <tr>
                <td><b>Race</b></td>
                <td><b>Number</b></td>
                <td><b>Percent</b></td>
            </tr>
        </thead>
        <tbody>
            
            <tr>
                <td>Romans:</td>
                <td><?php echo $tribes[0]; ?></td>
                <td><?php $percents = 100*($tribes[0] / $users); echo round($percents,1); ?>%</td>
            </tr>
            <tr>
                <td>Teutons:</td>
                <td><?php echo $tribes[1]; ?></td>
                <td><?php $percents = 100*($tribes[1] / $users); echo round($percents,1); ?>%</td>
            </tr>
            <tr>
                <td width="60">Gauls:</td>
                <td width="20"><?php echo $tribes[2]; ?></td>
                <td><?php $percents = 100*($tribes[2] / $users); echo round($percents,1); ?>%</td>
            </tr>
        </tbody>
    </table>
    </div>
    
    <div style="margin-right:400px;margin-top:-104px;">
    <table id="server_info" width="170" border="1" bgcolor="#E5E5E5" cellpadding="2">
        <thead align="center">
            <tr>
                <td colspan="2" align="center"><b>The role of informationه</b><br><br></td>
            </tr>
        </thead>
        <tbody>
            
            <tr>
                <td>The whole village:</td>
                <td><?php echo $allvillages; ?></td>
            </tr>
            <tr>
                <td>Villages were captured:</td>
                <td><?php echo $villages; ?></td>
            </tr>
            <tr>
                <td>کل آبادی ها:</td>
                <td><?php echo $alloasis; ?></td>
            </tr>
            <tr>
                <td>آبادی های تسخیر شده:</td>
                <td><?php echo $occoasis; ?></td>
            </tr>
            <tr>
                <td>Maximum capacity map:</td>
                <td><?php echo WORLD_MAX."x".WORLD_MAX; ?></td>
            </tr>
        </tbody>
    </table>
    </div>
</div>
