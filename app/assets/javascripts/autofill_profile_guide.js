$(document).ready(function () {
    $("#profile_guide_first_name").keyup(function () {
        $("#profile_guide_last_name").val("Meister");
        $("#profile_guide_description").val("Ich bin ein offener netter Mensch und mag es Leute herumzuführen.");
        $("#profile_guide_experience").val("Touristenguide für Galerien in ganz Deutschland.");
        $("#profile_guide_phone").val("0177 777 222 22");
        $("#profile_guide_mobile").val("0177 723 32 23");
        $("#profile_guide_street").val("Grünbergestrasse");
        $("#profile_guide_house_number").val("10");
        $("#profile_guide_postcode").val("10243");
        $("#profile_guide_city").val("Berlin");
        $("#profile_guide_country").val("Deutschland");
    });
});