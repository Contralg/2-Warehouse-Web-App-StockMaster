var form_input_user = document.getElementById("input_user")
function handleForm(event) { event.preventDefault(); }
form_input_user.addEventListener('submit', handleForm);
function insert_user() {
    var input_user_id = $("input[id=input_user_id]").val();
    var input_user_name = $("input[id=input_user_name]").val();
    var input_user_password = $("input[id=input_user_password]").val();
    var input_user_re_password = $("input[id=input_user_re_password]").val();
    var input_user_division = $("select[id=input_user_division]").val();
    var input_user_level = $("select[id=input_user_level]").val();
    $(document).ready(function () {
        if (input_user_id != '' && input_user_name != '' && input_user_password != '' && input_user_re_password != '' && input_user_division != '' && input_user_level != '') {
            if (input_user_password == input_user_re_password) {
                $.ajax({
                    url: "../model/input_profile.php",
                    method: 'POST',
                    data:
                    {
                        input_user_id
                        , input_user_name
                        , input_user_password
                        , input_user_division
                        , input_user_level
                    },
                    success: function (data) {
                        alert(data);
                        location.reload();
                    }
                })
            }
            else {
                alert('DATA SALAH')
            }
        }
        else {
            alert('DATA KURANG')
        }
    })
}