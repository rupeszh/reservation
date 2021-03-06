<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * This module only for imports task.
 *
 * @author crossover
 */
class Common_model extends CI_Model {

    public function __construct() {
        parent::__construct();

        $this->sessionOut();
    }

    function insert($table, $array) {

        $this->db->set($array);

        $this->db->insert($table);

        return $this->db->insert_id();
    }

    function update($table, $array, $where) {

        $this->db->where($where);

        return $this->db->update($table, $array);
    }

    function id_update($value, $id) {

        $data = array('user_id' => $value);

        $this->db->where('id', $id);

        return $this->db->update('cy_order', $data);
    }

    function delete($table, $where) {

        $this->db->where($where);

        $this->db->delete($table);
    }

    function deleteMultiple($table, $id, $array) {

        $this->db->where_in($id, $array);

        $this->db->delete($table);
    }

    function getById($table, $fieldId, $id, $select = '*') {

        $this->db->select($select);

        $this->db->where($fieldId . " = '" . $id . "'");

        $query = $this->db->get($table);

        return $query->row();
    }

    function getByIdMulti($table, $where, $select = '*') {

        $this->db->where($where);

        $query = $this->db->get($table);

        return $query->row();
    }

    function getAll($table, $orderBy = NULL, $where = NULL, $select = NULL, $group_by = NULL, $limit = NULL, $start = NULL) {

        $this->db->distinct();

        if ($select) {

            $this->db->select($select);
        }
        if ($limit) {

            $this->db->limit($limit, $start);
        }
        if ($where) {

            $this->db->where($where);
        }

        if ($orderBy) {

            $this->db->order_by($orderBy);
        }

        if ($group_by) {

            $this->db->group_by($group_by);
        }

        $query = $this->db->get($table);

        return $query->result();
    }

    function getAll_array($table, $orderBy = NULL, $where = NULL, $select = NULL, $group_by = NULL) {

        if ($select) {

            $this->db->select($select);
        }

        if ($where)
            $this->db->where($where);

        if ($orderBy)
            $this->db->order_by($orderBy);

        if ($group_by)
            $this->db->group_by($group_by);

        $query = $this->db->get($table);

        return $query->result_array();
    }

    function get_with_limit($table, $limit, $start, $orderBy = NULL, $search = NULL, $search1 = NULL) {

        if ($search)
            $this->db->where($search);

        if ($orderBy)
            $this->db->order_by($orderBy);

        $query = $this->db->get($table, $limit, $start);

        return $query->result();
    }

    function countTotal($table, $where = NULL, $where1 = NULL) {

        if ($where)
            $this->db->where($where);

        $this->db->from($table);

        return $this->db->count_all_results();
    }

    function getLast($table) {

        $this->db->order_by('id', 'desc');

        $query = $this->db->get($table);

        return $query->row();
    }

    function getFirst($table) {

        $this->db->order_by('id', 'ASC');

        $query = $this->db->get($table);

        return $query->row();
    }

    function get_attribute($table, $attribute, $where) {

        $this->db->select($attribute);

        $this->db->where($where);

        $query = $this->db->get($table);

        if ($query->num_rows() == 1)
            return $query->row();

        else if ($query->num_rows() > 1)
            return $query->result();
    }

    function get_attribute_one($table, $attribute, $where) {

        $this->db->select($attribute);

        $this->db->where($where);

        $query = $this->db->get($table);

        return $query->row();
    }

    function value_exist($table, $field, $value) {

        $this->db->where('' . $field . '', $value);

        $this->db->from($table);

        if ($this->db->count_all_results() > 0)
            return true;
        else
            return false;
    }

    function runQuery($sql) {
        $this->db->query($sql);
    }

    function contactInfo($id) {

        $this->db->where('user_id', $id);

        $query = $this->db->get('contact_user');

        return $query->result();
    }

    function searchShopMerchant($company = '', $column = 'company') {
        $this->db->select('tbl_shop.id,tbl_shop.company,tbl_shop.email,tbl_shop.address,tbl_shop.family_name,tbl_shop.first_name,tbl_merchant.name');
        $this->db->from('tbl_shop');
        $this->db->join('tbl_merchant', 'tbl_merchant.id = tbl_shop.merchant_id');
        $this->db->like($column, $company);

        return $this->db->get();
    }

    function searchShop($company = '', $column = 'company', $shop_id) {
        $this->db->select('id,company,email,address,family_name,first_name');
        $this->db->from('tbl_shop');
        $this->db->where('id <> ', $shop_id);
        $this->db->like($column, $company);

        return $this->db->get();
    }

    function searchShopPersonIncharge($company = '', $column = 'company', $shop_id, $action_id = '') {
        $this->db->_protect_identifiers = false;

        $this->db->select('t2.id,t1.company,concat( t2.last_name,\' \',t2.first_name ) as `personincharge`,t2.first_name,t2.last_name');
        $this->db->from('tbl_shop as t1');
        $this->db->join('tbl_person_incharge as t2', 't2.shop_id = t1.id');
        $this->db->where('t1.id <> ', $shop_id);
        if (!empty($action_id)) {
            $this->db->where_not_in('t2.id', $action_id);
        }
        $this->db->like($column, $company);

        return $this->db->get();
        //debug($this->db->last_query());
    }

    function getParentMenu() {

        return $this->db->get_where('tbl_menu', array('parent_id' => 0));
    }

    function getChildren($pId) {

        return $this->db->get_where('tbl_menu', array('parent_id' => $pId));
    }

    public function getMenuId($url) {//debug($url);
        return $result = $this->db->get_where('tbl_menu', array('url' => $url))->row()->id;
    }

    public function getRolePermission($role_id, $menu_id) {
        $this->db->select('action_id');

        return $this->db->get_where('tbl_role_permission', array('role_id' => $role_id, 'menu_id' => $menu_id));
    }

    public function getActionName($action_id) {
        return $this->db->get_where('tbl_action_list', array('id' => $action_id))->row()->name;
    }

    public function getMenuPermission($menu_id) {
        $role_id = $this->session->userdata('user_roleid');

        $this->db->select('count(action_id) as count');

        return $this->db->get_where('tbl_role_permission', array('role_id' => $role_id, 'menu_id' => $menu_id, 'action_id' => 19));
    }

    public function sessionOut() {
        $user_id = @$this->session->userdata('user_id');
        if ($user_id) {
            $result = @$this->db->get_where('ru_user', array('id' => $user_id))->row();

            if (@$result->is_login == 0) {
                $sessArr = array('user_id' => '', 'user_username' => '', 'user_roleid' => '', 'userAgent' => '');
                $this->session->unset_userdata($sessArr);
                $this->session->sess_destroy();
            }
        }
    }

}

?>
