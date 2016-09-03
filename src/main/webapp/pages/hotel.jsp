<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="i" uri="../WEB-INF/PrintImage.tld"%>
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
<title>${hotel.name}</title>

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


<!-- Add local libraries for gallery -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/hotel/font-awesome.min.css">

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/hotel/jquery-ui.css">

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/hotel/nouislider.min.css">

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/hotel/blueimp-gallery.min.css">

<script
	src="${pageContext.servletContext.contextPath}/resources/js/hotel/jquery.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/resources/js/hotel/jquery.blueimp-gallery.min.js"></script>
<!--  
not add
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
add
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.5.1/nouislider.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="css/bootstrap-image-gallery.min.css">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>


-->
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
</head>


<body>
	<div id="blueimp-gallery" class="blueimp-gallery">
		<!-- The container for the modal slides -->
		<div class="slides"></div>
		<!-- Controls for the borderless lightbox -->
		<h3 class="title"></h3>
		<a class="prev">‹</a> <a class="next">›</a> <a class="close">×</a> <a
			class="play-pause"></a>
		<ol class="indicator"></ol>
		<!-- The modal dialog, which will be used to wrap the lightbox content -->
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" aria-hidden="true">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body next"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left prev">
							<i class="glyphicon glyphicon-chevron-left"></i> Previous
						</button>
						<button type="button" class="btn btn-primary next">
							Next <i class="glyphicon glyphicon-chevron-right"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input id="lang" type="hidden" value="${language}" />


	<!-- Header ========================================================================= -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header End====================================================================== -->

	<div class="container" style="margin-top: 20px">

		<div id="links">
			<div class="row">
				<div class="col s4">
					<c:if test="${mainPhoto == null}">
						<a
							href='http://lindagalindotestenvironment.com.s179953.gridserver.com.s179953.gridserver.com/wp-content/uploads/2013/12/no.jpg'
							title="http://lindagalindotestenvironment.com.s179953.gridserver.com.s179953.gridserver.com/wp-content/uploads/2013/12/no.jpg"
							data-gallery> <img
							src="http://lindagalindotestenvironment.com.s179953.gridserver.com.s179953.gridserver.com/wp-content/uploads/2013/12/no.jpg"
							alt="http://lindagalindotestenvironment.com.s179953.gridserver.com.s179953.gridserver.com/wp-content/uploads/2013/12/no.jpg">
						</a>
					</c:if>
					<c:if test="${mainPhoto != null}">
						<a href='<i:urlToImage url="${mainPhoto.img}" />'
							title="<c:out value="${mainPhoto.desc }"></c:out>" data-gallery>
							<img src="<i:urlToImage url="${mainPhoto.img}" />"
							alt="<c:out value="${mainPhoto.desc }"></c:out>">
						</a>


						<div style="overflow-x: auto;">
							<div style="margin: 10px; white-space: nowrap;">
								<c:forEach items="${hotelPhotos}" var="photo">
									<div style="display: inline-block;">
										<a href='<i:urlToImage url="${photo.img}" />'
											title="<c:out value="${photo.desc }"></c:out>" data-gallery>
											<img style="height: 60px;"
											src="<i:urlToImage url="${photo.img}" />"
											alt="<c:out value="${photo.desc }"></c:out>">
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</div>

				<div class="col s8">
					<div class="container-fluid">
						<div class="row">
							<div class="col s6">
								<h5>
									<c:out value="${hotel.name }"></c:out>
								</h5>
							</div>
							<div class="col s4 offset-s1" style="margin-top: 15px;">
								<c:forEach var="i" begin="1" end="${hotel.stars}">
									<i class="fa fa-lg fa-star-o" aria-hidden="true"></i>
								</c:forEach>
							</div>
						</div>
						<div class="row">
							<i class="fa fa-lg icon-map-marker" aria-hidden="true"></i> <span>${hotel.city}
								${hotel.street}</span>
						</div>

						<div class="row" style="margin-bottom: 5px">
							<i class="material-icons" style="font-size: 20px;">receipt</i> <span>${hotel.desc}</span>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="container">
		<div id="switchContent" class="row">
			<jsp:include page="roomCard.jsp"></jsp:include>
		</div>
	</div>


	<!-- Footer ========================================================================== -->
	<jsp:include page="foot.jsp"></jsp:include>
	<!-- Footer End====================================================================== -->

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

</body>

</html>