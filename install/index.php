
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Travian Installation</title>
		<meta http-equiv="cache-control" content="max-age=0" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="imagetoolbar" content="no" />
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="content-language" content="en" />
		<link href="../gpack/travian_Travian_4.0_41/lang/ir/compact.css" rel="stylesheet" type="text/css" />
        <link href="../gpack/travian_Travian_4.0_41/lang/ir/lang.css" rel="stylesheet" type="text/css" />
        <link href="../img/travian_basics2.css" rel="stylesheet" type="text/css" />
		<script src="../mt-core.js?0faaa" type="text/javascript"></script>
		<script src="../mt-more.js?0faaa" type="text/javascript"></script>
		<script src="../unx.js?0faaa" type="text/javascript"></script>
		<script src="../new.js?0faaa" type="text/javascript"></script>

</head>
<body class="v35 webkit chrome login">
<div id="wrapper">
<img id="staticElements" src="img\x.gif" alt="" />
<div class="bodyWrapper">
					
<img style="filter:chroma();" src="img\x.gif" id="msfilter" alt="" />
<div id="header">
<div id="mtop">
<a id="logo" href="#" target="_blank" title="Travian"></a>
<div class="clear"></div>
</div>
</div>
<div id="mid">


<div id="side_navi">
<ul>

<?php include("templates/menu.tpl"); ?>
</ul>
</div>
<div class="clear"></div>
						<div id="contentOuterContainer">
							<div class="contentTitle">&nbsp;</div>
							<div class="contentContainer">
								<div id="content" class="statistics">
<h1 class="titleInHeader">TravianT4 Installation Script</h1>
                <?php 
                if(!isset($_GET['s'])) {
                include("templates/greet.tpl");
                }
                else {
                    switch($_GET['s']){
                        case 1:
                        include("templates/config.tpl");
                        break;
                        case 2:
                        include("templates/dataform.tpl");
                        break;
                        case 3:
                        include("templates/field.tpl");
                        break;
                        case 4:
                        include("templates/multihunter.tpl");
                        break;
                        case 5:
                        include("templates/oasis.tpl");
                        break;
                        case 6:
                        include("templates/end.tpl");
                        break;
                    }
                }
                ?>
<div class="clear">&nbsp;</div></div>
<div class="clear"></div></div>
<div class="contentFooter">&nbsp;</div></div>
		<div id="side_info">
        
            
		</div>
        
        <div class="clear"></div>
				</div>

		</div>

<div id="ce"></div>
</div>
</body>
</html>