<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<!-- 브라우저 크기가 작아졌을 때 버튼 생성 -->
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="../member/loginform"><strong>AT출결 관리 시스템</strong></a>
		</div>
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="../board/noticeList">공지사항</a></li>
				<li><a href="#about">강좌</a></li>
				<li><a href="#contact">취업정보</a></li>
				<li><a href="#contact">Q&A</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../member/loginform">로그인</a></li>
				<li><button class="btn btn-primary btn-sm navbar-btn" onclick="location.href='../member/joinform'" type="button">회원가입</button></li>
			</ul>
		</div>
	</div>
</nav>