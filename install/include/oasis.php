<?php
        include ("../../GameEngine/Database/connection.php");
        include ("../../GameEngine/Database.php");
        include ("../../GameEngine/Admin/database.php");
        include ("../../GameEngine/config.php");

        mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
        mysql_select_db(SQL_DB);

        $database->poulateOasisdata();  
        $database->populateOasis();
		$database->populateOasisUnitsLow();

header("Location: ../index.php?s=6");
?>