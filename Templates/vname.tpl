<div id="villageName">
	<div class="clickable" ondblclick="Travian.Game.showEditVillageDialog('<?php echo SIDEINFO_CHANGEVIL_TITLE; ?>', '<?php echo SIDEINFO_CHANGEVIL_LABEL; ?>', '<?php echo SIDEINFO_CHANGEVIL_BTN; ?>', <?php echo $village->wid; ?>);" title="<?php echo SIDEINFO_CHANGE_TITLE; ?>" >		
        
        
<span id="villageNameField"><?php echo $village->vname; ?></span><br/>
<?php
if($village->loyalty>'100'){ $style="high"; }
if($village->loyalty<='100'){ $style="high"; }
if($village->loyalty<='50'){ $style="medium"; }
if($village->loyalty<='20'){ $style="low"; }
?>
<span class="loyalty <?php echo $style; ?>"><?php echo LOYALTY; ?> <?php echo $village->loyalty; ?>%</span>


	</div>
</div>