var image = null;
var hotel_location = '';
var places;

function initAutocomplete() {
	var input = document.getElementById('address');
	var searchBox = new google.maps.places.SearchBox(input);
	searchBox.addListener('places_changed', function() {
		places = searchBox.getPlaces();
		setHotelLocation();
	});
}
function createHotel(){
	getInfoFromGoogle('createHotel', -1);
}
function updateHotel(hotelId) {
	getInfoFromGoogle('createHotel', hotelId);
}
	
function getInfoFromGoogle(str, id) {
	try {
		var input = document.getElementById('address');
		var text = input.value;
		text = text.replace(' ', '+');
		text = text.replace(' ', '+');
		text = text.replace(' ', '+');
		text = text.replace(' ', '+');
		text = text.replace(' ', '+');
		text = text.replace(' ', '+');
		text = text.replace(' ', '+');
		text = text.replace(' ', '+');
		if (validate()) {
			$.post('https://maps.googleapis.com/maps/api/geocode/json?address='+text+'&language=en&key=AIzaSyCKs6QYAUVp6Eb7EbfnChID4kNfYjpkLjU',
			 {}, function(result){
				places = result.results;
				hotel_x = places[0].geometry.location.lat;
				hotel_y = places[0].geometry.location.lng;
				hotel_location = places[0].formatted_address;
				var index = places[0].formatted_address;
				index = index.substring(index.lastIndexOf(",") + 2).trim();
				var re = /^([0-9]*)$/;
				if(re.test(index)){
					hotel_location = hotel_location.substring(0, hotel_location.lastIndexOf(","));
				}
				if(str == "createHotel"){
					createHotelAfter();
				}
				if(str == "updateHotel"){
					updateHotelAfter(id)
				}
			 }
			)	
		} else {
			Materialize.toast(languages.script.current.hotel.wrongData, 4000);
		}
	} catch (err) {
		invalid('address');
		return;
	}
}


function createHotelAfter() {
	var img = $('#photos').val();
	var star = $('#rating').val() == '' ? 1 : $('#rating').val();
	if (validate()) {
		$.get('../add_hotel', {
			name : $('#name').val(),
			stars : star,
			location : hotel_location,
			description : $('#desc').val(),
			phoneNumber : $('#phone').val(),
			xCoord : hotel_x,
			yCoord : hotel_y,
			hotelImages : img,
			sendNotif : document.getElementById('sendNotif').checked,
			
			hasParking : document.getElementById('hasParking').checked,
			hasPool : document.getElementById('hasPool').checked,
			hasGym : document.getElementById('hasGym').checked,
			hasSpa : document.getElementById('hasSpa').checked,
			hasService : document.getElementById('hasService').checked,
			hasCleaner : document.getElementById('hasCleaner').checked,
		}, function(result) {
			if (result != 'error') {
				Materialize.toast(languages.script.current.hotel.createSucces, 4000);
				setTimeout(function() {
					document.location.href = '/booker/cabinet/my_hotels/'
							+ result;
				}, 2000);
			} else {
				Materialize.toast(languages.script.current.hotel.createFail, 4000);
			}
		});
	} else {
		Materialize.toast(languages.script.current.hotel.wrongData, 4000);
	}
}

function updateHotelAfter(hotelId) {
	var star = $('#rating').val() == '' ? 1 : $('#rating').val();
	if (validate()) {
		$.get('../../edit_hotel', {
			hotelId : hotelId,
			name : $('#name').val(),
			stars : star,
			location : hotel_location,
			description : $('#desc').val(),
			phoneNumber : $('#phone').val(),
			deleted : document.getElementById('isDeleted').checked,
			
			hasParking : document.getElementById('hasParking').checked,
			hasPool : document.getElementById('hasPool').checked,
			hasGym : document.getElementById('hasGym').checked,
			hasSpa : document.getElementById('hasSpa').checked,
			hasService : document.getElementById('hasService').checked,
			hasCleaner : document.getElementById('hasCleaner').checked,
			
			xCoord : hotel_x,
			yCoord : hotel_y,
		}, function(result) {
			if (result != 'false') {
				Materialize.toast(languages.script.current.hotel.updateSucces, 4000);
			} else {
				Materialize.toast(languages.script.current.hotel.updateFail, 4000);
			}
		});
	} else {
		Materialize.toast(languages.script.current.hotel.wrongData, 4000);
	}
}

function validate() {
	var ok = true;
	ok = nameIsValid($('#name').val()) && ok;
	ok = starsIsValid($('#rating').val()) && ok;
	ok = addressIsValid(hotel_location) && ok;
	ok = phoneIsValid($('#phone').val()) && ok;
	ok = descIsValid($('#desc').val()) && ok;
	return ok;
}

function engLetIsValid(field) {
	var re = /^([a-zA-Z ]*)$/;
	return re.test(field);
}

