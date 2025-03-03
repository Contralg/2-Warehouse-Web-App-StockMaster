<?php
include "connect.php";

$query = "SELECT level_id
                ,level_name
                FROM master_level
                WHERE level_id != 'L3'
                order by level_id asc";
$sql_query =  sqlsrv_query($conn, $query);
while ($data = sqlsrv_fetch_array($sql_query)) {
    $level_id   = $data['level_id'];
    $level_name = $data['level_name'];
    echo "<option value='$level_id'>$level_name</option>";
}
