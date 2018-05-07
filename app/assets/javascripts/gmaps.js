function initMap() {
  // Cache DOM elements.
  var input = document.getElementById("pac-input");
  var item_loc = document.getElementById("transaction_item_location");

  // Init map element.
  var map = new google.maps.Map(document.getElementById("map"), {
    center: {
      lat: 39.9523585,
      lng: -75.1636103
    },
    zoom: 13
  });

  // Enable autocomplete for address input.
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo("bounds", map);

  // Place the location input on the top center of the map.
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);

  // Init the tooltip for markers.
  var infowindow = new google.maps.InfoWindow();
  var infowindowContent = document.getElementById("infowindow-content");
  infowindow.setContent(infowindowContent);

  // Init the marker.
  var marker = new google.maps.Marker({
    map: map
  });

  // Show place info when marker is clicked.
  marker.addListener("click", function() {
    infowindow.open(map, marker);
  });

  // If successfully picked a new place:
  autocomplete.addListener("place_changed", function() {
    // Close the current (old) marker tooltip.
    infowindow.close();

    // Get new place:
    var place = autocomplete.getPlace();

    // If it's not a place, do nothing.
    if (!place.geometry) {
      return;
    }

    // Pan to the new location in-map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
    }

    // Set the position of the marker using the place ID and location.
    marker.setPlace({
      placeId: place.place_id,
      location: place.geometry.location
    });
    marker.setVisible(true);

    // Populate the tooltip with info for the new location and show it.
    infowindowContent.children["place-name"].textContent = place.name;
    infowindowContent.children["place-address"].textContent =
      place.formatted_address;
    infowindow.open(map, marker);

    // Save the Place ID to our form to be written into the database.
    item_loc.value = place.place_id;
  });

  // For translating Address <=> Place ID.
  var geocoder = new google.maps.Geocoder();

  // If we're in "edit" and it already has a place, load it.
  if (item_loc.value != "") {
    geocoder.geocode(
      { placeId: item_loc.value },
      function(results, status) {
        if (status === "OK") {
          if (results[0]) {
            // Pan to the new location in-map.
            if (results[0].geometry.viewport) {
              map.fitBounds(results[0].geometry.viewport);
            } else {
              map.setCenter(results[0].geometry.location);
              map.setZoom(17);
            }
            marker.setPlace({
              placeId: results[0].place_id,
              location: results[0].geometry.location
            });
            infowindow.setContent(results[0].formatted_address);
            infowindow.open(map, marker);
          }
        }
      } // (res, stat)
    ); // geocoder.geocode()
  }
} // initMap()

// Loads a Place ID from the database into the map.
function geocodeItemLoc(geocoder, map, infowindow, marker) {
  var placeId = item_loc.value;
}
