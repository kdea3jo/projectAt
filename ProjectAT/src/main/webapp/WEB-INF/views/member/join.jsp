<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="https://github.com/bassjobsen/Bootstrap-3-Typeahead/blob/master/bootstrap3-typeahead.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('input.typeahead').typeahead({
      name: 'accounts',
      local: ['Audi', 'BMW', 'Bugatti', 'Ferrari', 'Ford', 'Lamborghini', 'Mercedes Benz', 'Porsche', 'Rolls-Royce', 'Volkswagen']
    });
});  
</script>

<div class="container">
  <div class="row">
  	<div class="col-md-6">
          <form class="form-horizontal" action="" method="POST">
          <fieldset>
            <div id="legend">
              <legend class="">회원가입</legend>
            </div>
            <div class="control-group">
              <label class="control-label" for="username">아이디</label>
              <div class="controls">
                <input type="text" id="username" name="username" placeholder="이메일을 입력하세요." class="form-control input-lg typeahead tt-query"
                autocomplete="off" spellcheck="false">
                <p class="help-block">Username can contain any letters or numbers, without spaces</p>
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label" for="email">E-mail</label>
              <div class="controls">
                <input type="email" id="email" name="email" placeholder="" class="form-control input-lg">
                <p class="help-block">Please provide your E-mail</p>
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label" for="password">Password</label>
              <div class="controls">
                <input type="password" id="password" name="password" placeholder="" class="form-control input-lg">
                <p class="help-block">Password should be at least 6 characters</p>
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label" for="password_confirm">Password (Confirm)</label>
              <div class="controls">
                <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="form-control input-lg">
                <p class="help-block">Please confirm password</p>
              </div>
            </div>
         
            <div class="control-group">
              <!-- Button -->
              <div class="controls">
                <button class="btn btn-success">Register</button>
              </div>
            </div>
          </fieldset>
        </form>
    </div> 
  </div>
</div>