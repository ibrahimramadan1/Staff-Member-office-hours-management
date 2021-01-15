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
        $("#OH").html("");
    } else {
        $.ajax({
            type: "GET",
            url: 'searchForOH.jsp',
            data: {search: value,userName:userName,date:daty},
            success: function (response) {
                $("#OH").html(response);
            }
        });
        
    }
});




