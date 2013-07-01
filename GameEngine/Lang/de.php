<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                           TRAVIAN 4                                              //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                		  Made by: yi12345                                          //
//                                      Edited by: Captain09                                        //
//                              - Travian 4 = Travian 4 Clone Project -                             //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////
                                    //                         //
									//        GERMAN           //
			                        //     Author: Captain09   //
									/////////////////////////////
//TRIBES
define("TRIBE1","R&oumlmer"); 
define("TRIBE2","Germanen");
define("TRIBE3","Gallier"); 
define("TRIBE4","Natur"); 
define("TRIBE5","Nataren");
define("TRIBE6","Monster");
/* NEW CONFIG STUFF
//ADVENTURE CHANCES
define("EXP_ADVENTURE_MULTIPLIER",50);
define("EXP_ADVENTURE_EASY_1",0*EXP_ADVENTURE_MULTIPLIER);
define("EXP_ADVENTURE_EASY_2",40*EXP_ADVENTURE_MULTIPLIER);
define("EXP_ADVENTURE_HARD_1",10*EXP_ADVENTURE_MULTIPLIER);
define("EXP_ADVENTURE_HARD_2",80*EXP_ADVENTURE_MULTIPLIER);
//HERO ITEM VALUE CHANCES
define("EXP_MULTIPLIER",10*EXP_ADVENTURE_MULTIPLIER);
//cages
define("CAGE_VALUE_MIN","10");
define("CAGE_VALUE_MAX","250");
//all other stackable items
define("STACKABLE_VALUE_MIN","200");
define("STACKABLE_VALUE_MAX","1500");
//adventure difficulty
define("DIFFICULTY_EASY_1",500*DIFFICULTY_MULTIPLIER);
define("DIFFICULTY_EASY_2",2000*DIFFICULTY_MULTIPLIER);
define("DIFFICULTY_HARD_1",1000*DIFFICULTY_MULTIPLIER);
define("DIFFICULTY_HARD_2",4000*DIFFICULTY_MULTIPLIER);
define("DIFFICULTY_MULTIPLIER",100);
*/

//TIME RELATED
define("DAY_YESTERDAY","gestern");
define("DAY_TODAY","heute");

//MAIN MENU
define("HOME","Startseite"); 
define("INSTRUCT","Anleitung");
define("ADMIN_PANEL","Admin Panel");
define("MASS_MESSAGE","Massen Nachricht");
define("LOGOUT","Logout");
define("PROFILE","Profil");
define("SUPPORT","Support");
define("UPDATE_T_10","Top 10 vergeben");
define("SYSTEM_MESSAGE","System Nachricht");
define("TRAVIAN_PLUS","Travian <b><span class=\"plus_g\">P</span><span class=\"plus_o\">l</span><span class=\"plus_g\">u</span><span class=\"plus_o\">s</span></span></span></b>");
define("CONTACT","Kontaktiere uns!");

define("HEADER_MESSAGES","Nachrichten");
define("HEADER_PLUS","Plus");
define("HEADER_ADMIN","Admin");
define("HEADER_PLUSMENU","Plus Men&uuml");
define("HEADER_NOTICES","Berichte");
define("HEADER_STATS","Statistiken");
define("HEADER_MAP","Karte");
define("HEADER_DORF2","Geb&aumlude");
define("HEADER_DORF1","Rohstoffe");
define("HEADER_GOLD","Gold");
define("HEADER_SILVER","Silber");
define("HEADER_NIGHT","Nacht");
define("HEADER_DAY","Tag");
define("HEADER_NOTICES_NEW","Neuer Bericht");


define("SIDEINFO_ADVENTURES","Abenteuer");
define("SIDEINFO_AUCTIONS","Auktion");
define("SIDEINFO_PROFILE","Profil");
define("SIDEINFO_ALLIANCE","Allianz");
define("SIDEINFO_CHANGE_TITLE","Hier Doppelklicken um den Dorfnamen zu &aumlndern");
define("SIDEINFO_CHANGEVIL_TITLE","Dorfname &aumlndern");
define("SIDEINFO_CHANGEVIL_LABEL","Neuer Dorfname");
define("SIDEINFO_CHANGEVIL_BTN","Speichern");
define("SIDEINFO_QUEST","Zum Quest");

define("LOGOUT_TITLE","Logout abgeschlossen!");
define("LOGOUT_H4","Vielen Dank f&uumlr deinen Besuch");
define("LOGOUT_DESC","Wenn auch andere Leute diesen PC nutzen, solltest du aus Sicherheitsgr&uumlnden das Cookie mit Namen und Passwort l&oumlschen:");
define("LOGOUT_LINK","Cookie l&oumlschen");

define("LOGIN_WELCOME","Willkommen auf der Welt 1");
define("LOGIN_USERNAME","Accountname");
define("LOGIN_PASSWORD","Passwort");
define("LOGIN_LOWRES_DESC1_extra","Version f&uumlr Spieler ");
define("LOGIN_LOWRES_DESC2","mit geringer Internetgeschwindigkeit");
define("LOGIN_LOWRES_DESC3","(Anmerkung: Die Karte dieser Version besitzt nicht alle Optionen) ");
define("LOGIN_PW_FORGOTTEN","Passwort Vergessen");

define("LOGIN_PW_REQUEST","Passwort anfordern");
define("LOGIN_PW_EMAIL","Email");
define("LOGIN_PW_BTN","Passwort anfordern");

define("REGISTER_USERINFO","Registrieren");
define("REGISTER_USERNAME","Accountname");
define("REGISTER_EMAIL","Email");
define("REGISTER_PASSWORD","Passwort");
define("REGISTER_STARTER","");
define("REGISTER_SELECT_TRIBE","Volk w&aumlhlen");
define("REGISTER_LOCATION","Startposition");
define("REGISTER_NE","Nord-Osten");
define("REGISTER_NW","Nord-Westen");
define("REGISTER_SE","S&uumld-Osten");
define("REGISTER_SW","S&uumld-Westen");
define("REGISTER_RANDOM","Zuf&aumlllig");
define("ACCEPT_RULES","Die Regeln wurden von mir gelesen und akzeptiert.");
define("BEFORE_REGISTER","");
define("REGISTER_MOREINFO","Spielregeln");
define("REGISTER_CLOSED","Anmeldung geschlossen");

//MENU
define("REG","Registrieren");
define("FORUM","Forum");
define("CHAT","Chat");
define("IMPRINT","Impressum");
define("MORE_LINKS","Mehr Links");
define("TOUR","Game Tour");


//ERRORS
define("USRNM_EMPTY","Bitte gib einen Accountnamen ein.");
define("USRNM_TAKEN","Der Name ist bereits vergeben");
define("USRNM_SHORT","Dein Accountname ist zu kurz, er sollte mindestens ".USRNM_MIN_LENGTH." Zeichen lang sein.");
define("USRNM_CHAR","Der Name enth&aumllt ung&uumlltige Zeichen");
define("PW_EMPTY","Dein Passwort ist zu kurz, es sollte mindestens 4 Zeichen lang sein.");
define("PW_SHORT","Dein Passwort ist zu kurz, es sollte mindestens 4 Zeichen lang sein.");
define("PW_INSECURE","(Password insecure. Please choose a more secure one.)");
define("EMAIL_EMPTY","Diese E-Mai-Adresse ist ung&uumlltig, schon vergeben oder von einem nicht vertrauensw&uumlrdigen Anbieter.");
define("EMAIL_INVALID","Diese E-Mai-Adresse ist ung&uumlltig, schon vergeben oder von einem nicht vertrauensw&uumlrdigen Anbieter.");
define("EMAIL_TAKEN","E-Mail Adresse ist bereits registriert");
define("TRIBE_EMPTY","<li>W&aumlhle ein Volk</li>");
define("AGREE_ERROR","<li>Es ist notwendig die AGB zu lesen und zu akzeptieren</li>");
define("LOGIN_USR_EMPTY","Login eingeben ");
define("LOGIN_PASS_EMPTY","Passwort eingeben ");
define("EMAIL_ERROR","Email Adresse stimmt nicht &uumlberein");
define("PASS_MISMATCH","Das neue Passwort stimmt nicht &uumlberein");
define("ALLI_OWNER","Bitte w&aumlhle einen Allianz Leiter bevor du die Allianz verl&aumlsst");
define("SIT_ERROR","Der Spieler ist bereits von anderen Spielern insgesamt 2x als Accountvertreter eingetragen. ");
define("USR_NT_FOUND","Name existiert nicht");
define("LOGIN_PW_ERROR","Passwort ist falsch");
define("WEL_TOPIC","N&uumltzliche Tipps & Informationen ");
define("ATAG_EMPTY","Tag leer");
define("ANAME_EMPTY","Es wurde kein Name gew&aumlhlt");
define("ATAG_EXIST","Tag wird bereits verwendet");
define("ANAME_EXIST","Name wird bereits verwendet");

//COPYRIGHT
define("TRAVIAN_COPYRIGHT","");

//BUILD.TPL
define("CUR_PROD","Aktuelle Produktion");
define("NEXT_PROD","Produktion bei Stufe ");
define("BUILDING_UPGRADING","Bauauftr&aumlge:");
define("WAITING_LOOP","(Warteschleife)");
define("INSTA_BUILD","Sofort fertigstellen");
define("INSTA_BUILD_COST","Kosten");
define("BUILD_DUR_HRS","Std.");
define("BUILD_DUR_TIME1","");
define("BUILD_DUR_TIME2","Uhr");
define("BUILD_DUR_GOLD","Gold");
define("BUILD_DUR_CANCEL","Abbrechen");
define("BUILD_MAX","vollst&auml;ndig ausgebaut");

//dorf2
define("BUILD_SIDE","Bauplatz");
define("BUILD_SIDE_2","Versammlungsplatz Bauplatz");
define("BUILD_SIDE_3","Outer building site");