function textIsValid(field) {
	var re = /^([a-zA-Zа-яА-Я0-9іІьїЇєЄ’,?=+-_.!/'" ]*)$/;
	return re.test(field);
}

function engTextIsValid(field) {
	var re = /^([a-zA-Z0-9,.;:'"!$&*()_=+ ]*)$/;
	return re.test(field);
}

function onlyTextIsValid(field) {
	var re = /^([a-zA-Zа-яА-ЯіІьїЇєЄ’.! ]*)$/;
	return re.test(field);
}

function checkAddress(field) {
	// var re = /^[a-zA-Z0-9\s,'-]*$/
	// return re.test(field);
	return true;
}

function starsIsValid(stars) {
	if (stars >= 1 && stars <= 5) {
		valid('rating');
		return true;
	} else {
		invalid('rating');
		return false;
	}
}

function addressIsValid(address) {
	if (address.length >= 5 && address.length <= 145 && checkAddress(address) && subAddressIsValid(address)) {
		valid('address');
		return true;
	} else {
		invalid('address');
		return false;
	}
}
function subAddressIsValid(address){
	var flag = true;
	var a = address;
	var index = 0;
	while(flag == true){
		if(a.indexOf(",") >= 0){
			index ++;
			a = a.substring(a.indexOf(",") + 1);
		} else {
			flag = false;
		}
	}
	if(index >= 4){
		return true;
	} else {
		return false;
	}
}

function numberIsValid(field) {
	var re = /^([0-9]*)$/;
	return re.test(field);
}

function valid(field) {
	$('#' + field).removeClass("invalid");
	$('#' + field).addClass("valid");
}

function invalid(field) {
	$('#' + field).removeClass("valid");
	$('#' + field).addClass("invalid");
}

function nameIsValid(name) {
	if (name.length >= 2 && name.length <= 45 && textIsValid(name)) {
		valid('name');
		return true;
	} else {
		invalid('name');
		return false;
	}
}

function phoneIsValid(name) {
	if (name.length >= 8 && name.length <= 15 && numberIsValid(name)) {
		valid('phone');
		return true;
	} else {
		invalid('phone');
		return false;
	}
}

function descIsValid(name) {
	if (name.length >= 10 && name.length <= 1000 && textIsValid(name)) {
		valid('desc');
		return true;
	} else {
		invalid('desc');
		return false;
	}
}

function value(value) {
	return value == null ? '' : value;
}

function updateHotelPhotos(id) {
	var file = document.querySelector('input[type=file]').files[0];
	if (file) {
		var reader = new FileReader();
		reader.onloadend = function() {
		}
		reader.readAsDataURL(file);
		var data = new FormData();
		$.each($('#imgInput')[0].files, function(i, file) {
			data.append('file-' + i, file);
		});
		$.ajax({
			url : '../../edit_hotel_pictures/' + id,
			data : data,
			cache : false,
			contentType : false,
			processData : false,
			type : 'POST',
			success : function(hotels) {
				$('#switchContent').html(hotels);
			}
		});
	}
}

function validateComas(text) {
	var re = /^([0-9]*)$/;
	return re.test(text);
}

function removeHotelPhoto() {
	var values = $('#images').val();
	$.post('../../remove_hotel_photo', {
		images : '' + values,
	}, function(photos) {
		$('#switchContent').html(photos);
	});
}

function promoteToMain() {
	var value = $('#images').val();
	var source = $('#source' + value).val();
	if (validateComas(value)) {
		$.post('../../set_main_hotel_photo', {
			photoId : '' + value,
		}, function(photos) {
			$('#switchContent').html(photos);
		});
	} else {
		alert("validateFail");
	}
}


function changeIsDeleted() {
//	var deleted = document.getElementById('isDeleted').checked;
//	$('#name').prop('disabled', deleted);
//	// $('#rating').prop('readonly', deleted);
//	$('#address').prop('disabled', deleted);
//	$('#phone').prop('disabled', deleted);
//	$('#desc').prop('disabled', deleted);
//
//	if (deleted) {
//		$('#pushImage').addClass('disabled');
//		$('#createBtn').addClass('disabled');
//		$('#btnToMain').addClass('disabled');
//	} else {
//		$('#pushImage').removeClass('disabled');
//		$('#btnToMain').removeClass('disabled');
//		$('#createBtn').removeClass('disabled');
//	}
}

var noHotelName = 'ENTER_HOTEL_NAME';
var noHotelLocation = 'ENTER_HOTEL_LOCATION';
var noHotelPhone = 'ENTER_HOTEL_PHONE';
var noHotelDesc = 'ENTER_HOTEL_DESC';

function init(){
	setHotelName();
	setHotelStars();
	setHotelLocation();
	setHotelPhone();
	setHotelDesc();
}

function setHotelName(){
	var text = $('#name').val();
	if (text.length > 45)
		return;
	$('#hotel_card_name').html(text == '' ? noHotelName : text);
}

function setHotelStars(){
	var stars = $('#rating').val();
	for(var y = 1; y < 6;y++){
		$('#card_star_'+ y).removeClass("fa-star");
		$('#card_star_'+ y).addClass("fa-star-o");
	}
	for(var y = 1; y <= stars;y++){
		$('#card_star_'+ y).removeClass("fa-star-o");
		$('#card_star_'+ y).addClass("fa-star");
	}
}

function setHotelLocation(){
	var text = $('#address').val();
	if (text.length > 999)
		return;
	$('#hotel_card_location').text(text == '' ? noHotelLocation : text);	
}

function setHotelPhone(){
	var text = $('#phone').val();
	if (text.length > 45)
		return;
	$('#hotel_card_phoneNumber').text(text == '' ? noHotelPhone : text);	
}

function setHotelDesc(){
	var text = $('#desc').val();
	if (text.length > 999)
		return;
	$('#hotel_card_desc').html(text == '' ? noHotelDesc : text);	
}

function setHotelCon(nmb,box){
	var elem = $('#con'+nmb);
	var flag = document.getElementById('' + box).checked;
	if (flag){
		elem.show();
	}
	else {
		elem.hide();
	}
}
