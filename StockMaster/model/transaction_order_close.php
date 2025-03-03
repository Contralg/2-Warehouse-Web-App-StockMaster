<?php
include 'connect.php';
session_start();

$t_order_id         = $_POST['t_order_id'];
$t_order_status     = $_POST['t_order_status'];

$query_update_status = "UPDATE transaction_order
                        SET t_order_status = '$t_order_status'
                        WHERE t_order_id = '$t_order_id'";

$sql_query_update = sqlsrv_query($conn, $query_update_status);

if ($sql_query_update == TRUE) {
    echo "Order telah selesai!";
} else {
    echo "Close order gagal";
}