//BUILDINGS
define("B1","Holzf&aumlller");
define("B1_DESC","Der Holzf&aumlller f&auml;llt B&auml;ume, um daraus Holz zu gewinnen. Je weiter der Holzf&auml;ller ausgebaut wird, desto mehr Holz produziert er.");
define("B2","Lehmgrube");
define("B2_DESC","Aus der Lehmgrube wird der Rohstoff Lehm gewonnen. Je h&ouml;her die Lehmgrube ausgebaut ist desto mehr Lehm kann produziert werden.");
define("B3","Eisenmine");
define("B3_DESC","Aus den Eisenminen gewinnen die Bergleute den wertvollen Rohstoff Eisen. Je weiter die Eisenmine ausgebaut ist, desto mehr Eisen wird jede Stunde produziert.");
define("B4","Getreidefarm");
define("B4_DESC","In der Getreidefarm wird Nahrung zur Versorgung der Bev&ouml;lkerung hergestellt. Je h&ouml;her die Getreidefarm ausgebaut wird, desto mehr Getreide wird produziert.");
define("B5","S&auml;gem&uuml;hle");
define("B5_DESC","Im S&auml;gewerk wird das Holz der Holzf&auml;ller weiterverarbeitet. Je nach Ausbaustufe erh&ouml;ht sich die Holzproduktion um bis zu 25 Prozent.");
define("B6","Lehmbrennerei");
define("B6_DESC","In der Lehmbrennerei wird Lehm zu Ziegelsteinen verarbeitet. Je nach Ausbaustufe erh&ouml;ht sich die Lehmproduktion um bis zu 25 Prozent.");
define("B7","Eisengie&szlig;erei");
define("B7_DESC","In der Eisengie&szlig;erei wird Eisen veredelt. Je nach Ausbaustufe erh&ouml;ht sich die Eisen-produktion so um bis zu 25 Prozent.");
define("B8","Getreidem&uuml;hle");
define("B8_DESC","In der Getreidem&uuml;hle wird Getreide zu Mehl gemahlen. Je nach Ausbaustufe erh&oumlht sich die Getreideproduktion um bis zu 25 Prozent.");
define("B9","B&auml;ckerei");
define("B9_DESC","In der B&auml;ckerei wird das Mehl der M&uuml;hle zu Brot verbacken. Damit erh&ouml;ht sich die Getreideproduktion zusammen mit der M&uuml;hle um bis zu 50 Prozent.");
define("B10","Rohstofflager");
define("B10_DESC","Im Rohstofflager werden die Rohstoffe Holz, Lehm und Eisen gelagert. Je weiter das Rohstofflager ausgebaut wird, desto mehr Rohstoffe k&ouml;nnen eingelagert werden.");
define("B11","Kornspeicher");
define("B11_DESC","Im Kornspeicher wird das Getreide der Getreidefarmen gelagert. Je weiter der Kornspeicher ausgebaut wird, desto mehr Getreide kann eingelagert werden.");
define("B13","Schmiede");
define("B13_DESC","In den Schmelz&ouml;fen der Schmiede werden die R&uuml;stungen und Waffen der Krieger verbessert. Je weiter das Geb&auml;ude ausgebaut ist, desto besser kann die Ausr&uuml;stung geschmiedet werden.");
define("B14","Turnierplatz");
define("B14_DESC","Am Turnierplatz k&ouml;nnen deine Truppen ihre Ausdauer trainieren. Je weiter dieses Geb&auml;ude ausgebaut ist, desto schneller sind deine Einheiten bei Entfernungen &uumlber 20 Felder.");
define("B15","Hauptgeb&auml;ude");
define("B15_DESC","Im Hauptgeb&auml;ude wohnen die Baumeister des Dorfes. Je weiter das Hauptgeb&auml;ude ausgebaut wird, desto schneller k&ouml;nnen andere Geb&auml;ude gebaut werden.");
define("B16","Versammlungsplatz");
define("B16_DESC","Am Versammlungsplatz treffen sich die Soldaten des Dorfes. Von dort aus k&ouml;nnen die Truppen zum Unterst&uuml;tzen, Pl&uuml;ndern oder Erobern, zu einem anderen Dorf geschickt werden.");
define("B17","Marktplatz");
define("B17_DESC","Am Marktplatz kann man mit anderen Spielern Rohstoffe tauschen. Je weiter der Marktplatz ausgebaut ist, desto mehr H&auml;ndler stehen zur Verf&uuml;gung.");
define("B18","Botschaft");
define("B18_DESC","Die Botschaft ist ein Ort f&uuml;r Diplomaten. Ab Stufe 1 kannst du anderen Allianzen beitreten, ab Stufe 3 kannst du auch selber eine Allianz gr&uumlnden.<br><br>Pro Stufe der Botschaft erh&oumlht sich die maximal Anzahl der Allianzmitglieder um drei. Damit k&oumlnnen bei Stufe 20 maximal 60 Spieler in einer Allianz sein.");
define("B19","Kaserne");
define("B19_DESC","In der Kaserne k&ouml;nnen alle Fu&szlig;truppen ausgebildet werden. Je weiter die Kaserne ausgebaut ist, desto schneller werden die Truppen ausgebildet.");
define("B20","Stall");
define("B20_DESC","In dem Stall k&ouml;nnen alle berittenen Truppen ausgebildet werden. Je weiter der Stall ausgebaut ist, desto schneller werden die Truppen ausgebildet.");
define("B21","Werkstatt");
define("B21_DESC","In der Werkstatt k&ouml;nnen Belagerungseinheiten wie Katapulte und Rammen gebaut werden. Je weiter die Werkstatt ausgebaut ist, desto schneller kann produziert werden.");
define("B22","Akademie");
define("B22_DESC","In der Akademie k&oumlnnen neue Einheitentypen erforscht werden. Je weiter die Akademie ausgebaut wird, desto fortschrittlichere Einheiten k&ouml;nnen erforscht werden.");
define("B23","Versteck");
define("B23_DESC","Im Versteck kann im Falle eines Angriffs ein Teil der Rohstoffe aus den Lagern versteckt werden. Diese Rohstoffe k&ouml;nnen von angreifenden Pl&uuml;nderern nicht geraubt werden.");
define("B24","Rathaus");
define("B24_DESC","Im Rathaus kannst du f&uuml;r deine B&uuml;rger prunkvolle Feste veranstalten. Durch ein solches Fest erh&ouml;ht sich die Anzahl deiner Kulturpunkte.");
define("B25","Residenz");
define("B25_DESC","Die Residenz ist ein kleiner Palast, in dem der K&ouml;nig weilt, wenn er gerade zu Besuch ist. Die Residenz sch&uuml;tzt das Dorf u.a. vor einer feindlichen &uuml;bernahme.");
define("B26","Palast");
define("B26_DESC","Im Palast wohnt der K&ouml;nig oder die K&ouml;nigin eines Reiches. Der Palast dient dem Herrscher zur Bestimmung des Hauptdorfes, deswegen kann auch nur ein Palast im ganzen Herrschaftsgebiet errichtet werden.");
define("B27","Schatzkammer");
define("B27_DESC","In der Schatzkammer werden die Reicht&uuml;mer deines Reiches aufbewahrt. In jeder Schatzkammer ist Platz f&uuml;r ein Artefakt. Nachdem du ein Artefakt erobert hast, dauert es 24 Stunden bis sich dessen Wirkung entfaltet.");
define("B28","Handelskontor");
define("B28_DESC","m Handelskontor werden die Marktkarren verbessert und mit starken Pferden ausgestattet. Je weiter das Handelskontor ausgebaut ist, desto mehr k&ouml;nnen deine H&auml;ndler transportieren.");
define("B29","Gro&szlig;e Kaserne");
define("B29_DESC","Die gro&szlig;e Kaserne erm&ouml;glicht die Ausbildung zus&auml;tzlicher Truppen. Dies schl&auml;gt allerdings mit den dreifachen Kosten zu Buche.<br>Kombiniert mit der normalen Kaserne kann man Truppen jedoch doppelt so schnell in einem Dorf produzieren.");
define("B30","Gro&szlig;er Stall");
define("B30_DESC","Der gro&szlig;e Stall erm&ouml;glicht die Ausbildung zus&auml;tzlicher berittener Truppen. Dies schl&auml;gt allerdings mit den dreifachen Kosten zu Buche.");
define("B31","Stadtmauer");
define("B31_DESC","Die Stadtmauer sch&uuml;tzt deine Siedlung vor Angriffen. Je weiter die Stadtmauer ausgebaut ist, desto leichter wird es deine Siedlung haben, sich erfolgreich gegen die pl&uuml;ndernden Horden deiner Gegner zu verteidigen. ");
define("B32","Erdwall");
define("B32_DESC","Der Erdwall sch&uuml;tzt deine Siedlung vor Angriffen. Je weiter der Erdwall ausgebaut ist, desto leichter wird es deine Siedlung haben, sich erfolgreich gegen die pl&uuml;ndernden Horden deiner Gegner zu verteidigen. ");
define("B33","Palisade");
define("B33_DESC","Die Palisade sch&uuml;tzt deine Siedlung vor Angriffen. Je weiter die Palisade ausgebaut ist, desto leichter wird es deine Siedlung haben, sich erfolgreich gegen die pl&uuml;ndernden Horden deiner Gegner zu verteidigen. ");
define("B34","Steinmetz");
define("B34_DESC","Der Steinmetz ist ein Experte in der Bearbeitung von Stein. Je h&ouml;her das Geb&auml;ude ausgebaut wird, desto stabiler werden die Bauwerke und die Mauer dieses Dorfes. Pro Ausbaustufe steigt die Stabilit&auml;t der Geb&auml;ude und Mauer um 10%.");
define("B35","Brauerei");
define("B35_DESC","In der Brauerei der Germanen wird Met gebraut, mit dem sich deine Soldaten vor der Schlacht Mut antrinken k&ouml;nnen. Je weiter deine Brauerei ausgebaut wird, desto st&auml;rker wird dann der Angriffsbonus. Die L&auml;nge deiner Brauerei-Feste liegt bei 72 Stunden.");
define("B36","Fallensteller");
define("B36_DESC","Mit gut versteckten Fallen sch&uuml;tzt der Fallensteller dein Dorf. Unachtsame Angreifer k&ouml;nnen so in Gefangenschaft geraten und stellen f&uuml;r dein Dorf vor&uuml;bergehend keine Gefahr mehr dar. Die Gefangenen ern&auml;hren sich weiterhin aus ihrem Heimatdorf.");
define("B37","Heldenhof");
define("B37_DESC","Ab den Geb&auml;udestufen 10, 15 und 20 k&ouml;nnen 1, 2 bzw. 3 verlassene T&auml;ler (Oasen) vom Helden annektiert werden. Je nach Typ der Oasen erh&ouml;hen diese die Produktion bestimmter Rohstoffe im Heimatdorf.");
define("B38","Gro&szlig;es Rohstofflager");
define("B38_DESC","Das gro&szlig;e Rohstofflager kann im Vergleich zum normalen Rohstofflager die 3fache Menge an Holz, Lehm und Eisen speichern.");
define("B39","Gro&szlig;er Kornspeicher");
define("B39_DESC","Der gro&szlig;e Kornspeicher kann im Vergleich zum normalen Kornspeicher die 3fache Menge an Getreide speichern.");
define("B40","Weltwunder");
define("B40_DESC","Das Weltwunder stellt die Kr&ouml;nung einer Zivilisation dar. Nur die M&auml;chtigsten und Reichsten sind in der Lage solch ein Meisterwerk der Baukunst zu errichten und vor neidischen Feinden zu sch&uuml;tzen.");
define("B41","Pferdetr&auml;nke");
define("B41_DESC","Die Pferdetr&auml;nke k&uuml;mmert sich um das Wohlbefinden deiner Pferde, beschleunigt die Ausbildung von berittenen Einheiten und verringert deren Getreideverbrauch.");

