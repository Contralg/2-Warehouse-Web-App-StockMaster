$.ajax({
    url: "../model/chart_used_item.php",
    method: 'POST',
    success: function (data1) {
        var jsonDATA = $.parseJSON(data1);
        var item_name = [];
        var qty = [];
        for (var index in jsonDATA) {
            item_name.push(jsonDATA[index].item_name);
            qty.push(jsonDATA[index].qty);
        }


        $("#row_chart_used_item").append("<canvas id='chart_used_item' style='height: 320px;'></canvas>")
        var ctx = document.getElementById("chart_used_item")
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: item_name,
                datasets: [{
                    data: qty,
                    borderWidth: 1
                }]
            },
            plugins: [ChartDataLabels],
            options: {
                responsive: true,
                indexAxis: 'y',
                plugins: {
                    legend: {
                        display: false,
                    },
                },
                scales: {
                    x: {
                        stacked: true,
                        beginAtZero: true,
                        grace: '1%',
                        ticks: {
                            stepSize: 1000,
                        },
                        grid: {
                            display: true,
                            drawOnChartArea: true,
                        },
                    },
                    y: {
                        stacked: true,
                        grid: {
                            drawOnChartArea: false,
                        },
                    }
                },
            }
        });
    }
})

$.ajax({
    url: "../model/chart_money_spent.php",
    method: 'POST',
    success: function (data1) {
        var jsonDATA = $.parseJSON(data1);
        var supplier_name = [];
        var qty = [];
        for (var index in jsonDATA) {
            supplier_name.push(jsonDATA[index].supplier_name);
            qty.push(jsonDATA[index].qty);
        }


        $("#row_chart_money_spent").append("<canvas id='chart_money_spent' style='height: 320px;'></canvas>")
        var ctx = document.getElementById("chart_money_spent")
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: supplier_name,
                datasets: [{
                    data: qty,
                    borderWidth: 1
                }]
            },
            plugins: [ChartDataLabels],
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false,
                    },
                },
                scales: {
                    x: {
                        stacked: true,
                        beginAtZero: true,
                        grace: '1%',
                        ticks: {
                            stepSize: 1000,
                        },
                        grid: {
                            display: true,
                            drawOnChartArea: true,
                        },
                    },
                    y: {
                        stacked: true,
                        grid: {
                            drawOnChartArea: false,
                        },
                    }
                },
            }
        });
    }
})