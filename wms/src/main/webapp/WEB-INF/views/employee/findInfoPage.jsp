<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>
    
	   	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
	   	
	   	body { 
		font-family : pretendard; 
		color: #404040; 
		} 
	
		#wrapper{
			width: 1200px;
			margin: auto;
		}
	</style>
	
	<script type="text/javascript">
		
		function findPw(){

			var innerDiv1 = document.getElementById("login");
			innerDiv1.innerText = "";

			var infoBox = document.getElementById("info");
			infoBox.innerHTML = "";
			infoBox.classList.add("row");
			infoBox.classList.add("border");
			infoBox.classList.add("p-3");

/* 			var infoForm = document.createElement("form");
			infoForm.setAttribute("action","");
			infoBox.appendChild(infoForm); */

			var wrapCol = document.createElement("div");
			wrapCol.classList.add("col");
			infoBox.appendChild(wrapCol);

			var innerRow1 = document.createElement("div");
			innerRow1.classList.add("row");
			innerRow1.classList.add("mb-2");
			wrapCol.appendChild(innerRow1);

			var innerCol1 = document.createElement("div");
			innerCol1.classList.add("col");
			innerRow1.appendChild(innerCol1);

			var innerDiv1 = document.createElement("div");
			innerCol1.appendChild(innerDiv1);

			var innerRow2 = document.createElement("div");
			innerRow2.classList.add("row");
			innerRow2.classList.add("mb-2");
			wrapCol.appendChild(innerRow2);

			var innerCol2 = document.createElement("div");
			innerCol2.classList.add("col");
			innerRow2.appendChild(innerCol2);

			var innerDiv2 = document.createElement("div");
			innerCol2.appendChild(innerDiv2);

			var nameLabel = document.createElement("label");
			nameLabel.setAttribute("for","name");
			nameLabel.classList.add("form-label");
			nameLabel.classList.add("fw-bold");
			nameLabel.innerText = "이름";
			innerDiv2.appendChild(nameLabel);

			var nameInput = document.createElement("input");
			nameInput.setAttribute("id","employee_name");
			nameInput.setAttribute("name","employee_name");
			nameInput.setAttribute("type","text");
			nameInput.setAttribute("placeholder","이름을 입력해주세요");
			nameInput.classList.add("form-control");
			nameInput.setAttribute("aria-label","Username");
			nameInput.setAttribute("aria-describedby","addon-wrapping");
			innerDiv2.appendChild(nameInput);

			var innerRow3 = document.createElement("div");
			innerRow3.classList.add("row");
			innerRow3.classList.add("mb-2");
			wrapCol.appendChild(innerRow3);

			var innerCol3 = document.createElement("div");
			innerCol3.classList.add("col");
			innerRow3.appendChild(innerCol3);

			var emailLabel = document.createElement("label");
			emailLabel.classList.add("form-label");
			emailLabel.classList.add("fw-bold");
			emailLabel.setAttribute("for","email");
			emailLabel.innerText = "등록된 이메일";
			innerCol3.appendChild(emailLabel);

			var innerDiv3 = document.createElement("div");
			innerDiv3.classList.add("input-group");
			innerDiv3.classList.add("mb-1");
			innerCol3.appendChild(innerDiv3);

			var emailInput = document.createElement("input");
			emailInput.setAttribute("id","employee_email");
			emailInput.setAttribute("name","employee_email");
			emailInput.setAttribute("type","text");
			emailInput.setAttribute("placeholder","이메일 주소를 입력해주세요.");
			emailInput.classList.add("form-control");
			emailInput.setAttribute("aria-label","Recipient's username");
			emailInput.setAttribute("aria-describedby","button-addon2");
			innerDiv3.appendChild(emailInput);

			var emailButton = document.createElement("button");
			emailButton.classList.add("btn");
			emailButton.classList.add("btn-outline-secondary");
			emailButton.setAttribute("type","button");
			emailButton.setAttribute("id","button-addon2");
			emailButton.innerText = "인증 번호 받기";
			emailButton.setAttribute("onclick", "sendAuthKey();");
			innerDiv3.appendChild(emailButton);
			
			var emailInputAlert = document.createElement("div");
			emailInputAlert.setAttribute("id", "emailInputAlert");
			innerCol3.appendChild(emailInputAlert);

			var innerRow4 = document.createElement("div");
			innerRow4.classList.add("row");
			innerRow4.classList.add("mb-2");
			wrapCol.appendChild(innerRow4);

			var innerCol4 = document.createElement("div");
			innerCol4.classList.add("col");
			innerRow4.appendChild(innerCol4);

			var innerDiv4 = document.createElement("div");
			innerCol4.appendChild(innerDiv4);

			var checkLabel = document.createElement("label");
			checkLabel.setAttribute("for","check");
			checkLabel.classList.add("form-label");
			checkLabel.classList.add("fw-bold");
			checkLabel.innerText = "인증 번호";
			innerDiv4.appendChild(checkLabel);

			var checkInput = document.createElement("input");
			checkInput.setAttribute("id","password_auth_key");
			checkInput.setAttribute("name","check");
			checkInput.setAttribute("type","text");
			checkInput.classList.add("form-control");
			checkInput.setAttribute("placeholder","인증번호를 입력해주세요.");
			checkInput.setAttribute("aria-label","Username");
			checkInput.setAttribute("aria-describedby","addon-wrapping");
			innerDiv4.appendChild(checkInput);
			
			var checkInputAlert = document.createElement("div");
			checkInputAlert.setAttribute("id", "checkInputAlert");
			innerCol4.appendChild(checkInputAlert);

			var innerRow5 = document.createElement("div");
			innerRow5.classList.add("row");
			wrapCol.appendChild(innerRow5);

			var innerCol5 = document.createElement("div");
			innerCol5.classList.add("col");
			innerCol5.classList.add("text-center");
			innerRow5.appendChild(innerCol5);

			var pwButton = document.createElement("button");
			pwButton.classList.add("btn");
			pwButton.classList.add("btn-primary");
			pwButton.innerText = "인증번호 확인";
			pwButton.setAttribute("onclick","checkAuthKey()");
			innerCol5.appendChild(pwButton);
		}
		
		function sendAuthKey(){
			var employee_email = document.getElementById("employee_email").value;
			var employee_name = document.getElementById("employee_name").value;
			var emailInputAlert = document.getElementById("emailInputAlert");
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
						
					if(jsonObj.data == true){
						emailInputAlert.classList.remove("text-danger");
						emailInputAlert.classList.add("text-success");
						emailInputAlert.innerText = "인증 번호가 전송 되었습니다 인증 번호를 입력해주세요.";
					} else {
						emailInputAlert.innerHTML = "";
						emailInputAlert.classList.add("text-danger");
						emailInputAlert.innerText = "등록되지 않은 정보 입니다 . 다시 한번 확인 해주세요.";
					}
					
				}
			}
			
			xhr.open("post", "./findPwProcess");	//리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send("employee_email=" + employee_email + "&employee_name=" + employee_name);	//AJAX로 리퀘스트함...
		}
		
		function checkAuthKey(){

			var password_auth_key = document.getElementById("password_auth_key");
			var checkInputAlert = document.getElementById("checkInputAlert");
			var employee_email = document.getElementById("employee_email").value;
			
			if(password_auth_key.value == ""){
				checkInputAlert.classList.add("text-danger");
				checkInputAlert.innerText = "인증번호가 일치하지 않습니다.";
				password_auth_key.focus();
				return;
			}
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
						
					if(jsonObj.data == true){
						changePasswordBox(employee_email);
					} else {
						checkInputAlert.classList.add("text-danger");
						checkInputAlert.innerText = "인증번호가 일치하지 않습니다.";
					}
					
				}
			}
			
			xhr.open("post", "./checkAuthKeyProcess");	//리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send("password_auth_key=" + password_auth_key.value);	//AJAX로 리퀘스트함...
			
			
		}
		
		function changePasswordBox(employee_email){
			console.log(employee_email);
			var infoBox = document.getElementById("info");
			infoBox.innerHTML = "";
			
			var changePasswordBoxRow = document.createElement("div");
			changePasswordBoxRow.classList.add("row");
			infoBox.appendChild(changePasswordBoxRow);
			
			var employee_email_value = document.createElement("input");
			employee_email_value.setAttribute("type", "hidden");
			employee_email_value.setAttribute("id", "employee_email_value");
			employee_email_value.setAttribute("value", employee_email);
			changePasswordBoxRow.appendChild(employee_email_value);
			
			var changePasswordBoxCol = document.createElement("col");
			changePasswordBoxCol.classList.add("col");
			changePasswordBoxRow.appendChild(changePasswordBoxCol);
			
			var PWLabel = document.createElement("label");
			PWLabel.setAttribute("for","password");
			PWLabel.classList.add("form-label");
			PWLabel.classList.add("fw-bold");
			PWLabel.innerText = "변경할 비밀번호";
			changePasswordBoxCol.appendChild(PWLabel);

			var PWInput = document.createElement("input");
			PWInput.setAttribute("id","employee_password");
			PWInput.setAttribute("type","password");
			PWInput.classList.add("form-control");
			PWInput.setAttribute("aria-label","password");
			PWInput.setAttribute("aria-describedby","addon-wrapping");
			PWLabel.appendChild(PWInput);
			
			var PWInput_alert = document.createElement("div");
			PWInput_alert.setAttribute("id", "employee_password_alert");
			changePasswordBoxRow.appendChild(PWInput_alert);
			
			var PasswordCheckBoxRow = document.createElement("div");
			PasswordCheckBoxRow.classList.add("row");
			infoBox.appendChild(PasswordCheckBoxRow);
			
			var PasswordCheckBoxCol = document.createElement("col");
			PasswordCheckBoxCol.classList.add("col");
			PasswordCheckBoxRow.appendChild(PasswordCheckBoxCol);
			
			var PWcheck = document.createElement("label");
			PWcheck.setAttribute("for","password");
			PWcheck.classList.add("form-label");
			PWcheck.classList.add("fw-bold");
			PWcheck.innerText = "비밀번호 확인";
			PasswordCheckBoxCol.appendChild(PWcheck);

			var PWcheckInput = document.createElement("input");
			PWcheckInput.setAttribute("id","employee_password_check");
			PWcheckInput.setAttribute("type","password");
			PWcheckInput.classList.add("form-control");
			PWcheckInput.setAttribute("aria-label","password");
			PWcheckInput.setAttribute("aria-describedby","addon-wrapping");
			PWcheck.appendChild(PWcheckInput);
			
			var PWcheckInput_alert = document.createElement("div");
			PWcheckInput_alert.setAttribute("id","employee_password_check_alert");
			PasswordCheckBoxRow.appendChild(PWcheckInput_alert);
			
			var PWButtonRow = document.createElement("div");
			PWButtonRow.classList.add("row");
			infoBox.appendChild(PWButtonRow);
			
			var PWButtonCol = document.createElement("col");
			PWButtonCol.classList.add("col");
			PWButtonRow.appendChild(PWButtonCol);
			
			var PWButton = document.createElement("button");
			PWButton.classList.add("btn");
			PWButton.classList.add("btn-primary");
			PWButton.innerText = "비밀번호 변경";
			PWButton.setAttribute("onclick","doPwChange()");
			PWButtonCol.appendChild(PWButton);
			
		}

		function doPwChange(){
			
			var employee_email = document.getElementById("employee_email_value").value;
			var employee_password = document.getElementById("employee_password").value;
			var employee_password_check = document.getElementById("employee_password_check").value;
			var PWInput = document.getElementById("employee_password");
			var PWInput_alert = document.getElementById("employee_password_alert");
			var PWcheckInput = document.getElementById("employee_password_check");
			var PWcheckInput_alert = document.getElementById("employee_password_check_alert");
			
			var pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;

			if(!pwRule.test(employee_password)){
				PWInput_alert.innerText = "비밀 번호는 숫자/문자/특수문자가 포함된 8~15자리 이내의 형식이어야합니다";
				PWInput_alert.classList.add("text-danger");
				PWInput.focus();
				return;
			} else {
				PWInput_alert.innerHTML = "";
			}
				
			
			if(employee_password == employee_password_check){
				PWcheckInput_alert.innerHTML = "";
			} else {
				PWcheckInput_alert.classList.add("text-danger");
				PWcheckInput_alert.innerText = "비밀번호가 일치하지 않습니다";
				PWcheckInput_alert.focus();
				return;
			}
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
					var infoBox = document.getElementById("info");
					infoBox.innerHTML = "";
					
					var Row1 = document.createElement("div");
					Row1.classList.add("row");
					infoBox.appendChild(Row1);
					
					var Col1 = document.createElement("div");
					Col1.classList.add("col");
					Col1.innerText = "비밀번호 변경이 완료되었습니다."
					Row1.appendChild(Col1);
					
					var Row2 = document.createElement("div");
					Row2.classList.add("row");
					infoBox.appendChild(Row2);
					
					var Col2 = document.createElement("div");
					Col2.classList.add("col");
					Row2.appendChild(Col2);
					
					var Col2A = document.createElement("a");
					Col2A.innerText = "로그인 페이지로"
					Col2A.setAttribute("href", "../main/loginPage");
					Col2.appendChild(Col2A);
				}
			}
			
			xhr.open("post", "./changePwProcess");	//리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send("employee_email=" + employee_email + "&employee_password=" + employee_password);	//AJAX로 리퀘스트함...
			
			
		}
		
		function test(){
			var infoBox = document.getElementById("info");
			infoBox.innerHTML = "";
			
			var Row1 = document.createElement("div");
			Row1.classList.add("row");
			infoBox.appendChild(Row1);
			
			var Col1 = document.createElement("div");
			Col1.classList.add("col");
			Col1.innerText = "비밀번호 변경이 완료되었습니다."
			Row1.appendChild(Col1);
			
			var Row2 = document.createElement("div");
			Row2.classList.add("row");
			infoBox.appendChild(Row2);
			
			var Col2 = document.createElement("div");
			Col2.classList.add("col");
			Row2.appendChild(Col2);
			
			var Col2A = document.createElement("a");
			Col2A.innerText = "로그인 페이지로"
			Col2A.setAttribute("href", "../main/loginPage");
			Col2.appendChild(Col2A);
		}
		
		window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		findPw();
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		});
		
		
		
	</script>
	
