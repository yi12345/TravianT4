<div style="margin-right:420px; margin-top:-10px;">
    <img border="0" src="../img/admin/logoBig.png">
    <div style="margin-right:-578px; margin-top:-70px;">
        <div class="point2">Today <b><?php echo jdate('l j F Y'); ?></b> مي باشد .</div>
        <div class="point2"><?php if($_SESSION['access'] == MULTIHUNTER) { echo '<b><font color="Blue">Multihunter</font></b>'; } elseif($_SESSION['access'] == ADMIN){ echo '<b><font color="Red">Administrator</font></b>'; } ?> عزیز به مدیریت سیستم خوش آمدید ! خسته نباشید .</div>
        <div class="point2">IP: <?php echo $_SERVER['REMOTE_ADDR']; ?></div>
    </div>
</div>
