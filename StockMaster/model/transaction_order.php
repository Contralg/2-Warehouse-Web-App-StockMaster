<?php
include 'connect.php';
session_start();

$item_id          = $_POST['item_id'];
$create_by        = $_SESSION['ID'];

$query_check_item = "SELECT CONVERT (int, itm.item_max_stock) - CONVERT (int, itm.item_actual_qty) as order_qty
                            ,((CONVERT (int, itm.item_max_stock) - CONVERT (int, itm.item_actual_qty)) / itm.item_qty_per_lot) * itm.item_price as order_price
                            , sup.supplier_id
                            , sup.supplier_name
                        FROM master_item as itm
                        INNER JOIN master_supplier as sup on itm.item_supplier_id = sup.supplier_id
                        WHERE itm.item_id = '$item_id'";

$sql_qry_check_item = sqlsrv_query($conn, $query_check_item);

while ($data = sqlsrv_fetch_array($sql_qry_check_item)) {

    $order_qty          = $data['order_qty'];
    $order_price        = $data['order_price'];
    $supplier_id        = $data['supplier_id'];
    $t_order_id;

    $qry_get_code = "SELECT TOP 1 SUBSTRING (t_order_id, CHARINDEX('ORDER', t_order_id) +5,LEN(t_order_id)) as total from transaction_order ORDER BY t_order_date DESC";
    $sql_get_code = sqlsrv_query($conn, $qry_get_code);
    if ($get_code = sqlsrv_fetch_array($sql_get_code)) {
        $t_order_id = "ORDER" . $get_code['total'] + 1;
    }

    $query_order = "INSERT INTO transaction_order
                                (t_order_id
                                ,t_order_item_id
                                ,t_order_item_qty
                                ,t_order_item_price
                                ,t_order_supplier_id
                                ,t_order_date
                                ,t_order_by
                                ,t_order_status)
    
                    VALUES
                                ('$t_order_id'
                                ,'$item_id'
                                ,'$order_qty'
                                ,'$order_price'
                                ,'$supplier_id'
                                ,GETDATE()
                                ,'$create_by'
                                ,'OPEN')";

    $sql_qry_order = sqlsrv_query($conn, $query_order);

    if ($sql_qry_order == true) {
        echo ('Berhasil order');
    } else echo ($create_by);
}
