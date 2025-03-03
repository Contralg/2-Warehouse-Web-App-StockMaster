<?php
include "connect.php";
session_start();

$array    = array();
$arrayAll = array();

$query = "SELECT itm.item_name as item_name
                ,SUM(CONVERT (int,ts.t_stock_action_qty)) AS qty
          FROM transaction_stock as ts
          INNER JOIN master_item as itm on ts.t_stock_item_id = itm.item_id
          WHERE t_stock_update_date >= DATEADD(day, -7, GETDATE())
          AND t_stock_action_id = 'ACT03'
          GROUP BY itm.item_name";

$sql_qry = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($sql_qry)) {
    $array['item_name']         = $data['item_name'];
    $array['qty']               = $data['qty'];
    array_push($arrayAll, $array);
}
echo json_encode($arrayAll);
