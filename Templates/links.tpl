<?php 
if($session->plus) {
$links = $database->getLinks($session->uid);
$query = count($links);
if($query>0){
echo '<div id="linkList" class="listing">
	<div class="head">
	<a href="spieler.php?s=2" accesskey="L">Links</a>
</div><div class="list none">';
foreach($links as $link) {
   echo '<ul><li class="entry">'; 
   echo '<a href="'.$link['url'].'" title="'.$link['name'].'">'.$link['name'].'</a></li></ul>';
}
?>
	<div class="pager">
		<a href="#" class="back" style="display: none; "></a>
		<a href="#" class="next" style="display: none; "></a>
	</div>
</div>
<script type="text/javascript">
	new Travian.Game.PageScroller(
	{
		elementPrev: $('linkList').down('a.back'),
		elementNext: $('linkList').down('a.next'),
		elementList: $('linkList').down('div.list'),
		elementBackground: $('linkList').down('div.list')
	});
</script></div><?php } } ?>