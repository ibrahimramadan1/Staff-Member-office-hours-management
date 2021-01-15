
$('#bad').hide();
$("#bad1").hide();
$(document).ready(function () {
    $('#bad').hide();
    $('#addofficehrs').submit(function (e) {
        var date = new Date($('#date').val());
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();


        var userName = $("#mFrom").val();


        var fromHours = $("#fromHours").val();
        var fromMinutes = $("#fromMinutes").val();
        var fromPeriod = $("#fromPeriod").val();
        var toHours = $("#toHours").val();
        var toMinutes = $("#toMinutes").val();
        var toPeriod = $("#toPeriod").val();


        var type = $("#type").val();
        var address = $("#address").val();
        var daty = year + "-" + month + "-" + day;
        var from = fromHours + ":" + fromMinutes + fromPeriod;
        var to = toHours + ":" + toMinutes + toPeriod;

        if (isNaN(day) || isNaN(month) || isNaN(year)) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#date").focus();
            return false;
        } else if (address.length == 0) {
            $('#bad').show();
            $('#bad').html("<strong>Enter the empty input</strong> ");
            $("#address").focus();
            return false;
        } else {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: 'addOfficehrs',
                data: {userName: userName, type: type, address: address, date: daty, from: from, to: to},
                success: function (response) {
                    var jsonData = JSON.parse(response);
                    if (jsonData.success == 0) {
                        $('#bad').hide();
                        alert("office hours added");
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


$(document).ready(function () {
    $("#bad1").hide();
    $('#cancelDay').submit(function (e) {
        var date = new Date($('#dayDate').val());
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        var todayDate = new Date();
        var userName = $("#mFrom").val();
        var daty = year + "-" + month + "-" + day;
        var cancleContent = "cancelDay";

        if (isNaN(day) || isNaN(month) || isNaN(year)) {
            $('#bad1').show();
            $('#bad1').html("<strong>Enter the empty input</strong> ");
            $("#dayDate").focus();
            return false;
        } else if (todayDate > date) {
            $('#bad1').show();
            $('#bad1').html("<strong>this is not a coming date</strong> ");
            $("#dayDate").focus();
            return false;
        } else {
            e.preventDefault();
            $.ajax({
                    type: "POST",
                    url: 'meetingMails',
                                   // meeting owner               // meeting date
                    data: {userName: userName, date:daty, content: cancleContent},
                    success: function (response) {
                        var jsonData = JSON.parse(response);
                        if (jsonData.success == 0) {
                            $('#bad1').hide();
                            alert("canceled Mail sent");
                        }
                        else {
                            $('#bad1').hide();
                            alert("Cancel Mail not sent");
                            return false;
                        }
                    }
                }).then(
                        $.ajax({
                        type: "POST",
                        url: 'cancelDay',
                        data: {userName: userName, date: daty},
                        success: function (response) {
                            var jsonData = JSON.parse(response);
                            if (jsonData.success == 0) {
                                $('#bad1').hide();
                                alert("your day is canceled");
                            }
                            else {
                                $('#bad1').hide();
                                alert("you don't have any meetings this day");
                                return false;
                            }
                        }
                        })
                    );
                
            
        }
    });
});