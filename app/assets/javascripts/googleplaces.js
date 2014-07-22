$(document).ready(function(){
	checkAddressField();
});

function checkAddressField()
{
 if($('.add-location').length)
 {
 	initialize_autocomplete();

 }
}

function initialize_autocomplete() {
	var mapOptions = {
       types: ['geocode']
	};

	input = document.getElementsByClassName('add-location')[0]
	
	var autocomplete = new google.maps.places.Autocomplete(input, mapOptions);

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();

		if (place.geometry) {
			$(document).find('#llat').val(place.geometry.location.lat());
			$(document).find('#llng').val(place.geometry.location.lng());
		}
	});

}