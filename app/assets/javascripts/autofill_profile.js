$(document).ready(function () {
    $("#profile_first_name").keyup(function () {
        $("#profile_last_name").val("Müller");
        $("#profile_phone").val("0176 777 222 22");
        $("#profile_mobile").val("0176 723 32 23");
        $("#profile_street").val("Amendestrasse");
        $("#profile_house_number").val("106");
        $("#profile_postcode").val("13409");
        $("#profile_city").val("Berlin");
        $("#profile_country").val("Deutschland");
    });
});