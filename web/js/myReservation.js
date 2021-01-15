/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$("#checkMeeting").click(function (e) {
    var date = new Date();
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    var daty = year + "-" + month + "-" + day;
    var userName = $("#mFrom").val();
    
    e.preventDefault();
            $.ajax({
                type: "GET",
                url: 'checkReservation',
                data: {userName: userName, date: daty},
                success: function (response) {
                    var jsonData = JSON.parse(response);
                        alert("You recieved an email");
                }
            });
});

