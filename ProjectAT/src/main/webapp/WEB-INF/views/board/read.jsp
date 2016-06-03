<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
$(function() {
	/* 목록 버튼 */
	$("#backtolist").on("click", function() {
		location.href = "list";
	});
	/* 수정 버튼 */
	$("#update").on("click", function() {
		location.href = "modify?num=${requestScope.content.num}";
	});
	/* 삭제 버튼 */
	$("#delete").on("click", function() {
		if (confirm("삭제하시겠습니까?")) {
			var data = ${requestScope.content.num};
			var url = "../${requestScope.boardname}/delete";
			$.ajax({
				type : "post",
				url : url,
				data : {"num":data},
				dataType : "json",
				success : function(obj) {
					if (obj) {
						alert("삭제되었습니다.");
						location.href = "list";
					}else if(!obj){
						alert("다시시도");
					}
				}
			});
		}
	});
});
</script>
<div class="writeFormArea">
	<h1>글읽기</h1>
	<label for="userid" >작성자</label>
	<span id="userid">${requestScope.content.userid}</span>
	<label for="userid" >작성일</label>
	<span id="userid">${requestScope.content.wDate}</span>
	<label for="userid" >글번호</label>
	<span id="userid">${requestScope.content.num}</span>
	<label for="userid" >조회수</label>
	<span id="userid">${requestScope.content.hit}</span>
	<div class="form-group">
		<label for="title">제목</label> ${requestScope.content.title}
	</div>
	<div class="form-group">
		<label for="content">내용</label> ${requestScope.content.content}
	</div>
	<div id="btnArea">
		<button id="update" type="button" class="btn btn-success">수정</button>
		<button id="delete" type="button" class="btn btn-success">삭제</button>
		<button id="backtolist" type="button" class="btn btn-success">목록</button>
	</div>
	<form >
	
	</form>

</div>