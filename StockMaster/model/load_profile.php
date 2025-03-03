<?php
include "connect.php";

$a = 1;
$query = "SELECT usr.user_id
                ,usr.user_name
                ,usr.user_password
                ,usr.user_division_id
                ,lvl.level_name
                ,div.division_name
           FROM master_user as usr
           INNER JOIN master_level as lvl on usr.user_level_id = lvl.level_id
           INNER JOIN master_division as div on usr.user_division_id = div.division_id
           WHERE user_id !=''
           ORDER BY user_id ASC";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
     $user_id              = $data['user_id'];
     $user_name            = $data['user_name'];
     $user_password        = $data['user_password'];
     $level_name           = $data['level_name'];
     $division_name        = $data['division_name'];

     echo "<tr>
              <th  scope='row'>" . $a++ . "</th>
              <td>" . $user_id . "</td>
              <td>" . $user_name . "</td>
              <td>" . $level_name . "</td>
              <td>" . $division_name . "</td>
         </tr>";
}
?>
<!-- 
<script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>

<script src="../assets/js/main.js"></script> -->