//DORF1
define("WOOD","Holz");
define("CLAY","Lehm");
define("IRON","Eisen");
define("CROP","Getreide");
define("ALLRES","Alle Ressourcen");
define("LEVEL","Stufe");
define("CROP_COM","Getreideverbrauch");
define("PER_HR","pro Stunde");
define("PROD_HEADER","Produktion");
define("MULTI_V_HEADER","D&oumlrfer");
define("ANNOUNCEMENT","Anzeige");
define("GO2MY_VILLAGE","Zum Dorf");
define("VILLAGE_CENTER","Dorfzentrum");
define("FINISH_GOLD","Finish all construction and research orders in this village immediately for 2 Gold?");
define("WAITING_LOOP","(Warteschleife)");
define("HRS","(Std.)");
define("DONE_AT","Fertig um");
define("CANCEL","abbrechen");
define("LOYALTY","Zustimmung:"); 
define("CALCULATED_IN","Berechnung in");
define("SEVER_TIME","Serverzeit:"); 
define("FIELD_DORF2","Dorfzentrum");

// HERO UNIT
define("U0","Held");

//ROMAN UNITS
define("U1","Legion&auml;r");
define("U2","Pr&auml;torianer");
define("U3","Imperianer");
define("U4","Equites Legati");
define("U5","Equites Imperatoris");
define("U6","Equites C&auml;saris");
define("U7","Rammbock");
define("U8","Feuerkatapult");
define("U9","Senator");
define("U10","Siedler");

//TEUTON UNITS
define("U11","Keulenschwinger");
define("U12","Speerk&auml;mpfer");
define("U13","Axtk&auml;mpfer");
define("U14","Kundschafter");
define("U15","Paladin");
define("U16","Teutonen Reiter");
define("U17","Ramme");
define("U18","Katapult");
define("U19","Stammesf&uuml;hrer");
define("U20","Siedler");

//GAUL UNITS
define("U21","Phalanx");
define("U22","Schwertk&auml;mpfer");
define("U23","Sp&auml;her");
define("U24","Theutates Blitz");
define("U25","Druidenreiter");
define("U26","Haeduaner");
define("U27","Rammholz");
define("U28","Kriegskatapult");
define("U29","H&auml;uptling");
define("U30","Siedler");

//NATURE UNITS
define("U31","Ratte");
define("U32","Spinne");
define("U33","Schlange");
define("U34","Fledermaus");
define("U35","Wildschwein");
define("U36","Wolf");
define("U37","B&auml;r");
define("U38","Krokodil");
define("U39","Tiger");
define("U40","Elefant");

//NATARS UNITS
define("U41","Lanzentr&auml;ger");
define("U42","Dornenkrieger");
define("U43","Gardist");
define("U44","Raubvogel");
define("U45","Axtreiter");
define("U46","Natarenritter");
define("U47","Kriegselefanten");
define("U48","Balliste");
define("U49","Natarenf&uuml;rst");
define("U50","Siedler");

//MONSTER UNITS
define("U51","Fussvolk");
define("U52","J&auml;ger");
define("U53","Krieger");
define("U54","Geist");
define("U55"," Pferd");
define("U56","Schlachtross");
define("U57","Ramme");
define("U58","Katapult");
define("U59","H&auml;uptling");
define("U60","Siedler");

