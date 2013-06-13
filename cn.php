<?php

/** --------------------------------------------------- **\
| ********* DO NOT REMOVE THIS COPYRIGHT NOTICE ********* |
+---------------------------------------------------------+
| Credits:     All the developers including the leaders:  |
|              Advocaite & Dzoki & Donnchadh              |
|                                                         |
| Copyright:   TravianX Project All rights reserved       |
\** --------------------------------------------------- **/
 
        include_once ("GameEngine/Session.php");
        include_once ("GameEngine/config.php");

        mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
        mysql_select_db(SQL_DB);

/**
 * If user is not administrator, access is denied!
 */
        if($session->access < ADMIN)
        	die("Access Denied: You are not Admin!");

/**
 * SMALL ARTEFACTS
 */
        function Artefact($uid, $type, $size, $art_name, $village_name, $desc, $effect, $img) {
        	global $database;
        	$kid = rand(1, 4);
        	$wid = $database->generateBase($kid);
        	$database->addArtefact($wid, $uid, $type, $size, $art_name, $desc, $effect, $img);
        	$database->setFieldTaken($wid);
        	$database->addVillage($wid, $uid, $village_name, '0');
        	$database->addResourceFields($wid, $database->getVillageType($wid));
        	$database->addUnits($wid);
        	$database->addTech($wid);
        	$database->addABTech($wid);
        	mysql_query("UPDATE " . TB_PREFIX . "vdata SET pop = " . rand(10, 200) . " WHERE wref = $wid");
        	mysql_query("UPDATE " . TB_PREFIX . "vdata SET name = '$village_name' WHERE wref = $wid");
        	if(SPEED > 3) {
        		$speed = 5;
        	} else {
        		$speed = SPEED;
        	}
        	if($size == 1) {
        		mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (rand(1000, 2000) * $speed) . ", u42 = " . (rand(1500, 2000) * $speed) . ", u43 = " . (rand(2300, 2800) * $speed) . ", u44 = " . (rand(25, 75) * $speed) . ", u45 = " . (rand(1200, 1900) * $speed) . ", u46 = " . (rand(1500, 2000) * $speed) . ", u47 = " . (rand(500, 900) * $speed) . ", u48 = " . (rand(100, 300) * $speed) . " , u49 = " . (rand(1, 5) * $speed) . ", u50 = " . (rand(1, 5) * $speed) . " WHERE vref = " . $wid . "");
        		mysql_query("UPDATE " . TB_PREFIX . "fdata SET f22t = 27, f22 = 10, f28t = 25, f28 = 10, f19t = 23, f19 = 10, f32t = 23, f32 = 10 WHERE vref = $wid");
        	} elseif($size == 2) {
        		mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (rand(2000, 4000) * $speed) . ", u42 = " . (rand(3000, 4000) * $speed) . ", u43 = " . (rand(4600, 5600) * $speed) . ", u44 = " . (rand(50, 150) * $speed) . ", u45 = " . (rand(2400, 3800) * $speed) . ", u46 = " . (rand(3000, 4000) * $speed) . ", u47 = " . (rand(1000, 1800) * $speed) . ", u48 = " . (rand(200, 600) * $speed) . " , u49 = " . (rand(2, 10) * $speed) . ", u50 = " . (rand(2, 10) * $speed) . " WHERE vref = " . $wid . "");
        		mysql_query("UPDATE " . TB_PREFIX . "fdata SET f22t = 27, f22 = 10, f28t = 25, f28 = 20, f19t = 23, f19 = 10, f32t = 23, f32 = 10 WHERE vref = $wid");
        	} elseif($size == 3) {
        		mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (rand(4000, 8000) * $speed) . ", u42 = " . (rand(6000, 8000) * $speed) . ", u43 = " . (rand(9200, 11200) * $speed) . ", u44 = " . (rand(100, 300) * $speed) . ", u45 = " . (rand(4800, 7600) * $speed) . ", u46 = " . (rand(6000, 8000) * $speed) . ", u47 = " . (rand(2000, 3600) * $speed) . ", u48 = " . (rand(400, 1200) * $speed) . " , u49 = " . (rand(4, 20) * $speed) . ", u50 = " . (rand(4, 20) * $speed) . " WHERE vref = " . $wid . "");
        		mysql_query("UPDATE " . TB_PREFIX . "fdata SET f22t = 27, f22 = 10, f28t = 25, f28 = 20, f19t = 23, f19 = 10, f32t = 23, f32 = 10 WHERE vref = $wid");
        	}
        }

