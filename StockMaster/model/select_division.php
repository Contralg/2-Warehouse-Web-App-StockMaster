<?php
include "connect.php";

$query = "SELECT division_id
                ,division_name
                FROM master_division
                order by division_id asc";
$sql_query =  sqlsrv_query($conn, $query);
while ($data = sqlsrv_fetch_array($sql_query)) {
    $division_id   = $data['division_id'];
    $division_name = $data['division_name'];
    echo "<option value='$division_id'>$division_name</option>";
}
