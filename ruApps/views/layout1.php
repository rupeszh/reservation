<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>

        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title><?php echo $pagetitle;?></title>
        
        

        <link rel="stylesheet"  href="<?php echo base_url(); ?>assets/themes/css/reset.css" media="screen" />

        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/themes/css/text.css" media="screen" />

        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/themes/css/grid.css" media="screen" />

        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/themes/css/layout.css" media="screen" />

        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/themes/css/nav.css" media="screen" />


        <!-- BEGIN: load jquery -->

        <script src="<?php echo base_url(); ?>assets/themes/js/jquery-1.6.4.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="<?php echo base_url(); ?>assets/themes/js/jquery-ui/jquery.ui.core.min.js"></script>

        <script src="<?php echo base_url(); ?>assets/themes/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>

        <script src="<?php echo base_url(); ?>assets/themes/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>

        <script src="<?php echo base_url(); ?>assets/themes/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>

        <script src="<?php echo base_url(); ?>assets/themes/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>

        <!-- END: load jquery -->

       

        <script src="<?php echo base_url(); ?>assets/themes/js/setup.js" type="text/javascript"></script>

       

        <script type="text/javascript">

            $(window).load(function () {

                $('#demo-side-bar').removeAttr('style');

            });

        </script>

        <style type="text/css">

            #demo-side-bar{left:90%!important;display:block!important;}

            #branding .floatright{margin-right:130px!important;}

        </style>

        <!--Dynamically creates ads markup-->



        <div class="container_12">

            <div class="grid_12 header-repeat">

                <div id="branding">

                    <div class="floatleft">

                        <img src="<?php echo base_url(); ?>assets/themes/images/logo.png" alt="Logo" /></div>

                    <div class="floatright">

                        <div class="floatleft">

                            <img src="<?php echo base_url(); ?>assets/themes/images/img-profile.jpg" alt="Profile Pic" /></div>

                        <div class="floatleft marginleft10">

                            <ul class="inline-ul floatleft">

                                <li>Hello Admin</li>

                                <li><a href="#">Config</a></li>

                                <li><a href="#">Logout</a></li>

                            </ul>

                            <br />

                            <span class="small grey">Last Login: 3 hours ago</span>

                        </div>

                    </div>

                    <div class="clear">

                    </div>

                </div>

            </div>

            <div class="clear">

            </div>

            <div class="grid_12">

                <ul class="nav main">

                    <li class="ic-dashboard"><a href="<?php echo base_url('dashboard');?>"><span>Dashboard</span></a> </li>

                    <li class="ic-form-style"><a href="<?php echo base_url('customer');?>"><span>Customer</span></a></li>

                    <li class="ic-typography"><a href="<?php echo base_url('payment');?>"><span>Payment</span></a></li>

                    

                    <li class="ic-gallery dd"><a href="javascript:"><span>Image Galleries</span></a>

                        <ul>

                            <li><a href="<?php echo base_url('gallery');?>">Pretty Photo</a> </li>

                        </ul>

                    </li>

                    <li class="ic-notifications"><a href="notifications.html"><span>Notifications</span></a></li>



                </ul>

            </div>

            <div class="clear">

            </div>

            

             <?php $this->load->view($loadpage);?>

            <div class="clear">

            </div>

        </div>

        <div class="clear">

        </div>

        <div id="site_info">

            <p>

                Copyright <a href="#">BlueWhale Admin</a>. All Rights Reserved.

            </p>

        </div>

        <div id="demo-side-bar">



        </div>

        </div>

        <!--wrapper end-->

        <!--Dynamically creates analytics markup-->



        </body>

</html>

