<?php
include "connect.php";

$a = 1;
$query = "SELECT  TRIM (t_order_id) as t_order_id
                 ,itm.item_name as t_order_item_id
                 ,t_order_item_qty
                 ,t_order_item_price
                 ,sup.supplier_name as t_order_supplier_id
                 ,CONVERT (varchar, ord.t_order_date, 100) as t_order_date
                 ,usr.user_name as t_order_by
                 ,ord.t_order_status as t_order_status
            FROM transaction_order as ord
            INNER JOIN master_item as itm on ord.t_order_item_id = itm.item_id
            INNER JOIN master_supplier as sup on ord.t_order_supplier_id = sup.supplier_id
            INNER JOIN master_user as usr on ord.t_order_by = usr.user_id
            WHERE ord.t_order_id !=''
            ORDER BY ord.t_order_date DESC";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
    $t_order_id              = $data['t_order_id'];
    $t_order_item_id         = $data['t_order_item_id'];
    $t_order_item_qty        = $data['t_order_item_qty'];
    $t_order_item_price      = $data['t_order_item_price'];
    $t_order_supplier_id     = $data['t_order_supplier_id'];
    $t_order_date            = $data['t_order_date'];
    $t_order_by              = $data['t_order_by'];
    $t_order_status          = $data['t_order_status'];

    echo "<tr>
              <th scope='row'>" . $a++ . "</th>
              <td>" . $t_order_id . "</td>
              <td>" . $t_order_item_id . "</td>
              <td>" . $t_order_item_qty . "</td>
              <td>" . $t_order_item_price . "</td>
              <td>" . $t_order_supplier_id . "</td>
              <td>" . $t_order_date . "</td>
              <td>" . $t_order_by . "</td>
              <td>" . $t_order_status . "</td>";

    if ($t_order_status == 'OPEN') {
        echo "<td>
                <button class='btn btn-outline-success' onclick='close_order(this)' data-code=" . $t_order_id . ">CLose Order</button>
                    </td>
                </tr>";
    } else {
        echo "<td>
                <button class='btn btn-success' onclick='close_order(this)' data-code=" . $t_order_id . " disabled>Closed</button>
                    </td>
                </tr>";
    }
}