//BUILD
//BUILDINGS AND DESCRIPTIONS
define("B1","Holzf&aumlller");
define("B1_DESC","Der Holzf&auml;ller f&auml;llt B&auml;ume, um daraus Holz zu gewinnen. Je weiter der Holzf&auml;ller ausgebaut wird, desto mehr Holz produziert er.");
define("B2","Lehmgrube");
define("B2_DESC","Aus der Lehmgrube wird der Rohstoff Lehm gewonnen. Je h&ouml;her die Lehmgrube ausgebaut ist desto mehr Lehm kann produziert werden.");
define("B3","Eisenmine");
define("B3_DESC","Aus den Eisenminen gewinnen die Bergleute den wertvollen Rohstoff Eisen. Je weiter die Eisenmine ausgebaut ist, desto mehr Eisen wird jede Stunde produziert.");
define("B4","Getreidefarm");
define("B4_DESC","In der Getreidefarm wird Nahrung zur Versorgung der Bev&ouml;lkerung hergestellt. Je h&ouml;her die Getreidefarm ausgebaut wird, desto mehr Getreide wird produziert.");
define("B5","S&aumlgem&uumlhle");
define("B5_DESC","Im S&auml;gewerk wird das Holz der Holzf&auml;ller weiterverarbeitet. Je nach Ausbaustufe erh&ouml;ht sich die Holzproduktion um bis zu 25 Prozent.");
define("B6","Lehmbrennerei");
define("B6_DESC","In der Lehmbrennerei wird Lehm zu Ziegelsteinen verarbeitet. Je nach Ausbaustufe erh&ouml;ht sich die Lehmproduktion um bis zu 25 Prozent.");
define("B7","Eisengie&szlig;erei");
define("B7_DESC","In der Eisengie&szlig;erei wird Eisen veredelt. Je nach Ausbaustufe erh&ouml;ht sich die Eisenproduktion so um bis zu 25 Prozent.");
define("B8","Getreidem&uumlhle");
define("B8_DESC","In der Getreidem&uuml;hle wird Getreide zu Mehl gemahlen. Je nach Ausbaustufe erh&ouml;ht sich die Getreideproduktion um bis zu 25 Prozent.");
define("B9","B&aumlckerei");
define("B9_DESC","In der B&auml;ckerei wird das Mehl der M&uuml;hle zu Brot verbacken. Damit erh&ouml;ht sich die Getreideproduktion zusammen mit der M&uuml;hle um bis zu 50 Prozent.");
define("B10","Rohstofflager");
define("B10_DESC","Im Rohstofflager werden die Rohstoffe Holz, Lehm und Eisen gelagert. Je weiter das Rohstofflager ausgebaut wird, desto mehr Rohstoffe k&ouml;nnen eingelagert werden.");
define("B11","Kornspeicher");
define("B11_DESC","Im Kornspeicher wird das Getreide der Getreidefarmen gelagert. Je weiter der Kornspeicher ausgebaut wird, desto mehr Getreide kann eingelagert werden.");
define("B12","Schmiede");
define("B12_DESC","In den Schmelz&ouml;fen der Schmiede werden die R&uuml;stungen und Waffen der Krieger verbessert. Je weiter das Geb&auml;ude ausgebaut ist, desto besser kann die Ausr&uuml;stung geschmiedet werden.");
define("B14","Turnierplatz");
define("B14_DESC","Am Turnierplatz k&ouml;nnen deine Truppen ihre Ausdauer trainieren. Je weiter dieses Geb&auml;ude ausgebaut ist, desto schneller sind deine Einheiten bei Entfernungen &uuml;ber 20 Feldern.");
define("B15","Hauptgeb&aumlude");
define("B15_DESC","Im Hauptgeb&auml;ude wohnen die Baumeister des Dorfes. Je weiter das Hauptgeb&auml;ude ausgebaut wird, desto schneller k&ouml;nnen andere Geb&auml;ude gebaut werden.");
define("B16","Versammlungsplatz");
define("B16_DESC","Am Versammlungsplatz treffen sich die Soldaten des Dorfes. Von dort aus k&ouml;nnen die Truppen zum Unterst&uuml;tzen, Pl&uuml;ndern oder Erobern, zu einem anderen Dorf geschickt werden.");
define("B17","Marktplatz");
define("B17_DESC","Am Marktplatz kann man mit anderen Spielern Rohstoffe tauschen. Je weiter der Marktplatz ausgebaut ist, desto mehr H&auml;ndler stehen dir zur Verf&uuml;gung.");
define("B18","Botschaft");
define("B18_DESC","Die Botschaft ist ein Ort f&uuml;r Diplomaten. Je weiter eine Botschaft ausgebaut wird, desto mehr M&ouml;glichkeiten stehen dem K&ouml;nig offen.");
define("B19","Kaserne");
define("B19_DESC","In der Kaserne k&ouml;nnen alle Fu&szlig;truppen ausgebildet werden. Je weiter die Kaserne ausgebaut ist, desto schneller werden die Truppen ausgebildet.");
define("B20","Stall");
define("B20_DESC","In dem Stall k&ouml;nnen alle berittenen Truppen ausgebildet werden. Je weiter der Stall ausgebaut ist, desto schneller werden die Truppen ausgebildet.");
define("B21","Werkstatt");
define("B21_DESC","In der Werkstatt k&ouml;nnen Belagerungseinheiten wie Katapulte und Rammen gebaut werden. Je weiter die Werkstatt ausgebaut ist, desto schneller kann produziert werden.");
define("B22","Akademie");
define("B22_DESC","In der Akademie k&ouml;nnen neue Einheitentypen erforscht werden. Je weiter die Akademie ausgebaut wird, desto fortschrittlichere Einheiten k&ouml;nnen erforscht werden.<br><br>Erst nach der Erforschung kann die neue Einheit in diesem Dorf von dir gebaut werden. ");
define("B23","Versteck");
define("B23_DESC","Im Versteck kann im Falle eines Angriffs ein Teil der Rohstoffe aus den Lagern versteckt werden. Diese Rohstoffe k&ouml;nnen von angreifenden Pl&uuml;nderern nicht geraubt werden.");
define("B24","Rathaus");
define("B24_DESC","Im Rathaus kannst du f&uuml;r deine B&uuml;rger prunkvolle Feste veranstalten. Durch ein solches Fest erh&ouml;ht sich die Anzahl deiner Kulturpunkte.");
define("B25","Residenz");
define("B25_DESC","Die Residenz ist ein kleiner Palast, in dem der K&ouml;nig weilt, wenn er gerade zu Besuch ist. Die Residenz sch&uuml;tzt das Dorf u.a. vor einer feindlichen &uuml;bernahme.");
define("B26","Palast");
define("B26_DESC","Im Palast wohnt der K&ouml;nig oder die K&ouml;nigin eines Reiches. Der Palast dient dem Herrscher zur Bestimmung des Hauptdorfes, deswegen kann auch nur ein Palast im ganzen Herrschaftsgebiet errichtet werden.");
define("B27","Schatzkammer");
define("B27_DESC","In der Schatzkammer werden die Reicht&uuml;mer deines Reiches aufbewahrt. In jeder Schatzkammer ist Platz f&uuml;r ein Artefakt. Nachdem du ein Artefakt erobert hast, dauert es 24 Stunden bis sich dessen Wirkung entfaltet.");
define("B28","Handelskontor");
define("B28_DESC","Im Handelskontor werden die Marktkarren verbessert und mit starken Pferden ausgestattet. Je weiter das Handelskontor ausgebaut ist, desto mehr k&ouml;nnen deine H&auml;ndler transportieren.");
define("B29","Gro&szlig;e Kaserne");
define("B29_DESC","Die gro&szlig;e Kaserne erm&ouml;glicht die Ausbildung zus&auml;tzlicher Truppen. Dies schl&auml;gt allerdings mit den 3x Kosten zu Buche. Zusammen mit der normalen Kaserne kann man damit in der gleichen Zeit doppelt so viele Einheiten ausbilden.");
define("B30","Gro&szlig;er Stall");
define("B30_DESC","Der gro&szlig;e Stall erm&ouml;glicht die Ausbildung zus&auml;tzlicher berittener Truppen. Dies schl&auml;gt allerdings mit den 3x Kosten zu Buche.");
define("B31","Stadtmauer");
define("B31_DESC","Die Stadtmauer sch&uuml;tzt deine Siedlung vor Angriffen. Je weiter die Stadtmauer ausgebaut ist, desto h&ouml;her ist der Verteidigungsbonus und die Grundverteidigung des Dorfes.");
define("B32","Erdwall");
define("B32_DESC","Der Erdwall sch&uuml;tzt deine Siedlung vor Angriffen. Je weiter der Wall ausgebaut ist, desto h&ouml;her ist der Verteidigungsbonus und die Grundverteidigung des Dorfes.");
define("B33","Palisade");
define("B33_DESC","Die Palisade sch&uuml;tzt deine Siedlung vor Angriffen. Je weiter die Palisade ausgebaut ist, desto h&ouml;her ist der Verteidigungsbonus und die Grundverteidigung des Dorfes.");
define("B34","Steinmetz");
define("B34_DESC","Der Steinmetz ist ein Experte in der Bearbeitung von Stein. Je h&ouml;her das Geb&auml;ude ausgebaut wird, desto stabiler werden die Bauwerke dieses Dorfes, egal ob Rohstofffelder, Geb&auml;ude oder Mauer. ");
define("B35","Brauerei");
define("B35_DESC","In der Brauerei brauen die Germanen leckeres Met, welches bei Volksfesten gerne und viel getrunken wird.<br><br>W&auml;hrend des Brauereifestes sind deine Soldaten st&auml;rker im Kampf (1% pro Stufe), deine Stammesf&uuml;hrer k&ouml;nnen bei Angriffen die Zustimmung nur noch halb so gut senken und deine Katapulte treffen nur noch zuf&auml;llige Ziele.");
define("B36","Fallensteller");
define("B36_DESC","Mit gut versteckten Fallen sch&uuml;tzt der Fallensteller dein Dorf. Unachtsame Angreifer k&ouml;nnen so in Gefangenschaft geraten und stellen f&uuml;r dein Dorf vor&uuml;bergehend keine Gefahr mehr dar. Je weiter der Fallensteller ausgebaut wird, desto mehr und schneller k&ouml;nnen Fallen gebaut werden.");
define("B37","Heldenhof");
define("B37_DESC","Ab den Geb&auml;udestufen 10, 15 und 20 k&ouml;nnen 1, 2 bzw. 3 verlassene T&auml;ler (Oasen) vom Helden annektiert werden. Je nach Typ der Oasen erh&ouml;hen diese die Produktion bestimmter Rohstoffe im Heimatdorf.");
define("B38","Gro&szlig;es Rohstofflager");
define("B38_DESC","Das gro&szlig;e Rohstofflager kann im Vergleich zum normalen Rohstofflager die 3fache Menge an Holz, Lehm und Eisen speichern.");
define("B39","Gro&szlig;er Kornspeicher");
define("B39_DESC","Der gro&szlig;e Kornspeicher kann im Vergleich zum normalen Kornspeicher die 3fache Menge an Getreide speichern.");
define("B40","Weltwunder");
define("B40_DESC","Das Weltwunder stellt die Kr&ouml;nung einer Zivilisation dar. Nur die M&auml;chtigsten und Reichsten sind in der Lage solch ein Meisterwerk der Baukunst zu errichten und vor neidischen Feinden zu sch&uuml;tzen.");
define("B41","Pferdetr&aumlnke");
define("B41_DESC","Die Pferdetr&auml;nke sorgt f&uuml;r das Wohlbefinden deiner Pferde und beschleunigt so deren Ausbildung um 1 Prozent pro Stufe.");
define("B42","Gro&szlig;e Werkstatt");
define("B42_DESC","Die gro&szlig;e Werkstatt erm&ouml;glicht die Ausbildung zus&auml;tzlicher Belagerungseinheiten. Dies schl&auml;gt allerdings mit den 3x Kosten zu Buche.");
//HERO ITEMS AND DESCRIPTIONS
define("ITEM_1","Helm der Erkenntnis");
define("ITEM_1_DESC","");
define("ITEM_2","Helm der Weisheit");
define("ITEM_2_DESC","");
define("ITEM_3","Helm der Erleuchtung");
define("ITEM_3_DESC","");
define("ITEM_4","Helm der Regeneration");
define("ITEM_4_DESC","");
define("ITEM_5","Helm der Gesundheit");
define("ITEM_5_DESC","");
define("ITEM_6","Helm der Heilung");
define("ITEM_6_DESC","");
define("ITEM_7","Helm des Gladiators");
define("ITEM_7_DESC","");
define("ITEM_8","Helm des Tribunen");
define("ITEM_8_DESC","");
define("ITEM_9","Helm des Konsuls");
define("ITEM_9_DESC","");
define("ITEM_10","Helm der Reiterei");
define("ITEM_10_DESC","");
define("ITEM_11","Helm der Kavallerie");
define("ITEM_11_DESC","");
define("ITEM_12","Helm der schweren Reiterei");
define("ITEM_12_DESC","");
define("ITEM_13","Helm des S&ouml;ldners");
define("ITEM_13_DESC","");
define("ITEM_14","Helm des K&auml;mpfers");
define("ITEM_14_DESC","");
define("ITEM_15","Helm des Anf&uuml;hrers");
define("ITEM_15_DESC","");
define("ITEM_16","Kurzschwert des Legon&auml;rs");
define("ITEM_16_DESC","");
define("ITEM_17","Schwert des Legion&auml;rs");
define("ITEM_17_DESC","");
define("ITEM_18","Langschwert des Legion&auml;rs");
define("ITEM_18_DESC","");
define("ITEM_19","Kurzschwert des Pr&auml;torianers");
define("ITEM_19_DESC","");
define("ITEM_20","Schwert des Pr&auml;torianers");
define("ITEM_20_DESC","");
define("ITEM_21","Langschwert des Pr&auml;torianers");
define("ITEM_21_DESC","");
define("ITEM_22","Kurzschwert des Imperianers");
define("ITEM_22_DESC","");
define("ITEM_23","Schwert des Imperianers");
define("ITEM_23_DESC","");
define("ITEM_24","Langschwert des Imperianers");
define("ITEM_24_DESC","");
define("ITEM_25","Kurzschwert des Imperatoris");
define("ITEM_25_DESC","");
define("ITEM_26","Schwert des Imperatoris");
define("ITEM_26_DESC","");
define("ITEM_27","Langschwert des Imperatoris");
define("ITEM_27_DESC","");
define("ITEM_28","Leichte Lanze des C&auml;saris");
define("ITEM_28_DESC","");
define("ITEM_29","Lanze des C&auml;saris");
define("ITEM_29_DESC","");
define("ITEM_30","Schwere Lanze des C&auml;saris");
define("ITEM_30_DESC","");
define("ITEM_31","Speer der Phalanx");
define("ITEM_31_DESC","");
define("ITEM_32","Spie&szlig; der Phalanx");
define("ITEM_32_DESC","");
define("ITEM_33","Lanze der Phalanx");
define("ITEM_33_DESC","");
define("ITEM_34","Kurzschwert des Schwertk&auml;mpfers");
define("ITEM_34_DESC","");
define("ITEM_35","Schwert des Schwertk&auml;mpfers");
define("ITEM_35_DESC","");
define("ITEM_36","Langschwert des Schwertk&auml;mpfers");
define("ITEM_36_DESC","");
define("ITEM_37","Kurzbogen des Theutates");
define("ITEM_37_DESC","");
define("ITEM_38","Bogen des Theutates");
define("ITEM_38_DESC","");
define("ITEM_39","Langbogen des Theutates");
define("ITEM_39_DESC","");
define("ITEM_40","Wanderstab des Druidenreiters");
define("ITEM_40_DESC","");
define("ITEM_41","Stab des Druidenreiters");
define("ITEM_41_DESC","");
define("ITEM_42","Kampfstab des Druidenreiters");
define("ITEM_42_DESC","");
define("ITEM_43","Leichte Lanze des Haeduaners");
define("ITEM_43_DESC","");
define("ITEM_44","Lanze des Haeduaners");
define("ITEM_44_DESC","");
define("ITEM_45","Schwere Lanze des Haeduaners");
define("ITEM_45_DESC","");
define("ITEM_46","Kn&uuml;ppel des Keulenschwingers");
define("ITEM_46_DESC","");
define("ITEM_47","Streitkolben des Keulenschwingers");
define("ITEM_47_DESC","");
define("ITEM_48","Morgenstern des Keulenschwingers");
define("ITEM_48_DESC","");
define("ITEM_49","Speer des Speerk&auml;mpfers");
define("ITEM_49_DESC","");
define("ITEM_50","Spie&szlig; des Speerk&auml;mpfers");
define("ITEM_50_DESC","");
define("ITEM_51","Lanze des Speerk&auml;mpfers");
define("ITEM_51_DESC","");
define("ITEM_52","Beil des Axtk&auml;mpfers");
define("ITEM_52_DESC","");
define("ITEM_53","Axt des Axtk&auml;mpfers");
define("ITEM_53_DESC","");
define("ITEM_54","Streitaxt des Axtk&auml;mpfers");
define("ITEM_54_DESC","");
define("ITEM_55","Leichter Hammer des Paladins");
define("ITEM_55_DESC","");
define("ITEM_56","Hammer des Paladins");
define("ITEM_56_DESC","");
define("ITEM_57","Schwerer Hammer des Paladins");
define("ITEM_57_DESC","");
define("ITEM_58","Kurzschwert des Teutonen Reiters");
define("ITEM_58_DESC","");
define("ITEM_59","Schwert des Teutonen Reiters");
define("ITEM_59_DESC","");
define("ITEM_60","Langschwert des Teutonen Reiters");
define("ITEM_60_DESC","");
define("ITEM_61","Kleine Karte");
define("ITEM_61_DESC","");
define("ITEM_62","Karte");
define("ITEM_62_DESC","");
define("ITEM_63","Gro&szlig;e Karte");
define("ITEM_63_DESC","");
define("ITEM_64","Kleine Standarte des Volkes");
define("ITEM_64_DESC","");
define("ITEM_65","Standarte des Volkes");
define("ITEM_65_DESC","");
define("ITEM_66","Gro&szlig;e Standarte des Volkes");
define("ITEM_66_DESC","");
define("ITEM_67","Kleine Standarte des Bundes");
define("ITEM_67_DESC","");
define("ITEM_68","Mittlere Standarte des Bundes");
define("ITEM_68_DESC","");
define("ITEM_69","Gro&szlig;e Standarte des Bundes");
define("ITEM_69_DESC","");
define("ITEM_70","Gro&szlig;e Standarte des Bundes");
define("ITEM_70_DESC","");
define("ITEM_71","Gro&szlig;e Standarte des Bundes");
define("ITEM_71_DESC","");
define("ITEM_72","Gro&szlig;e Standarte des Bundes");
define("ITEM_72_DESC","");
define("ITEM_73","Kleiner Sack des Diebes");
define("ITEM_73_DESC","");
define("ITEM_74","Sack des Diebes");
define("ITEM_74_DESC","");
define("ITEM_75","Gro&szlig;er Sack des Diebes");
define("ITEM_75_DESC","");
define("ITEM_76","Kleiner Kriegsschild");
define("ITEM_76_DESC","");
define("ITEM_77","Mittlerer Kriegsschild");
define("ITEM_77_DESC","");
define("ITEM_78","Gro&szlig;er Kriegsschild");
define("ITEM_78_DESC","");
define("ITEM_79","Kleines Kriegshorn der Nataren");
define("ITEM_79_DESC","");
define("ITEM_80","Kriegshorn der Nataren");
define("ITEM_80_DESC","");
define("ITEM_81","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_81_DESC","");
define("ITEM_82","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_82_DESC","");
define("ITEM_83","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_83_DESC","");
define("ITEM_84","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_84_DESC","");
define("ITEM_85","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_85_DESC","");
define("ITEM_86","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_86_DESC","");
define("ITEM_87","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_87_DESC","");
define("ITEM_88","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_88_DESC","");
define("ITEM_89","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_89_DESC","");
define("ITEM_90","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_90_DESC","");
define("ITEM_91","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_91_DESC","");
define("ITEM_92","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_92_DESC","");
define("ITEM_93","Gro&szlig;es Kriegshorn der Nataren");
define("ITEM_93_DESC","");
define("ITEM_94","Schuhe der Regeneration");
define("ITEM_94_DESC","");
define("ITEM_95","Schuhe der Gesundheit");
define("ITEM_95_DESC","");
define("ITEM_96","Schuhe der Heilung");
define("ITEM_96_DESC","");
define("ITEM_97","Schuhe des S&ouml;ldners");
define("ITEM_97_DESC","");
define("ITEM_98","Schuhe des Soldaten");
define("ITEM_98_DESC","");
define("ITEM_99","Schuhe des Anf&uuml;hrers");
define("ITEM_99_DESC","");
define("ITEM_100","Kleine Pferdesporen");
define("ITEM_100_DESC","");
define("ITEM_101","Pferdesporen");
define("ITEM_101_DESC","");
define("ITEM_102","Gro&szlig;e Pferdesporen");
define("ITEM_102_DESC","");
define("ITEM_103","Leichtes Reitpferd");
define("ITEM_103_DESC","");
define("ITEM_104","Edles Vollblut");
define("ITEM_104_DESC","");
define("ITEM_105","Streitross");
define("ITEM_105_DESC","");
define("ITEM_106","Heilsalbe");
define("ITEM_106_DESC","");
define("ITEM_107","Schriftrolle");
define("ITEM_107_DESC","Wirken beim Einlegen sofort und geben einen absoluten Wert an Erfahrung (10XP je Schriftrolle).<br />Wird aktiv beim Einlegen.<br />Der Gegenstand ist stapelbar.");
define("ITEM_108","Wassereimer");
define("ITEM_108_DESC","Belebt den Helden sofort und kostenlos. Wenn der Held lebt, kann kein Wassereimer in die Tasche des Helden gelegt werden. Der Wassereimer verschwindet nach Gebrauch.<br />Wird aktiv beim Einlegen.");
define("ITEM_109","Gesetzestafeln");
define("ITEM_109_DESC","Steigert sofort die Zustimmung im Heimatdorf des Helden um 1% je Tafel, bis maximal 125%.<br />Wird aktiv beim Einlegen.<br />Der Gegenstand ist stapelbar.");
define("ITEM_110","Buch der Weisheit");
define("ITEM_110_DESC","Setzt sofort alle Helden-Attribute zur&uuml;ck und erlaubt es dir die Skillpunkte deines Helden neu zu verteilen.<br />Wird aktiv beim Einlegen.");
define("ITEM_111","Kunstwerk");
define("ITEM_111_DESC","Wenn das Kunstwerk benutzt wird, erh&auml;ltst Du zus&auml;tzliche Kulturpunkte, basierend auf der Produktion deiner D&ouml;rfer, jedoch niemals mehr als 5000 (2500 3xSpeedwelt und 3300 2xSpeedwelt) Kulturpunkte pro Kunstwerk.<br />Wird aktiv beim Einlegen.<br />Der Gegenstand ist stapelbar.");
define("ITEM_112","Kleiner Verband");
define("ITEM_112_DESC","25er Verb&auml;nde k&ouml;nnen maximal 25% der Truppenverluste heilen. Es k&ouml;nnen aber nur so viele Truppen geheilt werden, wie Verb&auml;nde vorhanden sind.<br /><br /> Die Heilung dauert die R&uuml;ckkehrzeit der Truppen ins Ausgangsdorf, mindestens aber 24h.<br />Der Gegenstand ist stapelbar.<br />Der Gegenstand muss vor dem Kampf angelegt werden, damit er wirken kann");
define("ITEM_113","Gro&szlig;er Verband");
define("ITEM_113_DESC","33er Verb&auml;nde k&ouml;nnen maximal 33% der Truppenverluste heilen. Es k&ouml;nnen aber nur so viele Truppen geheilt werden, wie Verb&auml;nde vorhanden sind.<br /><br />Die Heilung dauert die R&uuml;ckkehrzeit der Truppen ins Ausgangsdorf, mindestens aber 24h.<br />Der Gegenstand ist stapelbar.<br />Der Gegenstand muss vor dem Kampf angelegt werden, damit er wirken kann");
define("ITEM_114","K&auml;fig");
define("ITEM_114_DESC","Tiere in Oasen k&ouml;nnen damit gez&auml;hmt und mit ins Dorf genommen werden. Dort verteidigen sie dein Dorf. Die gefangenen Tiere verbrauchen kein Getreide.Der Gegenstand ist stapelbar.<br />Der Gegenstand muss vor dem Kampf angelegt werden, damit er wirken kann");


