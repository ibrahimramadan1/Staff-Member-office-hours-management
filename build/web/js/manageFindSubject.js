/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$("#searchor").change(function () {
    var value = $(this).val();
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



