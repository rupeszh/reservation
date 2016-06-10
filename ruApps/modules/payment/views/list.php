<?php 
require 'assets/carbon/Carbon.php';

use Carbon\Carbon;
$todaysDateInGregorian = Carbon::now();
//print_R($todaysDateInGregorian);die;
$currentDateInNepal = $todaysDateInGregorian->addYears(56)->addMonths(8)->addDays(15);
$date = DateTime::createFromFormat("Y-m-d H:i:s", $currentDateInNepal);
$currentNepaliDAte =  $date->format("Y");
?> 
<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">Payment Information </h3>
    </div>
    <!-- /.col-lg-12 -->
</div>
<?php if ($this->session->flashdata('error')) { ?>
    <div class="alert alert-error"> <a class="close" data-dismiss="alert">&times;</a> <?php echo $this->session->flashdata('error'); ?> </div>
<?php } ?>

<?php if ($this->session->flashdata('success')) { ?>
    <div class="alert alert-success"> <a class="close" data-dismiss="alert">&times;</a> <?php echo $this->session->flashdata('success'); ?> </div>
<?php } ?>
<!-- Modal -->
<div class="modal fade" id="myPaymentForm" tabindex="-1" role="dialog" aria-labelledby="myPaymentFormLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Payment Form</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-14">
                        <div class="col-lg-12">
                            <form action="<?php echo base_url('payment/search'); ?>"  method="post" enctype="multipart/form-data" id="paymentForm" name="paymentForm" class="form-horizontal">

                                <div class="panel panel-default">
                                    <div class="panel-heading"><h4>Payment By customer</h4></div>
                                    <div class="panel-body">
                                        <input type="hidden" name="hidden_id"  id="hidden_id" value="">
                                        <div class="col-md-4">
                                            <p>Select Customer</p>
                                            <div class="form-group">
                                                <select class="form-control" id="payment_by_customer_id" name="payment_by_customer_id">
                                                    <option value="">select Customers</option>
                                                    <?php foreach ($customers as $customer) { ?>
                                                        <option value="<?php echo $customer->customer_id; ?>"><?php echo $customer->name; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <p>Select Floor</p>
                                            <div class="form-group">
                                                <select class="form-control" id="payment_by_floor_id" name="payment_by_floor_id">
                                                    <option value="">select the floor</option>
                                                    <?php foreach ($floors as $floor) { ?>
                                                        <option value="<?php echo $floor->floor_id; ?>"><?php echo $floor->name; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <p>Select Room</p>
                                            <div class="form-group">
                                                <select class="form-control" id="payment_by_room_id" name="payment_by_room_id">
                                                    <option value="">select Room</option>
                                                    <?php foreach ($rooms as $room) { ?>
                                                        <option value="<?php echo $room->room_id; ?>"><?php echo $room->name; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"><h4>Rent Charges Per Month</h4></div>
                                <div class="panel-body">


                                    <div class="form-group">
                                        <label for="room_rent_charges" class="control-label col-xs-4">Room Charge<span class="alert-danger alert-link">*</span> :</label>
                                        <div class="col-xs-8">
                                            <input type="text" class="form-control required" id="room_rent_charge" name="room_rent_charge" placeholder="Amount">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="electric_rent_charge" class="control-label col-xs-4"> Electric Charge:</label>
                                        <div class="col-xs-8">
                                            <input type="text" class="form-control " id="electric_rent_charge" name="electric_rent_charge" placeholder="Amount">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="water_rent_charge" class="control-label col-xs-4">Water Charge :</label>
                                        <div class="col-xs-8">
                                            <input type="text" class="form-control " id="water_rent_charge" name="water_rent_charge" placeholder="Amount">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="cable_rent_charge" class="control-label col-xs-4">Cable Charge :</label>
                                        <div class="col-xs-8">
                                            <input type="text" class="form-control " id="cable_rent_charge" name="cable_rent_charge" placeholder="Amount">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="SaveBtn" name="SaveBtn" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script>
    $(document).ready(function () {
        $('#date_of_contract').nepaliDatePicker();
        $("#customerForm").validate();

        $('#SaveBtn').click(function (e) {
            e.preventDefault();
            $('#customerForm').submit();
        })
        $('#payment_by_room_id').change(function () {
            var floor_id = $('#payment_by_floor_id').val();
            if (floor_id == '') {
                alert('Please select the floor to choose the room');
                return false;
            }
        })
        $('#phone_no,#room_rent_charge,#electric_rent_charge,#water_rent_charge,#cable_rent_charge').keypress(function (event) {
            var dInput = this.value;
            var keyCode = (event.which) ? event.which : event.keyCode

            if (keyCode > 31 && (keyCode != 46 || $(this).val().indexOf('.') != -1) && (keyCode < 48 || keyCode > 57)) {
                return false;
            }

        });

    });
</script>
<!-- /.modal -->
<div class="row">
    <div class="col-lg-12">

        <!-- /.panel-heading -->
        <div class="panel-body">
            <div class="row show-grid">
                <button class="btn btn-primary btn-large" data-toggle="modal" data-target="#myPaymentForm">Payment</button>
<!--                <div class="col-md-12">
                    <h3> Advance Payment Search</h3>
                    <div class="row show-grid">
                        <div class="col-md-4">
                            <p>Select Customer</p>
                            <div class="form-group">
                                <select class="form-control" id="floor_id" name="floor_id">
                                    <option value="">select Customers</option>
                                    <?php foreach ($customers as $customer) { ?>
                                        <option value="<?php echo $customer->customer_id; ?>"><?php echo $customer->name; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>                       
                        <div class="col-md-4">
                            <p>Select Year</p>
                            <div class="form-group">
                                <select class="form-control " id="Year" name="year">

                                    <option value="">select Year</option>
                                    <?php for ($i = 2072; $i <= 2072 + 10; $i++) { ?>
                                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <p>Select Month</p>
                            <div class="form-group">
                                <select class="form-control" id="Year" name="year">
                                    <option value="">select Month</option>
                                    <?php foreach ($months as $month) { ?>
                                        <option value="<?php echo $month->month_id; ?>"><?php echo $month->name; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row show-grid">

                        <div class="col-md-4">
                            <p>Select Floor</p>
                            <div class="form-group">
                                <select class="form-control" id="floor_id" name="floor_id">
                                    <option value="">select the floor</option>
                                    <?php foreach ($floors as $floor) { ?>
                                        <option value="<?php echo $floor->floor_id; ?>"><?php echo $floor->name; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <p>Select Room</p>
                            <div class="form-group">
                                <select class="form-control" id="room_id" name="room_id">
                                    <option value="">select Room</option>
                                    <?php foreach ($rooms as $room) { ?>
                                        <option value="<?php echo $room->room_id; ?>"><?php echo $room->name; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-success btn-lg btn-block" type="button" name="advSearch" id="advSearch">Search</button>
                        </div>


                    </div>
                </div>-->
            </div>
            <?php 

            ?>
            <nav>
                <ul class="pagination">
                  <li>
                    <a href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <?php for($i = 2070;$i<= $currentNepaliDAte+1;$i++) {  ?> 
                       <li <?php if($i == $currentNepaliDAte) { ?>class="active" <?php }?>><a href="#"><?php echo $i;?></a></li>
                  <?php } ?>
                 
                  <li>
                    <a href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>

            <!-- /.table-responsive -->
            <div class="dataTable_wrapper">
                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>S.N</th>
                            <th width="12%">Customer Name</th> 
                            <th>Floor No</th>
                            <th>Room No</th>

                            <?php foreach ($months as $month) { ?>
                            <th class="nepaliMonth" ><?php $month_name =  $month->name; echo substr($month_name, 0, 5);  ?></th>
                            <?php } ?>

                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($customers) {
                            $sn = 1;
                            foreach ($customers as $customer) { //print_R($customer);
                                ?>
                                <tr class="odd gradeX">
                                    <td><?php echo $sn; ?></td>
                                    <td><?php echo $customer->name; ?></td>
                                    <td><?php echo $customer->floor_id; ?></td>
                                    <td><?php echo $customer->room_id; ?></td>
                                    <?php
                                    //echo date('Y');
                                    // [room_rent_charge] => 3200 [water_rent_charge] => 0 [electricity_rent_charge] => 0 [cable_rent_charge] => 0 
                                    //echo $customer->date_of_contract;
                                    //GET THE MONTH OF THE CONTRACT
                                    //GET MONTH NAME FROM THE MONTH TABLE
                                    //DISPLAY THE PAYMENT AMOUNT OF EACH MONTH
                                    ?>
                                    <?php foreach ($months as $month) { ?>
                                    <td><?php echo $customer->room_rent_charge + $customer->water_rent_charge + $customer->electricity_rent_charge + $customer->cable_rent_charge;?> </td>
                                    <?php } ?>
                                </tr>
                                <?php
                                $sn++;
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>

<!-- /.row -->

<style>
    .form-horizontal .control-label {
        text-align: left !important;
    }
    #name {text-transform:capitalize;}
    .reset {
        margin-left: -308px;
        margin-top: 884px;
        padding: 6px;
        position: absolute;
        z-index: 2000;
    </style>
    <!-- DataTables JavaScript -->
    <script src="<?php echo base_url(); ?>assets/sb-admin/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/sb-admin/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <script>
    $(document).ready(function () {
        $('#paymentForm')[0].reset();
        $('#dataTables-example').DataTable({
            responsive: true
        });

    });

    //display the empty room on change floor 
    $("#floor_id").on('change', function () {
        var floor_id = $(this).val();
        //alert(floor_id);return false;
        $.ajax({
            url: "<?php echo base_url(); ?>payment/getpaymentByFloorIdAjax",
            type: 'post',
            data: {floor_id: floor_id},
            dataType: 'json',
            success: function (data) {
                //find the room with value obtain and make it disabled
                $("#room_id option").each(function () {
                    var $thisOption = $(this);
                    if (data != '') {
                        for (var i = 0; i < data.length; i++) {
                            var valueToCompare = data[i].room_id;

                            if ($thisOption.val() == valueToCompare) {
                                $thisOption.attr("disabled", "disabled");
                                $thisOption.css('color', 'red');
                            }
                        }
                    } else {
                        $thisOption.removeAttr('disabled', 'disabled');
                        $thisOption.css('color', '#555');
                    }
                });


                return false;
            }
        });

    });


    </script>