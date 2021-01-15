/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $('#bad').hide();
    $('#dates').submit(function (e) {
        var date = new Date($('#fromDate').val());
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        var date1 = new Date($('#toDate').val());
        var day1 = date1.getDate();
        var month1 = date1.getMonth() + 1;
        var year1 = date1.getFullYear();
        var userName = $("#mFrom").val();

        var daty = year + "-" + month + "-" + day;
        var daty1 = year1 + "-" + month1 + "-" + day1;

        if (isNaN(day) || isNaN(month) || isNaN(year)) {
            alert("Enter from date");
            return false;
        } else if (isNaN(day1) || isNaN(month1) || isNaN(year1)) {
            alert("Enter to date");
            return false;
        } else {
            e.preventDefault();
            $.ajax({
                type: "GET",
                url: 'getMyOH.jsp',
                data: {userName: userName, from: daty, to: daty1},
                success: function (response) {
                    $("#urOH").html(response);
                }
            });
        }
    });
});
$("#checkMeeting").click(function (e) {
    var date = new Date();
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    var daty = year + "-" + month + "-" + day;
});