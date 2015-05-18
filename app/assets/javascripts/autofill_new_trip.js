$(document).ready(function () {
    $("#trip_name").keyup(function () {
        $("#trip_description").val("Eine schöne Tour durch typische DDR Kunstgalerien. Erleben Sie das Flair der " +
            "russisch-deutschen Kultur aus der Zeit vor dem Mauerfall.");
        $("#trip_contact").val("Ich bin per Handy und Email erreichbar.");
        $("#trip_notes").val("Ich biete die Tour das komplette Wochenende an. Unter der Woche nur mit Ausnahme.");
        $("#trip_meeting_point").val("Friedrichstrasse, 10117 Berlin");
    });
});
