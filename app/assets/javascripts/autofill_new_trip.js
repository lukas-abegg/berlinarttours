$(document).ready(function () {
    $("#trip_name").keyup(function () {
        $("#trip_description").val("Eine schöne Tour durch typische DDR Kunstgalerien. Erleben Sie das Flair der " +
            "russisch-deutschen Kultur aus der Zeit vor dem Mauerfall.");
        $("#trip_contact").val("Ich biete die Tour das komplette Wochenende an. Unter der Woche nur mit Ausnahme.");
        $("#trip_notes").val("Die Fahrten zwischen den Tourstationen können vakant auch mit Trabis durchgeführt werden.");
        $("#trip_meeting_point").val("Friedrichstrasse, 10117 Berlin");
    });
});
