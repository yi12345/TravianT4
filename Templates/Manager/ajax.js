var sload = '<center><img src=../template/admin/rashcms/images/load1.gif></center>';
var ncsload= '<img src=../template/admin/rashcms/images/load1.gif>';
var loadingt = "<center>لطفا صبر کنید...<br><br><img border='0' src='../template/admin/rashcms/images/loading.gif'><center>";
var note='<br><br><p align="center" dir="rtl">مشکلی در بر قراری ارتباط رخ داد. از وجود ارتباط با سرور مطمئن شوید و مجددا تلاش کنید<br><br><img border="0" src="../template/admin/rashcms/images/error.gif"><br>[ <a onclick="showfrm();" href="#reload">بازیابی فرم</a> ]</p>';
var smallnote = 'خطا در ارتباط';
function connect(url,data,id,load,after) {
showid(id);
var xmlhttp=false;
if(!xmlhttp) { 
if (window.XMLHttpRequest)
xmlhttp=new XMLHttpRequest(); 
else if (window.ActiveXObject)
xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
} else if(window.XMLHttpRequest){  
xmlHttp = new XMLHttpRequest(); 
} 
xmlhttp.open('POST', url, true);
xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
 xmlhttp.onreadystatechange = function() {
  if(xmlhttp.readyState==4 && xmlhttp.status == 200) {
document.getElementById(id).innerHTML = xmlhttp.responseText;
dofunc(after);

  }else if (xmlhttp.readyState==0 || xmlhttp.readyState==1 || xmlhttp.readyState==2 || xmlhttp.readyState==3) {
document.getElementById(id).innerHTML = load;
} else {
if(load == sload)
{
document.getElementById(id).innerHTML = smallnote;
}else{
document.getElementById(id).innerHTML = note;
}
}
 } 
xmlhttp.send(data);


}


function gi(id){
if(document.getElementById(id))
return document.getElementById(id);
return false;
}
function gv(id,raj){
if(raj == 'undefined'){
return rajax(document.getElementById(id).value);
}
else{
return document.getElementById(id).value;
}
}


function go(url)
{
document.location = url;
}
function send_to_textarea(id,Which) {
  	if (document.getElementById(id).createTextRange) {
  		document.getElementById(id).focus();
  		document.selection.createRange().duplicate().text = Which;
   	} else {
  		document.getElementById(id).value += Which;
   	}
}

function writeid(id,content){
 if( document.getElementById(id) ){
 document.getElementById(id).innerHTML=content;
 }
}
function waitimg(resultid,hide){
writeid(resultid,'<center><br><br><img src=../template/admin/websun/images/loading.gif\><br><a onclick=stopajax("frame","currentframe","ajaxcontent","result2"); href="#">[لغو عملیات]</a></center>');
hideid(hide);
}


function stopajax(type,lid,show,hide){
if(type == 'frame'){
if (!document.all){
window.frames[lid].stop()}else{
window.frames[lid].document.execCommand('Stop')
}

//alert(lid);
//var reza="top.frames["+lid+"].stop();";
//var reza=  "window.frames["+lid+"].document.execCommand('Stop');"; 
//var reza= "parent."+lid+".stoploading();";
//eval(reza);
showid(show);hideid(hide);
}
}

function rajax(note){
	note= note.replace(/&/g,"**rsh**");
	note= note.replace(/=/g,"**reza**");
	note= note.replace(/\+/g,"**sh**");
	return note;
}
function showid(id){
    if( document.getElementById(id) ){
    document.getElementById(id).style.display ='';
    
	}
}
function hideid(id){
    if( document.getElementById(id) ){
	document.getElementById(id).style.display ='none';
	}
}
function changeclass(id,nclass){
if (document.getElementById(id)){
document.getElementById(id).className=nclass;
}
}
function toggle(id){
if (document.getElementById(id)){
cur = document.getElementById(id).style.display;
if(cur == 'none'){document.getElementById(id).style.display = '';}else{
document.getElementById(id).style.display = 'none';
}
}
}
function writeid(id,inner){
showid(id);
if (document.getElementById(id)){
if(inner = 'undefined'){inner = '';}
document.getElementById(id).innerHTML=inner;
}
}
function owriteid(id,outer){
showid(id);
if (document.getElementById(id)){
if(outer = 'undefined'){outer = '';}
document.getElementById(id).innerHTML=outer;
document.getElementById(id).outerHTML=outer;
}
}
function trim(stringToTrim)
        {
	        return stringToTrim.replace(/^\s+|\s+$/g,"");
        }
        function clickclear(thisfield, defaulttext)
        {
	        if (thisfield.value == defaulttext)
	        {
		        thisfield.value = "";
	        }
        }

  function clickrecall(thisfield, defaulttext)
        {
	        if (trim(thisfield.value) == "")
	        {
		        thisfield.value = defaulttext;
	        }
	        else
	        {
		        thisfield.value = trim(thisfield.value);
	        }
        }
        
function dofunc(type){
switch (type){
case 'delete_link':
connect('pages/listlinks.php',"r",'ajax_tabs_1_content',loadingt,'');
break;
case 'edit_link':
connect('pages/listlinks.php',"r",'ajax_tabs_1_content',loadingt,'');
break;
case 'edit_class':
connect('pages/listads.php',"task=get_list&type=quickclass",'ajax_tabs_2_content',loadingt,'');
break;
case 'edit_ads':
connect('pages/listads.php',"task=get_list&type=quickads",'ajax_tabs_3_content',loadingt,'');
break;
case 'edit_block':
connect('pages/listblock.php',"task=listing",'ajax_tabs_1_content',loadingt,'');
break;
case 'edit_page':
connect('pages/listpage.php',"task=listing",'ajax_tabs_1_content',loadingt,'');
break;
case 'edit_poll':
connect('pages/listpoll.php',"task=listing",'ajax_tabs_1_content',loadingt,'');
break;
case 'edit_ups':
connect('pages/listups.php',"r",'ajax_tabs_2_content',loadingt,'');
break;
case 'edit_pm_in':
connect('pages/listpms.php',"task=inbox&page=0",'ajax_tabs_1_content',loadingt,'');
break;
case 'edit_pm_out':
connect('pages/listpms.php',"task=outbox&page=0",'ajax_tabs_2_content',loadingt,'');
break;
case 'delete_ip':
connect('pages/listips.php',"r",'ajax_tabs_1_content',loadingt,'');
break;
case 'delete_back':
connect('pages/listbacks.php',"r",'ajax_tabs_1_content',loadingt,'');
break;

case 'edit_cat':
hideid('editing_area');
connect('pages/listcats.php',"r",'ajax_tabs_2_content',loadingt,'');
connect('pages/cat.php',"task=listing&type=2",'main_2_ajax',loadingt,'');
break;
case 'rk':
hideid('keysid');
reza = document.getElementById("keysid").innerHTML;
document.getElementById("keys").value = reza;
break;

}
}