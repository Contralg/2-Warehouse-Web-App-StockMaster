$.ajax({
    url: "../model/load_count_item.php",
    method: 'POST',
    success: function (data1) {

        $.ajax({
            url: "../model/chart_stock.php",
            method: 'POST',
            success: function (data2) {
                var jsonDATA = $.parseJSON(data2);
                var item_id = [];
                var item_name = [];
                var item_act_qty = [];
                var item_max = [];
                for (var index in jsonDATA) {
                    item_id.push(jsonDATA[index].item_id);
                    item_name.push(jsonDATA[index].item_name);
                    item_act_qty.push(jsonDATA[index].item_act_qty);
                    item_max.push(jsonDATA[index].item_max);
                }
                let qty = [];
                let row = item_act_qty.length;
                for (var i = 0; i < row; i++) {
                    qty[i] = [];
                    qty[i][0] = item_act_qty[i];
                    qty[i][1] = item_max[i];
                }

                var datalabel_center = [];
                var datalabel_center_text = [];

                for (i = 0; i < data1; i++) {

                    var chart_id = "chart" + i;

                    $("#row_chart").append("<div class='col-md-2' style='padding-top: 10px;'><h6>" + item_name[i] + "</h6><canvas id='" + chart_id + "' style='max-height: 100px;'></canvas><div class='row'><div class='col-md-6' style='text-align: right;'><button class='btn btn-primary btn-sm' onclick='stock_in(this)' data-code='" + item_id[i] + "'>In</button></div><div class='col-md-6'><button class='btn btn-danger btn-sm' onclick='stock_out(this)' data-code='" + item_id[i] + "'>Out</button></div></div></div>")


                    datalabel_center_text[i] = {
                        id: item_id[i],
                        afterDatasetsDraw(chart, args, options) {
                            const { ctx, chartArea: { left, rigth, top, bottom, width, height } } = chart;
                            ctx.save();

                            ctx.font = 'bolder 15pt Arial';
                            ctx.fillStyle = '#000000';
                            ctx.textAlign = 'center';
                            ctx.fillText(datalabel_center[i], width / 2, height / 2 + top);

                            ctx.font = '12pt Arial';
                            ctx.fillStyle = '#000000';
                            ctx.textAlign = 'center';
                            ctx.fillText('Pcs', width / 2, height / 2 + top + 20);
                        }
                    }

                    var ctx = document.getElementById(chart_id)
                    new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels: ['Ready Stock', 'Out of Stock'],
                            datasets: [{
                                data: qty[i],
                                borderWidth: 1
                            }]
                        },
                        plugins: [ChartDataLabels],
                        options: {
                            plugins: {
                                legend: {
                                    display: false,
                                },
                                datalabels: {
                                    formatter: (value, context) => {
                                        const lol = context.dataset.data;
                                        var total = lol[0];
                                        datalabel_center[i] = total;
                                        return value + "pcs";
                                    },
                                    anchor: 'center',
                                    color: 'black',
                                    font: {
                                        size: 16,
                                    }
                                }
                            }
                        }
                    });
                }
            }
        })
    }
})



function stock_in(element) {
    var item_id = element.dataset.code;
    var action_id = 'ACT02'
    $.ajax({
        url: "../model/transaction_stock.php",
        method: 'POST',
        data:
        {
            item_id,
            action_id
        },
        success: function (data) {
            location.reload();
        }
    })
}


function stock_out(element) {
    var item_id = element.dataset.code;
    var action_id = 'ACT03'
    $.ajax({
        url: "../model/transaction_stock.php",
        method: 'POST',
        data:
        {
            item_id,
            action_id
        },
        success: function (data) {
            location.reload();
        }
    })
}


$.ajax({
    url: "../model/notification_order.php",
    method: 'POST',
    success: function (data) {
        $("#row_notification").html(data);
    }
})

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
            location.reload()
        }
    })
}
