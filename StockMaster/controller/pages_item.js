var form_input_user = document.getElementById("input_item")
function handleForm(event) { event.preventDefault(); }
form_input_user.addEventListener('submit', handleForm);
function insert_item() {
    var input_item_name = $("input[id=input_item_name]").val();
    var input_item_description = $("input[id=input_item_description]").val();
    var input_item_qty = $("input[id=input_item_qty]").val();
    var input_item_price = $("input[id=input_item_price]").val();
    var input_item_max = $("input[id=input_item_max]").val();
    var input_item_min = $("input[id=input_item_min]").val();
    var input_item_supplier = $("select[id=input_item_supplier]").val();

    $(document).ready(function () {
        if (input_item_name != '' && input_item_description != '' && input_item_qty != '' && input_item_price != '' && input_item_max != '' && input_item_min != '' && input_item_supplier != '') {

            $.ajax({
                url: "../model/input_item.php",
                method: 'POST',
                data:
                {
                    input_item_name
                    , input_item_description
                    , input_item_qty
                    , input_item_price
                    , input_item_max
                    , input_item_min
                    , input_item_supplier

                },
                success: function (data) {
                    alert(data);
                    location.reload();
                }
            })

        }
        else {
            alert('DATA KURANG')
        }
    })
}