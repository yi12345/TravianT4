
<form method="post" action="nachrichten.php">
<div id="block">
	<input type="hidden" name="ft" value="m6" />
	<textarea name="notizen" id="notice"><?php echo $message->note; ?></textarea>
	<div class="btn">
    <button type="submit" value="" name="s1" id="btn_save"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Save</div></div></button>
    </div>
	
</div>
</form>
