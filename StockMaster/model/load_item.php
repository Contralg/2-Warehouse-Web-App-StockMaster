<?php
include "connect.php";

$a = 1;
$query = "SELECT itm.item_id
                ,itm.item_name
                ,itm.item_description
                ,itm.item_qty_per_lot
                ,itm.item_price
                ,itm.item_max_stock
                ,itm.item_min_stock
                ,sup.supplier_name
           FROM master_item as itm
           INNER JOIN master_supplier as sup on itm.item_supplier_id = sup.supplier_id
           WHERE item_id !=''
           ORDER BY item_id ASC";

$result = sqlsrv_query($conn, $query);

while ($data = sqlsrv_fetch_array($result)) {
    $item_id              = $data['item_id'];
    $item_name            = $data['item_name'];
    $item_description     = $data['item_description'];
    $item_qty_per_lot     = $data['item_qty_per_lot'];
    $item_price           = $data['item_price'];
    $item_max_stock       = $data['item_max_stock'];
    $item_min_stock       = $data['item_min_stock'];
    $item_supplier_id     = $data['supplier_name'];

    echo "<tr>
              <th scope='row'>" . $a++ . "</th>
              <td>" . $item_id . "</td>
              <td>" . $item_name . "</td>
              <td>" . $item_description . "</td>
              <td>" . $item_qty_per_lot . "</td>
              <td>" . $item_price . "</td>
              <td>" . $item_max_stock . "</td>
              <td>" . $item_min_stock . "</td>
              <td>" . $item_supplier_id . "</td>
              </tr>";
}
