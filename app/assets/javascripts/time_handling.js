

function fillDropdownHour(name) {

    var dropdown = document.getElementById(name);
    // Loop through the array
    for (var i = 0; i < myArray.length; ++i) {
        // Append the element to the end of Array list
        dropdown[dropdown.length] = new Option(myArray[i], myArray[i]);
    }
​}