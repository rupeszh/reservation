<?php

class Customer_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('common_model');
    }

    function getCustomers() {
        $this->db->select('ru_customer_info.*,ru_customer_rent_charges.*,ru_room.name as room_name,ru_floor.name as floor_name');
        $this->db->from('ru_customer_info');
        $this->db->join('ru_customer_rent_charges', 'ru_customer_rent_charges.customer_id = ru_customer_info.customer_id', 'left');
        $this->db->join('ru_room', 'ru_room.room_id = ru_customer_info.room_id', 'left');
        $this->db->join('ru_floor', 'ru_floor.floor_id = ru_customer_info.floor_id', 'left');
        $result = $this->db->get();

        return $result->result();
    }

    function getCustomer($customer_id = null) {
        $this->db->select('ru_customer_info.*,ru_customer_rent_charges.*,ru_room.name as room_name,ru_floor.name as floor_name');
        $this->db->from('ru_customer_info');
        $this->db->join('ru_customer_rent_charges', 'ru_customer_rent_charges.customer_id = ru_customer_info.customer_id', 'left');
        $this->db->join('ru_room', 'ru_room.room_id = ru_customer_info.room_id', 'left');
        $this->db->join('ru_floor', 'ru_floor.floor_id = ru_customer_info.floor_id', 'left');
        $this->db->where('ru_customer_info.customer_id', $customer_id);
        $result = $this->db->get();

        return $result->row();
    }
    
    public function getReservedRoomByFloorId($floor_id){
        $this->db->select('room_id');
        $this->db->from('ru_customer_info');
        $this->db->where('floor_id',$floor_id);
        $result = $this->db->get();
        
        return $result->result();
    }
}

?>