map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 52.3176039, lng: 4.9044912},
  zoom: 13
});

new google.maps.Marker({
      position: {lat: 52.3176039, lng: 4.9044912},
      map: map,
      title: 'Amstel River Shortstay'
    });
