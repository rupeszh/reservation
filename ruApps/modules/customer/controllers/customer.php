<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Customer extends MY_Controller {

    protected $action = array();

    public function __construct() {
        parent::__construct();
        //loading all the required model
        $this->load->model('customer_model');
        $this->load->model('room/room_model');
        $this->load->model('floor/floor_model');
    }

    //display the list of the customer available
    public function index() {
       // debug($this->session->userdata('username'));
        //Set the page title and load page
        $data = array(
            'pagetitle' => 'Reservation System | customer',
            'loadpage' => 'list',
        );
        //get all the customer information 
        $data['customers'] = $this->customer_model->getCustomers();
        //get all the floor information
        $data['floors'] = $this->floor_model->getFloor();
        //get all the rooms informtation
        $data['rooms'] = $this->room_model->getRoom();
        //$data['payments'] = $this->payment_model->getPayment();       

        $this->load->view('layout', $data);
    }

    //For add and edit date of the customer
    public function addEdit($id = NULL) {
        //check if there is any input post data from the form 
        if ($this->input->post() != '') {
            //check the ci validation rules 
            $this->form_validation->set_rules('name', 'Fullname', 'required');
            $this->form_validation->set_rules('address', 'Address', 'required');
            $this->form_validation->set_rules('phone_no', 'Telephone', 'required');
            $this->form_validation->set_rules('date_of_contract', 'Contract Date', 'required');
            $this->form_validation->set_rules('no_of_people', 'No of People', 'required');
            $this->form_validation->set_rules('room_id', 'Select Room no', 'required');
            $this->form_validation->set_rules('floor_id', 'Select floor', 'required');

            if ($this->form_validation->run() == false) {
                //set session flashdata for the error display 
                $this->session->set_flashdata("error", "Something went wrong Please Try Again!!");
            } else {
                //listing all the input post data 
                $user_id = $this->session->userdata('user_id');
                $hidden_id = $this->input->post('hidden_id');
                $name = $this->input->post('name');
                $address = $this->input->post('address');
                $phone_no = $this->input->post('phone_no');
                $date_of_contract = $this->input->post('date_of_contract');
                $image = $this->input->post('image');
                $no_of_people = $this->input->post('no_of_people');
                $room_id = $this->input->post('room_id');
                $security_deposit = $this->input->post('security_deposit');
                $floor_id = $this->input->post('floor_id');

                $room_rent_charge = $this->input->post('room_rent_charge');
                $electric_rent_charge = $this->input->post('electric_rent_charge');
                $water_rent_charge = $this->input->post('water_rent_charge');
                $cable_rent_charge = $this->input->post('cable_rent_charge');
                //if upload image is available 
                $config['upload_path'] = "./assets/uploads/";
                $config['allowed_types'] = 'gif|png|jpg';
                //print_R($config);
                $this->load->library('upload', $config);
                $imgName = $_FILES['image']['name'];
               // print_R($imgName);
                if (!empty($imgName)) {
                    if (!$this->upload->do_upload('image')) {
                        $this->session->set_flashdata('error', "Smthing went wrong in uploading image.Try Again");
                        redirect('customer/index');
                    } 
                }
                
                //set all the post data of the customer info table in the array
                $form = array(
                    'name' => $name,
                    'room_id' => $room_id,
                    'floor_id' => $floor_id,
                    'address' => $address,
                    'phone_no' => $phone_no,
                    'no_of_people' => $no_of_people,
                    'security_deposit' => $security_deposit,
                    'date_of_contract' => $date_of_contract,
                    'created_date' => date('Y-m-d'),
                    'created_by' => $user_id,
                    'status' => 1
                );
                
                //check where the post data is for adding or updating 
                if (empty($hidden_id)) {
                    
                    //Insert customer ifno
                    $this->db->insert('ru_customer_info', $form);
                    $last_insert_id = $this->db->insert_id();
                     //Update image if available 
                    if ($imgName) {
                        $this->db->update('ru_customer_info', array('image' => $imgName), array('customer_id' => $last_insert_id));
                    }
                   
                    //Delete customer rent charges info so that it will reduce the duplication of the charge
                    $this->db->delete('ru_customer_rent_charges', array('customer_id' => $last_insert_id));


                    $rent_form = array(
                        'customer_id' => $last_insert_id,
                        'room_rent_charge' => $room_rent_charge,
                        'electricity_rent_charge' => $electric_rent_charge,
                        'water_rent_charge' => $water_rent_charge,
                        'cable_rent_charge' => $cable_rent_charge
                    );

                    //Insert the customer Rent charges
                    $this->db->insert('ru_customer_rent_charges', $rent_form);
                    //set session flashdata for displaying the sucess message
                    $this->session->set_flashdata("success", "Customer has been Inserted Sucessfully");
                } else { 
                    /**
                     * update customer info
                     */
                    $this->db->update('ru_customer_info', $form, array('customer_id' => $hidden_id));
                    //check Image upload on edit
                    if ($imgName) {
                        $this->db->update('ru_customer_info', array('image' => $imgName), array('customer_id' => $last_insert_id));
                    }
                    $rent_form = array(
                        'customer_id' => $hidden_id,
                        'room_rent_charge' => $room_rent_charge,
                        'electricity_rent_charge' => $electric_rent_charge,
                        'water_rent_charge' => $water_rent_charge,
                        'cable_rent_charge' => $cable_rent_charge
                    );
                    $this->db->update('ru_customer_rent_charges', $rent_form, array('customer_id' => $hidden_id));
                    
                    $this->session->set_flashdata("success", "Customer information has been Updated Sucessfully");
                }
            }
            //redirect to the customer index controller
            redirect('customer/index');
        } else {
            //redirect to the customer index controller
            redirect('customer/index');
        }
    }

    public function delete($customer_id = 0) {
        //Delete customer info 
        $this->db->delete('ru_customer_info', array('customer_id' => $customer_id));
        //Delete customer Rent charges info 
        $this->db->delete('ru_customer_rent_charges', array('customer_id' => $customer_id));
        //set flashdata to display the sucessfully deleted message
        $this->session->set_flashdata("success", "Data has been Deleted Sucessfully");
        //redirect to the customer
        redirect('customer/index');
    }
    
    public function getCustomerByAjax(){
        $customer_id = $this->input->post('customer_id');
        $customers = $this->customer_model->getCustomer($customer_id);
        
        echo json_encode($customers);
    }
    
    public function getReservedRoomByFloorIdAjax(){
        $floor_id = $this->input->post('floor_id');
        $reserved_room = array();
        //get all the empty room id
        $room_info = $this->room_model->getRoom();
        $reserved_room = $this->customer_model->getReservedRoomByFloorId($floor_id);
        echo json_encode($reserved_room); 
        
    }

}
