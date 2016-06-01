<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<c:url value="/resources/bootstrap/datepicker/js/moment.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/datepicker/js/bootstrap-datepicker.js"/>"></script>
<link href="<c:url value="/resources/bootstrap/datepicker/css/datepicker3.css"/>" rel="stylesheet">

<script type="text/javascript">
$(document).ready(function(){      
    $('#wrtDtReg').datepicker({
  	  format: "yyyy-mm-dd",
  	  startView: 1,
  	  orientation: "top auto",
  	  keyboardNavigation: false,
  	  forceParse: false,
  	  autoclose: true,
  	  todayHighlight: true
  	 });
  $('#datepicker .input-date').datepicker('setDate', 'today');
});
</script>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<form action="../member/join" method="POST">
				<fieldset>
					<div id="legend">
						<legend class="">AT출결 관리 시스템과 함께 합니다.</legend>
					</div>
					<div class="control-group">
						<label class="control-label" for="id">아이디</label>
						<div class="controls">
							<input type="text" name="userid" placeholder="이메일을 입력하세요." class="form-control input-lg typeahead tt-query" autocomplete="off" spellcheck="false">
							<p class="help-block">이메일은 아이디로 사용됩니다.</p>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="password">비밀번호</label>
						<div class="controls">
							<input type="password" name="userpw" placeholder="비밀번호를 입력하세요." class="form-control input-lg">
							<p class="help-block">8자리 이상의 대소문자와 특수문자를 포함한 문자</p>
							<input type="password" name="userpw_confirm" placeholder="비밀번호를 재입력하세요." class="form-control input-lg">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="birthday">생년월일</label>
						<div class="controls">
							<input class="form-control input-sm" type="text" id="wrtDtReg" name="birthday" placeholder="클릭하세요." readonly="readonly">							
						</div>
					</div>
	
					<div class="control-group">
						<label class="control-label" for="phone">연락처</label>
						<div class="controls">
							<input type="text" name="phone" placeholder="연락처를 입력하세요." class="form-control input-lg typeahead tt-query" autocomplete="off" spellcheck="false">
							<p class="help-block">'-'를 제외한 숫자만 입력하세요.</p>
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<label class="checkbox-inline"><input type="checkbox" name="emailcheck">이메일을 수신하겠습니까?</label>
						</div>
					</div>

					<div class="control-group">
						<!-- Button -->
						<div class="controls">
							<button class="btn btn-success">가입하기</button>
						</div>
					</div>
					
				</fieldset>
			</form>
		</div>
	</div>
</div>