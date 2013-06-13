<?php
	if(isset($_GET['s'])) {
	switch($_GET['s']) {
		case 1:
		echo "<li class=\"c2 f9\"><a href=\"#\">Start</a></li><li class=\"active\"><a href=\"#\">Configuration</a></li><li class=\"c1 f9\"><a href=\"#\">Database</a></li><li class= \"c1 f9\"><a href=\"#\">Field</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">End</a></li>";

		break;
		case 2:
		echo "<li class=\"c2 f9\"><a href=\"#\">Start</a></li><li class=\"c1 f9\"><a href=\"#\">Configuration</a></li><li class=\"active\"><a href=\"#\">Database</a></li><li class= \"c1 f9\"><a href=\"#\">Field</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">End</a></li>";
		break;
		case 3:
		echo "<li class=\"c2 f9\"><a href=\"#\">Start</a></li><li class=\"c1 f9\"><a href=\"#\">Configuration</a></li><li class=\"c1 f9\"><a href=\"#\">Database</a></li><li class= \"active\"><a href=\"#\">Field</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">End</a></li>";
		break;
		case 4:
		echo "<li class=\"c2 f9\"><a href=\"#\">Start</a></li><li class=\"c1 f9\"><a href=\"#\">Configuration</a></li><li class=\"c1 f9\"><a href=\"#\">Database</a></li><li class= \"c1 f9\"><a href=\"#\">Field</a></li><li class=\"active\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">End</a></li>";
		break;
        case 5:
		echo "<li class=\"c2 f9\"><a href=\"#\">Start</a></li><li class=\"c1 f9\"><a href=\"#\">Configuration</a></li><li class=\"c1 f9\"><a href=\"#\">Database</a></li><li class= \"c1 f9\"><a href=\"#\">Field</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"active\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">End</a></li>";
		break;
        case 6:
        echo "<li class=\"c2 f9\"><a href=\"#\">Start</a></li><li class=\"c1 f9\"><a href=\"#\">Configuration</a></li><li class=\"c1 f9\"><a href=\"#\">Database</a></li><li class= \"c1 f9\"><a href=\"#\">Field</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"active\"><a href=\"#\">End</a></li>";
        break;
	}
    
}
else {
	echo "<li class=\"active\"><a href=\"#\">Start</a></li><li class=\"c1 f9\"><a href=\"#\">Configuration</a></li><li class=\"c1 f9\"><a href=\"#\">Database</a></li><li class= \"c1 f9\"><a href=\"#\">Field</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">End</a></li>";
}
?>