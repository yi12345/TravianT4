<?php
	include "GameEngine/Database.php";
	$sector = 4;
				// (-/-) SW
				if($sector == 1){
					$x_a = (WORLD_MAX - (WORLD_MAX*2));
					$x_b = 0;
					$y_a = (WORLD_MAX - (WORLD_MAX*2));
					$y_b = 0;
					$order = "ORDER BY y DESC,x DESC";
					$mmm = rand(-1, -20);
					$x_y = "AND x < -4 AND y < $mmm";
				}
				// (+/-) SE
				elseif($sector == 2){
					$x_a = (WORLD_MAX - (WORLD_MAX*2));
					$x_b = 0;
					$y_a = 0;
					$y_b = WORLD_MAX;
					$order = "ORDER BY y ASC,x DESC";
					$mmm = rand(1, 20);
					$x_y = "AND x < -4 AND y > $mmm";
				}
				// (+/+) NE
				elseif($sector == 3){
					$x_a = 0;
					$x_b = WORLD_MAX;
					$y_a = 0;
					$y_b = WORLD_MAX;
					$order = "ORDER BY y,x ASC"; 
					$mmm = rand(1, 20);
					$x_y = "AND x > 4 AND y > $mmm";
				}
				// (-/+) NW
				elseif($sector == 4){
					$x_a = 0;
					$x_b = WORLD_MAX;
					$y_a = (WORLD_MAX - (WORLD_MAX*2));
					$y_b = 0;
					$order = "ORDER BY y DESC, x ASC";
					$mmm = rand(-1, -20);
					$x_y = "AND x > 4 AND y < $mmm";
				}
				$q = "SELECT * FROM ".TB_PREFIX."wdata where fieldtype = 3 and occupied = 0 $x_y and (x BETWEEN $x_a AND $x_b) and (y BETWEEN $y_a AND $y_b) $order LIMIT 20";
				$result = mysql_query($q);
				while($row = mysql_fetch_array($result)){
        			echo $row['x']." | ".$row['y']."<br>";
				}
?>