<?php
#################################################################################
##                                                                             ##
##              -= YOU MUST NOT REMOVE OR CHANGE THIS NOTICE =-                ##
##                                                                             ##
## --------------------------------------------------------------------------- ##
##                                                                             ##
##  Project:       ZravianX                                                    ##
##  Version:       2011.12.03                                                  ##
##  Filename:      index.php                                                   ##
##  Developed by:  ZZJHONS                                                     ##
##  Little changes by:  yi12345                                                ##
##  License:       Creative Commons BY-NC-SA 3.0                               ##
##  Copyright:     ZravianX (c) 2011 - All rights reserved                     ##
##  URLs:          http://zravianx.zzjhons.com                                 ##
##  Source code:   http://www.github.com/ZZJHONS/ZravianX                      ##
##                                                                             ##
#################################################################################

       if(!file_exists('GameEngine/config.php')) {
        header("Location: install/");
       }

       include ("GameEngine/Database.php");
       include ("GameEngine/Lang/".$result['lang'].".php");

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Powered by ZravianX Server - <?php echo SERVER_NAME; ?></title>
    <link rel="shortcut icon" href="favicon.ico" />
    <meta content="description" content="<?php echo $lang['index2']['description']; ?>" />
    <link rel="stylesheet" type="text/css" href="gpack/travian_homepage/lang/en/compact.css"/>
	<meta name="content-language" content="<?php echo LANG;?>"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<script type="text/javascript" src="crypt1.js?1302263420"></script>
	<style type="text/css">
	/*<![CDATA[*/
		div.c1 {left: 274px; top: 100px; display: block; visibility: visible}
    /*]]>*/
    </style>
