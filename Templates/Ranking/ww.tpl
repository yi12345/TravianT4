<?php
if(WW == True){
    $result = mysql_query("select ".TB_PREFIX."users.id, ".TB_PREFIX."users.username,".TB_PREFIX."users.alliance, ".TB_PREFIX."fdata.wwname, ".TB_PREFIX."fdata.f99, ".TB_PREFIX."vdata.name, ".TB_PREFIX."vdata.wref
                        FROM ".TB_PREFIX."users 
                        INNER JOIN ".TB_PREFIX."vdata ON ".TB_PREFIX."users.id = ".TB_PREFIX."vdata.owner
                        INNER JOIN ".TB_PREFIX."fdata ON ".TB_PREFIX."fdata.vref = ".TB_PREFIX."vdata.wref
                        WHERE ".TB_PREFIX."fdata.f99t = 40 ORDER BY ".TB_PREFIX."fdata.f99 Desc Limit 20");
?>
<h4 class="round">Wonder of the world</h4>
<table cellpadding="1" cellspacing="1" id="wonder">
		<thead><tr><td></td><td>Player</td><td>Name</td><td>Alliance</td><td>Level</td></tr></thead>
	<tbody>
        <?php
        $cont = 1;
    while($row = mysql_fetch_array($result))
      { 
      $ally = $database->getAlliance($row[alliance]);
      ?>
			<tr class="hover">
				<td class="ra"><?php echo $cont; $cont++;?>.</td>
				<td class="pla"><a href="spieler.php?uid=<?php echo $row['id'];?>"><?php echo $row['username'];?></a></td>

                
                

				<td class="nam"><?php echo $row['wwname'];?></td>
				<td class="al">
                
                <?php
                if($ally['tag'] != "") {
                ?>
                <center><a href="allianz.php?aid=<?php echo $ally['id'];?>"><?php echo $ally['tag']; ?></a></center>
                <?php
                }
                    else {
                    echo "-";
                    } ?>
                </td>
				<td class="lev"><?php echo $row['f99'];?></td>
			</tr>
       <?php }
        ?>
	</tbody>
</table>
<?php
}else{
header("Location: statistiken.php");
}
?>