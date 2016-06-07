<?php

class Payment_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('common_model');
    }

    function getPayments() {
        $this->db->select('*');
        $this->db->from('ru_customer_payment');
        $this->db->join('ru_customer_info', 'ru_customer_info.customer_id = ru_customer_payment.customer_id', 'left');
        $this->db->join('ru_room', 'ru_room.room_id = ru_customer_info.room_id', 'left');
        $this->db->join('ru_floor', 'ru_floor.floor_id = ru_customer_info.floor_id', 'left');
        $result = $this->db->get();
        
        return $result->result();
    }
    

    function getPaymentById($payment_id = null) {
        $this->db->select('*');
        $this->db->where('payment_id', $payment_id);
        $result = $this->db->get('ru_customer_payment');

        return $result->result();
    }

}

?>