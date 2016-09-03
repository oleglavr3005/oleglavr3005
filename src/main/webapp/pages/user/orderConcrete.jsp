<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.i18n.text" />
<html lang="en">

<head>

<meta charset="utf-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link type="image/png" rel="icon"
	href="${pageContext.servletContext.contextPath}/resources/themes/images/ico/favicon.png">
<title>MAIN PAGE</title>

<link
	href="${pageContext.servletContext.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="${pageContext.servletContext.contextPath}/resources/bootstrap/css/simple-sidebar.css"
	rel="stylesheet">

<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/materialize/css/materialize.min.css"
	media="screen,projection" />


<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/bootstrap/css/languages.min.css">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.5.1/nouislider.min.css"
	rel="stylesheet">

<style>
div #sidebar-wrapper {
	position: relative;
	left: 0;
	margin-top: 0px;
}

.bg-img {
	border-style: solid;
	border-width: 3px 0px 0px;
	border-color: grey;
	width: 100%;
	/* 	background: */
	/* 		url('http://3.bp.blogspot.com/-UXVFcPTKwrk/VC9-GaPAooI/AAAAAAAAFfo/g_uYO8A1PCo/s1600/black%2Bgrey%2Bgradient%2Bbackground%2Bfor%2Bweb.jpg') */
	background:
		url(${pageContext.servletContext.contextPath}/resources/images/foot.jpg)
		center center no-repeat;
	background-size: cover; &: before { content : '';
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-image: linear-gradient(to bottom right, #002f4b, #dc4225);
	opacity: .6;
}

.well {
	padding: 0px;
}
</style>
<style>
.invert:hover {
	-webkit-filter: invert(70%);
	filter: invert(70%);
}
</style>
</head>


<body>
	<input id="mapping" type="hidden"
		value="${pageContext.servletContext.contextPath}/" />

	<input id="lang" type="hidden" value="${language}" />


	<!-- Header ========================================================================= -->
	<jsp:include page="/pages/header.jsp"></jsp:include>
	<!-- Header End====================================================================== -->

	<div class="container">

<div id="links">
			<div class="row" style="margin-bottom: 0;">
				<div class="col s4">
					<a href='<c:out value="${mainPhoto.id}"></c:out>' title="Banana"
						data-gallery> <img
						src="<c:out value="${mainPhoto.img}"></c:out>" alt="Banana">
					</a>


					<div style="overflow-x: auto;">
						<div style="margin: 10px; white-space: nowrap;">
							<c:forEach items="${hotelPhotos}" var="photo">
								<div style="display: inline-block;">
									<a href='<c:out value="${photo.img }"></c:out>'
										title="<c:out value="${photo.img }"></c:out>" data-gallery>
										<img style="height: 60px;"
										src="<c:out value="${photo.img }"></c:out>"
										alt="<c:out value="${photo.img }"></c:out>">
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="col s8">
					<div class="container-fluid">
						<div class="row" style="margin-bottom: 0;">
							<div class="col s6" style="width: 30%;">
								<h5>
									<c:out value="${hotel.name }"></c:out>
								</h5>
							</div>
							<div class="row">
							    <h5 style=" font-size: 1rem;     margin: 1.2rem 0 0.656rem 0;">
									<c:out value="${room.type }"></c:out>
								</h5>
							</div>
						</div>
						<div class="row">
							<i class="fa fa-lg icon-map-marker" aria-hidden="true"></i> <span>${hotel.city}
								${hotel.street}</span>
						</div>
						<div class="col s3">
						<div class="row">
							<c:if test="${room.wifi == true}">
								<div class="row col s6" style="margin-top: 5px; width: 100%;">
									<a class="tooltipped" data-position="icon" data-tooltip="Wifi" style="color: #0d0d0d;"><i  class="material-icons invert">wifi</i></a>
									<span>Wifi</span>
								</div>
							</c:if>

							<c:if test="${room.shower == true}">
								<div class="row col s6" style="margin-top: 5px; width: 24%;">
									<a class="tooltipped" data-position="icon" data-tooltip="Shower"><img class="invert" style="max-width: 230%;" src="${pageContext.servletContext.contextPath}/resources/images/Shower-512.png"/></a>
								<span>Shower</span>
								</div>
							</c:if>

							<c:if test="${room.parking == true}">
								<div class="col s6" style="margin-top: 5px; width: 100%;">
									<a class="tooltipped" data-position="icon" data-tooltip="Parking" style="color: #0d0d0d;"><i class="material-icons invert">local_parking</i></a>
								<span>Parking</span>
								</div>
							</c:if>

							<c:if test="${room.condition == true}">
								<div class="col s6" style="margin-top: 5px; width: 100%;">
								<a class="tooltipped" data-position="icon" data-tooltip="Condition" style="color: #0d0d0d;"><i class="material-icons invert">toys</i></a>
								<span>Condition</span>
								</div>
							</c:if>

							<c:if test="${room.pool == true}">
								<div class="col s6" style="margin-top: 5px; width: 100%;">
								<a class="tooltipped" data-position="icon" data-tooltip="Pool" style="color: #0d0d0d;"><i class="material-icons invert">pool</i></a>
								<span>Pool</span>
								</div>
							</c:if>

							<c:if test="${room.gym == true}">
								<div class="col s6" style="margin-top: 5px; width: 100%;">
								<a class="tooltipped" data-position="icon" data-tooltip="Gym" style="color: #0d0d0d;"><i class="material-icons invert">fitness_center</i></a>
								<span>Gym</span>
								</div>
							</c:if>

							<c:if test="${room.balcony == true}">
								<div class="col s6" style="margin-top: 5px; width: 23%;">
								<a class="tooltipped" data-position="icon" data-tooltip="Balcony"><img class="invert" style="max-width: 230%;" src="${pageContext.servletContext.contextPath}/resources/images/balcony.png"/></a>
								<span>Balcony</span>
								</div>
							</c:if>
						</div>
						</div>
						<div class="row col s12" style="margin-bottom: 0;">
							<p>Start date ${order.startDate}</p>
						</div>
						
						<div class="row col s12" style="margin-bottom: 0;">
							<p>End date ${order.endDate}</p>
						</div>
						
						<div class="row col s12" style="margin-bottom: 0;">
							<p>Order date ${order.orderDate}</p>
						</div>
						
						<div class="row col s12" style="margin-bottom: 0;">
							<p>Status ${order.status}</p>
						</div>
						
						<div class="row col s12">
							<p>Price ${order.price}</p>
						</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>




	<!-- Footer ========================================================================== -->
	<jsp:include page="/pages/foot.jsp"></jsp:include>
	<!-- Footer End====================================================================== -->

	<div id="modal1" class="modal"
		style="width: 25% !important; max-height: 40% !important">
		<div class="modal-content">
			<!-- 			<h4>VK auth</h4> -->
			<p>
				<img alt="Vk Log"
					src="http://1863x.com/wp-content/uploads/2016/01/vk-vkontakte-logo-vk.jpg"
					width="275px" height="200px;">
			</p>
			<div class="progress" style="width: 275px;">
				<div class="indeterminate"></div>
			</div>
			<!-- 			<div class="modal-footer"> -->

			<!-- 			</div> -->
		</div>

	</div>

	<c:if test="${vkOAuth}">
		<script type="text/javascript">
			$(document).ready(function() {
				$(window).load(function() {

					$('.modal-trigger').leanModal();
					$('#modal1').openModal();

					debugger;

					var token = window.location.hash.substr(1);
					$.post('vk_oauth', {
						token : token.split("&")[0].split("=")[1],
						user_id : token.split("&")[2].split("=")[1]
					}, function() {
						//NEED normal names
						document.location.href = '/MainPage/';

					});
				});
			});
		</script>
	</c:if>



	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/resources/js/search/search.js"></script>
		
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.5.1/nouislider.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.5.1/nouislider.min.js"></script>

	<script>
		var range = document.getElementById('rangeSlider');
		noUiSlider.create(range, {
			start : [ 1, 5 ], // Handle start position
			step : 1, // Slider moves in increments of '1'
			connect : true, // Display a colored bar between the handles
			behaviour : 'tap-drag', // Move handle on tap, bar is draggable
			range : { // Slider can select '1' to '5'
				'min' : 1,
				'max' : 5
			}
		});
	</script>
	
	<script>
	var range2 = document.getElementById('priceSlider');
	noUiSlider.create(range2, {
		start : [ 100, 5000 ], // Handle start position
		step : 1, // Slider moves in increments of '1'
		connect : true, // Display a colored bar between the handles
		behaviour : 'tap-drag', // Move handle on tap, bar is draggable
		range : { // Slider can select '1' to '5'
			'min' : 100,
			'max' : 5000
		}
	});
	
	function togle(){
		var elem1 = document.getElementById("details_panel");
		var style = document.defaultView.getComputedStyle(elem1, null).getPropertyValue("display");
		if (style == 'none'){
			document.getElementById('details_panel').style.display = "block";
			
			$('#arrow_icon').removeClass("fa-angle-double-down");
			$('#arrow_icon').addClass("fa-angle-double-up");
		}
		else {
			document.getElementById('details_panel').style.display = "none";
			
			$('#arrow_icon').removeClass("fa-angle-double-up");
			$('#arrow_icon').addClass("fa-angle-double-down");
		}
	}
	
	</script>



	
	
</body>

</html>