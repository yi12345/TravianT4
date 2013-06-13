<?php
////////////// made by TTMTT //////////////

if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>Alliance - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl"); 


?>

<script type="text/javascript">
<?php sajax_show_javascript();?>
function show_data_cb(text) { document.getElementById("masnun").innerHTML = text; }
function start_it() { x_get_data(show_data_cb); setTimeout("start_it()",1000); }
function add_cb() {}
function send_data() {
msg = document.form1.msg.value;
x_add_data(name +"|"+msg,add_cb); }

</script>
<body onLoad="start_it()">
<form name="form1" onSubmit="send_data()">
<div id="TitleName" class="chatHeader"><div style="float:left;"></div><div style="float:right;" id="TitleClose"></div><div style="text-align:middle">Ally-Chat</div></div>
<div id="chatContainer" style="position: relative; top: 0px; left: 0px; height: 260px; overflow-x: hidden; overflow-y: hidden; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(192, 192, 192); border-right-color: rgb(192, 192, 192); border-bottom-color: rgb(192, 192, 192); border-left-color: rgb(192, 192, 192); display: block; ">
<div id="div_chat" style="position: absolute; left: 5px; background-color: rgb(255, 255, 255); top: 260px; "></div>
<div id="scrollbarbackground2" style="position: absolute; top: 0; left: 531px; width: 17px; height: 238px;"></div>
<div id="scrollbarbackground" style="position: absolute; top: 0; left: 539px; width: 1px; height: 238px; border-width: 1px; border-style: solid; border-color: #71D000; background-color: #FFF;"></div>
<div id="scrollbar" style="position: absolute; left: 531px; width: 17px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(113, 208, 0); border-right-color: rgb(113, 208, 0); border-bottom-color: rgb(113, 208, 0); border-left-color: rgb(113, 208, 0); background-color: rgb(240, 255, 240); height: 238px; top: 0px; "></div>
<input id="scrollCheckbox" class="fm" checked="checked" type="checkbox" style="position: absolute; top: 240px; left: 531px;"></div>
<div style="margin-top: 10px; margin-bottom: 10px;">
<table cellpadding="1" cellspacing="1" id="chat_input">
	<tbody><tr>
		<td>
        <input name="s" value="6" type="hidden" />
        <input class="text" type="text" name="msg" id="message" style="display: block; " />
        <input type="button" src="img/x.gif" id="btn_ok" style="border: 0px; float:left; height:0px; width:0px;" alt="ok" onClick="send_data()" /></td>
		
	</tr>
</tbody></table>
<input type="hidden" id="room" name="room" value="429280664">
<input type="hidden" id="joincmd" name="joincmd" value="/ally ir3ODY3-f496c0fbddaecdb9b71a76ca60ed1dd7 ca09844bbe31c1cc1bc570c2de5e82a3"></div>
</form>
<div id="rooms"><span id="room429280664" name="-2" class="roomselectorActive"><span style="float:left;"><a href="javascript:S55365909fd1bd63efb0e61c4878a363a(429280664);"><span id="channelName429280664">Ally-Chat</span></a></span><span id="userCount429280664" style="float:left;"></span></span></div>

