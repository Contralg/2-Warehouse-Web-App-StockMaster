function make_order(element) {
    var item_id = element.dataset.code;
    $.ajax({
        url: "../model/transaction_order.php",
        method: 'POST',
        data:
        {
            item_id,
        },
        success: function (data) {
            console.log(item_id)
        }
    })
}

function close_order(element) {
    var t_order_id = element.dataset.code;
    var t_order_status = 'CLOSE';
    $.ajax({
        url: "../model/transaction_order_close.php",
        method: 'POST',
        data:
        {
            t_order_id,
            t_order_status
        },
        success: function (data) {
            location.reload()
        }
    })
}