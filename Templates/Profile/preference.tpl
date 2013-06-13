<?php 
if(isset($_GET['del']) && is_numeric($_GET['del'])){
	$database->removeLinks($_GET['del'],$session->uid);
	header("Location: spieler.php?s=2");
}
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       links.tpl                                                   ##
##  Developed by:  Slim, Manuel Mannhardt < manuel_mannhardt@web.de >          ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

// Save new link or just edit a link
if($_POST) {
    $links = array();
    
    // let's do some complicated code x'D
    foreach($_POST as $key => $value) {
        if(substr($key, 0, 2) == 'nr') {
            $i = substr($key, 2);
            $links[$i]['nr'] = mysql_escape_string($value);
        }
        
        if(substr($key, 0, 2) == 'id') {
            $i = substr($key, 2);
            $links[$i]['id'] = mysql_escape_string($value);
        }
        
        if(substr($key, 0, 8) == 'linkname') {
            $i = substr($key, 8);
            $links[$i]['linkname'] = mysql_escape_string($value);
        }
        
        if(substr($key, 0, 8) == 'linkziel') {
            $i = substr($key, 8);
            $links[$i]['linkziel'] = mysql_escape_string($value);
        }
    }
    
    // Save
    foreach($links as $link) {
        settype($link['nr'], 'int');
        
        if(trim($link['nr']) != '' AND trim($link['linkname']) != '' AND trim($link['linkziel']) != '' AND trim($link['id']) == '') {
            // Add new link
            $userid = $session->uid;
            
            $query = mysql_query('INSERT INTO `' . TB_PREFIX . 'links` (`userid`, `name`, `url`, `pos`) VALUES (' . $userid . ', \'' . $link['linkname'] . '\', \'' . $link['linkziel'] . '\', ' . $link['nr'] . ')');
        } elseif(trim($link['nr']) != '' AND trim($link['linkname']) != '' AND trim($link['linkziel']) != '' AND trim($link['id']) != '') {
            // Update link
            $query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'links` WHERE `id` = ' . $link['id']);
            $data = mysql_fetch_assoc($query);
            
            // May the user update this entry?
            if($data['userid'] == $session->uid) {
                $query2 = mysql_query('UPDATE `' . TB_PREFIX . 'links` SET `name` = \'' . $link['linkname'] . '\', `url` = \'' . $link['linkziel'] . '\', `pos` = ' . $link['nr'] . ' WHERE `id` = ' . $link['id']);
            }
        } elseif(trim($link['nr']) == '' AND trim($link['linkname']) == '' AND trim($link['linkziel']) == '' AND trim($link['id']) != '') {
            // Delete entry
            $query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'links` WHERE `id` = ' . $link['id']);
            $data = mysql_fetch_assoc($query);
            
            // May the user delete this entry?
            if($data['userid'] == $session->uid) {
                $query2 = mysql_query('DELETE FROM `' . TB_PREFIX . 'links` WHERE `id` = ' . $link['id']);
            }
        }
    }
    
    print '';
}


// Fetch all links
$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'links` WHERE `userid` = ' . $session->uid . ' ORDER BY `pos` ASC') or die(mysql_error());
$links = array();
while($data = mysql_fetch_assoc($query)) {
    $links[] = $data;
}
?>
<form action="spieler.php?s=2" method="POST">
  <input type="hidden" name="ft" value="p2">
  <input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
			<h4 class="round spacer">Direct Link</h4>

		<table class="transparent" cellpadding="1" cellspacing="1" id="links">
			<thead>
				<tr>
					<td>Delete</td>
					<td>No.</td>
					<td>Link Name</td>
					<td>Link Address</td>
					<td></td>
				</tr>
			</thead>
			<tbody>

							<?php $i = 0; foreach($links as $link): ?>
								<tr>
						  <td>
						<a href="spieler.php?del=<?php echo $link['id']; ?>&s=2"><img class="del" src="img/x.gif" alt="delete" title="delete"></a>
						</td>
					<td class="nr">
						<input class="text" type="text" name="nr<?php print $i; ?>" value="<?php print $link['pos']; ?>" size="1" maxlength="3" /><input type="hidden" name="id<?php print $i; ?>" value="<?php print $link['id']; ?>" />
					</td>
					<td class="nam">
						<input class="text" type="text" name="linkname<?php print $i; ?>" value="<?php print $link['name']; ?>" maxlength="30" />
					</td>
					<td class="link">
						<input class="text" type="text" name="linkziel<?php print $i; ?>" value="<?php print $link['url']; ?>" maxlength="255" />
					</td>
					<td class="add">
					</td>
				</tr>
							<?php ++$i; $last_pos = $link['pos']; endforeach; ?>		
						<tr class="addLine templateElement insertElement">
					<td></td>
					<td class="nr">
						<input class="text" type="text" name="nr<?php print $i; ?>" value="<?php print ($last_pos + 1); ?>" size="1" maxlength="3" />
					</td>
					<td class="nam">
						<input class="text" type="text" name="linkname<?php print $i; ?>" value="" maxlength="30" />
					</td>
					<td class="link">
						<input class="text" type="text" name="linkziel<?php print $i; ?>" value="" maxlength="255" />
					</td>
					<td class="add">
                    	<input type="image" value="" name="s1" id="plus" class="plus" src="img/x.gif" alt="OK" />
					</td>
				</tr>
			</tbody>
		</table>

		<script type="text/javascript">
			window.addEvent('domready', function()
			{
				var lastNumber = <?php print ($last_pos + 1); ?>;
				new Travian.Game.AddLine(
				{
					entryCount: <?php print ($last_pos + 1); ?>,
					elements:
					{
						table: $('links')
					},
					onInsertInputBefore: function(addLine, newInsertElement, newInputElement)
					{
						if (newInputElement.name.indexOf('nr<?php print $i; ?>') == 0)
						{
							newInputElement.value = ++lastNumber;
						}
					}
				});
			});
		</script>

	
	
	<div class="submitButtonContainer">
		<button type="submit" value="Mentés" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Save</div></div></button>
        </div>
</form>

