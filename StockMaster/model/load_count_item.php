<?php
include "connect.php";

$a         = 1;
$array     = array();
$array_all = array();

$query = "SELECT COUNT (item_id) AS count_item FROM master_item";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
    $count_item              = $data['count_item'];
    echo ($count_item);
}
