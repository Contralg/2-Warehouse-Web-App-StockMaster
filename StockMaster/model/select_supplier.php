<?php
include "connect.php";

$query = "SELECT supplier_id
                ,supplier_name
                FROM master_supplier
                WHERE supplier_id != ''
                order by supplier_id asc";
$sql_query =  sqlsrv_query($conn, $query);
while ($data = sqlsrv_fetch_array($sql_query)) {
    $supplier_id   = $data['supplier_id'];
    $supplier_name = $data['supplier_name'];
    echo "<option value='$supplier_id'>$supplier_name</option>";
}