//INDEX.php
define("LOGIN","Login");
define("PLAYERS","Spieler");
define("ONLINE","Online");
define("TUTORIAL","Tutorial");
define("PLAYER_STATISTICS","Spieler Statistiken");
define("TOTAL_PLAYERS","Spieler gesamt");
define("PLAYERS_ACTIVE","Spieler aktiv");
define("PLAYERS_ONLINE","Spieler online");
define("MP_STRATEGY_GAME","".SERVER_NAME." - the multiplayer strategy game");
define("WHAT_IS","".SERVER_NAME." issss one of the most popular browser games in the world. As a player in ".SERVER_NAME.", you will build your own empire, recruit a mighty army, and fight with your allies for game world hegemony.");
define("REGISTER_FOR_FREE","Hier gratis registrieren");
define("LATEST_GAME_WORLD","Neueste Welt");
define("LATEST_GAME_WORLD2","Melde dich auf der<br />neuesten Welt an<br />und genie&szlig;e die<br />Vorteile der ersten<br />Spieler.</div>");
define("PLAY_NOW","Jetzt ".SERVER_NAME." spielen");
define("LEARN_MORE","Mehr erfahren <br/>about ".SERVER_NAME."!");
define("LEARN_MORE2","Now with a revolutionised<br>server system, completely new<br>graphics <br>This clone is The Shiz!");
define("COMUNITY","Community");
define("BECOME_COMUNITY","Werde Teil der Community!");
define("BECOME_COMUNITY2","Become a part of one of<br>the biggest gaming<br>communities in the<br>world.");
define("NEWS","News");
define("SCREENSHOTS","Screenshots");
define("LEARN1","Baue Felder und Minen aus, um deine Rohstoffproduktion zu erhöhen. Du benötigst Rohstoffe um Gebäude zu errichten und Soldaten auszubilden.");
define("LEARN2","Errichte Gebäude in deinem Dorf und baue sie aus. Gebäude verbessern die Infrastruktur, erhöhen die Rohstoffproduktion und erlauben dir Einheiten zu trainieren.");
define("LEARN3","Interagiere mit deiner Umgebung. Suche deine Freunde und Feinde, mach dir Oasen zu nutze und beobachte dein Imperium, wie es wächst und stärker wird.");
define("LEARN4","Verfolge deine Fortschritte und Erfolge und vergleiche dich mit anderen Spielern. Beobachte die Top 10-Platzierungen und erhalte wöchentliche Medaillen.");
define("LEARN5","Studiere Berichte über deine Abenteuer, deinen Handel mit Nachbarn und geführte Schlachten. Verpasse nicht die wichtigen Berichte von Ereignissen in deiner Nähe.");
define("LEARN6","Tausche Informationen und verhandle mit anderen Spielern. Kommunikation ist der Schlüssel um neue Freunde zu gewinnen und alte Konflikte bei zulegen.");
define("LOGIN_TO","Einloggen auf ". SERVER_NAME);
define("REGIN_TO","Anmelden auf ". SERVER_NAME);
define("P_ONLINE","Spieler online: ");
define("P_TOTAL","Spieler gesamt: ");
define("CHOOSE","Bitte w&aumlhle eine Welt");
define("STARTED"," Rundenstart vor ". round((time()-COMMENCE)/86400) ." Tagen");
//ANMELDEN.php
define("NICKNAME","Nickname");
define("EMAIL","Email");
define("PASSWORD","Passwort");
define("NW","Nord-West");
define("NE","Nord-Ost");
define("SW","Süd-West");
define("SE","Süd-Ost");
define("RANDOM","Zuf&auml;llig");
define("ACCEPT_RULES","Die <a href='rules.php'>Spielregeln</a> wurden von mir gelesen und akzeptiert.");
define("ONE_PER_SERVER","Jeder Spieler darf pro Server nur EINEN Account besitzen.");
define("BEFORE_REGISTER","Vor der Anmeldung solltest du die <a href='../anleitung.php' target='_blank'>Anleitung</a> von Travian lesen, um die Vor- und Nachteile der drei V&ouml;lker zu sehen.");
define("BUILDING_UPGRADING","Bauauftr&auml;ge:");
define("HOURS","Std.");


