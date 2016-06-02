<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="writeFormArea">
	<h1>글쓰기</h1>
	<form>
	  <div class="form-group">
	    <label for="title">제목</label>
	    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요.">
	  </div>
	  <div class="form-group">
	    <label for="content">내용</label>
	    <textarea class="form-control" rows="25"></textarea>
	  </div>
	  <div id="btnArea"> <button type="button" class="btn btn-success">등록</button></div>
	</form>
</div>