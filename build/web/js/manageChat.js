/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(".messages").animate({scrollTop: $(document).height()}, "fast");

$("#profile-img").click(function () {
    $("#status-options").toggleClass("active");
});

$(".expand-button").click(function () {
    $("#profile").toggleClass("expanded");
    $("#contacts").toggleClass("expanded");
});

$("#status-options ul li").click(function () {
    $("#profile-img").removeClass();
    $("#status-online").removeClass("active");
    $("#status-away").removeClass("active");
    $("#status-busy").removeClass("active");
    $("#status-offline").removeClass("active");
    $(this).addClass("active");

    if ($("#status-online").hasClass("active")) {
        $("#profile-img").addClass("online");
    } else if ($("#status-away").hasClass("active")) {
        $("#profile-img").addClass("away");
    } else if ($("#status-busy").hasClass("active")) {
        $("#profile-img").addClass("busy");
    } else if ($("#status-offline").hasClass("active")) {
        $("#profile-img").addClass("offline");
    } else {
        $("#profile-img").removeClass();
    }
    ;

    $("#status-options").removeClass("active");
});

function newMessage() {
    var message = $(".message-input input").val();
    if ($.trim(message) == '') {
        return false;
    }
    else {
        var to = $("#mTo").val();
        var from = $("#mFrom").val();
        $.ajax({
            type: "GET",
            url: 'sendMessage',
            data: {to: to, from: from, message: message},
            success: function (response) {
                var jsonData = JSON.parse(response);
                if (jsonData.success == 0) {
                    getChat(to, from);
                }
                else {
                    alert("message didn't sent");
                }
            }
        });

    }

}
;

$('.submit').click(function () {
    newMessage();
});

$(window).on('keydown', function (e) {
    if (e.which == 13) {
        newMessage();
        return false;
    }
});

$("#searchor").change(function () {
    var value = $(this).val();
    var from = $("#mFrom").val();
    if (!value.trim()) {
        $("#contacts").html("");
    }
    if (value == from) {
        $("#contacts").html("<h3>this is you,lol</h3>");
    } else {
        $.ajax({
            type: "GET",
            url: 'searchForContacts',
            data: {search: value},
            success: function (response) {
                $("#contacts").html(response);
            }
        });
    }
});
function getChat(to, from) {
    $.ajax({
        type: "GET",
        url: 'getChat.jsp',
        data: {to: to, from: from},
        success: function (response) {
            $("#chaty").html(response);
            $(".messages").animate({scrollTop: '2000px'}, "fast");
        }
    });
}
$("#contacts").click(function () {
    var to = $("#mTo").val();
    var from = $("#mFrom").val();
    if (to != null) {
        getChat(to, from);
    } else {
        $("#chaty").html(" ");
    }
});
