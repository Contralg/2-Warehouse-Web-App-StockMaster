<?php
$serverName = ""; //Isi dengan nama server Anda
$connectionInfo = array("Database" => "stockmaster", "UID" => "", "PWD" => "");
$conn = sqlsrv_connect($serverName, $connectionInfo);

if ($conn === false) {
    die(print_r(sqlsrv_errors(), true));
}
