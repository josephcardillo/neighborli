function initMap() {
  if (document.querySelector("#gmap-form")) {
    // If we're on a page with a gmap form:
    const input = document.querySelector("#pac-input");
    const item_loc = document.querySelector("#transaction_item_location");

    // Init map element with Philly placeholder.
    var map = new google.maps.Map(document.querySelector("#map"), {
      center: {
        lat: 39.9523585,
        lng: -75.1636103
      },
      zoom: 13
    });

    // Init the marker.
    var marker = new google.maps.Marker({ map: map });

    // Init the tooltip for markers.
    var infowindow = new google.maps.InfoWindow();
    var infowindowContent = document.querySelector("#infowindow-content");
    infowindow.setContent(infowindowContent);
    // Show place info when marker is clicked.
    marker.addListener("click", () => {
      infowindow.open(map, marker);
    });

    // Place the address input on the top center of the map.
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);

    // Enable autocomplete for address input.
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo("bounds", map);

    // If successfully picked a new place:
    autocomplete.addListener("place_changed", () => {
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
      placeId = item_loc.value;
      geocodeItemLoc(geocoder, map, infowindow, marker, placeId);
    }
  } else if (document.querySelectorAll(".gmap-show").length > 0) {
    // If we're on a page just showing gmaps:
    // .gmap-show
    // .gmap{data: {placeid: transaction.item_location} }

    document.querySelectorAll(".gmap-show").forEach((el, idx) => {
      if (el.getElementsByClassName("gmap").length == 0) {
        return;
      }

      // Grab the placeID before it's replaced by the map.
      var placeId = el.getElementsByClassName("gmap")[0].dataset.placeid;

      // Init map element with Philly placeholder.
      var map = new google.maps.Map(el, {
        center: {
          lat: 39.9523585,
          lng: -75.1636103
        },
        zoom: 13
      });
      var marker = new google.maps.Marker({ map: map });
      var geocoder = new google.maps.Geocoder();
      var infowindow = new google.maps.InfoWindow();
      geocodeItemLoc(geocoder, map, infowindow, marker, placeId);
    }); // gmap.each()
  } // Show Non-editing Maps.
} // initMap()

// Loads a Place ID from the database into the map.
function geocodeItemLoc(geocoder, map, infowindow, marker, placeId) {
  geocoder.geocode(
    { placeId: placeId },
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
        } // results[0]
      } // status = OK
    } // (res, stat)
  ); // geocoder.geocode()
} // geocodeItemLoc()