$('#bad').hide();
$(document).ready(function() {
    $('#bad').hide();
    $('#loginForm').submit(function(e) {
        var userName = $("#Auser").val(); 
        var pass = $("#Apassword").val(); 
        if (userName.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#Auser").focus();
            return false;
        } else if (pass.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#Apassword").focus();
            return false;
        } else {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: 'Login',
                data: {Auser:userName,Apassword:pass},
                success: function(response) {
                    var jsonData = JSON.parse(response);
                    if (jsonData.success == 0) {
                        $('#bad').show();
                        $('#bad').html("<strong>Username is invalid</strong> ");
                        $("#Auser").focus();
                        return false;
                  
                    } else if (jsonData.success == 1) {
                        $('#bad').show();
                        $('#bad').html("<strong>This username still need a validation from admin</strong> ");
                        $("#Auser").focus();
                        return false;
                    } else if (jsonData.success == 2) {
                        $('#bad').show();
                        $('#bad').html("<strong>Password is incorrect</strong> ");
                        $("#Apassword").focus();
                        return false;
                    } 
                    else if (jsonData.success == 3) {
                        $('#bad').hide();
                        location.href="user.jsp";
                    } 
                    else {
                        $('#bad').show();
                        $('#bad').html("<strong>Error happen</strong> ");
                        $("#Auser").focus();
                        return false;
                    }
                }
            });
        }
    });
});