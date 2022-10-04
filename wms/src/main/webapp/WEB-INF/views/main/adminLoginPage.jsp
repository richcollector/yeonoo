<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	#wrapper{
		width: 1200px;
		margin: auto;
	}
	
</style>
<script type="text/javascript">

	function doAdminLogin(){
		
		var admin_email = document.getElementById("admin_email").value;
		var admin_password = document.getElementById("admin_password").value;
		var loginBoxAlert = document.getElementById("loginBoxAlert");
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				if(result.result == "Fail"){
					loginBoxAlert.classList.add("text-danger");
					loginBoxAlert.setAttribute("style" , "font-size: 0.8rem;");
					loginBoxAlert.innerText = "이메일 혹은 비밀번호를 확인해주세요."
					return;
				}
				window.location.href = './mainPage';
			}
		}
		xhr.open("post" , "./adminLoginProcess"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("admin_email=" + admin_email + "&admin_password=" + admin_password); //AJAX로 리퀘스트함..
		
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div id="wrapper">
	  <div class="row border border-2 m-2" style="height: 100%">
	    <div class="col p-0" style="text-align: center;">
	      <img src="../resources/img/1.png" class="img-fluid p-5">
	    </div>
	    <div class="col" style="display: table;">
	      <div class="row" style="display: table-cell; vertical-align: middle;">
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
	          <input class="form-control mb-1" type="text" id="admin_email" name="admin_email" placeholder="이메일을 입력해주세요.">
	          <input class="form-control mb-1" type="password" id="admin_password" name="admin_password" placeholder="비밀번호를 입력해주세요.">
	          <div id="loginBoxAlert"></div>
	          <button type="button" onclick="doAdminLogin()" class="btn btn-outline-primary form-control mb-3">로그인</button>        
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
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>