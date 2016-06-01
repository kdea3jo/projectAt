<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="tableArea">
<h1>공지사항</h1>
	<div id="currPageTotalPage">
		${requestScope.pageNation.currPage}/ ${requestScope.pageNation.totalPages} 
	</div>
	
		<table class="table table-striped table-bordered table-hover">
		<tr>
			<th class="num warning" >NO</th> 
			<th class="title warning">제목</th> 
			<th class="userid warning" >작성자</th> 
			<th class="wDate warning">날짜</th>
		</tr>
		
		<c:forEach var="items" items="${requestScope.boardList}" varStatus="status">
		<tr>
			<td class="num">${items.num}</td>
			<td class="title"><a href="../board/read?num=${items.num}">${items.title}</a></td>
			<td class="userid">${items.userid}</td>
			<td class="wDate">${items.wDate}</td>
	    </tr>
		</c:forEach>
		
		</table>
	<div class="navArea">
	<nav>
	  	<ul class="pagination">
	  	<!-- 이전 -->
	  	<c:choose>
		    <c:when test="${requestScope.pageNation.leftMore==true}">
		        <li class="page-item">
			      <a class="page-link" href="../board/list?pg=${requestScope.pageNation.linkBegin-1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
		    </c:when>
		    <c:otherwise>
			    <li class="page-item disabled">
			      <span class="page-link" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </span>
			    </li>
		    </c:otherwise>
		</c:choose>
	    
		<!-- 페이지 -->
   		<c:forEach var="i" begin="${requestScope.pageNation.linkBegin}" end="${requestScope.pageNation.linkEnd}">
			<c:choose>
				<c:when test="${requestScope.pageNation.currPage==i}">
				<li class="page-item active">
			      <a class="page-link" href="../board/list?pg=${i}">${i}<span class="sr-only">(current)</span></a>
			    </li>
				</c:when>
				
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="../board/list?pg=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 다음 -->
		<c:choose>
		    <c:when test="${requestScope.pageNation.rightMore==true}">
		        <li class="page-item">
			      <a class="page-link" href="../board/list?pg=${requestScope.pageNation.linkEnd+1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
		    </c:when>
		    <c:otherwise>
			    <li class="page-item disabled">
			      <span class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </span>
			    </li>
		    </c:otherwise>
		</c:choose>
	  </ul>
	</nav>
	</div>
	<div id="btnArea">
		<button id="write" class="next btn btn-default " type="button">글쓰기</button>
	</div>
	</div>