<?php
include 'connect.php';
session_start();

$code;
$user_id        = $_POST['input_user_id'];
$user_name      = $_POST['input_user_name'];
$user_password  = md5(trim(strtoupper(str_replace("'", '"', $_POST['input_user_password']))));
$user_division  = $_POST['input_user_division'];
$user_level     = $_POST['input_user_level'];
$create_by      = $_SESSION['ID'];

$query = "SELECT user_id
                ,user_level_id
            FROM master_user 
            WHERE user_id = '$create_by'";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
    $user_level_id        = $data['user_level_id'];

    if ($user_level_id == "L2" or $user_level_id == "L3") {
        $qry_insert = "INSERT INTO master_user 
        (user_id
        , user_name
        , user_password
        , user_division_id
        , user_level_id
        , create_date
        , create_by
        , update_date
        , update_by)

        VALUES 
        ('$user_id'
        ,'$user_name'
        ,'$user_password'
        ,'$user_division'
        ,'$user_level'
        , GETDATE()
        ,'$create_by'
        , GETDATE()
        ,'$create_by')";

        $sql_insert = sqlsrv_query($conn, $qry_insert);

        if ($sql_insert == true) {
            echo ('Berhasil Input User Baru');
            // header("Location: ../view/pages_profile.php");
        }
    } else {
        echo ('Anda Tidak Punya Akses');
    }
}
