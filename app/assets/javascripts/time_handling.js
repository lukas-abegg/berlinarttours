

function fillDropdownHour(name) {

    var dropdown = document.getElementById(name);
    var maxHours = 24;

    // Loop through the array
    for (var i = 1; i < maxHours; ++i) {
        // Append the element to the end of Array list
        var option;
        if (i < 10){
            option = new Option(0+ i.toString(), 0+i.toString());
        }else{
            option = new Option(i, i);
        }
        dropdown[dropdown.length] = option;
    }

    return dropdown;
}

function fillDropdownMin(name) {

    var dropdown = document.getElementById(name);
    var maxMin = 60;

    // Loop through the array
    for (var i = 1; i < maxMin; ++i) {
        // Append the element to the end of Array list
        var option;
        if (i < 10){
            option = new Option(0+ i.toString(), 0+i.toString());
        }else{
            option = new Option(i, i);
        }
        dropdown[dropdown.length] = option;
    }
    return dropdown;
}

function saveTime(inputH, inputM, outputS, outputE, duration) {

    var dropdownH = document.getElementById(inputH);
    var dropdownM = document.getElementById(inputM);
    var outputSDoc = document.getElementById(outputS);
    var outputEDoc = document.getElementById(outputE);

    outputSDoc.value = dropdownH.value + ":" + dropdownM.value;

    var durationArr = duration.split(":");
    var durationH = +dropdownH.value + +durationArr[0];
    var durationM = +dropdownM.value + +durationArr[1];

    if (durationH > 24 ){
        durationH = +durationH - +24;
    }
    if (durationM > 59 ){
        durationH = +durationH + +1;
        durationM = +durationM - +60;
    }
    if (durationH < 10){
        durationH = 0 + durationH.toString();
    }
    if (durationM < 10){
        durationM = 0 + durationM.toString();
    }

    outputEDoc.value =  durationH + ":" + durationM;
}

function saveDuration(inputH, inputM, outputS) {

    var dropdownH = document.getElementById(inputH);
    var dropdownM = document.getElementById(inputM);
    var outputSDoc = document.getElementById(outputS);

    outputSDoc.value = dropdownH.value + ":" + dropdownM.value;
}