<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="fa">
<title>ACP :: <?php echo SERVER_NAME; ?></title>
<link rel="stylesheet" type="text/css" href="../img/admin/login.css">
</head>

<body>
<div align="center">
    <form action="login.php" method="post">
    <input type="hidden" name="action" value="login">
    <div class="login">
        <center><img border="0" src="../Templates/Manager/images/admin.gif"></center>
        <table style="margin-top:10px" align="center" cellpadding="0" cellspacing="3" width="300" height="142">
            <tr>
                <td height="19" width="70">
                <img border="0" src="images/breadcrumb_separator_arrow_1_dot.png" width="10" height="5">نام کاربری :</td>
                <td height="19" width="371" colspan="2"><input name="name" value="<?php echo $_SESSION['username']; ?>" maxlength="15"></td>
            </tr>
            <tr>
                <td height="21" width="70">
                <img border="0" src="images/breadcrumb_separator_arrow_1_dot.png" width="10" height="5">کلمه عبور :</td>
                <td height="21" width="371" colspan="2"><input name="pw" type="password" value="" maxlength="20"></td>
            </tr>
            <tr>
                <td height="19" width="157">
                <img border="0" src="images/breadcrumb_separator_arrow_1_dot.png" width="10" height="5">کد امنیتی :</td>
                <td height="19" width="131"><input name="img" maxlength="6" size="6"></td>
                <td height="19" width="131"><img border="0" src="img.php?code_section=[rand]"></td>
            </tr>
            <tr>
                <td colspan="3">
                <p align="center"><input name="submit" type="submit" value=" ورود " size="20" ></p>
                </td>
            </tr>
        
        </table>
    </div>
    </form>
</div>
</body>
</html>
