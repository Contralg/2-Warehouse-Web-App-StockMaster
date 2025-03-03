<?php
include 'connect.php';
session_start();

$supplier_id;
$supplier_name     = $_POST['input_supplier_name'];
$supplier_email    = $_POST['input_supplier_email'];
$supplier_address  = $_POST['input_supplier_address'];
$supplier_contact  = $_POST['input_supplier_contact'];
$create_by         = $_SESSION['ID'];

$qry_get_code = "SELECT TOP 1 SUBSTRING (supplier_id, CHARINDEX('SUPL', supplier_id) +4,LEN(supplier_id)) as total from master_supplier ORDER BY create_date DESC";
$sql_get_code = sqlsrv_query($conn, $qry_get_code);
if ($get_code = sqlsrv_fetch_array($sql_get_code)) {
    $supplier_id = "SUPL" . $get_code['total'] + 1;
}


$query = "SELECT user_id
                ,user_level_id
            FROM master_user 
            WHERE user_id = '$create_by'";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
    $user_level_id        = $data['user_level_id'];

    if ($user_level_id == 'L2' || $user_level_id == 'L3') {
        $qry_insert = "INSERT INTO master_supplier 
        (supplier_id
        , supplier_name
        , supplier_email
        , supplier_address
        , supplier_contact
        , create_date
        , create_by
        , update_date
        , update_by)

        VALUES 
        ('$supplier_id'
        , UPPER ('$supplier_name')
        ,'$supplier_email'
        , UPPER ('$supplier_address')
        ,'$supplier_contact'
        , GETDATE()
        ,'$create_by'
        , GETDATE()
        ,'$create_by')";

        $sql_insert = sqlsrv_query($conn, $qry_insert);

        if ($sql_insert == true) {
            echo ('Berhasil Input Supplier Baru');
            // header("Location: ../view/pages_profile.php");
        }
    } else {
        echo ('Anda Tidak Punya Akses');
    }
}
