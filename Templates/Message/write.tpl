<div id="messageNavigation">
	<div id="backToInbox">
		<a href="nachrichten.php">Return to inbox</a>
	</div>
	<div class="clear"></div>
</div>
<div id="write_head" class="msg_head"></div>
<div id="write_content" class="msg_content">
	<form method="post" action="nachrichten.php" accept-charset="UTF-8" name="msg">
	<input type="hidden" name="c" value="3e9" />
	<input type="hidden" name="p" value="" />
	<div class="paper">
		<div class="layout">
			<div class="paperTop"></div>
			<div class="paperMiddle"></div>
			<div class="paperBottom"></div>
		</div>
		<div class="paperContent">
			<div id="recipient">
				<div class="header label">Recipient:</div>
				<div class="header text">
<input tabindex="1" class="text" type="text" name="an" id="receiver" value="<?php if(isset($id)) { echo $database->getUserField($id,'username',0); } ?>" maxlength="50" onkeyup="copyElement('receiver')" >

<button title="Address Book" type="button" value="adbook" id="adbook" class="icon" onclick="Travian.Game.Messages.Write.showAddressBook('adressbook');" tabindex="5">
<img src="img/x.gif" class="adbook" alt="adbook"></button>
<script>
</script>
<button title="Ally" type="button" value="ally" id="ally" class="icon" tabindex="6" onclick="this.form.receiver.value='[ally]';">
<img src="img/x.gif" class="ally" alt="ally"></button>
</div>

				<div class="clear"></div>
			</div>
			<div id="subject">
				<div class="header label">Suject</div>
				<div class="header text"><input tabindex="2" class="text" name="be" id="subject" type="text" value="<?php if(isset($message->reply['topic'])) 
{ 
   if (preg_match("/re([0-9]+)/i",$message->reply['topic'],$c)) 
   { 
       $c = $c[1]+1; 
       echo $message->reply['topic'] = preg_replace("/re[0-9]+/i","re".($c),$message->reply['topic']); 
}else{ 
echo "RE:".$message->reply['topic']; }} ?>" name="be" onkeyup="copyElement('subject')"></div>
				<div class="clear"></div>
			</div>
            			<div id="bbEditor">
				
			<div id="message_container" class="bbEditor">
				<div class="boxes boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
				<div id="message_toolbar" class="bbToolbar"><button type="button" value="bbBold" class="icon bbButton bbBold bbType{d} bbTag{b}"><img src="img/x.gif" class="bbBold" alt="bbBold"></button><button type="button" value="bbItalic" class="icon bbButton bbItalic bbType{d} bbTag{i}"><img src="img/x.gif" class="bbItalic" alt="bbItalic"></button><button type="button" value="bbUnderscore" class="icon bbButton bbUnderscore bbType{d} bbTag{u}"><img src="img/x.gif" class="bbUnderscore" alt="bbUnderscore"></button><button type="button" value="bbAlliance" class="icon bbButton bbAlliance bbType{d} bbTag{alliance0}"><img src="img/x.gif" class="bbAlliance" alt="bbAlliance"></button><button type="button" value="bbPlayer" class="icon bbButton bbPlayer bbType{d} bbTag{player0}"><img src="img/x.gif" class="bbPlayer" alt="bbPlayer"></button><button type="button" value="bbCoordinate" class="icon bbButton bbCoordinate bbType{d} bbTag{coor0}"><img src="img/x.gif" class="bbCoordinate" alt="bbCoordinate"></button><button type="button" value="bbReport" class="icon bbButton bbReport bbType{d} bbTag{report0}"><img src="img/x.gif" class="bbReport" alt="bbReport"></button><button type="button" value="bbResource" id="message_resourceButton" class="bbWin{resources} bbButton bbResource icon"><img src="img/x.gif" class="bbResource" alt="bbResource"></button><button type="button" value="bbSmilies" id="message_smilieButton" class="bbWin{smilies} bbButton bbSmilies icon"><img src="img/x.gif" class="bbSmilies" alt="bbSmilies"></button><button type="button" value="bbTroops" id="message_troopButton" class="bbWin{troops} bbButton bbTroops icon"><img src="img/x.gif" class="bbTroops" alt="bbTroops"></button><button type="button" value="bbPreview" id="message_previewButton" class="icon bbButton bbPreview"><img src="img/x.gif" class="bbPreview" alt="bbPreview"></button><div class="clear"></div>
					<div id="message_toolbarWindows" class="bbToolbarWindow">
						<div id="message_resources"><a href="#" class="bbType{o} bbTag{l}"><img src="img/x.gif" class="r1" alt="چوب"></a><a href="#" class="bbType{o} bbTag{cl}"><img src="img/x.gif" class="r2" alt="خشت"></a><a href="#" class="bbType{o} bbTag{c}"><img src="img/x.gif" class="r4" alt="گندم"></a><a href="#" class="bbType{o} bbTag{i}"><img src="img/x.gif" class="r3" alt="آهن"></a></div>
						<div id="message_smilies"><a href="#" class="bbType{s} bbTag{*aha*}"><img class="smiley aha" src="img/x.gif" alt="*aha*"></a><a href="#" class="bbType{s} bbTag{*angry*}"><img class="smiley angry" src="img/x.gif" alt="*angry*"></a><a href="#" class="bbType{s} bbTag{*cool*}"><img class="smiley cool" src="img/x.gif" alt="*cool*"></a><a href="#" class="bbType{s} bbTag{*cry*}"><img class="smiley cry" src="img/x.gif" alt="*cry*"></a><a href="#" class="bbType{s} bbTag{*cute*}"><img class="smiley cute" src="img/x.gif" alt="*cute*"></a><a href="#" class="bbType{s} bbTag{*depressed*}"><img class="smiley depressed" src="img/x.gif" alt="*depressed*"></a><a href="#" class="bbType{s} bbTag{*eek*}"><img class="smiley eek" src="img/x.gif" alt="*eek*"></a><a href="#" class="bbType{s} bbTag{*ehem*}"><img class="smiley ehem" src="img/x.gif" alt="*ehem*"></a><a href="#" class="bbType{s} bbTag{*emotional*}"><img class="smiley emotional" src="img/x.gif" alt="*emotional*"></a><a href="#" class="bbType{s} bbTag{:D}"><img class="smiley grin" src="img/x.gif" alt=":D"></a><a href="#" class="bbType{s} bbTag{:)}"><img class="smiley happy" src="img/x.gif" alt=":)"></a><a href="#" class="bbType{s} bbTag{*hit*}"><img class="smiley hit" src="img/x.gif" alt="*hit*"></a><a href="#" class="bbType{s} bbTag{*hmm*}"><img class="smiley hmm" src="img/x.gif" alt="*hmm*"></a><a href="#" class="bbType{s} bbTag{*hmpf*}"><img class="smiley hmpf" src="img/x.gif" alt="*hmpf*"></a><a href="#" class="bbType{s} bbTag{*hrhr*}"><img class="smiley hrhr" src="img/x.gif" alt="*hrhr*"></a><a href="#" class="bbType{s} bbTag{*huh*}"><img class="smiley huh" src="img/x.gif" alt="*huh*"></a><a href="#" class="bbType{s} bbTag{*lazy*}"><img class="smiley lazy" src="img/x.gif" alt="*lazy*"></a><a href="#" class="bbType{s} bbTag{*love*}"><img class="smiley love" src="img/x.gif" alt="*love*"></a><a href="#" class="bbType{s} bbTag{*nocomment*}"><img class="smiley nocomment" src="img/x.gif" alt="*nocomment*"></a><a href="#" class="bbType{s} bbTag{*noemotion*}"><img class="smiley noemotion" src="img/x.gif" alt="*noemotion*"></a><a href="#" class="bbType{s} bbTag{*notamused*}"><img class="smiley notamused" src="img/x.gif" alt="*notamused*"></a><a href="#" class="bbType{s} bbTag{*pout*}"><img class="smiley pout" src="img/x.gif" alt="*pout*"></a><a href="#" class="bbType{s} bbTag{*redface*}"><img class="smiley redface" src="img/x.gif" alt="*redface*"></a><a href="#" class="bbType{s} bbTag{*rolleyes*}"><img class="smiley rolleyes" src="img/x.gif" alt="*rolleyes*"></a><a href="#" class="bbType{s} bbTag{:(}"><img class="smiley sad" src="img/x.gif" alt=":("></a><a href="#" class="bbType{s} bbTag{*shy*}"><img class="smiley shy" src="img/x.gif" alt="*shy*"></a><a href="#" class="bbType{s} bbTag{*smile*}"><img class="smiley smile" src="img/x.gif" alt="*smile*"></a><a href="#" class="bbType{s} bbTag{*tongue*}"><img class="smiley tongue" src="img/x.gif" alt="*tongue*"></a><a href="#" class="bbType{s} bbTag{*veryangry*}"><img class="smiley veryangry" src="img/x.gif" alt="*veryangry*"></a><a href="#" class="bbType{s} bbTag{*veryhappy*}"><img class="smiley veryhappy" src="img/x.gif" alt="*veryhappy*"></a><a href="#" class="bbType{s} bbTag{;)}"><img class="smiley wink" src="img/x.gif" alt=";)"></a></div>
						<div id="message_troops"><a href="#" class="bbType{o} bbTag{tid1}"><img class="unit u1" src="img/x.gif" alt="سرباز لژیون"></a><a href="#" class="bbType{o} bbTag{tid2}"><img class="unit u2" src="img/x.gif" alt="محافظ"></a><a href="#" class="bbType{o} bbTag{tid3}"><img class="unit u3" src="img/x.gif" alt="شمشیرزن"></a><a href="#" class="bbType{o} bbTag{tid4}"><img class="unit u4" src="img/x.gif" alt="خبرچین"></a><a href="#" class="bbType{o} bbTag{tid5}"><img class="unit u5" src="img/x.gif" alt="شوالیه"></a><a href="#" class="bbType{o} bbTag{tid6}"><img class="unit u6" src="img/x.gif" alt="شوالیۀ سزار"></a><a href="#" class="bbType{o} bbTag{tid7}"><img class="unit u7" src="img/x.gif" alt="دژکوب"></a><a href="#" class="bbType{o} bbTag{tid8}"><img class="unit u8" src="img/x.gif" alt="منجنیق آتشین"></a><a href="#" class="bbType{o} bbTag{tid9}"><img class="unit u9" src="img/x.gif" alt="سناتور"></a><a href="#" class="bbType{o} bbTag{tid10}"><img class="unit u10" src="img/x.gif" alt="مهاجر"></a><a href="#" class="bbType{o} bbTag{tid11}"><img class="unit u11" src="img/x.gif" alt="گرزدار"></a><a href="#" class="bbType{o} bbTag{tid12}"><img class="unit u12" src="img/x.gif" alt="نیزه دار"></a><a href="#" class="bbType{o} bbTag{tid13}"><img class="unit u13" src="img/x.gif" alt="تبرزن"></a><a href="#" class="bbType{o} bbTag{tid14}"><img class="unit u14" src="img/x.gif" alt="جاسوس"></a><a href="#" class="bbType{o} bbTag{tid15}"><img class="unit u15" src="img/x.gif" alt="دلاور"></a><a href="#" class="bbType{o} bbTag{tid16}"><img class="unit u16" src="img/x.gif" alt="شوالیۀ توتن"></a><a href="#" class="bbType{o} bbTag{tid17}"><img class="unit u17" src="img/x.gif" alt="دژکوب"></a><a href="#" class="bbType{o} bbTag{tid18}"><img class="unit u18" src="img/x.gif" alt="منجنیق"></a><a href="#" class="bbType{o} bbTag{tid19}"><img class="unit u19" src="img/x.gif" alt="رئیس"></a><a href="#" class="bbType{o} bbTag{tid20}"><img class="unit u20" src="img/x.gif" alt="مهاجر"></a><a href="#" class="bbType{o} bbTag{tid21}"><img class="unit u21" src="img/x.gif" alt="سرباز پیاده"></a><a href="#" class="bbType{o} bbTag{tid22}"><img class="unit u22" src="img/x.gif" alt="شمشیرزن"></a><a href="#" class="bbType{o} bbTag{tid23}"><img class="unit u23" src="img/x.gif" alt="رد یاب"></a><a href="#" class="bbType{o} bbTag{tid24}"><img class="unit u24" src="img/x.gif" alt="رعد"></a><a href="#" class="bbType{o} bbTag{tid25}"><img class="unit u25" src="img/x.gif" alt="کاهن سواره"></a><a href="#" class="bbType{o} bbTag{tid26}"><img class="unit u26" src="img/x.gif" alt="شوالیۀ گول"></a><a href="#" class="bbType{o} bbTag{tid27}"><img class="unit u27" src="img/x.gif" alt="دژکوب"></a><a href="#" class="bbType{o} bbTag{tid28}"><img class="unit u28" src="img/x.gif" alt="منجنیق"></a><a href="#" class="bbType{o} bbTag{tid29}"><img class="unit u29" src="img/x.gif" alt="رئیس قبیله"></a><a href="#" class="bbType{o} bbTag{tid30}"><img class="unit u30" src="img/x.gif" alt="مهاجر"></a><a href="#" class="bbType{o} bbTag{tid31}"><img class="unit u31" src="img/x.gif" alt="موش صحرایی"></a><a href="#" class="bbType{o} bbTag{tid32}"><img class="unit u32" src="img/x.gif" alt="عنکبوت"></a><a href="#" class="bbType{o} bbTag{tid33}"><img class="unit u33" src="img/x.gif" alt="مار"></a><a href="#" class="bbType{o} bbTag{tid34}"><img class="unit u34" src="img/x.gif" alt="خفاش"></a><a href="#" class="bbType{o} bbTag{tid35}"><img class="unit u35" src="img/x.gif" alt="گراز"></a><a href="#" class="bbType{o} bbTag{tid36}"><img class="unit u36" src="img/x.gif" alt="گرگ"></a><a href="#" class="bbType{o} bbTag{tid37}"><img class="unit u37" src="img/x.gif" alt="خرس"></a><a href="#" class="bbType{o} bbTag{tid38}"><img class="unit u38" src="img/x.gif" alt="تمساح"></a><a href="#" class="bbType{o} bbTag{tid39}"><img class="unit u39" src="img/x.gif" alt="ببر"></a><a href="#" class="bbType{o} bbTag{tid40}"><img class="unit u40" src="img/x.gif" alt="فیل"></a><a href="#" class="bbType{o} bbTag{tid41}"><img class="unit u41" src="img/x.gif" alt="نیزه دار ناتار"></a><a href="#" class="bbType{o} bbTag{tid42}"><img class="unit u42" src="img/x.gif" alt="تيغ پوش"></a><a href="#" class="bbType{o} bbTag{tid43}"><img class="unit u43" src="img/x.gif" alt="محافظ ناتار"></a><a href="#" class="bbType{o} bbTag{tid44}"><img class="unit u44" src="img/x.gif" alt="پرندگان شکاری"></a><a href="#" class="bbType{o} bbTag{tid45}"><img class="unit u45" src="img/x.gif" alt="تيشه زن"></a><a href="#" class="bbType{o} bbTag{tid46}"><img class="unit u46" src="img/x.gif" alt="شوالیۀ ناتار"></a><a href="#" class="bbType{o} bbTag{tid47}"><img class="unit u47" src="img/x.gif" alt="فيل عظيم الجثۀ جنگی"></a><a href="#" class="bbType{o} bbTag{tid48}"><img class="unit u48" src="img/x.gif" alt="منجنیق عظيم"></a><a href="#" class="bbType{o} bbTag{tid49}"><img class="unit u49" src="img/x.gif" alt="امپراطوری ناتار"></a><a href="#" class="bbType{o} bbTag{tid50}"><img class="unit u50" src="img/x.gif" alt="مهاجر"></a><a href="#" class="bbType{o} bbTag{قهرمان}"><img class="unit uhero" src="img/x.gif" alt="قهرمان"></a></div>
					</div>
				</div>
					</div>
				</div>
				<div class="line bbLine"></div>
                <textarea id="message" name="message" class="messageEditor" tabindex="3" cols="1" rows="1" onkeyup="copyElement('body')"  ><?php if(isset($message->reply['message'])) { echo " \n_________________________
Reply:
\n".$message->reply['message']; } ?></textarea>
				<div id="message_preview" class="messageEditor preview" style="display: none; "></div>
			</div>

			<script type="text/javascript">

				window.addEvent('domready', function()

				{
					new Travian.Game.BBEditor("message");

				});
			</script>
						</div>
                        			<div id="send">
				<button type="submit" value="Elküld" name="s1" id="s1" tabindex="4"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Send</div></div></button>
                <input type="hidden" name="ft" value="m2" />
							</div>

            </div></div>
            
<div class="clear"></div>
<div class="line"></div>
			
				<script>
				var bbEditor = new BBEditor("message");
			</script>
	</form>
<div class="hide" id="adressbook">
    <form method="post" name="abform" action="nachrichten.php" accept-charset="UTF-8">
 <input type="hidden" name="a" value="3e9" />
 <input type="hidden" name="t" value="1" />
 <input type="hidden" name="ft" value="m7" />
 <input type="hidden" name="myid" value="<?php echo $session->uid; ?>" />
 <input type="hidden" id="copy_receiver" name="copy_receiver" value="" />
 <input type="hidden" id="copy_subject" name="copy_subject" value="" />
 <input type="hidden" id="copy_igm" name="copy_igm" value="" />
 <input type="hidden" name="sbmtype" value="default" />
 <input type="hidden" name="sbmvalue" value="" />
	<div class="friendListContainer">
	<table cellpadding="1" cellspacing="1" id="friendlist">
<?php 
$user = $database->getUserArray($session->uid, 1);
for($i=0;$i<20;$i++) {
if($user['friend'.$i] == 0 && $user['friend'.$i.'wait'] == 0){
if(is_int($i/2)){ echo "<tr>"; } ?><td class="end"></td>
  <td class="pla">
    <input class="text" type="text" name="addfriends<?php echo $i; ?>" value="" maxlength="20" />
  </td>
  <td class="on"></td><?php if(!is_int($i/2)){ echo "</tr>"; }else{ echo "<td></td>";}}else if($user['friend'.$i.'wait'] == 0){
if(is_int($i/2)){ echo "<tr>"; } ?><td class="end"><a href="nachrichten.php?delfriend=<?php echo $i; ?>"><img class="del" src="img/x.gif" alt="delete" title="delete"></td>
  <td class="pla">
  <?php echo "<a href=\"nachrichten.php?t=1&id=".$user['friend'.$i]."\">".$database->getUserField($user['friend'.$i],"username",0)."</a>"; ?>
  </td>
		<?php
		$friend = $database->getUserArray($user['friend'.$i], 1);
		if ((time()-600) < $friend['timestamp']){ // 0 Min - 10 Min
            echo "    <td class=on><img class=online1 src=img/x.gif title='Now online' alt='Now online' /></td>";
        }elseif ((time()-86400) < $friend['timestamp'] && (time()-600) > $friend['timestamp']){ // 10 Min - 1 Days
            echo "    <td class=on><img class=online2 src=img/x.gif title='Offline' alt='Offline' /></td>";              
            }elseif ((time()-259200) < $friend['timestamp'] && (time()-86400) > $friend['timestamp']){ // 1-3 Days
            echo "    <td class=on><img class=online3 src=img/x.gif title='Last 3 days' alt='Last 3 days' /></td>";    
        }elseif ((time()-604800) < $friend['timestamp'] && (time()-259200) > $friend['timestamp']){
            echo "    <td class=on><img class=online4 src=img/x.gif title='Last 7 days' alt='Last 7 days' /></td>";    
        }else{
             echo "    <td class=on><img class=online5 src=img/x.gif title=inactive alt=inactive /></td>";   
        }
if(!is_int($i/2)){ echo "</tr>"; }else{ echo "<td></td>";}
  }else{
$friend = $database->getUserArray($user['friend'.$i.'wait'], 1);
$friendwait = 0;
for($j=0;$j<20;$j++) {
if($friend['friend'.$j.'wait'] == $session->uid){
$wait = $friend['friend'.$j];
$friendwait = $friend['id'];
}
}
if($wait == 0){
if(is_int($i/2)){ echo "<tr>"; } ?><td class="end"><a href="nachrichten.php?delfriend=<?php echo $i; ?>"><img class="del" src="img/x.gif" alt="delete" title="delete"></td>
  <td class="pla">
  <?php echo "<img src=\"../../".GP_LOCATE."img/a/clock-inactive.gif\" alt=\"wait for confirm\" title=\"wait for confirm\"><a href=\"nachrichten.php?t=1&id=".$user['friend'.$i]."\"> ".$database->getUserField($user['friend'.$i],"username",0)."</a>"; ?>
  </td>
		<?php
            echo "<td class=on></td>";
if(!is_int($i/2)){ echo "</tr>"; }else{ echo "<td></td>";}
}else{
if(is_int($i/2)){ echo "<tr>"; } ?><td class="end"><a href="nachrichten.php?delfriend=<?php echo $i; ?>"><img class="del" src="img/x.gif" alt="delete" title="delete"></td>
  <td class="pla">
  <?php echo "<a href=\"nachrichten.php?t=1&id=".$friendwait."\">".$database->getUserField($friendwait,"username",0)."</a>"; ?>
  </td>		
            <td class="on"><a href="nachrichten.php?confirm=<?php echo $i; ?>"><img src="../../<?php echo GP_LOCATE; ?>img/a/online6.gif" alt="confirm" title="confirm"></a></td>
<?php
if(!is_int($i/2)){ echo "</tr>"; }else{ echo "<td></td>";}
}
  }} ?>
  </tr></table>
		<div class="clear"></div>
	</div>
</br><center><button type="submit" value="Elküld" name="s1" id="s1" tabindex="4"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">save</div></div></button></center>
</form>
</div></div>
<script type="text/javascript">
	Travian.Translation.add(
	{
		'nachrichten.adressbuch': 'addressbook',
		'allgemein.save': 'save'
	});
</script>
<span style="color: #DD0000"><b>Warning:</b> you can't use the values <b>[message]</b> or <b>[/message]</b> in your message because it can cause problem with bbcode system.</span>
