<?php
include "connect.php";
session_start();

$array    = array();
$arrayAll = array();

$query = "SELECT TRIM (item_id) as item_id
                ,item_name
                ,item_actual_qty
                ,CONVERT (int, item_max_stock) - CONVERT (int, item_actual_qty) as count
          FROM	master_item";

$sql_qry = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($sql_qry)) {
    $array['item_id']         = $data['item_id'];
    $array['item_name']       = $data['item_name'];
    $array['item_act_qty']    = $data['item_actual_qty'];
    $array['item_max']        = $data['count'];
    array_push($arrayAll, $array);
}
echo json_encode($arrayAll);
