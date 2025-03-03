<?php
include 'connect.php';
session_start();

$item_id;
$item_name          = $_POST['input_item_name'];
$item_description   = $_POST['input_item_description'];
$item_qty           = $_POST['input_item_qty'];
$item_price         = $_POST['input_item_price'];
$item_max           = $_POST['input_item_max'];
$item_min           = $_POST['input_item_min'];
$item_supplier      = $_POST['input_item_supplier'];
$create_by          = $_SESSION['ID'];

$qry_get_code = "SELECT TOP 1 SUBSTRING (item_id, CHARINDEX('ITEM', item_id) +4,LEN(item_id)) as total from master_item ORDER BY create_date DESC";
$sql_get_code = sqlsrv_query($conn, $qry_get_code);
if ($get_code = sqlsrv_fetch_array($sql_get_code)) {
    $item_id = "ITEM" . $get_code['total'] + 1;
}


$query = "SELECT user_id
                ,user_level_id
            FROM master_user 
            WHERE user_id = '$create_by'";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
    $user_level_id        = $data['user_level_id'];

    if ($user_level_id == 'L2' || $user_level_id == 'L3') {
        $qry_insert = "INSERT INTO master_item 
        (item_id
        , item_name
        , item_description
        , item_qty_per_lot
        , item_actual_qty
        , item_price
        , item_max_stock
        , item_min_stock
        , item_supplier_id
        , create_date
        , create_by
        , update_date
        , update_by)

        VALUES 
        ('$item_id'
        , UPPER ('$item_name')
        , UPPER ('$item_description')
        ,'$item_qty'
        ,'$item_max'
        ,'$item_price'
        ,'$item_max'
        ,'$item_min' 
        ,'$item_supplier'
        , GETDATE()
        ,'$create_by'
        , GETDATE()
        ,'$create_by')";

        $sql_insert = sqlsrv_query($conn, $qry_insert);

        if ($sql_insert == true) {
            echo ('Berhasil Input Item Baru');
            // header("Location: ../view/pages_profile.php");
        }
    } else {
        echo ('Anda Tidak Punya Akses');
    }
}