/**
 * THE ARCHITECTS
 */

        $desc = 'نقشه ساخت به شما آموزش مي دهد كه چگونه در يك دهكده ناتار شگفتي جهان ايجاد كنيد . براي ارتقا تا سطح 50 يك نقشه كافي مي باشد . براي ارتقا از سطح 50 به بعد داشتن نقشه اضافه در اتحاد شما ضروري مي باشد .';
        
        
        $vname = 'WW BuildingPlan';
        $effect = '';
        for($i > 1; $i < 10; $i++) {
        	Artefact($uid, 1, 1, 'نقشه ساخت ساختمان شگفتی های جهان', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type1.gif');
        }


/**
 * MILITARY HASTE
 */
		
        $desc = "اين كتيبه دهكده شما را در برابر منجنيق و دژكوب مقاومتر مي سازد .";

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه راز هاي معماري';
        $effect = '4x';
        for($i > 1; $i < 6; $i++) {
        	Artefact($uid, 2, 1, 'راز هاي معماري كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه راز هاي معماري';
        $effect = '3x';
        for($i > 1; $i < 4; $i++) {
        	Artefact($uid, 2, 2, 'راز هاي معماري بزرگ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه راز هاي معماري';
        $effect = '5x';
        for($i > 1; $i < 1; $i++) {
        	Artefact($uid, 2, 3, 'راز هاي معماري منحصر به فرد', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
        }


/**
 * THE DIET
 */


        $desc = "اين كتيبه سرعت حركت سرباز هاي شما را سريعتر مي سازد .";

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه چکمه خدايان';
        $effect = '2x';
        for($i > 1; $i < 6; $i++) {
        	Artefact($uid, 4, 1, 'چكمه خدايان كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه چکمه خدايان';
        $effect = '1.5x';
        for($i > 1; $i < 4; $i++) {
        	Artefact($uid, 4, 2, 'چكمه خدايان بزرگ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه چکمه خدايان';
        $effect = '3x';
        for($i > 1; $i < 1; $i++) {
        	Artefact($uid, 4, 3, 'چكمه خدايان منحصر به فرد', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
        }


/**
 * ACADEMIC ADVANCEMENT
 */


        $desc = "اين كتيبه جاسوس هاي شما را قوي تر مي سازد . همچنين جاسوس هاي مستقر در دهكده نيز قوي تر از قبل عمل مي كنند . به علاوه اينكه شما ميتوانيد نوع سرباز هايي كه در حال حمله به شما هستند را در اردوگاه تشخيص دهيد ولي قادر به تشخيص تعداد آن ها نمي باشيد .";

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه چشمان عقاب';
        $effect = '5x';
        for($i > 1; $i < 5; $i++) {
        	Artefact($uid, 5, 1, 'چشمان عقاب كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه چشمان عقاب';
        $effect = '3x';
        for($i > 1; $i < 4; $i++) {
        	Artefact($uid, 5, 2, 'چشمان عقاب بزرگ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه چشمان عقاب';
        $effect = '10x';
        for($i > 1; $i < 1; $i++) {
        	Artefact($uid, 5, 3, 'چشمان عقاب منحصر به فرد', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
        }


/**
 * STORAGE MASTER PLAN
 */


        $desc = "اين كتيبه مصرف گندم سرباز هاي اين دهكده و همچنين سرباز هاي كمكي مستقر در اين دهكده را كاهش مي دهد .";

        unset($i);
        unset($vname);
        unset($effect);;
        $vname = 'كتيبه مرتاض ها';
        $effect = '1/2';
        for($i > 1; $i < 6; $i++) {
        	Artefact($uid, 6, 1, 'كتيبه مرتاض هاي كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type6.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'كتيبه مرتاض ها';
        $effect = '3/4';
        for($i > 1; $i < 4; $i++) {
        	Artefact($uid, 6, 2, 'كتيبه مرتاض هاي بزرگ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type6.gif');
        }


/**
 * ARTEFACT OF THE FOOL
 */


        $desc = 'اين كتيبه سرعت ساخت لشكريان شما را در پادگان ، اصطبل ، كارگاه افزايش مي دهد . 
همچنين سرعت ساخت سرباز در پادگان بزرگ و اصطبل بزرگ نيز تحت تاثير قرار خواهد گرفت .';

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه جنگ آموز';
		$effect = '1/2';
        for($i > 1; $i < 6; $i++) {
        	Artefact($uid, 8, 1, 'جنگ آموز كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه جنگ آموز';
		$effect = '3/4';
        for($i > 1; $i < 4; $i++) {
        	Artefact($uid, 8, 2, 'جنگ آموز بزرگ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه جنگ آموز';
		$effect = '1/2';
        for($i > 1; $i < 1; $i++) {
        	Artefact($uid, 8, 3, 'جنگ آموز منحصر به فرد', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
        }


/**
 * RIVAL'S CONFUSION
 */


        $desc = 'اين كتيبه ظرفيت مخفيگاه شما را افزايش مي دهد . 

صاحبان اين كتيبه تنها مورد هدف گيري اتفاقي منجنيق قرار خواهند گرفت ، 

البته خزانه و شگفتي جهان مورد هدفگيري انتخابي قرار خواهند گرفت و در صورتي كه كتيبه از نوع منحصر به فرد باشد هدف گيري انتخابي خزانه نيز امكان پذير نمي باشد .';

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه گيج كننده';
        $effect = '200x';
        for($i > 1; $i < 6; $i++) {
        	Artefact($uid, 7, 1, 'گيج كننده كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه گيج كننده';
        $effect = '100x';
        for($i > 1; $i < 4; $i++) {
        	Artefact($uid, 7, 2, 'گيح كننده بزرگ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه گيج كننده';
        $effect = '500x';
        for($i > 1; $i < 1; $i++) {
        	Artefact($uid, 7, 3, 'گيج كننده منحصر به فرد', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
        }


/**
 * WAREHOUSE CONFUSION
 */


        $desc = 'اين نقشه به شما ساخت انبار بزرگ و انبار غذاي بزرگ را آموزش مي دهد . 
شما همچنين براي ارتقا ساختمان هاي مذكور به اين نقشه نياز خواهيد داشت .';

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه انبار برتر';
        $effect = '';
        for($i > 1; $i < 6; $i++) {
        	Artefact($uid, 9, 1, 'انبار برتر كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type9.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه انبار برتر';
        $effect = '';
        for($i > 1; $i < 4; $i++) {
        	Artefact($uid, 9, 2, 'انبار برتر بزرگ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type9.gif');
        }


/**
 * HAWK'S EYESIGHT
 */


        $desc = "اين كتيبه تاثير دفاعي ديوار هاي دهكده را برابر كاهش مي دهد .";

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه دهكده احمق ها';
        $effect = '2x';
        for($i > 1; $i < 6; $i++) {
        	Artefact($uid, 3, 1, 'دهكده احمق ها كوچك', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
        }

        unset($i);
        unset($vname);
        unset($effect);
        $vname = 'کتیبه دهكده احمق ها';
        $effect = '5x';
        for($i > 1; $i < 1; $i++) {
        	Artefact($uid, 3, 3, 'دهكده احمق ها منحصر به فرد', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
        }
header("Location: dorf1.php");