<?php

class Dashboard_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('common_model');
    }

    function getMonths() {
        $this->db->select('*');
        $this->db->from('ru_months');
        $result = $this->db->get();
        
        return $result->result();
    }

   

}

?>