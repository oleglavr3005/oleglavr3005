<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="comment" items="${feedbacks}">
	<div class="comment_card" id="comment_id_${comment.id}"
		style="margin: 20px; display: none">
		<div class="row" style="margin-bottom: 0;">
			<div class="media">
				<img
					src='/booker/get_image/${comment.user.image}'
					style="margin-right: 0; padding-left: 11px; width: 10%;" width="60"
					height="60" alt="Avatar" class="pull-left">
				<div class="media-body">
					<h4 style="font-size: 1.3rem; margin-top: 0; margin-bottom: 10px;">
						<c:out value="${comment.user.firstName}"></c:out>
						<c:out value="${comment.user.lastName}"></c:out>
						<c:if test="${comment.user.status == 'BANNED'}">
							<span class="feedback_banned" 
								style="font-size: 0.7rem; background-color: darkslateblue; color: #f3eeee; padding: 0 4px 0 4px;  border-radius: 10px;">
							</span>
						</c:if>
					</h4>
					<a class="tooltipped" data-position="icon" data-tooltip="Stars"
						style="color: #0d0d0d; text-decoration: none;"
						data-tooltip-id="5701b81f-c345-f4bd-c005-58f8e04f7175"><c:forEach
							var="i" begin="1" end="${comment.rating}">
							<i class="fa fa-lg fa-star" aria-hidden="true"></i>
						</c:forEach> <c:forEach var="i" begin="${comment.rating}" end="4">
							<i class="fa fa-lg fa-star-o" aria-hidden="true"></i>
						</c:forEach></a><span class="date_posted" style="padding-left: 20px;"><c:out
							value="${comment.date}"></c:out></span>
				</div>
			</div>
			<div style="margin: 20px 0 0 12px; padding-left: 1.5rem; border-left: 4px solid #ee6e73; word-wrap: break-word;">
				<span class="title_comment_span" style="font-weight: bold; margin : 0;"></span> : 
				<c:out value="${comment.title}"></c:out>
				<br>
				<c:out value="${comment.comment}"></c:out>
			</div>
		</div>
	</div>
</c:forEach>
<c:if test="${newRating != null}">
<script> var newRating = ${newRating}</script> 
</c:if>
