$('#bad').hide();
$(document).ready(function() {
    $('#bad').hide();
    $('#registerForm').submit(function(e) {
        var userName = $("#user").val();
        var name = $("#name").val();
        var email = $("#email").val();
        var role = $("#role").val();
        var recaptcha = $("#g-recaptcha-response").val();
        
        if (userName.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#user").focus();
            return false;
        }else if (name.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#name").focus();
            return false;
        }
        else if (email.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#email").focus();
            return false;
        } else if (recaptcha.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>do the recaptcha</strong> ");
            //$("#recaptcha").focus();
            return false;
        }
        else {
            
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: 'Register',
                data: {userName:userName,name:name,email:email,role:role,recaptcha:recaptcha},
                success: function(response) {
                    console.log(response);
                    var jsonData = JSON.parse(response);
                    if (jsonData.success == 0) {
                        $('#bad').show();
                        $('#bad').html("<strong>Username already exists</strong> ");
                        $("#user").focus();
                        return false;
                  
                    } else if (jsonData.success == 1) {
                        $('#bad').show();
                        $('#bad').html("<strong>email already exists</strong> ");
                        $("#email").focus();
                        return false;
                    }  
                    else if (jsonData.success == 3) {
                        $('#bad').hide();
                        alert("your registeration is done, wait for an email with your password");
                    } 
                    else {
                        $('#bad').show();
                        $('#bad').html("<strong>Error happen</strong> ");
                        $("#user").focus();
                        return false;
                    }
                }
            });
        }
    });
});