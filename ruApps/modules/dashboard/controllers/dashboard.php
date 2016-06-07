<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    protected $action = array();

    public function __construct() {
        parent::__construct();  
        
        $this->load->model('customer/customer_model');
        $this->load->model('room/room_model');
        $this->load->model('floor/floor_model');
        //$this->load->model('payment/payment_model');
        
    }

    public function index() {
        ;
        $data = array(
                'pagetitle' => 'Reservation System',
                'loadpage' => 'dashboard', 
            );
        
        $data['customers'] = $this->customer_model->getCustomers();
        $data['floors'] = $this->floor_model->getFloor();
        $data['rooms'] = $this->room_model->getRoom();
       //$data['payments'] = $this->payment_model->getPayment();       

        $this->load->view('layout', $data);
       
    }
    
   
    
    public function saveIncome(){
        
        if($this->input->post()){
         $year = $this->input->post('income_year');
         $month = $this->input->post('income_month');
         $day = $this->input->post('income_day');
         $company = $this->input->post('income_company');
         $amount = $this->input->post('income_amount');
         $added_date = date('Y-m-d H:i:s');
         $data = array(                
                'company'=>$company,
                'amount'=>$amount,
                'year'=>$year,
                'month'=>$month,
                'day'=>$day,
                'added_date'=>$added_date
         );
         
        $this->db->insert('ru_income', $data);
        $this->session->set_flashdata("success", "Data has been Updated Sucessfully");
        
        }
        redirect('dashboard');
    }
    
    public function savePlan(){        
        if($this->input->post()){
         $title = $this->input->post('plan_title');
         $description = $this->input->post('plan_description');
        
         $added_date = date('Y-m-d H:i:s');
         $data = array(                
                'title'=>$title,
                'description'=>$description,
                'added_date'=>$added_date
         );
         
        $this->db->insert('ru_plans', $data);
       
        $this->session->set_flashdata("success", "Data has been Updated Sucessfully");
        
        }
        redirect('dashboard');
    }

}
