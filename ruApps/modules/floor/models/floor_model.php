<?php

class Floor_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('common_model');
    }

    function getFloor() {
        $this->db->select('*');
        $result = $this->db->get('ru_floor');

        return $result->result();
    }

    function getFloorById($floor_id = null) {
        $this->db->select('*');
        $this->db->where('floor_id', $floor_id);
        $result = $this->db->get('ru_floor');

        return $result->result();
    }

}

?>