<link rel="stylesheet" type="text/css" href="../img/admin/login.css">
<div align="center">
    <form action="index.php" method="post">
    <input type="hidden" name="action" value="login">
    <div class="login">
        <div align="center"><img border="0" src="../img/admin/admin.gif"></div>
        <table style="margin-top:20px" align="center" cellpadding="3" cellspacing="3" width="300" height="142">
        <h4>ورود به کنترل پانل</h4>
        <div style="color:#F00;">
        <?php
            if(isset($_GET['error'])){
            	if($_GET['error']==1){
                	echo 'Username or password is incorrect.';
                }elseif($_GET['error']==2){
                	echo 'Please enter the code carefully.';
                }
            }
        ?></div>
            <tr>
                <td height="19" width="70">
                <img border="0" src="../img/admin/breadcrumb_separator_arrow_1_dot.png" width="10" height="5">نام کاربری :</td>
                <td height="19" width="371" colspan="2"><input name="name" type="text" value="<?php echo $_SESSION['username']; ?>" maxlength="15"></td>
            </tr>
            <tr>
                <td height="21" width="70">
                <img border="0" src="../img/admin/breadcrumb_separator_arrow_1_dot.png" width="10" height="5">کلمه عبور :</td>
                <td height="21" width="371" colspan="2"><input name="pw" type="password" value="" maxlength="20"></td>
            </tr>
            <tr>
                <td height="19" width="157">
                <img border="0" src="../img/admin/breadcrumb_separator_arrow_1_dot.png" width="10" height="5">کد امنیتی :</td>
                <td height="19" width="131"><input name="img" maxlength="6" size="6"></td>
                <td height="19" width="131"><img border="0" src="img.php?code_section=<?php echo time(); ?>"></td>
            </tr>
            <tr>
                <td colspan="3">
                <p align="center">
                <button type="submit" class="loginbtn" value=""><img width="80" height="20" src="../img/admin/b/l1.gif" /></button> 
                </p>
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</div>
