<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	#wrapper{
		width: 1200px;
		height : 700px;
		margin: auto;
	}
	
</style>
<script type="text/javascript">
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div id="wrapper">
	  <div class="row border border-2 m-2" style="height: 100%">
	    <div class="col p-0">
	      <img src="../resources/img/1.png" class="img-fluid">
	    </div>
	    <div class="col">
	      <div class="row fs-1 fw-bold" style="color:#008FFF; text-align: center;">
	        <div class="col">관리자 로그인 페이지</div>
	      </div>
	      <div class="row mb-1" style="text-align: center;">
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
			  <label class="btn btn-outline-primary" for="btnradio1" onclick="location.href='./loginPage'">사원</label>
			
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked>
			  <label class="btn btn-outline-primary" for="btnradio2" onclick="location.href='./adminLoginPage'">관리자</label>
			</div>
	      </div>
	      <div class="row">
	        <form action="adminLoginProcess" method="post">
	        <div class="col" style="text-align: center;">
	          <input class="form-control mb-1" type="text" name="admin_email" placeholder="이메일을 입력해주세요.">
	          <input class="form-control mb-1" type="password" name="admin_password" placeholder="비밀번호를 입력해주세요.">
	          <button type="submit" class="btn btn-outline-primary form-control mb-3">로그인</button>        
	        </div>
	        </form>
	      </div>
		  <!--<div class="row">
	        <div class="col border-end border-dark text-end" style="font-size: 0.8rem;">
	          <a>회원가입</a>
	        </div>
	        <div class="col text-start" style="font-size: 0.8rem;">
	          <a onclick="location.href='../employee/findInfoPage'">계정정보 찾기</a>
	        </div>
	      </div> -->
	    </div>


	
	
	
	
	
	
	
	
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>