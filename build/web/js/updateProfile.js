$('#bad').hide();
$('#badName').hide();
$('#badEmail').hide();
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

$(document).ready(function (){
    $('#badName').hide();
    $('#updateName').submit(function (e) {
        var userName = $("#user").val();
        var newName = $("#newName").val();
        if (newName.length == 0) {
            $('#badName').show();
            $('#badNname').html("<strong>Enter the empty input</strong> ");
            $("#newName").focus();
            return false;
        }
        else{
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: 'updateName',
                data: {userName: userName, newName: newName},
                success: function (response) {
                    var jsonData = JSON.parse(response);
                    if (jsonData.success == 0) {
                        alert("Name changed");
                        location.href="user.jsp";
                    } 
                    else {
                        $('#badName').show();
                        $('#badName').html("<strong>Error happen!</strong> ");
                        $("#newName").focus();
                        return false;
                    }
                }
            });
        }
    });
});

$(document).ready(function (){
    $('#badEmail').hide();
    $('#updateEmail').submit(function (e) {
        var userName = $("#user").val();
        var newEmail = $("#newEmail").val();
        
        if (newEmail.length == 0) {
            $('#badEmail').show();
            $('#badEmail').html("<strong>Enter the empty input</strong> ");
            $("#newEmail").focus();
            return false;
        }
        else{
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: 'updateEmail',
                data: {userName: userName, newEmail: newEmail},
                success: function (response) {
                    var jsonData = JSON.parse(response);
                    if (jsonData.success == 0) {
                        alert("Email changed");
                        location.href="user.jsp";
                    } 
                    else {
                        $('#badEmail').show();
                        $('#badEmail').html("<strong>Error happen!</strong> ");
                        $("#newEmail").focus();
                        return false;
                    }
                }
            });
        }
    });
});

$(document).ready(function (){
    $('#badRole').hide();
    $('#updateRole').submit(function (e) {
        var userName = $("#user").val();
        var newRole = $("#newRole").val();
        
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'updateRole',
            data: {userName: userName, newRole: newRole},
            success: function (response) {
                var jsonData = JSON.parse(response);
                if (jsonData.success == 0) {
                    alert("Role changed");
                    location.href="user.jsp";
                } 
                else {
                    $('#badRole').show();
                    $('#badRole').html("<strong>Error happen!</strong> ");
                    $("#newRole").focus();
                    return false;
                }
            }
        });
    });
});