</head>
<body class=" LTR">
    <div id="backgroundLeft"></div>
    <div id="backgroundRight"></div>
	<div id="background">
		<div id="navigation-wrapper">
	    	<div id="navigation-container">
	        	<div id="country_select">
				</div>
	            <div id="top-nav">
                    <div id="top-nav-menu">
                        <ul id="top-navigation">
                            <li><a href="#tutorial" class="popcon"><?php echo GAME_TOUR; ?></a></li>
                            <li><a href="<?php echo FORUM_LINK; ?>" target="blank" id="forum"><?php echo FORUM; ?></a></li>
                            <li><a href="#moregames" class="popcon"><?php echo MORE_GAMES; ?></a></li>
                            <li><a href="#serverRegister" class="popcon" id="register"><?php echo REGISTER; ?></a></li>
                        </ul>
                    </div>
                    <div id="top-nav-login">
                        <div id="login">
                            <div class="btn-green">
                                <div class="btn-green-l"></div>
                                <div class="btn-green-c"><a class="npage popcon" href="#serverLogin"><?php echo LOGIN; ?></a></div>
                                <div class="btn-green-r"></div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	    <div id="content-container">
	    	<div id="content-menu">
				<div id="statistics">
                   	<div id="stat-top"></div>
                    <div id="stat_bottom"></div>
                    	<h3 class="stat bold grey"><?php echo PLAYER_STATISTICS; ?></h3>
                    	<div>
	                    	<div class="stat type"><?php echo TOTAL_PLAYERS; ?>:</div>
                            <div class="stat value"><?php $users = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users"));
							echo $users-4; ?></div>
                            <div class="clear"></div>
							<div class="stat type"><?php echo PLAYERS_ACTIVE; ?>:</div>
                            <div class="stat value"><?php $active = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users WHERE " . time() . "-timestamp < (3600*24) AND tribe!=5 AND tribe!=0"));
							echo $active; ?></div>
							<div class="clear"></div>
                            <div class="stat type"><?php echo PLAYERS_ONLINE; ?>:</div>
                            <div class="stat value"><?php $online = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users WHERE " . time() . "-timestamp < (60*5) AND tribe!=5 AND tribe!=0"));
							echo $online; ?></div>
							<div class="clear"></div>
	                	</div>
                	</div>
					<?php include("Templates/homenews.tpl");?>
				</div>
	            <div id="content-main">
	            	<div id="wit">
                    	<div id="wit-top"></div>
                        <div id="wit-content" class="with-button">
                        	<div id="hero"></div>
                            <h1 class="wit bold"><?php echo $lang['index2']['strategy game']; ?></h1>
                            <div class="wit-info">
                            	<?php echo $lang['index2']['what is']; ?>
                            	<div class="playnow playnow-button">
                                	<div class="playnow-start">
                                    	<h1 class="play white bold">
                                        <a class="popcon play" href="#serverRegister" title="<?php echo $lang['index2']['register free']; ?>"><?php echo $lang['index2']['register free']; ?></a>
                                        </h1>
									</div>
                                    <div class="playnow-end"></div>
                                    <div class="clear"></div>
								</div>
							</div>
                            <div id="stage_space"></div>
                            <div id="stage">
                            	<div id="frame">
									<div class="stage-content stage-content0 shown" style="background-image: url(http://www.travian.com/tvbox_image.php?size=big&id=1)">
                                    	<div style="position:absolute; left:15px; top:170px;">
                                        	<img alt="" class="bbArrow" src="img/x.gif" />
                                            <span style="color:black;"><span style="font-weight:bold;"><?php echo $lang['index2']['text1']; ?></span></span>
										</div>
                                        <div style="position:absolute; left:15px; top:12px;">
                                            <h3><?php echo $lang['index2']['title1']; ?></h3>
                                            <br />
                                            <span style="font-weight:bold;"><?php echo $lang['index2']['desc1']; ?></span>
                                        </div>
                                        <div class="stage-arrow stage-arrow-0"></div>
									</div>
                                    <div class="stage-content stage-content1" style="background-image: url(http://www.travian.com/tvbox_image.php?size=big&id=2)">
                                    	<div style="position:absolute; left:15px; top:170px;">
                                        	<img alt="" class="bbArrow" src="img/x.gif" />
                                            <span style="color:black;"><span style="font-weight:bold;"><?php echo $lang['index2']['text2']; ?></span></span>
                                        </div>
                                        <div style="position:absolute; left:15px; top:12px;">
                                        	<h3><?php echo $lang['index2']['title2']; ?></h3>
                                            <br />
                                            <span style="font-weight:bold;"><?php echo $lang['index2']['desc2']; ?></span>
										</div>
										<div class="stage-arrow stage-arrow-1"></div>
									</div>
									<div class="stage-content stage-content2" style="background-image: url(http://www.travian.com/tvbox_image.php?size=big&id=3)">
                                    	<div style="position:absolute; left:15px; top:170px;">
                                        	<img alt="" class="bbArrow" src="img/x.gif" />
                                            <span style="color:black;"><span style="font-weight:bold;"><?php echo $lang['index2']['text3']; ?></span></span>
										</div>
                                        <div style="position:absolute; left:15px; top:12px;">
                                            <h3><?php echo $lang['index2']['title3']; ?></h3>
                                            <br />
                                            <span style="font-weight:bold;"><?php echo $lang['index2']['desc3']; ?></span>
                                        </div>
										<div class="stage-arrow stage-arrow-2"></div>
									</div>
                                    <div id="stage-nav">
                                        <ul id="buttons">
                                            <li class="b0 act0" style="background-image: url(http://www.travian.com/tvbox_image.php?size=small&id=1)">&nbsp;</li>
                                            <li class="b1" style="background-image: url(http://www.travian.com/tvbox_image.php?size=small&id=2)">&nbsp;</li>
                                            <li class="b2" style="background-image: url(http://www.travian.com/tvbox_image.php?size=small&id=3)">&nbsp;</li>
                                        </ul>
                                    </div>
								</div>
								<div id="stage-bg"></div>
								<div id="stage-fg">
                                	<div class="stage-links">
                                    	<a class="stage-link stage-link1 shown" href="<?php echo $lang['index2']['link1']; ?>"></a>
                                        <a class="stage-link stage-link2" href="<?php echo $lang['index2']['link2']; ?>"></a>
                                        <a class="stage-link stage-link3" href="<?php echo $lang['index2']['link3']; ?>"></a>
									</div>
                                    <div id="stage-nav-click">
                                    	<ul id="buttons-click">
											<li class="b0 act0">&nbsp;</li>
											<li class="b1">&nbsp;</li>
											<li class="b2">&nbsp;</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div id="wit-bottom"></div>
					</div>
					<div id="moreabttravian">
						<div id="find-out-more">
							<div id="strip-head">
                            	<div><?php echo $lang['index2']['learn more']; ?></div>
                            </div>
							<div id="strip">
								<ul id="strips">
					                <li class="stip0">&nbsp;</li>
                					<li class="stip1">&nbsp;</li>
                					<li class="stip2">&nbsp;</li>
                					<li class="stip3">&nbsp;</li>
                					<li class="stip4">&nbsp;</li>
                					<li class="stip5">&nbsp;</li>
            					</ul>
    					    </div>
                            <div id="strip-details">
                                <div class="details">
                                    <div class="details-top"></div>
                                    <div class="details-l-top"></div>
                                    <div class="details-r-top"></div>
                                    <div class="details-body">
                                        <div class="details-body-l" id="strip-c1"></div>
                                        <div class="details-body-r"><?php echo $lang['index2']['strip1']; ?><br /><br />
                                            <div class="btn-green">
                                                <div class="btn-green-l"></div>
                                                <div class="btn-green-c"><a class="npage popcon" href="#tutorial"><?php echo GAME_TOUR; ?></a></div>
                                                <div class="btn-green-r"></div>
                                            </div>
                                        </div>
								</div>
								<div class="details-l-bottom"></div>
								<div class="details-r-bottom"></div>
								<div class="details-bottom"></div>
							</div>
							<div class="details">
								<div class="details-top"></div>
								<div class="details-l-top"></div>
                                <div class="details-r-top"></div>
								<div class="details-body">
									<div class="details-body-l" id="strip-c2"></div>
									<div class="details-body-r"><?php echo $lang['index2']['strip2']; ?><br /><br />
										<div class="btn-green">
											<div class="btn-green-l"></div>
											<div class="btn-green-c"><a class="npage popcon" href="#tutorial"><?php echo GAME_TOUR; ?></a></div>
											<div class="btn-green-r"></div>
										</div>
									</div>
								</div>
								<div class="details-l-bottom"></div>
                                <div class="details-r-bottom"></div>
								<div class="details-bottom"></div>
							</div>
							<div class="details">
								<div class="details-top"></div>
								<div class="details-l-top"></div>
                                <div class="details-r-top"></div>
								<div class="details-body">
									<div class="details-body-l" id="strip-c3"></div>
									<div class="details-body-r"><?php echo $lang['index2']['strip3']; ?><br /><br />
									<div class="btn-green">
										<div class="btn-green-l"></div>
										<div class="btn-green-c"><a class="npage popcon" href="#tutorial"><?php echo GAME_TOUR; ?></a></div>
										<div class="btn-green-r"></div>
									</div>
								</div>
							</div>
							<div class="details-l-bottom"></div>
                            <div class="details-r-bottom"></div>
							<div class="details-bottom"></div>
						</div>
						<div class="details">
							<div class="details-top"></div>
							<div class="details-l-top"></div>
                            <div class="details-r-top"></div>
							<div class="details-body">
								<div class="details-body-l" id="strip-c4"></div>
								<div class="details-body-r"><?php echo $lang['index2']['strip4']; ?><br /><br />
									<div class="btn-green">
										<div class="btn-green-l"></div>
										<div class="btn-green-c"><a class="npage popcon" href="#tutorial"><?php echo GAME_TOUR; ?></a></div>
										<div class="btn-green-r"></div>
									</div>
								</div>
							</div>
							<div class="details-l-bottom"></div>
                            <div class="details-r-bottom"></div>
							<div class="details-bottom"></div>
						</div>
						<div class="details">
							<div class="details-top"></div>
							<div class="details-l-top"></div>
                            <div class="details-r-top"></div>
							<div class="details-body">
								<div class="details-body-l" id="strip-c5"></div>
								<div class="details-body-r"><?php echo $lang['index2']['strip5']; ?><br /><br />
									<div class="btn-green">
										<div class="btn-green-l"></div>
										<div class="btn-green-c"><a class="npage popcon" href="#tutorial"><?php echo GAME_TOUR; ?></a></div>
										<div class="btn-green-r"></div>
									</div>
								</div>
							</div>
							<div class="details-l-bottom"></div>
                      		<div class="details-r-bottom"></div>
							<div class="details-bottom"></div>
						</div>
						<div class="details">
							<div class="details-top"></div>
							<div class="details-l-top"></div>
                            <div class="details-r-top"></div>
							<div class="details-body">
								<div class="details-body-l" id="strip-c6"></div>
								<div class="details-body-r"><?php echo $lang['index2']['strip6']; ?><br /><br />
									<div class="btn-green">
										<div class="btn-green-l"></div>
										<div class="btn-green-c"><a class="npage popcon" href="#tutorial"><?php echo GAME_TOUR; ?></a></div>
										<div class="btn-green-r"></div>
									</div>
								</div>
							</div>
							<div class="details-l-bottom"></div>
                            <div class="details-r-bottom"></div>
							<div class="details-bottom"></div>
						</div>
					</div>
				</div>
			</div>
			<div id="ssc-bg">
				<div id="ss-head">
					<div id="ss-head-left"></div>
					<div id="ss-head-right"></div>
					<h3 class="ss bold white"><?php echo SCREENSHOTS; ?></h3>
				</div>
				<div id="ss-container">
					<div id="g-widget">
                    	<a class="browse next"></a>
						<div id="gallery">
							<div id="g-items">
								<img src="img/x.gif" class="screen1" alt="" />
                                <img src="img/x.gif" class="screen2" alt="" />
                                <img src="img/x.gif" class="screen3" alt="" />
                                <img src="img/x.gif" class="screen4" alt="" />
                                <img src="img/x.gif" class="screen5" alt="" />
                                <img src="img/x.gif" class="screen6" alt="" />
                                <img src="img/x.gif" class="screen7" alt="" />
                                <img src="img/x.gif" class="screen8" alt="" />
							</div>
						</div>
						<a class="browse prev"></a>
					</div>
				</div>
			</div>
			<script type="text/javascript">
                window.addEvent('domready', function()
                {
                    //stage
                    var stagewidget = new stageWidget({
                        stagebg:$('stage-bg'),
                        stageduration: {
                            0:5000,
                            1:5000,
                            2:5000	        },
                        stagecon:$$(".stage-content"),
                        stagenav:$$("#buttons-click li"),
                        stagelink:$$(".stage-link"),
                    });
            
                    //tooltip
                    var tooltipwidget = new tooltipWidget({
                        tips: $$("#strips li"),
                        details:$$(".details")
                    });
                    //slider
                    var sliderwidget = new sliderWidget({
                        container: $$('#g-widget'),
                        pimgwidth:520,
                        head:$('prev_head'),
                        desc:$('prev_desc'),
                        prev_bg:$('overlaybg'),
                        prev_container:$('preview_container'),
                        prev_stage_container:$$('#preview_stage'),
                        prev_items:$('preview_items'),
                        close:$('close')
                    });
            
                    //slideshow [footer]
                    $('screenshotp').addEvents(
                    {
                        'click': function(e) {
                            e.stop();
                            this.fireEvent('show');
                        },
                        'show':function(e){
                            new sliderWidget({
                                container: $$('#g-widget'),
                                preview: false,
                                inpreview:true,
                                pimgwidth:520,
                                head:$('prev_head'),
                                desc:$('prev_desc'),
                                prev_bg:$('overlaybg'),
                                prev_container:$('preview_container'),
                                prev_stage_container:$$('#preview_stage'),
                                prev_items:$('preview_items'),
                                close:$('close'),
                                directcall:true
                            });
            
                        }
                    });
            
                    //popup anchor
                    var url = new URI();
                    var anchor = url.get('fragment');
                    if (anchor && anchor == 'screenshots')
                    {
                        $('screenshotp').fireEvent('show');
                    }
                });
            </script>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer-container">
		<div id="footer">
			<a class="flink popcon" href="#help"><?php echo SUPPORT; ?></a>&nbsp;|&nbsp;
            <a target="blank" class="flink" href="anleitung.php?s=3"><?php echo FAQ; ?></a>&nbsp;|&nbsp;
            <a class="flink popcon" href="#links"><?php echo LINKS; ?></a>&nbsp;|&nbsp;
            <a target="blank" class="flink" href="#screenshots" id="screenshotp"><?php echo SCREENSHOTS; ?></a>&nbsp;|&nbsp;
            <a class="flink popcon" href="#spielregeln"><?php echo SPIELREGELN; ?></a>&nbsp;|&nbsp;
            <a class="flink popcon" href="#agb"><?php echo AGB; ?></a>&nbsp;|&nbsp;
            <a class="flink popcon" href="#impressum"><?php echo IMPRINT; ?></a>
			<br />
			&copy; 2011 - <a target="blank" class="flink" href="#">ZravianX</a> - All rights reserved
		</div>
	</div>
	<div id="preview_container">
		<div id="p-top"></div>
		<div id="p-bg"></div>
		<div id="p-bottom"></div>
		<a class="close"></a>
		<div id="p-content">
			<div id="prev_head">
				<h3><?php echo SCREENSHOTS; ?></h3>
			</div>
			<div id="preview_stage">
			<a class="browse next"></a>
			<div id="preview_img">
				<div id="preview_items"></div>
			</div>
			<a class="browse prev"></a>
			<div class="clear"></div>
		</div>
		<div id="prev_desc"></div>
	</div>
