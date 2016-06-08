<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">Customers<div style="float:right" ><button class="btn btn-primary btn-large" data-toggle="modal" data-target="#myCustomerForm"> Create New customers </button></h3>
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
<div class="modal fade" id="myCustomerForm" tabindex="-1" role="dialog" aria-labelledby="myCustomerFormLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Customers Registration Form</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-lg-14">
                        <form action="<?php echo base_url('customer/addEdit'); ?>"  method="post" enctype="multipart/form-data" id="customerForm" name="customerForm" class="form-horizontal">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading"><h4>Customer's Detail</h4></div>
                                    <div class="panel-body">
                                        <input type="hidden" name="hidden_id"  id="hidden_id" value="">


                                        <div class="form-group">
                                            <label for="name" class="control-label col-xs-4">FullName<span class="alert-danger alert-link">*</span> :</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control required" id="name" name="name" placeholder="Full Name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="address" class="control-label col-xs-4">Address<span class="alert-danger alert-link">*</span> :</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control required" id="address" name="address" placeholder="Address">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="telephone" class="control-label col-xs-4">Telephone No<span class="alert-danger alert-link">*</span> :</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control required" id="phone_no" name="phone_no" placeholder="telephone">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="telephone" class="control-label col-xs-4">No of People<span class="alert-danger alert-link">*</span> :</label>
                                            <div class="col-xs-8">
                                                <select class="form-control required" id="no_of_people" name="no_of_people">
                                                    <option value="">select no of people</option>
                                                    <?php for ($i = 1; $i <= 10; $i++) { ?>
                                                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="floor_id" class="control-label col-xs-4">Floor<span class="alert-danger alert-link">*</span> :</label>
                                            <div class="col-xs-8">
                                                <select class="form-control required" id="floor_id" name="floor_id">
                                                    <option value="">select the floor</option>
                                                    <?php foreach ($floors as $floor) { ?>
                                                        <option value="<?php echo $floor->floor_id; ?>"><?php echo $floor->name; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="room_id" class="control-label col-xs-4">Room No<span class="alert-danger alert-link">*</span> :</label>
                                            <div class="col-xs-8">
                                                <select class="form-control required" id="room_id" name="room_id">
                                                    <option value="">Select the room</option>
                                                    <?php foreach ($rooms as $room) { ?>
                                                        <option id="rooom<?php echo $room->room_id;?>" value="<?php echo $room->room_id; ?>"><?php echo $room->name; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div> 

                                        <div class="form-group">
                                            <label for="date_of_contract" class="control-label col-xs-4">Date of Contract<span class="alert-danger alert-link">*</span> :</label>
                                            <div class="col-xs-8">
                                                <input  type="text" class="form-control required" placeholder="click to show datepicker" name="date_of_contract" id="date_of_contract">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="security_deposit" class="control-label col-xs-4">Security Deposit :</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control" id="security_deposit" name="security_deposit" placeholder="Security deposit">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="Images" class="control-label col-xs-4">Images :</label>
                                            <div class="col-xs-8">
                                                <input type="file" name="image"  id="image" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                        </form>

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
        <div class="panel panel-default">
            <div class="panel-heading">
                <div >List of Customer Details</div>

            </div>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            <!-- /.table-responsive -->
            <div class="dataTable_wrapper">
                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>S N </th>
                            <th>Name</th>
                            <th>Floor</th>
                            <th>Room</th>
                            <th>Contact No</th>
                            <th>Date of Contract</th>
                            <th>Charge/Month</th>
                            <th width="10%">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($customers) {
                            $sn = 1;
                            foreach ($customers as $customer) { //print_r($customer);
                                ?>
                                <tr class="odd gradeX">
                                    <td><?php echo $sn; ?></td>
                                    <td><?php echo $customer->name; ?></td>
                                    <td><?php echo $customer->floor_name; ?></td>
                                    <td><?php echo $customer->room_name; ?></td>
                                    <td><?php echo $customer->phone_no; ?></td>
                                    <td><?php echo $customer->date_of_contract; ?></td>
                                    <td><?php echo $customer->room_rent_charge + $customer->water_rent_charge + $customer->electricity_rent_charge + $customer->cable_rent_charge; ?></td>

                                    <td class="left"><button onclick="EditCustomer(<?php echo $customer->customer_id; ?>)" class="btn btn-primary btn-circle" type="button">
                                            <i class="fa fa-edit"></i>
                                        </button>&nbsp;&nbsp;<a href="<?php echo base_url('customer/delete/' . $customer->customer_id); ?>" onclick="return confirm('Are you sure you want to Delete?');" >
                                            <button class="btn btn-danger btn-circle " type="button">
                                                <i class="fa fa-remove"></i>
                                            </button>
                                        </a>
                                    </td>
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
        $('#customerForm')[0].reset();
        $('#dataTables-example').DataTable({
            responsive: true
        });

    });
    function EditCustomer(id = null) {
        $('#customerForm')[0].reset();
        var customer_id = id;
        $('#hidden_id').val('');
        $("#name").val('');
        $("#address").val('');
        $("#phone_no").val('');
        $("#no_of_people").val('');
        $("#date_of_contract").val('');
        $("#floor_id").val('');
        $("#room_id").val('');
        $("#room_rent_charge").val('');
        $("#cable_rent_charge").val('');
        $("#water_rent_charge").val('');
        $("#electric_rent_charge").val('');
        $("#security_deposit").val('');
        $('#myCustomerForm').modal('show');
        $.ajax({
            url: "<?php echo base_url(); ?>customer/getCustomerByAjax",
            type: 'post',
            data: {customer_id: customer_id},
            dataType: 'json',
            success: function (data) {
                if (data) {
                    $('#hidden_id').val(data.customer_id);
                    $("#name").val(data.name);
                    $("#address").val(data.address);
                    $("#phone_no").val(data.phone_no);
                    $("#no_of_people").val(data.no_of_people);
                    $("#date_of_contract").val(data.date_of_contract);
                    $("#floor_id").val(data.floor_id);
                    $("#floor_id").attr("disabled", "disabled");
                    $("#room_id").val(data.room_id);
                    $("#room_id").attr("disabled", "disabled");
                    $("#room_rent_charge").val(data.room_rent_charge);
                    $("#cable_rent_charge").val(data.cable_rent_charge);
                    $("#water_rent_charge").val(data.water_rent_charge);
                    $("#electric_rent_charge").val(data.electricity_rent_charge);
                    $("#security_deposit").val(data.security_deposit);
                    $('#myCustomerForm').modal('show');
                }
                return false;
            }
        });
    }
    //display the empty room on change floor 
    $("#floor_id").on('change', function () {
        var floor_id = $(this).val();
        $.ajax({
            url: "<?php echo base_url(); ?>customer/getReservedRoomByFloorIdAjax",
            type: 'post',
            data: {floor_id: floor_id},
            dataType: 'json',
            success: function (data) {
                        //find the room with value obtain and make it disabled
                       $("#room_id option").each(function() {
                            var $thisOption = $(this);
                            if (data != '') { 
                             for(var i = 0; i < data.length; i++){
                                var valueToCompare = data[i].room_id;

                                    if($thisOption.val() == valueToCompare) {
                                        $thisOption.attr("disabled", "disabled");
                                        $thisOption.css('color','red');
                                    }
                                 }
                            }else{ 
                                $thisOption.removeAttr('disabled','disabled');
                                $thisOption.css('color','#555');
                            }
                        });
                   
                
                return false;
            }
        });

    });


</script>