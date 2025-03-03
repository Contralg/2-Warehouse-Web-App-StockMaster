<?php
include "connect.php";

if (isset($_POST['login'])) {
    $input_user_id       = $_POST['input_user_id'];
    $input_user_password = md5(trim(strtoupper(str_replace("'", '"', $_POST['input_user_password']))));
    $query_select = "SELECT 
                user_id,
                user_name,
                user_password
                FROM master_user
                WHERE user_id = '$input_user_id'";

    $sql_qry = sqlsrv_query($conn, $query_select);


    while ($data = sqlsrv_fetch_array($sql_qry)) {
        if ($input_user_id == $data['user_id'] && $input_user_password == $data['user_password']) {
            session_start();
            $_SESSION['ID'] = $data['user_id'];
            $_SESSION['USERNAME'] = $data['user_name'];
            echo ("Berhasil Login");
            header("Location: ../view/pages_main.php");
        } else echo ("User Id/Password Salah");
    }
}
