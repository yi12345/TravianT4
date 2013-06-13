<?php
#################################################################################
##                                                                             ##
##              -= YOU MUST NOT REMOVE OR CHANGE THIS NOTICE =-                ##
##                                                                             ##
## --------------------------------------------------------------------------- ##
##                                                                             ##
##  Project:       ZravianX                                                    ##
##  Version:       2011.12.03                                                  ##
##  Filename:      tutorial.php                                                ##
##  Developed by:  ZZJHONS                                                     ##
##  License:       Creative Commons BY-NC-SA 3.0                               ##
##  Copyright:     ZravianX (c) 2011 - All rights reserved                     ##
##  URLs:          http://zravianx.zzjhons.com                                 ##
##  Source code:   http://www.github.com/ZZJHONS/ZravianX                      ##
##                                                                             ##
#################################################################################

	if(!isset($_GET['s'])) {
	$_GET['s'] = ""; }
	if ($_GET['s'] == "") {
	include("Templates/Tutorial/1.tpl"); }
	if ($_GET['s'] == "1") {
	include("Templates/Tutorial/1.tpl"); }
	if ($_GET['s'] == "2") {
	include("Templates/Tutorial/2.tpl"); }
	if ($_GET['s'] == "3") {
	include("Templates/Tutorial/3.tpl"); }
	if ($_GET['s'] == "4") {
	include("Templates/Tutorial/4.tpl"); }
	if ($_GET['s'] == "5") {
	include("Templates/Tutorial/5.tpl"); }
	
?>