<?php
	if($btype==1){
    
    	if($type==1){
        	$name = "Helmet of Awareness";
        	$title = "+15% more experience.";
            $item = "1";
            $effect = "15";
		}elseif($type==2){
        	$name = "Helmet of Enlightenment";
        	$title = "+20 more experience.";
            $item = "2";
            $effect = "20";
		}elseif($type==3){
        	$name = "Helmet of Wisdom";
        	$title = "+25% more experience.";
            $item = "3";
            $effect = "25";
		}
        if($type==4){
        	$name = "Helmet of Regeneration";
        	$title = "+10 health points/day";
            $item = "4";
            $effect = "10";
        }elseif($type==5){
        	$name = "Helmet of Healthiness";
        	$title = "+15 health points/day";
            $item = "5";
            $effect = "15";
        }elseif($type==6){
        	$name = "Helmet of Healing";
        	$title = "+20 health points/day";
            $item = "6";
            $effect = "20";
        }
        if($type==7){
        	$name = "Helmet of the Gladiator";
			$title = "+100 Culture Points/day";
            $item = "7";
            $effect = "100";
		}elseif($type==8){
        	$name = "Helmet of the Tribune";
			$title = "+400 Culture Points/day";
            $item = "8";
            $effect = "400";
		}elseif($type==9){
        	$name = "Helmet of the Consul";
			$title = "+800 Culture Points/day";
            $item = "9";
            $effect = "800";
		}
        if($type==10){
        	$name = "Helmet of the Horseman";
			$title = "Training time in stable reduced by 10%";
            $item = "10";
            $effect = "10";
		}elseif($type==11){
        	$name = "Helmet of the Cavalry";
			$title = "Training time in stable reduced by 15%";
            $item = "11";
            $effect = "15";
		}elseif($type==12){
        	$name = "Helmet of the Heavy Cavalry";
			$title = "Training time in stable reduced by 20%";
            $item = "12";
            $effect = "20";
		}
        if($type==13){
        	$name = "Helmet of the Mercenary";
			$title = "Training time in barracks reduced by 10%";
            $item = "13";
            $effect = "10";
		}elseif($type==14){
        	$name = "Helmet of the Warrior";
			$title = "Training time in barracks reduced by 15%n";
            $item = "14";
            $effect = "15";
		}elseif($type==15){
        	$name = "Helmet of the Archon";
			$title = "Training time in barracks reduced by 20%";
            $item = "15";
            $effect = "20";
		}
        
	}elseif($btype==2){
    
		if($type==82){
        	$name = "A Regeneráció könnyű vértje";
        	$title = "20+ egészség pont naponta";
            $item = "82";
            $effect = "20";
		}elseif($type==83){
        	$name = "A Regeneráció vértje";
        	$title = "30+ egészség pont naponta";
            $item = "83";
            $effect = "30";
		}elseif($type==84){
        	$name = "A Regeneráció nehéz páncélja";
        	$title = "40+ egészség pont naponta";
            $item = "84";
            $effect = "40";
		}
        if($type==85){
        	$name = "Könnyű pikkelypáncél ";
        	$title = "Az életerő veszteség 4 ponttal csökken +10 egészségpont naponta";
            $item = "85";
            $effect = "10";
        }elseif($type==86){
        	$name = "Pikkelypáncél";
        	$title = "Az életerő veszteség 6 ponttal csökken +15 egészségpont naponta";
            $item = "86";
            $effect = "15";
        }elseif($type==87){
        	$name = "Nehéz pikkelypáncél";
        	$title = "Az életerő veszteség 8 ponttal csökken +20 egészségpont naponta";
            $item = "87";
            $effect = "20";
        }
        if($type==88){
        	$name = "Könnyű mellvért";
			$title = "+500 harci erő a hősnek";
            $item = "88";
            $effect = "500";
		}elseif($type==89){
        	$name = "Mellvért";
			$title = "+1000 harci erő a hősnek";
            $item = "89";
            $effect = "1000";
		}elseif($type==90){
        	$name = "Nehéz mellvért";
			$title = "+1500 harci erő a hősnek";
            $item = "90";
            $effect = "1500";
		}
        if($type==91){
        	$name = "Könnyű tagolt páncél";
			$title = "Az életerő veszteség 3 ponttal csökken +250 harci erő a hősnek";
            $item = "91";
            $effect = "3";
		}elseif($type==92){
        	$name = "Tagolt páncél";
			$title = "Az életerő veszteség 4 ponttal csökken +500 harci erő a hősnek";
            $item = "92";
            $effect = "4";
		}elseif($type==93){
        	$name = "Nehéz tagolt páncél";
			$title = "Az életerő veszteség 5 ponttal csökken +750 harci erő a hősnek";
            $item = "93";
            $effect = "5";
		}
        
	}elseif($btype==3){
    
		if($type==61){
        	$name = "Small Map";
        	$title = "30% faster return";
            $item = "61";
            $effect = "30";
		}elseif($type==62){
        	$name = "Map";
        	$title = "40% faster return";
            $item = "62";
            $effect = "40";
		}elseif($type==63){
        	$name = "Large Map";
        	$title = "50% faster return";
            $item = "63";
            $effect = "50";
		}
        if($type==64){
        	$name = "Small Pennant";
        	$title = "30% faster troops between own villages";
            $item = "64";
            $effect = "30";
		}elseif($type==65){
        	$name = "Pennant";
        	$title = "40% faster troops between own villages";
            $item = "65";
            $effect = "40";
		}elseif($type==66){
        	$name = "Great Pennant";
        	$title = "50% faster troops between own villages";
            $item = "66";
            $effect = "50";
		}
        if($type==67){
        	$name = "Small Standard";
			$title = "15% faster troops between alliance members";
            $item = "67";
            $effect = "15";
		}elseif($type==68){
        	$name = "Standard";
			$title = "20% faster troops between alliance members";
            $item = "68";
            $effect = "20";
		}elseif($type==69){
        	$name = "Great Standard";
			$title = "25% faster troops between alliance members";
            $item = "69";
            $effect = "25";
		}
        if($type==73){
        	$name = "Pouch of the thief";
			$title = "+10% plunder bonus";
            $item = "73";
            $effect = "10";
		}elseif($type==74){
        	$name = "Bag of the thief";
			$title = "+15% plunder bonus";
            $item = "74";
            $effect = "15";
		}elseif($type==75){
        	$name = "Sack of the thief";
			$title = "+20% plunder bonus";
            $item = "75";
            $effect = "20";
		}
        if($type==76){
        	$name = "Small shield";
        	$title = "+500 hero strength";
            $item = "76";
            $effect = "500";
        }elseif($type==77){
        	$name = "Shield";
        	$title = "+1000 hero strength";
            $item = "77";
            $effect = "1000";
        }elseif($type==78){
        	$name = "Large shield";
        	$title = "+1500 hero strength";
            $item = "78";
            $effect = "1500";
        }
        if($type==79){
        	$name = "Small horn of the Natarian";
			$title = "+20% fighting strength against Natars";
            $item = "79";
            $effect = "20";
		}elseif($type==80){
        	$name = "Horn of the Natarian";
			$title = "+25% fighting strength against Natars";
            $item = "80";
            $effect = "25";
		}elseif($type==81){
        	$name = "Large horn of the Natarian";
			$title = "+30% fighting strength against Natars";
            $item = "81";
            $effect = "30";
		}
        
	}elseif($btype==4){
    
		if($type==16){
        	$name = "Short sword of the Legionnaire";
        	$title = "+500 to hero strength&lt;br /&gt;For every Legionnaire: +3 attack and +3 defence";
            $item = "16";
            $effect = "500";
		}elseif($type==17){
        	$name = "Sword of the Legionnaire";
        	$title = "+1000 to hero strength&lt;br /&gt;For every Legionnaire: +4 attack and +4 defence";
            $item = "17";
            $effect = "1000";
		}elseif($type==18){
        	$name = "Long sword of the Legionnaire";
        	$title = "+1500 to hero strength&lt;br /&gt;For every Legionnaire: +5 attack and +5 defence";
            $item = "18";
            $effect = "1500";
		}
        if($type==19){
        	$name = "Short sword of the Praetorian";
        	$title = "+500 to hero strength;br /&gt;For every Praetorian: +3 attack and +3 defence";
            $item = "19";
            $effect = "500";
        }elseif($type==20){
        	$name = "Sword of the Praetorian";
        	$title = "+1000 to hero strength&lt;br /&gt;For every Praetorian: +4 attack and +4 defence";
            $item = "20";
            $effect = "1000";
        }elseif($type==21){
        	$name = "Long sword of the Praetorian";
        	$title = "+1500 to hero strength&lt;br /&gt;For every Praetorian: +5 attack and +5 defence";
            $item = "21";
            $effect = "1500";
        }
        if($type==22){
        	$name = "Short sword of the Imperian";
			$title = "+500 to hero strength&lt;br /&gt;For every Imperian: +3 attack and +3 defence";
            $item = "22";
            $effect = "500";
		}elseif($type==23){
        	$name = "Sword of the Imperian";
			$title = "+1000 to hero strength&lt;br /&gt;For every Imperian: +4 attack and +4 defence";
            $item = "23";
            $effect = "1000";
		}elseif($type==24){
        	$name = "Long sword of the Imperian";
			$title = "+1500 to hero strength&lt;br /&gt;For every Imperian: +5 attack and +5 defence";
            $item = "24";
            $effect = "1500";
		}
        if($type==25){
        	$name = "Short sword of the Imperatoris";
			$title = "+500 to hero strength&lt;br /&gt;For every Equites Imperatoris: +9 attack and +9 defence";
            $item = "25";
            $effect = "500";
		}elseif($type==26){
        	$name = "Sword of the Imperatoris";
			$title = "+1000 to hero strength&lt;br /&gt;For every Equites Imperatoris: +12 attack and +12 defence";
            $item = "26";
            $effect = "1000";
		}elseif($type==27){
        	$name = "Long sword of the Imperatoris";
			$title = "+1500 to hero strength&lt;br /&gt;For every Equites Imperatoris: +15 attack and +15 defence";
            $item = "27";
            $effect = "1500";
		}
        if($type==28){
        	$name = "Light lance of the Caesaris";
        	$title = "+500 to hero strength&lt;br /&gt;For every Equites Caesaris: +12 attack and +12 defence";
            $item = "28";
            $effect = "500";
        }elseif($type==29){
        	$name = "Lance of the Caesaris";
        	$title = "+1000 to hero strength&lt;br /&gt;For every Equites Caesaris: +16 attack and +16 defence";
            $item = "29";
            $effect = "1000";
        }elseif($type==30){
        	$name = "Heavy lance of the Caesaris";
        	$title = "+1500 to hero strength&lt;br /&gt;For every Equites Caesaris: +20 attack and +20 defence";
            $item = "30";
            $effect = "1500";
        }
        if($type==31){
        	$name = "Spear of the Phalanx";
			$title = "+500 to hero strength&lt;br /&gt;For every Phalanx: +3 attack and +3 defence";
            $item = "31";
            $effect = "500";
		}elseif($type==32){
        	$name = "Pike of the Phalanx";
			$title = "+1000 to hero strength&lt;br /&gt;For every Phalanx: +4 attack and +4 defence";
            $item = "32";
            $effect = "1000";
		}elseif($type==33){
        	$name = "Lance of the Phalanx";
			$title = "+1500 to hero strength&lt;br /&gt;For every Phalanx: +5 attack and +5 defence";
            $item = "33";
            $effect = "1500";
		}
        if($type==34){
        	$name = "Short sword of the Swordsman";
        	$title = "+500 to hero strength&lt;br /&gt;For every Swordsman: +3 attack and +3 defence";
            $item = "34";
            $effect = "500";
        }elseif($type==35){
        	$name = "Sword of the Swordsman";
        	$title = "+1000 to hero strength&lt;br /&gt;For every Swordsman: +4 attack and +4 defence";
            $item = "35";
            $effect = "1000";
        }elseif($type==36){
        	$name = "Long sword of the Swordsman";
        	$title = "+1500 to hero strength&lt;br /&gt;For every Swordsman: +5 attack and +5 defence";
            $item = "36";
            $effect = "1500";
        }
        if($type==37){
        	$name = "Short-bow of the Theutates";
			$title = "+500 to hero strength&lt;br /&gt;For every Theutates Thunder: +6 attack and +6 defence";
            $item = "37";
            $effect = "500";
		}elseif($type==38){
        	$name = "Bow of the Theutates";
			$title = "+1000 to hero strength&lt;br /&gt;For every Theutates Thunder: +8 attack and +8 defence";
            $item = "38";
            $effect = "1000";
		}elseif($type==39){
        	$name = "Long-bow of the Theutates";
			$title = "+1500 to hero strength&lt;br /&gt;For every Theutates Thunder: +10 attack and +10 defence";
            $item = "39";
            $effect = "1500";
		}
        if($type==40){
        	$name = "Staff of the Druidrider";
			$title = "+500 to hero strength&lt;br /&gt;For every Druidrider: +6 attack and +6 defence";
            $item = "40";
            $effect = "500";
		}elseif($type==41){
        	$name = "Great staff of the Druidrider";
			$title = "+1000 to hero strength&lt;br /&gt;For every Druidrider: +8 attack and +8 defence";
            $item = "41";
            $effect = "1000";
		}elseif($type==42){
        	$name = "Fighting-staff of the Druidrider";
			$title = "+1500 to hero strength&lt;br /&gt;For every Druidrider: +10 attack and +10 defence";
            $item = "42";
            $effect = "1500";
		}
        if($type==43){
        	$name = "Light lance of the Haeduan";
        	$title = "+500 to hero strength&lt;br /&gt;For every Haeduan: +9 attack and +9 defence";
            $item = "43";
            $effect = "500";
        }elseif($type==44){
        	$name = "Lance of the Haeduan";
        	$title = "+1000 to hero strength&lt;br /&gt;For every Haeduan: +12 attack and +12 defence";
            $item = "44";
            $effect = "1000";
        }elseif($type==45){
        	$name = "Heavy lance of the Haeduan";
        	$title = "+1500 to hero strength&lt;br /&gt;For every Haeduan: +15 attack and +15 defence";
            $item = "45";
            $effect = "1500";
        }
        if($type==46){
        	$name = "Club of the Clubswinger";
			$title = "+500 to hero strength&lt;br /&gt;For every Maceman: +3 attack and +3 defence";
            $item = "46";
            $effect = "500";
		}elseif($type==47){
        	$name = "Mace of the Clubswinger";
			$title = "+1000 to hero strength&lt;br /&gt;For every Maceman: +4 attack and +4 defence";
            $item = "47";
            $effect = "1000";
		}elseif($type==48){
        	$name = "Morning star of the Clubswinger";
			$title = "+1500 to hero strength&lt;br /&gt;For every Maceman: +5 attack and +5 defence";
            $item = "48";
            $effect = "1500";
		}
        if($type==49){
        	$name = "Spear of the Spearman";
        	$title = "+500 to hero strength&lt;br /&gt;For every Spearman: +3 attack and +3 defence";
            $item = "49";
            $effect = "500";
        }elseif($type==50){
        	$name = "Spike of the Spearman";
        	$title = "+1000 to hero strength&lt;br /&gt;For every Spearman: +4 attack and +4 defence";
            $item = "50";
            $effect = "1000";
        }elseif($type==51){
        	$name = "Lance of the Spearman";
        	$title = "+1500 to hero strength&lt;br /&gt;For every Spearman: +5 attack and +5 defence";
            $item = "51";
            $effect = "1500";
        }
        if($type==52){
        	$name = "Hatchet of the Axeman";
			$title = "+500 to hero strength&lt;br /&gt;For every Axeman: +3 attack and +3 defence";
            $item = "52";
            $effect = "500";
		}elseif($type==53){
        	$name = "Axe of the Axeman";
			$title = "+1000 to hero strength&lt;br /&gt;For every Axeman: +4 attack and +4 defence";
            $item = "53";
            $effect = "1000";
		}elseif($type==54){
        	$name = "Battle axe of the Axeman";
			$title = "+1500 to hero strength&lt;br /&gt;For every Axeman: +5 attack and +5 defence";
            $item = "54";
            $effect = "1500";
		}
        if($type==55){
        	$name = "Light hammer of the Paladin";
			$title = "+500 to hero strength&lt;br /&gt;For every Paladin: +6 attack and +6 defence";
            $item = "55";
		}elseif($type==56){
        	$name = "Hammer of the Paladin";
			$title = "+1000 to hero strength&lt;br /&gt;For every Paladin: +8 attack and +8 defence";
            $item = "56";
		}elseif($type==57){
        	$name = "Heavy hammer of the Paladin";
			$title = "+1500 to hero strength&lt;br /&gt;For every Paladin: +10 attack and +10 defence";
            $item = "57";
		}
        if($type==58){
        	$name = "Short sword of the Teutonic Knight";
        	$title = "+500 to hero strength&lt;br /&gt;For every Teutonic Knight: +9 attack and +9 defence";
            $item = "58";
            $effect = "500";
        }elseif($type==59){
        	$name = "Sword of the Teutonic Knight";
        	$title = "+1000 to hero strength&lt;br /&gt;For every Teutonic Knight: +12 attack and +12 defence";
            $item = "59";
            $effect = "1000";
        }elseif($type==60){
        	$name = "Long sword of the Teutonic Knight";
        	$title = "+1500 to hero strength&lt;br /&gt;For every Teutonic Knight: +15 attack and +15 defence";
            $item = "60";
            $effect = "1500";
        }
        
	}elseif($btype==5){
    
		if($type==94){
        	$name = "Boots of Regeneration";
        	$title = "+10 health points/day";
            $item = "94";
            $effect = "10";
		}elseif($type==95){
        	$name = "Boots of Healthiness";
        	$title = "+15 health points/day";
            $item = "95";
            $effect = "15";
		}elseif($type==96){
        	$name = "Boots of Healing";
        	$title = "+20 health points/day";
            $item = "96";
            $effect = "20";
		}
        if($type==97){
        	$name = "Boots of the Mercenary";
        	$title = "+25% army's speed for distances > 20 fields";
            $item = "97";
            $effect = "25";
        }elseif($type==98){
        	$name = "Boots of the Warrior";
        	$title = "+50% army's speed for distances > 20 fields";
            $item = "98";
            $effect = "30";
        }elseif($type==99){
        	$name = "Boots of the Archon";
        	$title = "+75% army's speed for distances > 20 fields";
            $item = "99";
            $effect = "35";
        }
        if($type==100){
        	$name = "Small spurs";
			$title = "hero speed +3";
            $item = "100";
            $effect = "3";
		}elseif($type==101){
        	$name = "Spurs";
			$title = "hero speed +4";
            $item = "101";
            $effect = "4";
		}elseif($type==102){
        	$name = "Nasty spurs";
			$title = "hero speed +5";
            $item = "102";
            $effect = "5";
		}
        
	}elseif($btype==6){
    	if($type==103){
        	$name = "Gelding";
			$title = "Hero speed is 14";
            $item = "103";
            $effect = "14";
		}elseif($type==104){
        	$name = "Thoroughbred";
			$title = "Hero speed is 17";
            $item = "104";
            $effect = "17";
		}elseif($type==105){
        	$name = "Warhorse";
			$title = "Hero speed is 20";
            $item = "105";
            $effect = "20";
		}
        
	}elseif($btype==7){
    	$name = " Small bandage";
		$title = "Heals 1 troop each, max 25% &lt;br /&gt;Stackable";
		$item = "112";
	}elseif($btype==8){
    	$name = "Bandage";
		$title = "Heals 1 troop each, max 33%&lt;br /&gt;Stackable";
		$item = "113";
	}elseif($btype==9){
    	$name = "Cage";
		$title = "1 animal can be caught in oasis&lt;br /&gt;Stackable";
		$item = "114";
	}elseif($btype==10){
    	$name = "Scroll";
		$title = "Gives hero 10 experience&lt;br /&gt;Stackable";
		$item = "107";
	}elseif($btype==11){
    	$name = "Ointment";
		$title = "Instantly heals hero by 1%&lt;br /&gt;Stackable";
		$item = "106";
	}elseif($btype==12){
    	$name = "Bucket";
		$title = "Instantly ressurect your hero";
        $item = "108";
	}elseif($btype==13){
    	$name = "Book of Wisdom";
		$title = "Redistributes hero skills";
        $item = "110";
	}elseif($btype==14){
    	$name = "Tablet of Law";
		$title = "+1% loyalty in village, max 125%&lt;br /&gt;Stackable";
		$item = "109";
	}elseif($btype==15){
    	$name = "Artwork";
		$title = "Instantly gives amount of CP, equal to daily production, but not more than 5000&lt;br /&gt;Stackable";
        $item = "111";
	}

?>