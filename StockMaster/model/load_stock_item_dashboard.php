<?php
include "connect.php";

$a = 1;
$query = "SELECT TOP 3 ts.t_stock_id
                ,itm.item_name as item_name
                ,act.action_name as action_name
                ,ts.t_stock_action_qty as action_qty
                ,ts.t_stock_actual_qty as act_qty
                ,usr.user_name as user_name
                ,div.division_name as division
                ,CONVERT (varchar, ts.t_stock_update_date, 100) as update_date
                
                FROM transaction_stock as ts
                INNER JOIN master_item as itm on ts.t_stock_item_id = itm.item_id
                INNER JOIN master_action as act on ts.t_stock_action_id = act.action_id
                INNER JOIN master_user as usr on ts.t_stock_update_by = usr.user_id
                INNER JOIN master_division as div on usr.user_division_id = div.division_id
                WHERE t_stock_id !=''
                ORDER BY t_stock_update_date DESC";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
     $t_stock_id         = $data['t_stock_id'];
     $item_name          = $data['item_name'];
     $action_name        = $data['action_name'];
     $action_qty         = $data['action_qty'];
     $act_qty            = $data['act_qty'];
     $user_name          = $data['user_name'];
     $division           = $data['division'];
     $update_date        = $data['update_date'];

     echo "<tr>
              <th  scope='row'>" . $a++ . "</th>
              <td>" . $item_name . "</td>
              <td>" . $action_name . "</td>
              <td>" . $user_name . "</td>
              <td>" . $division . "</td>
              <td>" . $update_date . "</td>
         </tr>";
}
?>
<!-- 
<script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>

<script src="../assets/js/main.js"></script> -->