<title>개인정보 찾기</title>
</head>
<body>
    <div id="wrapper">
    	<div class="row mt-3 mb-3">
    	  <div class="col-10">
    		<h2 class="ms-3" style="color:#008FFF;">비밀번호 찾기</h2>
    	  </div>
    	  <div class="col" style="text-align: end;">
    		<input type="button" onclick="location.href='./loginPage'" class="btn btn-outline-primary" value="뒤로가기">
    	  </div>
    	</div>
		<div id="info" class="row border p-3">
			<!-- <form action="">
			<div class="col">
				<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="companyCode" class="form-label fw-bold">회사 코드</label>
				             <input id="companyCode" name="company_code" type="text" class="form-control" placeholder="회사코드를 입력해 주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
					</div>
				</div>
			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="companyCode" class="form-label fw-bold">이름</label>
				             <input id="companyCode" name="company_code" type="text" class="form-control" placeholder="이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
					</div>
				</div>
			<div class="row mb-2">
					<div class="col">
						<label for="companyCode" class="form-label fw-bold">등록된 이메일 번호</label>
						<div class="input-group mb-3">
							<input id="companyCode" type="text" class="form-control" placeholder="이메일 주소를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button" id="button-addon2">인증 번호 받기</button>
						</div>
					</div>
				</div>
			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="companyCode" class="form-label fw-bold">인증 번호</label>
				             <input id="companyCode" name="company_code" type="text" class="form-control" placeholder="인증 번호를 입력해 주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col text-center">
					<button class="btn btn-primary">아이디 찾기</button>
				</div>
			</div>
			
			</form> -->
		</div> 
		<div id="login">

		</div>
    
    </div>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>