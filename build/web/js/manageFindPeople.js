/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$("#searchor").change(function () {
    var value = $(this).val();
    var from = $("#mFrom").val();
    if (!value.trim()) {
        $("#people").html("");
    }
    else if (value == from) {
        $("#people").html("<h3>this is you,lol</h3>");
    } else {
        $.ajax({
            type: "GET",
            url: 'searchForContact.jsp',
            data: {search: value},
            success: function (response) {
                $("#people").html(response);
            }
        });
    }
});
