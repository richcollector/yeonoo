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
	
	<style>
		#wrapper{
			width: 1200px;
			margin: auto;
		}
	</style>
	
	<script type="text/javascript">

		function findId(){

			var innerDiv1 = document.getElementById("login");
			innerDiv1.innerText = "";

			var infoBox = document.getElementById("info");
			infoBox.innerHTML = "";
			infoBox.classList.add("row");
			infoBox.classList.add("border");
			infoBox.classList.add("p-3");

			var infoForm = document.createElement("form");
			infoForm.setAttribute("action","");
			infoBox.appendChild(infoForm);

			var wrapCol = document.createElement("div");
			wrapCol.classList.add("col");
			infoForm.appendChild(wrapCol);

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
			nameInput.setAttribute("id","name");
			nameInput.setAttribute("name","name");
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
			emailLabel.innerText = "등록된 이메일 번호";
			innerCol3.appendChild(emailLabel);

			var innerDiv3 = document.createElement("div");
			innerDiv3.classList.add("input-group");
			innerDiv3.classList.add("mb-3");
			innerCol3.appendChild(innerDiv3);

			var emailInput = document.createElement("input");
			emailInput.setAttribute("id","email");
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
			innerDiv3.appendChild(emailButton);

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
			checkInput.setAttribute("id","check");
			checkInput.setAttribute("name","check");
			checkInput.setAttribute("type","text");
			checkInput.classList.add("form-control");
			checkInput.setAttribute("placeholder","인증번호를 입력해주세요.");
			checkInput.setAttribute("aria-label","Username");
			checkInput.setAttribute("aria-describedby","addon-wrapping");
			innerDiv4.appendChild(checkInput);


			var innerRow5 = document.createElement("div");
			innerRow5.classList.add("row");
			wrapCol.appendChild(innerRow5);

			var innerCol5 = document.createElement("div");
			innerCol5.classList.add("col");
			innerCol5.classList.add("text-center");
			innerRow5.appendChild(innerCol5);

			var idButton = document.createElement("button");
			idButton.classList.add("btn");
			idButton.classList.add("btn-primary");
			idButton.innerText = "아이디 찾기";
			idButton.setAttribute("onclick","idSearch()");
			innerCol5.appendChild(idButton);
		}
		
		function findPw(){

			var innerDiv1 = document.getElementById("login");
			innerDiv1.innerText = "";

			var infoBox = document.getElementById("info");
			infoBox.innerHTML = "";
			infoBox.classList.add("row");
			infoBox.classList.add("border");
			infoBox.classList.add("p-3");

			var infoForm = document.createElement("form");
			infoForm.setAttribute("action","");
			infoBox.appendChild(infoForm);

			var wrapCol = document.createElement("div");
			wrapCol.classList.add("col");
			infoForm.appendChild(wrapCol);

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
			nameInput.setAttribute("id","name");
			nameInput.setAttribute("name","name");
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
			emailLabel.innerText = "등록된 이메일 번호";
			innerCol3.appendChild(emailLabel);

			var innerDiv3 = document.createElement("div");
			innerDiv3.classList.add("input-group");
			innerDiv3.classList.add("mb-3");
			innerCol3.appendChild(innerDiv3);

			var emailInput = document.createElement("input");
			emailInput.setAttribute("id","email");
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
			innerDiv3.appendChild(emailButton);

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
			checkInput.setAttribute("id","check");
			checkInput.setAttribute("name","check");
			checkInput.setAttribute("type","text");
			checkInput.classList.add("form-control");
			checkInput.setAttribute("placeholder","인증번호를 입력해주세요.");
			checkInput.setAttribute("aria-label","Username");
			checkInput.setAttribute("aria-describedby","addon-wrapping");
			innerDiv4.appendChild(checkInput);


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
			pwButton.innerText = "비밀번호 찾기";
			pwButton.setAttribute("onclick","pwSearch()");
			innerCol5.appendChild(pwButton);	
		}

		function idSearch(){

			var innerDiv1 = document.getElementById("login");
			innerDiv1.innerText = "";

			var infoBox = document.getElementById("info");
			infoBox.innerHTML = "";
			infoBox.classList.add("p-3");

			var wrapCol = document.createElement("div");
			wrapCol.classList.add("col");
			infoBox.appendChild(wrapCol);
			
			var innerRow1 = document.createElement("div");
			innerRow1.classList.add("text-center");
			wrapCol.appendChild(innerRow1);

			var innerSpan1 = document.createElement("span");
			innerSpan1.innerText = "ktw9115(여누솔루션)  ";
			innerRow1.appendChild(innerSpan1);

			var innerSpan2 = document.createElement("span");
			innerSpan2.innerText = "가입 : 2013.01.01";
			innerRow1.appendChild(innerSpan2);

			var innerDiv1 = document.getElementById("login");
			innerDiv1.classList.add("mt-2");
			innerDiv1.classList.add("text-center");

			var loginButton = document.createElement("button");
			loginButton.classList.add("btn");
			loginButton.classList.add("btn-outline-primary");
			loginButton.setAttribute("onclick","location.href='../main/loginPage'")
			loginButton.innerText = "로그인 하기";
			innerDiv1.appendChild(loginButton);
		}


		function pwSearch(){

		var innerDiv1 = document.getElementById("login");
		innerDiv1.innerText = "";

		var infoBox = document.getElementById("info");
		infoBox.innerHTML = "";
		infoBox.classList.add("p-3");

		var wrapCol = document.createElement("div");
		wrapCol.classList.add("col");
		infoBox.appendChild(wrapCol);

		var innerRow1 = document.createElement("div");
		innerRow1.classList.add("text-center");
		wrapCol.appendChild(innerRow1);

		var innerSpan1 = document.createElement("span");
		innerSpan1.innerText = "kyt04@naver.com으로 비밀번호 재설정 이메일을 발송하였습니다.";
		innerRow1.appendChild(innerSpan1);

		var innerSpan2 = document.createElement("span");
		innerSpan2.innerText = "kyt04@naver.com으로 비밀번호 재설정 이메일을 발송하였습니다.";
		innerRow1.appendChild(innerSpan2);

		var innerSpan3 = document.createElement("span");
		innerSpan3.innerText = "스팸함을 확인해보시거나, 이름과 아이디(이메일)가 WMS 회원정보와 일치하는지 확인해주세요.";
		innerRow1.appendChild(innerSpan3);

		var innerSpan3 = document.createElement("span");
		innerSpan3.innerText = "아이디(이메일)를 잊으신 경우, 먼저 아이디(이메일) 찾기를 진행해주세요.";
		innerRow1.appendChild(innerSpan3);
		
		}

		
		window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		findId();
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		
		});
		
		
		
	</script>
	
<title>개인정보 찾기</title>
</head>
<body>
    <div id="wrapper">
    	<div class="row border-bottom mt-3 mb-3">
    		<h2 class="fb-bold">계정정보 찾기</h2>
    	</div>
    	
		<div class="btn-group mb-3" role="group" aria-label="Basic radio toggle button group">
		
			<input onclick="findId()" type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="btnradio1">아이디 찾기</label>
			
			<input onclick="findPw()" type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
			<label class="btn btn-outline-primary" for="btnradio2">비밀번호 찾기</label>
		
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