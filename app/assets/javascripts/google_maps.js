/**
 * Created by lukas on 07/03/15.
 */

var rendererOptions = {
    draggable: true
};
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);;
var directionsService = new google.maps.DirectionsService();
var map;

var berlin = new google.maps.LatLng(52.565039, 13.366349);
var trip_stations = $.parseJSON("#{j @trip_stations_js}");
var waypointsArr = []

function initialize() {

    console.log("include"+ trip_stations);

    trip_stations.forEach(function(station)
    {
        //waypointsArr.append(new google.maps.LatLng(station.location[0], station.location[1]));
        //console.log("log:"+new google.maps.LatLng(station.location[0], station.location[1]));
        console.log("asdasdads");
    });


    var mapOptions = {
        zoom: 7,
        center: berlin
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directionsPanel'));

    google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
        computeTotalDistance(directionsDisplay.getDirections());
    });

    calcRoute();
}

google.maps.event.addDomListener(window, 'load', initialize);