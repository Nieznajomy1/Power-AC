<?php
    
    $db_host = "localhost";
    $db_username = "root";  
    $db_password = "";
    $db_database = "yolo_license";
    $return = null;


    function get_license_time(string $license, int $timestamp) {
        global $db_host;
        global $db_username;
        global $db_password;
        global $db_database;
        
    
        $db = new mysqli($db_host, $db_username, $db_password, $db_database);
        if ($db->connect_errno) {
            $db->close();
            return "error";
        }
    
        $query = $db->query("SELECT used FROM licenses WHERE license='$license'");
        if ($query) {
            $activation_time = $query->fetch_array()[0];
            $query = $db->query("SELECT total_time FROM licenses WHERE license='$license'");
            if ($query) {
                $db->close();
                    $expire_time = (int)strtotime('+' . (int)$query->fetch_array()[0] . ' day', $activation_time);
    
                    $date1 = strtotime(date('Y-m-d H:i:s', $expire_time));
                    $date2 = strtotime(date('Y-m-d H:i:s', $timestamp));
                    $secs = $date1 - $date2;
                    $days = $secs / 86400;
    
                    $time_left = (int)$days;
    
                    if ($time_left <= -1) {
                        return "expired";
                    }
    
                    return $time_left . "d";
            }
        }
    
        $db->close();
        return "error";
    }

    function get_client_ip() {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
          $ip=$_SERVER['HTTP_CLIENT_IP'];
        } else if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
          $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
          $ip=$_SERVER['REMOTE_ADDR'];
        }
        
        return $ip;
    }

    function get_license(string $license) {

        global $db_host;
        global $db_username;
        global $db_password;
        global $db_database;
        
    
        $db = new mysqli($db_host, $db_username, $db_password, $db_database);
        if ($db->connect_errno) {
            $db->close();
            return "error";
        }


        $query = $db->query("SELECT license FROM licenses WHERE license='$license'");
        if ($query) {
            if($query->num_rows > 0) {
                return true;
            }
        }
    return false;
    }


    function get_ip_registered(string $license) {
        global $db_host;
        global $db_username;
        global $db_password;
        global $db_database;
        
    
        $db = new mysqli($db_host, $db_username, $db_password, $db_database);
        if ($db->connect_errno) {
            $db->close();
            return "error";
        }

        $query = $db->query("SELECT ip FROM licenses WHERE license='$license'");
        if ($query) {
            return $query->fetch_array()[0];
        }
    }
        if(get_license($_POST["PowerLicenseSyS"])) {
            if(get_license_time($_POST["PowerLicenseSyS"], time()) != "expired") {
                if(get_ip_registered($_POST["PowerLicenseSyS"]) == get_client_ip()) {
                   echo("authenticated");
                } else {
                    echo("ip");
                }
            } else {
                echo("expired");
            }
        } else {
            echo "invalid";
        }
?>