//ATTACKS ETC.
define("TROOP_MOVEMENTS","Troop Movements:");
define("ARRIVING_REINF_TROOPS","Arriving reinforcing troops");
define("ARRIVING_REINF_TROOPS_SHORT","Reinf.");
define("OWN_ATTACKING_TROOPS","Own attacking troops");
define("ATTACK","Attack");
define("OWN_REINFORCING_TROOPS","Own reinforcing troops");
define("TROOPS_DORF","Truppen:");


//LOGIN.php
define("COOKIES","You must have cookies enabled to be able to log in. If you share this computer with other people you should log out after each session for your own safety.");
define("NAME","Name");
define("PW_FORGOTTEN","Password forgotten?");
define("PW_REQUEST","Then you can request a new one which will be sent to your email address.");
define("PW_GENERATE","All fields required");
define("EMAIL_NOT_VERIFIED","Email not verified!");
define("EMAIL_FOLLOW","Follow this link to activate your account.");
define("VERIFY_EMAIL","Verify Email.");
define("LOGIN_SERVER_START","Server will start in:");


//404.php
define("NOTHING_HERE","Hier ist nichts!");
define("WE_LOOKED","Wir haben schon 404 mal gesucht, aber nichts gefunden");

//TIME RELATED
define("CALCULATED","Berechnung in");
define("SERVER_TIME","Serverzeit:");

//MASSMESSAGE.php
define("MASS","Message Content");
define("MASS_SUBJECT","Subject:");
define("MASS_COLOR","Message color:");
define("MASS_REQUIRED","All fields required");
define("MASS_UNITS","Images (units):");
define("MASS_SHOWHIDE","Show/Hide");
define("MASS_READ","Read this: after adding smilie, you have to add left or right after number otherwise image will won't work");
define("MASS_CONFIRM","Confirmation");
define("MASS_REALLY","Do you really want to send MassIGM?");
define("MASS_ABORT","Aborting right now");
define("MASS_SENT","Mass IGM was sent");

// Menu items

	define("GAME_TOUR","Game Tour");
	define("FORUM","Forum");
	define("FORUM_LINK","http://forum.travian.com");
	define("MORE_GAMES","Mehr Spiele");
	define("REGISTER","Anmelden");
	define("LOGIN","Login");
	define("MANUAL","Manual");
	define("TUTORIAL","Tutorial");
	define("SCREENSHOTS","Screenshots");
	define("FAQ","FAQ");
	define("SPIELREGELN","Spielregeln");
	define("AGB","AGB");
	define("IMPRINT","Imprint");
	define("SUPPORT","Support");
	define("LINKS","Links");
	define("HOME","Homepage");
	define("PROFILE","Profile");
	define("INSTRUCTIONS","Instructions");
	define("ADMIN_PANEL","Admin Panel");
	define("MULTIHUNTER_PANEL","Multihunter Panel");
	define("MASS_MESSAGE","Mass Message");
	define("UPDATE_TOP_TEN","Update Top 10");
	define("SYSTEM_MESSAGE","System Message");
	define("LOGOUT","Ausloggen");
	define("HELP","Help");
	define("TRAVIAN_PLUS",SERVER_NAME." <b><span class=\"plus_g\">P</span><span class=\"plus_o\">l</span><span class=\"plus_g\">u</span><span class=\"plus_o\">s</span></span></span></b>");

// Index
//not finished yet

	define("WELCOME","Welcome to ".SERVER_NAME);
	define("PLAY_NOW","Jetzt kostenlos Spielen!");
	define("WHAT_IS","Was ist ".SERVER_NAME);
	define("GAME_DESCRIPTION",SERVER_NAME." is a <b>browser game</b> featuring an engaging ancient world with thousands of other real players.</p><p>It`s <strong>free to play</strong> and requires <strong>no downloads</strong>.");
	define("CLICK_HERE","Klicke hier um ".SERVER_NAME." zu spielen");
	define("ABOUT","About the game");
	define("ABOUT1","You will begin as the chief of a tiny village and will embark on an exciting quest.");
	define("ABOUT2","Build up villages, wage wars or establish trade routes with your neighbours.");
	define("ABOUT3","Play with and against thousands of other real players and conquer the world of ".SERVER_NAME.".");
	define("NEWS","News");
	define("CHOOSE_WORLD","W&auml;hle eine Welt");
	
// Index Travian 4
//not finished yet
	define("","");
	
	$lang['index2']['description'] = 'Master the art of ancient tactics as Roman, Gaul or Teuton!';
	$lang['index2']['shop title'] = SERVER_NAME.' shop';
	$lang['index2']['shop'] = 'Zum Shop';
	$lang['index2']['shop link'] = '#';
	$lang['index2']['facebook'] = 'http://www.facebook.com/ZravianX';
	$lang['index2']['strategy game'] = 'TRAVIAN – das Multiplayer-Strategiespiel';
	$lang['index2']['what is'] = 'TRAVIAN ist eines der erfolgreichsten Browserspiele weltweit. Als Spieler in TRAVIAN baust du dein Imperium mit vielen D&oumlrfern auf, rekrutierst eine m&aumlchtige Armee und k&aumlmpfst mit deiner Allianz um die Vorherrschaft in deiner Spiel-Welt.';
	$lang['index2']['register free'] = 'Hier gratis registrieren';
	$lang['index2']['title1'] = 'Neueste Welt';
	$lang['index2']['desc1'] = 'Melde dich auf der<br />neuesten Welt an<br />und genie&szlig;e die<br />Vorteile der ersten<br />Spieler.';
	$lang['index2']['text1'] = 'Jetzt TRAVIAN 4 spielen';
	$lang['index2']['link1'] = '#serverRegister';
	$lang['index2']['title2'] = 'Das neue TRAVIAN 4';
	$lang['index2']['desc2'] = 'Jetzt mit neuem <br />Heldensystem, <br />komplett &uumlberarbeiteter <br />Grafik und einer <br />interaktiven Karte';
	$lang['index2']['text2'] = 'Erkunde das neue TRAVIAN 4';
	$lang['index2']['link2'] = '#serverRegister';
	$lang['index2']['title3'] = 'Community';
	$lang['index2']['desc3'] = 'Werde Teil einer der <br />gr&ouml&szlig;ten Spiele-<br />Communities<br />weltweit.';
	$lang['index2']['text3'] = 'Jetzt Teil der Community werden';
	$lang['index2']['link3'] = '#';
	$lang['index2']['learn more'] = 'Erfahre mehr &uumlber TRAVIAN!';
	$lang['index2']['strip1'] = 'Baue Felder und Minen aus, um deine Rohstoffproduktion zu erh&oumlhen. Du ben&oumltigst Rohstoffe um Geb&aumlude zu errichten und Soldaten auszubilden.';
	$lang['index2']['strip2'] = 'Errichte Geb&aumlude in deinem Dorf und baue sie aus. Geb&aumlude verbessern die Infrastruktur, erh&oumlhen die Rohstoffproduktion und erlauben dir Einheiten zu trainieren.';
	$lang['index2']['strip3'] = 'Interagiere mit deiner Umgebung. Suche deine Freunde und Feinde, mach dir Oasen zu nutze und beobachte dein Imperium, wie es w&aumlchst und st&aumlrker wird.';
	$lang['index2']['strip4'] = 'Verfolge deine Fortschritte und Erfolge und vergleiche dich mit anderen Spielern. Beobachte die Top 10-Platzierungen und erhalte w&oumlchentliche Medaillen.';
	$lang['index2']['strip5'] = 'Studiere Berichte &uumlber deine Abenteuer, deinen Handel mit Nachbarn und gef&uumlhrte Schlachten. Verpasse nicht die wichtigen Berichte von Ereignissen in deiner N&aumlhe.';
	$lang['index2']['strip6'] = 'Tausche Informationen und verhandle mit anderen Spielern. Kommunikation ist der Schl&uumlssel um neue Freunde zu gewinnen und alte Konflikte bei zulegen.';

