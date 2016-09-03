<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.i18n.text" />

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/themes/bootshop/bootstrap.min.css"
	media="screen" />
<link
	href="${pageContext.servletContext.contextPath}/resources/themes/css/base.css"
	rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link
	href="${pageContext.servletContext.contextPath}/resources/themes/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.servletContext.contextPath}/resources/themes/css/font-awesome.css"
	rel="stylesheet" type="text/css">

<!-- Materialize -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/materialize/css/materialize.min.css"
	media="screen,projection" />

<!--  Scripts -->
<script
	src="${pageContext.servletContext.contextPath}/resources/themes/js/jquery.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/themes/js/bootstrap.min.js"
	type="text/javascript"></script>

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/materialize/js/materialize.min.js"></script>

<!-- Slider stuff	 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<style>
body {
	background-color: #F7F7F7;
}

img.logo {
	width: 140px;
	height: 50px;
}

.login {
	margin-top: 5px;
}

.btn-large {
	height: 30px;
	line-height: 30px;
}

.imageavatar:hover {
	cursor: pointer;
}
</style>

<!-- =================================================================== -->
<fmt:message key="header.error.name" var="fmtName" />

<fmt:message key="header.error.surname" var="fmtSurname" />

<fmt:message key="header.error.pass" var="fmtPass" />

<fmt:message key="header.error.cpass" var="fmtCpass" />

<fmt:message key="header.error.mail" var="fmtMail" />

<fmt:message key="header.error.mailpass" var="fmtMailPass" />

<fmt:message key="header.error.mailuse" var="fmtMailUse" />

<fmt:message key="header.regist" var="fmtRegist" />

<fmt:message key="header.regist.succes" var="fmtSucces" />

<fmt:message key="header.regist.confirmmail" var="fmtConfirm" />

<fmt:message key="header.error.fail" var="fmtFail" />

<!-- =================================================================== -->


<nav class="navbar navbar-default navbar-static-top"
	style="margin-bottom: 0px; background: #0d0d0d;">
	<div class="container-fluid">
		<div class="navbar-header"
			style="margin-left: 30px; margin-right: 50px;">

			<a href="${pageContext.servletContext.contextPath}/home"
				class="brand"> <img class="logo"
				src="${pageContext.servletContext.contextPath}/resources/themes/images/logo.png"
				alt="Periodicals" />
			</a>
		</div>

		<div id="navbar" class="navbar" style="margin-bottom: 0px;">

			<ul class="nav navbar-nav navbar-right" style="padding-top: 5px;">

				<c:choose>
					<c:when test="${user != null}">
						<!-- 							<img id="imageavatar" src="http://www.desicomments.com/dc3/09/336028/336028.png" alt="img"  -->
						<!-- 								style="margin-top: 5px; height: 50px; width: 50px; border-radius: 25px;" -->
						<!-- 								class="imageavatar dropdown-button" data-activates='dropdown1'  -->
						<!-- 								data-beloworigin="true" data-hover="true"/> -->
						<!-- 								<ul id='dropdown1' class='dropdown-content'> -->
						<!-- 								    <li><a href="#!">one</a></li> -->
						<!-- 								    <li><a href="#!">two</a></li> -->
						<!-- 								    <li class="divider"></li> -->
						<!-- 								    <li><a href="#!">three</a></li> -->
						<!-- 								 </ul> -->


<!-- 						<div class="container"> -->

							<div class="dropdown">
								<img id="imageavatar"
									src="http://www.desicomments.com/dc3/09/336028/336028.png"
									alt="img"
									style="margin-top: 5px; height: 50px; width: 50px; border-radius: 25px;"
									class="imageavatar dropdown-toggle" data-toggle='dropdown'
									data-beloworigin="true" data-hover="true" />
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="#" style="color: #26A69A">HTML</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="#" style="color: #26A69A">CSS</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="#" style="color: #26A69A">JavaScript</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="#" style="color: #26A69A">About Us</a></li>
								</ul>
							</div>
<!-- 						</div> -->


