<?php
include 'connect.php';
session_start();

$item_id          = $_POST['item_id'];
$action_id        = $_POST['action_id'];
$create_by        = $_SESSION['ID'];
$query_update_item;

if ($action_id == 'ACT02') {
    $query_update_item = "UPDATE master_item
                          SET item_actual_qty = CONVERT (int, item_actual_qty) + CONVERT (int, item_qty_per_lot),
                              update_date = GETDATE(),
                              update_by = '$create_by'
                          WHERE item_id = '$item_id'";
} else if ($action_id == 'ACT03') {
    $query_update_item = "UPDATE master_item
    SET item_actual_qty = CONVERT (int, item_actual_qty) - CONVERT (int, item_qty_per_lot),
        update_date = GETDATE(),
        update_by = '$create_by'
    WHERE item_id = '$item_id'";
}

$sql_update_item = sqlsrv_query($conn, $query_update_item);

if ($sql_update_item ==  TRUE) {
    $qry_act_qty = "SELECT 
                            CONVERT (int, item_qty_per_lot) as item_qty_per_lot
                          , CONVERT (int, item_actual_qty) as item_actual_qty
                    FROM master_item
                    WHERE item_id = '$item_id'";

    $sql_act_qty = sqlsrv_query($conn, $qry_act_qty);

    while ($data = sqlsrv_fetch_array($sql_act_qty)) {
        $item_actual_qty        = $data['item_actual_qty'];
        $item_qty_per_lot       = $data['item_qty_per_lot'];
        $t_stock_id;

        $qry_get_code = "SELECT TOP 1 SUBSTRING (t_stock_id, CHARINDEX('STOCK', t_stock_id) +5,LEN(t_stock_id)) as total from transaction_stock ORDER BY t_stock_update_date DESC";
        $sql_get_code = sqlsrv_query($conn, $qry_get_code);
        if ($get_code = sqlsrv_fetch_array($sql_get_code)) {
            $t_stock_id = "STOCK" . $get_code['total'] + 1;
        }

        $query_insert_stock = "INSERT INTO transaction_stock
                               (t_stock_id
                               ,t_stock_item_id
                               ,t_stock_action_id
                               ,t_stock_action_qty
                               ,t_stock_actual_qty
                               ,t_stock_update_date
                               ,t_stock_update_by)
                               
                               VALUES
                               ('$t_stock_id'
                               ,'$item_id'
                               ,'$action_id'
                               ,'$item_qty_per_lot'
                               ,'$item_actual_qty'
                               ,GETDATE()
                               ,'$create_by')";

        $sql_qry_insert_stock = sqlsrv_query($conn, $query_insert_stock);

        if ($sql_qry_insert_stock == true) {
            echo ('Berhasil Input Item Baru');
        } else echo ($create_by);
    }
}