</div>
<div id="popup">
	<div id="popup-top"><a class="pclose"></a></div>
	<div id="popup-content">
		<div class="loading"></div>
	</div>
	<div id="popup-bottom"></div>
</div>
<div id="overlaybg"></div>
<script type="text/javascript">
	var screenshots = [
		{'img':'screenBig screenBig1','hl':'<?php echo SCREENSHOTS_T4_TITLE1; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc1"]; ?>'},
		{'img':'screenBig screenBig2','hl':'<?php echo SCREENSHOTS_T4_TITLE2; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc2"]; ?>'},
		{'img':'screenBig screenBig3','hl':'<?php echo SCREENSHOTS_T4_TITLE3; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc3"]; ?>'},
		{'img':'screenBig screenBig4','hl':'<?php echo SCREENSHOTS_T4_TITLE4; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc4"]; ?>'},
		{'img':'screenBig screenBig5','hl':'<?php echo SCREENSHOTS_T4_TITLE5; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc5"]; ?>'},
		{'img':'screenBig screenBig6','hl':'<?php echo SCREENSHOTS_T4_TITLE6; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc6"]; ?>'},
		{'img':'screenBig screenBig7','hl':'<?php echo SCREENSHOTS_T4_TITLE7; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc7"]; ?>'},
		{'img':'screenBig screenBig8','hl':'<?php echo SCREENSHOTS_T4_TITLE8; ?>', 'desc':'<?php echo $lang["screenshots2"]["desc8"]; ?>'}
	];
</script>
</div>
</body>
</html>