<!-- 						<li><a href="#" onclick="logout()" data-toggle="modal" -->
<%-- 							style="padding-right: 10"> <fmt:message key="header.logout" /> --%>
<!-- 								<i class="fa fa-sign-in" aria-hidden="true"></i></a></li> -->
					</c:when>
					<c:otherwise>
						<script type="text/javascript"
							src="${pageContext.servletContext.contextPath}/resources/js/registration/registration.js"></script>
						<script type="text/javascript"
							src="${pageContext.servletContext.contextPath}/resources/js/authorization/authorization.js"></script>

						<li><a class="modal-trigger" href="#signupModal"><fmt:message
									key="header.regist" /></a>
							<div id="signupModal" class="modal">
								<div class="modal-header">
									<h4 id="registrationHeader">
										<fmt:message key="header.regist" />
									</h4>
								</div>
								<div class="modal-content" style="margin-top: -10px">
									<div class="form-horizontal registrationFrm">
										<div class="input-field col">
											<input id="name" type="text" class="validate"> <label
												id="nameLbl" data-error="${fmtName}" for="name"><fmt:message
													key="header.regist.name" /></label>
										</div>
										<div class="input-field col">
											<input id="surname" type="text" class="validate"> <label
												id="surnameLbl" data-error="${fmtSurname}" for="surname"><fmt:message
													key="header.regist.surname" /></label>
										</div>
										<div class="input-field col">
											<input id="email" type="email" class="validate"> <label
												id="emailLbl" data-error="${fmtMail}" for="email"><fmt:message
													key="header.regist.mail" /></label>
										</div>
										<div class="input-field">
											<input id="password" type="password" class="validate">
											<label id="passwordLbl" data-error="${fmtPass}"
												for="password"><fmt:message key="header.regist.pass" /></label>
										</div>
										<div class="input-field">
											<input id="сpassword" type="password" class="validate">
											<label id="сpasswordLbl" data-error="${fmtCpass}"
												for="сpassword"><fmt:message
													key="header.regist.cpass" /></label>
										</div>
									</div>


									<!-- 											<div class="modal-footer"> -->

									<div class="row">
										<button id="registrationConfirmButton" type="submit"
											class="btn-flat btn-success login col s2 offset-s1"
											onclick="confirmRegistration('${fmtMail}', '${fmtMailUse}', '${fmtSucces}', '${fmtConfirm}', '${fmtFail}', '${fmtRegist}')"
											style="margin-left: 15px;">
											<fmt:message key="header.regist.confirm" />
										</button>
										<button
											class="modal-action modal-close waves-effect waves-red btn-flat col s2 offset-s1"
											data-dismiss="modal" aria-hidden="true"
											style="margin-left: 10px;">
											<fmt:message key="header.regist.close" />
										</button>
									</div>

									<!-- 											</div> -->
								</div>
							</div></li>

						<li><a class="waves-effect waves-white modal-trigger"
							href="#login" role="button" style="padding-right: 0"><span><fmt:message
										key="header.auth" /></span></a>
							<div id="login" class="modal">
								<div class="modal-content">
									<h4>
										<fmt:message key="header.auth" />
									</h4>
									<div class="form-horizontal loginFrm">
										<div class="input-field col">
											<input id="emailAuth" type="email" class="validate">
											<label id="emailAuthLbl" data-error="${fmtMail}"
												for="emailAuth"><fmt:message
													key="header.regist.mail" /></label>
										</div>
										<div class="input-field">
											<input id="passwordAuth" type="password"> <label
												id="passwordLbl" data-error="${fmtMailPass}"
												for="passwordAuth"><fmt:message
													key="header.regist.pass" /></label>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" id="sbm"
										class="btn-flat btn-success login" onclick="auth()"
										style="margin-left: 15px;">
										<fmt:message key="header.auth.enter" />
									</button>
									<button class="btn-flat waves-effect waves-red "
										onclick="forgot()" style="margin-left: 15px;">
										<fmt:message key="header.auth.forgot" />
									</button>
									<button
										class="modal-action modal-close waves-effect waves-red btn-flat"
										data-dismiss="modal" aria-hidden="true"
										style="margin-left: 10px;">
										<fmt:message key="header.regist.close" />
									</button>
								</div>
							</div></li>
						<li><a style="padding: 0px;"
							href="${pageContext.servletContext.contextPath}/vkLogin"> <img
								style="width: 50px; height: 40px; padding: 0px; margin-top: 10; margin-left: 20px;"
								src="${pageContext.servletContext.contextPath}/resources/images/vk.png"
								alt="vk" />
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>

		</div>
		<!--/.nav-collapse -->
	</div>
</nav>

<script>
	$(document).ready(function() {
		$('#passwordAuth').keypress(function(e) {
			if (e.keyCode == 13)
				$('#sbm').click();
		});
	});
</script>

<script>
	$(document).ready(function() {
		$('#сpassword').keypress(function(e) {
			if (e.keyCode == 13)
				$('#registrationConfirmButton').click();
		});
	});
</script>

<script>
	$('.modal-footer').css("border-top", "0px solid #FAFAFA");
	function logout() {
		$.post('${pageContext.servletContext.contextPath}/logout', function() {
			document.location.href = '/';
		});
	}
</script>
<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>