// Screenshots Travian 4

	define("SCREENSHOTS_T4_TITLE1","Dorfzentrum");
	define("SCREENSHOTS_T4_TITLE2","Dorf&uuml;bersicht");
	define("SCREENSHOTS_T4_TITLE3","Der Held");
	define("SCREENSHOTS_T4_TITLE4","Geb&auml;udeinformationen");
	define("SCREENSHOTS_T4_TITLE5","Umliegende Territorien");
	define("SCREENSHOTS_T4_TITLE6","Kampfbericht");
	define("SCREENSHOTS_T4_TITLE7","Medaillensystem");
	define("SCREENSHOTS_T4_TITLE8","Questsystem");
	$lang['screenshots2']['desc1'] = 'So k&ouml;nnte dein Dorf aussehen bevor es zum Ausgangspunkt deines Imperiums wird.';
	$lang['screenshots2']['desc2'] = 'Holz, Lehm, Eisen und Getreide versorgen dein Dorf mit Nahrung, Baumaterial oder Kriegsausr&uuml;stung. So kannst du dir eine ganze Armee aufbauen.';
	$lang['screenshots2']['desc3'] = 'Du kannst deinen Held auf Abenteuer schicken. Dort muss er verschiedene Herausfor-derungen bestehen und wird Gefundenes zur&uuml;ck ins Dorf bringen.';
	$lang['screenshots2']['desc4'] = 'Dein Dorf ben&ouml;tigt am Anfang viele Geb&auml;ude. &uuml;berlege dir gut, welche du als erste baust.';
	$lang['screenshots2']['desc5'] = 'Erkunde die umliegenden Territorien, um deine Nachbarn kennenzulernen, mit ihnen B&uuml;ndnisse einzugehen oder um sie auszuspionieren und anzugreifen. Erobere Oasen der verschiedenen Rohstoffe, aber Vorsicht mit den wilden Tieren!';
	$lang['screenshots2']['desc6'] = 'Stelle fr&uuml;h dein eigenes Heer auf, um dich verteidigen oder selbst Angriffe ausf&uuml;hren zu k&ouml;nnen. So kannst du Rohstoffe hinzugewinnen und dein Reich ausbauen.';
	$lang['screenshots2']['desc7'] = 'W&ouml;chentlich werden die 10 besten Spieler und Allianzen in verschiedenen Kategorien gek&uuml;rt und erhalten Medaillen.';
	$lang['screenshots2']['desc8'] = 'Um dich in den ersten Stunden deines Imperiums zu unterst&uuml;tzen, geben wir dir einen Questgeber mit Ratschl&auml;gen zur Seite, der dir erst mal hilft, dein Dorf aufzubauen. Klicke einfach auf die Figur auf der linken Seite um ihn zu aktivieren.';
/*
$lang['screenshots2']['desc1'] = 'Your village could like this one day, becoming the starting point for your vast empire.';
	$lang['screenshots2']['desc2'] = 'Lumber, clay, iron and crop are the vital resources which will fuel the economy of your village and feed your people; they will provide you with the materials necessary for construction and war. With these valuable resources, you can train a powerful conquering army.';
	$lang['screenshots2']['desc3'] = 'You can send your hero to adventures, where he will have to face great danger and pass difficult challenges. If your hero is successful, he stands a chance of bringing something valuable home.';
	$lang['screenshots2']['desc4'] = 'For it to become powerful and productive, your village will need a great number of buildings. At the beginning, choose well what you want to construct first, as resources are scarce.';
	$lang['screenshots2']['desc5'] = 'Explore your surrounding territories in order to get to know your neighbors; you can opt for a path of peace, creating alliances and confederacies, or you can wage war and conquer the surrounding lands. There may be rich oases in your vicinity; conquer them to gain various valuable bonuses, but always be aware of the dangerous wild animals that inhabit them.';
	$lang['screenshots2']['desc6'] = 'It is wise to train your army early on, so you can defend yourself and attack others. This way, you can raid more resources and build up your empire more quickly.';
	$lang['screenshots2']['desc7'] = 'At the end of every week, the very best 10 players and alliances will be elected, topping in different categories; as a reward for their prowess they will receive medals, celebrating their achievements.';
	$lang['screenshots2']['desc8'] = 'To assist you when you first start managing your empire, we have sent the Taskmaster; he will guide you with tips and advice in order to help you build up your village. Just click on the image of the Taskmaster to your left to activate him.';

// Player statics

	define("TOTAL_PLAYERS","Players in total");
	define("PLAYERS_ACTIVE","Active players");
	define("PLAYERS_ONLINE","Players online");
	define("PLAYERS","Players");
	define("ACTIVE","Active");
	define("ONLINE","Online");
	define("PLAYER_STATISTICS","Players statistics");
*/
//NOTICES
define("REPORT_SUBJECT","Betreff:");
define("REPORT_ATTACKER","Angreifer");
define("REPORT_DEFENDER","Verteidiger");
define("REPORT_RESOURCES","Rohstoffe");
define("REPORT_FROM_VIL","from village");
define("REPORT_FROM_ALLY","from ally");
define("REPORT_SENT","Sent on:");
define("REPORT_SENDER","Absender");
define("REPORT_RECEIVER","Empf&auml;nger");
define("REPORT_AT","At");
define("REPORT_TO","To");
define("REPORT_SEND_RES","Rohstoffe schicken");
define("REPORT_DEL_BTN","Bericht l&ouml;schen");
define("REPORT_DEL_QST","Willst du diesen Bericht wirklich löschen?");
define("REPORT_WARSIM","Kampfsimulator");
define("REPORT_ATK_AGAIN","nochmal Angreifen");
define("REPORT_TROOPS","Truppen");
define("REPORT_REINF","Unterst&uuml;tzung");
define("REPORT_CASUALTIES","Verluste");
define("REPORT_INFORMATION","information");
define("REPORT_BOUNTY","Beute");
define("REPORT_CLOCK","Time");
define("REPORT_UPKEEP","Unterhalt");
define("REPORT_PER_HOURS","pro Stunde");
define("REPORT_SEND_REINF_TO","Unterst&uuml;tzung an ");



									
//


//reports
define("REPORTS_UNREAD_1","Neu");


//warsim
define("WARSIM","Kampfsimulator");
define("WARSIM_ATTACKER","Angreifer");
define("WARSIM_DEFENDER","Verteidiger");
define("WARSIM_TYPE","Angriffstyp");
define("WARSIM_RAID","Raubzug");
define("WARSIM_NORMAL","Normaler Angriff");
define("WARSIM_TROOPS","Truppen");
define("WARSIM_SIMULATE","Angriff simulieren");
define("WARSIM_ETC","Sonstige");
define("WARSIM_POP","Einwohner");
define("WARSIM_KATA","Lvl Katapultziel");
define("WARSIM_HEROPOWER","Held (Kampfkraft) ");
define("WARSIM_STONEMASON","Steinmetz");
define("WARSIM_PALACE","Palast");

