<?php
include "connect.php";
session_start();

$array    = array();
$arrayAll = array();

$query = "SELECT sup.supplier_name as supplier_name
                ,SUM(CONVERT (int,ord.t_order_item_price)) AS qty
          FROM transaction_order as ord
          INNER JOIN master_supplier as sup on ord.t_order_supplier_id = sup.supplier_id
          WHERE ord.t_order_date >= DATEADD(day, -7, GETDATE())
          GROUP BY sup.supplier_name";

$sql_qry = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($sql_qry)) {
    $array['supplier_name']     = $data['supplier_name'];
    $array['qty']               = $data['qty'];
    array_push($arrayAll, $array);
}
echo json_encode($arrayAll);
