<?php

class User_model extends CI_Model {

    public function __construct() {
        parent::__construct();

        $this->table_name = 'tbl_user';
    }

    function getUserDetails($id) {
        $this->db->select('*');
        $this->db->where('id', $id);

        return $this->db->get($this->table_name);
    }

    function listUser($order_by_column = null, $order_by = 'asc') {
        $this->db->select('tbl_user.*, tbl_role.name as roleName');
        $this->db->from('tbl_user');
        $this->db->join('tbl_role', 'tbl_role.id = tbl_user.role_id');
        $this->db->order_by('tbl_user.' . $order_by_column, $order_by);

        return $this->db->get()->result_array();
    }

    public function getRole() {
        return $this->db->get_where('tbl_role');
    }

    public function save($id = 0) {
        $data = array(
            'role_id' => $this->input->post('role'),
            'name' => $this->input->post('fname'),
            'username' => $this->input->post('uname'),
            'status' => $this->input->post('status'),
        );
        //echo $this->input->post('cpwd');die;
        if ($this->input->post('cpwd')) {
            $data['password'] = hash('sha512', check($this->input->post('cpwd')));
        }

        if (empty($id)) {
            $this->db->insert('tbl_user', $data);
            return $this->db->insert_id();
        } else {
            $this->db->update('tbl_user', $data, array('id' => $id));
        }
    }

    public function CheckPassword($pass, $userId) {
        return $this->db->get_where('tbl_user', array('id' => $userId))->row()->password;
    }

    public function update($pass, $userId) {
        $data['password'] = $pass;
        $this->db->update('tbl_user', $data, array('id' => $userId));
    }

    public function checkUsernameExist($username, $id = NULL) {
        if ($id) {
            $this->db->where("id !=", $id);
        }
        $query = $this->db->get_where('tbl_user', array('username' => $username));
        if ($query->num_rows() > 0) {
            return TRUE;
        }
        return FALSE;
    }

}
