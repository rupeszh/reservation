<?php

function debug($src = '') {
    echo"<pre>";
    print_r($src);
    echo "</pre>";
    die;
}


if (!function_exists("check")) {
    function check($field, $st_tags = false) {
 
        $field = trim($field);
        $field = stripslashes($field);
        
        if ($st_tags == false) {
            $field = strip_tags($field);
        }
        
        //$field = mysql_real_escape_string($field);
       
        return $field;
    }

}



function show_403($page = '') {
    $message_403 = "You don't have access to the url you where trying to reach.";
    show_error($message_403, 403);
}

?>
