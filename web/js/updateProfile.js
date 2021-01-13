$('#bad').hide();
$(document).ready(function () {
    $('#bad').hide();
    $('#updatePass').submit(function (e) {
        var userName = $("#user").val();
        var pass = $("#pass").val();
        var newPass = $("#newPass").val();
        var newPassword = $("#newPassword").val();
        if (newPass.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#newPass").focus();
            return false;
        } else if (newPassword.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#newPassword").focus();
            return false;
        } else if (pass.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#pass").focus();
            return false;
        } else if (newPass != newPassword) {
            $('#bad').show();
            $('#bad').html("<strong>Password doesn't match</strong> ");
            $("#newPassword").focus();
            return false;
        } else {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: 'updatePassword',
                data: {userName: userName, pass: pass, newPass: newPass},
                success: function (response) {
                    var jsonData = JSON.parse(response);
                    if (jsonData.success == 0) {
                        alert("password changed, login again!!");
                        location.href="Logout.jsp";
                    } 
                    else {
                        $('#bad').show();
                        $('#bad').html("<strong>Error happen</strong> ");
                        $("#newPass").focus();
                        return false;
                    }
                }
            });
        }
    });
});