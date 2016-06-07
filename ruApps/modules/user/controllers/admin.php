<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admin extends MY_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->model('login_model');

        $this->template = 'user/login';
    }

    public function index() {

        if ($this->input->post('loginBtn') != '') { 
            $this->form_validation->set_rules('username', 'Username', 'required');
            $this->form_validation->set_rules('password', 'Password', 'required');

            if ($this->form_validation->run() == false) {
                $this->load->view($this->template);
            } else {
                $username = check($this->input->post('username'));
                $password = hash('sha512', check($this->input->post('password')));                

                $condition = array(
                    'username' => $username,
                    'password' => $password,
                );
                
                $status_code = $this->login_model->login_act($condition);
                
                $status_msg = '';
                if ($status_code) {
                        $user_id = $status_code->id;
                        
                        $this->setCredentials($user_id, $username);
                        
                        redirect(base_url('dashboard'));
                }else { 
                        $status_msg = "Invalid Username or Password!";
                        $this->session->set_flashdata('loginErr', $status_msg);
                        redirect(base_url('user/admin'));
                }
                      
            }
        } else {
            $this->load->view($this->template);
        }
    }

    function setCredentials($user_id, $username) {
        $this->session->set_userdata('user_id', $user_id);
        $this->session->set_userdata('user_username', $username);
        $this->session->set_userdata('userAgent', $_SERVER['HTTP_USER_AGENT']);
        
        //redirect(base_url('dashboard'));
    }


    function logout() {
        delete_cookie('user_username', 'value', 'expire');

        $sessArr = array('user_id' => '', 'user_username' => '', 'userAgent' => '');
        $this->session->unset_userdata($sessArr);

        $this->session->sess_destroy();

        redirect('user/admin');
    }

}

?>