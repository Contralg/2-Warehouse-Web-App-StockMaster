var form_input_user = document.getElementById("input_supplier")
function handleForm(event) { event.preventDefault(); }
form_input_user.addEventListener('submit', handleForm);
function insert_supplier() {
    var input_supplier_name = $("input[id=input_supplier_name]").val();
    var input_supplier_email = $("input[id=input_supplier_email]").val();
    var input_supplier_address = $("input[id=input_supplier_address]").val();
    var input_supplier_contact = $("input[id=input_supplier_contact]").val();

    $(document).ready(function () {
        if (input_supplier_name != '' && input_supplier_email != '' && input_supplier_address != '' && input_supplier_contact != '') {

            $.ajax({
                url: "../model/input_supplier.php",
                method: 'POST',
                data:
                {
                    input_supplier_name
                    , input_supplier_email
                    , input_supplier_address
                    , input_supplier_contact

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