<?php
include "connect.php";

$a = 1;
$query = "SELECT supplier_id
                ,supplier_name
                ,supplier_email
                ,supplier_address
                ,supplier_contact
           FROM master_supplier
           WHERE supplier_id !=''
           ORDER BY supplier_id ASC";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
     $supplier_id           = $data['supplier_id'];
     $supplier_name         = $data['supplier_name'];
     $supplier_email        = $data['supplier_email'];
     $supplier_address      = $data['supplier_address'];
     $supplier_contact      = $data['supplier_contact'];

     echo "<tr>
              <th  scope='row'>" . $a++ . "</th>
              <td>" . $supplier_id . "</td>
              <td>" . $supplier_name . "</td>
              <td>" . $supplier_email . "</td>
              <td>" . $supplier_address . "</td>
              <td>" . $supplier_contact . "</td>
         </tr>";
}
?>
<!-- 
<script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>

<script src="../assets/js/main.js"></script> -->