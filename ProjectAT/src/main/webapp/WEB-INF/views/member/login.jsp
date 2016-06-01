<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"], .form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>

<div class="container">
	<form class="form-signin" action="<c:url value='/check'/>" method="post">
		<h2 class="form-signin-heading">환영합니다.</h2>
		<input type="text" class="input-block-level" name="id" placeholder="Email Adress">
		<input type="password" class="input-block-level" name="pw" placeholder="Password">
		<label class="checkbox"> <input type="checkbox" value="remember-me"> 로그인 유지
		</label>
		<button class="btn btn-large btn-primary" type="submit">로그인</button>
	</form>
	<c:if test="${param.error==true }">
		로그인 실패...
	</c:if>
</div>

