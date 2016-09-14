<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="i" uri="../../WEB-INF/PrintImage.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link
	href="${pageContext.servletContext.contextPath}/resources/js/image-picker/image-picker.css"
	rel="stylesheet">

<select class="image-picker masonry show-html" id="images"
	multiple="multiple">
	<c:forEach var="photo" items="${hotel.photos}">
		<c:if test="${photo.id != 0}">
			<option data-img-src="<i:urlToImage url="${photo.img }" />"
				value="${photo.id}">${photo.desc }</option>
		</c:if>
	</c:forEach>
</select>

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/image-picker/image-picker.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/image-picker/image-picker.min.js"></script>
<script
	src="http://rvera.github.io/image-picker/js/jquery.masonry.min.js"></script>
<script type="text/javascript">
	$("select").imagepicker();
	var container = jQuery("select.image-picker.masonry").next("ul.thumbnails");
	container.imagesLoaded(function() {
		container.masonry({
			itemSelector : "li",
		});
	});
</script>