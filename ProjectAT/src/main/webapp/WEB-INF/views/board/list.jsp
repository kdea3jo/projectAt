<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/* 글쓰기 버튼 */
			$("#writeBtn").on("click",function(){
				location.href = "write";			
			});
			/* 검색 버튼 */
			$("#searchBtn").on("click",function(){
				var type = $("#searchForm div select").val();
				var keyword = $("#searchForm div input").val();
				
				location.href="search?type="+type+"&keyword="+keyword;
			});
		});
	</script>
<div class="tableArea">
	<h1>${requestScope.boardname}</h1>

	<div id="currPageTotalPage">${requestScope.pageNation.currPage}/
		${requestScope.pageNation.totalPages}</div>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th class="num col-xs-1 text-center">NO</th>
				<th class="title col-xs-6 text-center">제목</th>
				<th class="userid col-xs-2 text-center">작성자</th>
				<th class="wDate col-xs-3 text-center">날짜</th>
			</tr>
		</thead>
		<c:forEach var="items" items="${requestScope.boardList}"
			varStatus="status">
			<tr>
				<td class="num col-xs-1 text-center">${items.num}</td>
				<td class="title col-xs-6"><a
					href="../${requestScope.boardname}/read?num=${items.num}">${items.title}</a></td>
				<td class="userid col-xs-2 text-center">${items.userid}</td>
				<td class="wDate col-xs-3 text-center">${items.wDate}</td>
			</tr>
		</c:forEach>

	</table>

	<div id="btnArea">
		<button id="writeBtn" class="next btn btn-primary" type="button">글쓰기</button>
	</div>

	<!-- pagination -->
	<div class="navArea">
		<nav>
			<ul class="pagination" style="margin-top: 0px">
				<!-- 이전 -->
				<c:choose>
					<c:when test="${requestScope.pageNation.leftMore==true}">
						<li class="page-item"><a class="page-link"
							href="../${requestScope.boardname}/list?pg=${requestScope.pageNation.linkBegin-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><span class="page-link"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</span></li>
					</c:otherwise>
				</c:choose>

				<!-- 페이지 -->
				<c:forEach var="i" begin="${requestScope.pageNation.linkBegin}"
					end="${requestScope.pageNation.linkEnd}">
					<c:choose>
						<c:when test="${requestScope.pageNation.currPage==i}">
							<li class="page-item active"><a class="page-link"
								href="../${requestScope.boardname}/list?pg=${i}">${i}<span
									class="sr-only">(current)</span></a></li>
						</c:when>

						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="../${requestScope.boardname}/list?pg=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 -->
				<c:choose>
					<c:when test="${requestScope.pageNation.rightMore==true}">
						<li class="page-item"><a class="page-link"
							href="../${requestScope.boardname}/list?pg=${requestScope.pageNation.linkEnd+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><span class="page-link"
							href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
						</span></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
	<form id="searchForm" class="form-inline text-center">
		<div class="form-group">
			<select name="type" class="form-control">
				<option>제목</option>
				<option>내용</option>
				<option>글번호</option>
				<option>글쓴이</option>
			</select>
		</div>
		<div class="form-group">
			<label class="control-label sr-only" for="search">검색</label> 
			<input name="keyword" id="search" type="text" class="form-control col-xs-3"
				placeholder="검색어를 입력하세요">
		</div>
		<button id="searchBtn" class="next btn btn-primary" type="button">검색</button>
	</form>
</div>