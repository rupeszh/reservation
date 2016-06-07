<?php

class login_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->user = 'ru_user';
    }

    function login_act($condition) {
        $this->db->select('*');
        $this->db->where($condition);

        $result = $this->db->get($this->user);
        return $result->row();
    }

    function update($data = array(), $cond) {
        $this->db->update($this->user, $data, array('id' => $cond));
    }

    function get($username) {
        $this->db->select('id');
        return $this->db->get_where($this->user, array('username' => $username))->row()->id;
    }
    
    function setLoginDetails($data){
        $this->db->insert('tbl_login_details',$data);
    }
    
    
    function isUserLoggedIn($user_id) {
        return $this->db->get_where('tbl_user', array('id' => $user_id))->row()->is_login;
    }

}