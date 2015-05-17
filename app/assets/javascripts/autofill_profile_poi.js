$(document).ready(function () {
    $("#profile_poi_name").keyup(function () {
        $("#profile_poi_description").val("Eine schöne Kunstgalerie über verschiedene Picasso Kunstwerke.");
        $("#profile_poi_phone").val("0178 777 222 22");
        $("#profile_poi_mobile").val("0178 723 32 23");
        $("#profile_poi_street").val("Seestrasse");
        $("#profile_poi_house_number").val("23");
        $("#profile_poi_postcode").val("13348");
        $("#profile_poi_city").val("Berlin");
        $("#profile_poi_country").val("Deutschland");
    });
});