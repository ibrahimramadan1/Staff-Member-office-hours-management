/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$("#searchor").change(function () {
    var value = $(this).val();
    var userName = $("#mFrom").val();
    var date = new Date();
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    var daty = year + "-" + month + "-" + day;
    if (!value.trim()) {
        $("#subject").html("");
    } else {
        $.ajax({
            type: "GET",
            url: 'searchForSubject.jsp',
            data: {search: value},
            success: function (response) {
                $("#subject").html(response);
            }
        });

    }
});



