<?php

class Room_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('common_model');
    }

    function getRoom() {
        $this->db->select('*');
        $result = $this->db->get('ru_room');

        return $result->result();
    }

    function getRoomById($room_id = null) {
        $this->db->select('*');
        $this->db->where('room_id', $room_id);
        $result = $this->db->get('ru_room');

        return $result->result();
    }
    
    public function getUnreservedRoom($room_id = null) {
        $this->db->select('*');
        $this->db->where('room_id !=',$room_id);
        $result = $this->db->get('ru_room');

        return $result->result();
    }

}

?>