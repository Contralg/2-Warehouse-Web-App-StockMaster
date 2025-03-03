<?php
include 'connect.php';
session_start();

$query = "SELECT TRIM (item_id) as item_id
                ,item_name
                ,item_actual_qty
                ,item_min_stock
          FROM master_item";

$sql_query = sqlsrv_query($conn, $query);


while ($data = sqlsrv_fetch_array($sql_query)) {
    $item_id            = $data['item_id'];
    $item_name          = $data['item_name'];
    $item_actual_qty    = $data['item_actual_qty'];
    $item_min_stock     = $data['item_min_stock'];

    if ($item_actual_qty <= $item_min_stock) {
        $query_check_order = "SELECT t_order_status
                                 FROM transaction_order
                                 WHERE t_order_item_id = '$item_id'
                                 AND t_order_status = 'OPEN'";


        $sql_qry_count_check       = sqlsrv_query($conn, $query_check_order, array(), array("Scrollable" => "static"));
        $row_count                 = sqlsrv_num_rows($sql_qry_count_check);

        if ($row_count == 0)

            echo ("<button class='btn btn-link' style='color: red; padding-bottom: 10px; font-weight: bold; font-size: 10pt; text-align: left;' onclick='make_order(this)' data-code=$item_id> $item_name tersisa $item_actual_qty pcs. Klik Untuk Order</button>");
    }
}
