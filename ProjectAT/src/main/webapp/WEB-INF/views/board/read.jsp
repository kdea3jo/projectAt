<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/* 목록 버튼 */
			$("#backtolist").on("click",function(){
				location.href = "list";			
			});
		});
	</script>
<div class="writeFormArea">
	<h1>글읽기</h1>
	<form>
		작성자 : ${requestScope.content.userid}<br>
		작성일 : ${requestScope.content.wDate}<br>
		글번호 : ${requestScope.content.num}<br>
		조회수 : ${requestScope.content.hit}<br>
	  <div class="form-group">
	    <label for="title">제목</label>
	    ${requestScope.content.title}
	  </div>
	  <div class="form-group">
	    <label for="content">내용</label>
	    ${requestScope.content.content}
	  </div>
	  <div id="btnArea">
	  	<button type="button" class="btn btn-success">수정</button>
	  	<button type="button" class="btn btn-success">삭제</button>
	  	<button id="backtolist" type="button" class="btn btn-success">목록</button>
	  </div>
	  
	</form>
</div>