//tasks
//generell stuff
define("PLUS","<b><font color=\"#71D000\">P<\/font><font color=\"#FF6F0F\">l<\/font><font color=\"#71D000\">u<\/font><font color=\"#FF6F0F\">s<\/font>");
define("ORDER","Auftrag:");
define("REWARD","Deine Belohnung:");
define("GRAB_REWARD","Belohnung abholen und weiter zur n&auml;chsten Quest");
//first page
define("QST_WELCOME_HEADER","Willkommen bei Travian!");
define("QST_WELCOME_1","Wie ich sehe hat man dich zum Senator dieses kleinen Dorfes ernannt. Ich werde dir in den ersten Tagen als Berater zur Seite stehen.<br><br>Eventuell m&ouml;chtest du ");
define("QST_WELCOME_2","das Aussehen deines Helden");
define("QST_WELCOME_3"," erst einmal &auml;ndern?");
define("QST_WELCOME_4","Zum ersten Quest!");
define("QST_WELCOME_5","Erst mal selbst umsehen");
//task 1
define("QST_1_HEADER","Quest 1: Holzf&auml;ller");
define("QST_1_1","Um dein Dorf gibt es vier gr&uuml;ne W&auml;lder. Bau auf einem der Felder einen Holzf&auml;ller. Holz ist ein wichtiger Rohstoff f&uuml;r unsere neue Siedlung.");
define("QST_1_ORDER","Gib einen Holzf&auml;ller in Auftrag.");
define("QST_1_ANSWER","Ja, so bekommst du mehr Holz...Ich hab dir etwas geholfen und ihn sofort fertig gestellt.");
define("QST_1_REWARD","Holzf&auml;ller sofort fertig gestellt");
//task 2
define("QST_2_HEADER","Quest 2: Getreide");
define("QST_2_1","Deine Leute sind jetzt hungrig vom vielen Arbeiten. Gib den Befehl zum Bau einer Getreidefarm.");
define("QST_2_ORDER","Starte den Ausbau einer Getreidefarm.");
define("QST_2_ANSWER","Sehr gut. Jetzt haben deine Dorfbewohner wieder genug Nahrung...");
define("QST_2_REWARD","1 Tag Travian <b>Plus</b>");
//task 3
define("QST_3_HEADER","Quest 3: Dein Dorfname");
define("QST_3_1","Der Name deines Dorfes gef&auml;llt mir nicht. Gib deinem Dorf einen sch&ouml;nen Namen.<br><br>Einfach links auf das Schild mit dem Dorfnamen doppelklicken...");
define("QST_3_ORDER","&Auml;ndere deinen Dorfnamen auf etwas Sch&ouml;nes.");
define("QST_3_ANSWER","Wow, das ist ein toller Name f&uuml;r dein Dorf. Die Idee h&auml;tte von mir sein k&ouml;nnen!");
//task 4
define("QST_4_HEADER","Quest 4: Versammlungsplatz");
define("QST_4_1","In der Umgebung gibt es ein paar geheimnisvolle Orte, die du erkunden solltest. F&uuml;r die Vorbereitung auf das Abenteuer brauchst du aber einen Versammlungsplatz.<br>Anders als bei anderen Geb&auml;uden kannst du den Versammlungsplatz nur auf einem ganz bestimmten Feld bauen. Das ");
define("QST_4_2","Feld");
define("QST_4_3"," liegt rechts unterhalb vom Hauptgeb&auml;ude.");
define("QST_4_ORDER","Baue den Versammlungsplatz");
define("QST_4_ANSWER","Super, du hast das Feld gefunden und den Versammlungsplatz gebaut. Ich ahb dir etwas geholfen und ihn sofort fertig gestellt.");
define("QST_4_REWARD","Versammlungsplatz sofort fertig gestellt");
//task 5
define("QST_5_HEADER","Quest 5: Auf zum ersten Abenteuer!");
define("QST_5_1","Abenteuer k&ouml;nnen nur von Helden unternommen werden. Suche auf der Karte nach einem Abenteuer in der N&auml;he. Vielleicht findest du den einen oder anderen Schatz dabei.");
define("QST_5_ORDER","Starte dein erstes Abenteuer.");
define("QST_5_ANSWER","Sehr gut. Ich bin gespannt was du entdecken wirst!");
define("QST_5_REWARD","keine");
//task 6
define("QST_6_HEADER","Quest 6: Andere Spieler");
define("QST_6_1","In Travian bist du mit vielen anderen Spielern unterwegs. Klicke im oberen Men&uuml; auf 'Statistik'. Dort schaue deinen Rang nach und gib ihn hier ein:");
define("QST_6_ORDER","Suche deinen Rang im Statistikbereich und gib ihn hier ein.");
define("QST_6_ANSWER","Genau das ist dein Rang!");
define("QST_6_BUTTON","Quest erf&uuml;llen");
define("QST_6_REWARD","Genau! Das ist dein Rang.");
//task 7
define("QST_7_HEADER","Quest 7: Zwei Bauauftr&auml;ge");
define("QST_7_1","W&auml;hrend du ein Abenteuer unternimmst, kannst du in deinem Dorf weitere Befehle geben. Gib den Befehl zum Bau einer <b>Eisenmine</b> und einer <b>Lehmgrube</b> um die Produktion deines Dorfes zu erh&ouml;hen.<br><br>Dank des Plus-Accounts, den ich dir vorhin geschenkt habe, kannst du gleich beide Geb&auml;ude in Auftrag geben.");
define("QST_7_ORDER","Starte den Ausbau einer Eisenmine");
define("QST_7_ORDER_2","Starte den Ausbau einer Lehmgrube");
define("QST_7_ANSWER","Wie du gemerkt hast dauern Bauauftr&auml;ge recht lange. Die Welt in Travian l&auml;uft auch dann weiter, wenn du nicht online bist. Auch in ein paar Monaten wird es noch viel zu entdecken geben.<br><br>Am besten schaust du immer mal wieder in dein Dorf und gibst deinen Untertanen neue Aufgaben.");
//task 8
define("QST_8_HEADER","Quest 8: Nachrichten");
define("QST_8_1","Du kannst dich &uuml;ber das Nachrichtensystem mit anderen Spielern unterhalten. Ich habe dir eine Nachricht zukommen lassen. Lies sie und komme dann wieder!");
define("QST_8_ORDER","Lies deine neue Nachricht.");
define("QST_8_MSG_SUBJECT","Nachricht vom Questgeber");
define("QST_8_MSG_CONTENT","");
define("QST_8_ANSWER","Hast du auch alles durchgelesen? Sehr gut!<br><br>Hier hast du etwas Gold. Damit kannst du z.B. deinen <b>Plus</b>-Account verl&auml;ngern oder deine Rohstoffproduktion steigern. Klicke oben rechts auf die Goldst&uuml;cke um eine &uuml;bersicht der M&ouml;glichkeiten zu erhalten.");
//task 9
define("QST_9_HEADER","Quest 9: Je eins!");
define("QST_9_1","In Travian gibt es immer etwas zu tun! W&auml;hrend du auf das Ergebnis deines Abenteuers wartest, baue ein weiteres Holz, Lehm, Eisen und Getreidefeld auf Stufe1.");
define("QST_9_ORDER","Baue je ein weiteres Rohstofffeld auf Stufe 1 aus.");
define("QST_9_ANSWER","Sehr gut, deine Rohstoffproduktion entwickelt sich hervorragend.");
//task 10
define("QST_10_HEADER","Quest 10: Nachbarn");
define("QST_10_1","Um dich herum gibt es viele andere D&ouml;rfer. Eines davon hei&szlig;t");
define("","Klicke im oberen Men&uuml; auf 'Karte' und suche das Dorf. Den Dorfnamen deiner Nachrbarn findest du, wenn du mit der Maus &uuml;ber das Dorf f&auml;hrst.");
define("QST_10_ORDER","Suche die koordinaten von");
define("","und gib sie hier ein.");
define("","Quest erf&uuml;llen");
define("","Ja, da liegt");
define("QST_10_ANSWER","Du kriegst jetzt so viele Rohstoffe wie dieses Dorf wert ist. Naja, fast.");
//task 11
define("QST_11_HEADER","Quest 11: Heldenproduktion &auml;ndern");
define("QST_11_1","Helden sind nicht nur Abennteuer und K&auml;mpfer, sie k&ouml;nnen auch richtig anpacken und selber Rohstoffe produzieren. Im Moment produzierst du von Allem etwas.");
define("QST_11_ORDER","&auml;ndere die Rohstoffproduktion deines Helden.");
define("QST_11_ANSWER","Sehr gut. Du produzierst nun zus&auml;tzlich ");
//task 12
define("QST_12_HEADER","Quest 12: Abenteuerbericht lesen");
define("QST_12_1","Du hast das Abenteuer erfolgreich abgeschlossen. Schau dir den Bericht an, um Weiteres &uuml;ber das Abenteuer zu erfahren.");
define("QST_12_ORDER","Lies den Abenteuer-Bericht.");
define("QST_12_ANSWER","Sehr gur. Du wei&szlig;t nun wie das Abenteuer gelaufen ist.");
//task 13
define("QST_13_HEADER","Quest 13: 2.Abenteuer");
define("QST_13_1","Nachdem das letzte Abenteuer so erfolgreich war, machen wir gleich noch eines!<br><br>Nach 10 bestandenen Abenteuern kannst du an Auktionen teilnehmen um Gegenst&auml;nde zu kaufen und zu verkaufen.");
define("QST_13_ORDER","Schicke den Helden erneut zu einem Abenteuer.");
define("QST_13_ANSWER","Sehr sch&ouml;n, du bist schon unterwegs.<br><br><b>Tipp:</b> Je mehr Kampfkraft dein held besitzt, umso weniger Schaden erh&auml;lt er auf Abenteuern.");
define("","2 Tage Travian <b>Plus</b>");
//task 14
define("QST_14_HEADER","Quest 14: Alles auf 1!");
define("QST_14_1","Nun sollten wir deine Rohstoffproduktion noch etwas erh&ouml;hen. Baue alle deine Rohstofffelder auf Stufe 1 aus.");
define("QST_14_ORDER","Baue alle Rohstofffelder auf Stufe 1 aus.");
define("QST_14_ANSWER","Sehr gut, deine Rohstoffproduktion entwickelt sich hervorragend.<br><br>Bald k&ouml;nnen wir mit dem Bau von geb&auml;uden im Dorf beginnen.");
//task 15
define("QST_15_HEADER","Quest 15: Friedenstaube");
define("QST_15_1","In den ersten Tagen nach der Anmeldung bist du vor Angriffen deiner Mitspieler gesch&uuml;tzt. Wie lange genau, kannst du sehen, wenn du den Code <b>[#0]</b> in dein Profil eintr&auml;gst.");
define("QST_15_ORDER","Schreibe den Code <b>[#0]</b> in dein Profil.");
define("QST_15_ANSWER","Sehr gut! Wenn du die Maus &uuml;ber die Taube bewegst, kannst du sehen, wie lange du noch vor Angriffen gesch&uuml;tzt bist.");
//task 16
define("QST_16_HEADER","Quest 16: Baue ein Versteck.");
define("QST_16_1","Es wird Zeit ein Versteck zu bauen. Die Welt in Travian ist gef&auml;hrlich und voller Neider.<br><br>Viele Spieler leben davon, anderen Spielern ihre Rohstoffe zu rauben. Baue ein Versteck um zumindest einen Teil deiner Rohstoffe vor Feinden zu sch&uuml;tzen.");
define("QST_16_ORDER","Baue ein Versteck.");
define("QST_16_ANSWER","Super, jetzt wird es schwieriger f&uuml;r deine fiesen Mitspieler dich zu pl&uuml;ndern.<br><br>Bei einem Angriff bringen die Dorfbewohner deine Rohstoffe &uuml;brigens selbstst&auml;ndig ins Versteck.");
//task 17
define("QST_17_HEADER","Quest 17: Auf zwei!");
define("QST_17_1","In Travian gibt es immer etwas zu tun! Baue einen Holzf&auml;ller, eine Lehmgrube, eine Eisenmine und eine Getreidefarm jeweils auf Stufe 2 aus.");
define("QST_17_ORDER","Baue je ein Ressourcenfeld auf Stufe 2 aus.");
define("QST_17_ANSWER","Sehr gut, dein Dorf w&auml;chstt und gedeiht!");
//task 18
define("QST_18_HEADER","Quest 18: Anleitung");
define("QST_18_1","In der Kurz-Anleitung findest du kurze Infos zu den verschiedenen Geb&auml;uden und Truppentypen.<br><br>Klicke auf das schwarze Buch unten links und schaue wie viel Holz eine Kaserne kostet.");
define("QST_18_ORDER","Gib ein, wie viel Holz eine Kaserne kostet.");
define("QST_18_ANSWER","Quest erf&uuml;llen");
//too much
define("","Nein, um eine Kaserne zu bauen brauchst du weniger Holz.");
//too few
define("","Nein, um eine Kaserne zu bauen brauchst du mehr Holz.");
//correct
define("","Genau! Eine Kaserne kostet 210 Holz.");
//task 19
define("QST_19_HEADER","Quest 19: Hauptgeb&auml;ude");
define("QST_19_1","Deine Einwohner ben&ouml;tigen ein Hauptgeb&auml;ude der Stufe 3 u wichtige Geb&auml;ude wie Marktplatz und Kaserne bauen zu k&ouml;nnen.");
define("QST_19_ORDER","Baue dein Hauptgeb&auml;ude auf Stufe 3 aus.");
define("QST_19_ANSWER","Sehr gut. Dein hauptgeb&auml;ude der Stufe 3 ist nun fertig.<br><br>Je h&ouml;her du dein Hauptgeb&auml;ude ausbaust, umso schneller werden deine Bauauftr&auml;ge fertig gestellt.");
//task 20
define("QST_20_HEADER","Quest 20: Fortgeschritten!");
define("QST_20_1","Schaue deinen Rang in der Spieler-Statistik erneut nach und beobachte deine Fortschritte!");
define("QST_20_ORDER","Suche deinen rang im Statistikbereich und gib ihn hier ein.");
define("QST_20_ANSWER","Quest erf&uuml;llen");



?>
