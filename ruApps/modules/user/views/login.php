<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- BEGIN CSS -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/login.css" />
        <!--  END CSS  -->
        <!--  BEGIN JS  -->
        <script src="<?php echo base_url(); ?>assets/js/login/jquery-1.9.1.js"></script>
        <script src="<?php echo base_url(); ?>assets/js/login/jquery.validate.js"></script>
        <!--  END JS  -->       

        <title>User Authentication Login Form</title>

    </head>
    <body>
        <div id="loginform">           

            <div class="logo">Reservation System</div>
            <div class="row error">
                <?php
                if ($this->session->flashdata('loginErr') != '') {
                    echo $this->session->flashdata('loginErr');
                }
                ?>
            </div>
            <form action="<?php echo base_url(); ?>user/admin" method="post" enctype="multipart/form-data" name="loginForm" id="loginForm" class="formLogin" autocomplete="off">
                <div class="row">
                    <img src="<?php echo base_url(); ?>assets/img/user.png" />
                    <input type="text" name="username" id="username" class="txt required" value="<?php echo set_value('username'); ?>" placeholder="Username"  title="Enter Username"/>
                </div>
                <?php echo form_error('username'); ?>
                <div class="row">
                    <img src="<?php echo base_url(); ?>assets/img/password.png" />
                    <input type="password" name="password" id="password" class="txt required" value="<?php echo set_value('password'); ?>" placeholder="Password"  title="Enter Password"/>
                </div>
                <?php echo form_error('password'); ?>
                <div class="row checkbox">
                    <input type="submit" name="loginBtn" id="loginBtn" class="btn btn-primary submit" value="Login" />
                </div>
            </form>
        </div>
    </body>

</html>
<script>
    $(function () {
        $("#loginForm").validate();
    });

</script>