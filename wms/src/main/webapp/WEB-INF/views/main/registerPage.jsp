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

			function chageCompanySelect(){
				
				var company_code = document.getElementById("company_code");
				var companyCode = company_code.options[company_code.selectedIndex].value;
				var dep_selectBox = document.getElementById("dep_selectBox");
				var company_code_alert = document.getElementById("company_code_alert");
				
				if(company_code.value != "회사 코드를 선택해주세요."){
					company_code_alert.innerHTML = "";
				}
				
				var xhr = new XMLHttpRequest(); //AJAX 객체 생성
				xhr.onreadystatechange = function () {
					if(xhr.readyState == 4 && xhr.status == 200){
						var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
						dep_selectBox.innerHTML = "";
						
						var label = document.createElement("label");
						label.classList = "form-lable";
						label.classList = "my-2 fw-bold";
						label.innerText = "부서 코드";
						dep_selectBox.appendChild(label);
						
						var dep_select = document.createElement("select");
						dep_select.classList = "form-select";
						dep_select.setAttribute("id" , "department_code");
						dep_select.setAttribute("name" , "department_code");
						dep_select.setAttribute("onchange" , "dep_change()");
						dep_selectBox.appendChild(dep_select);
						
						var optionDisabled = document.createElement("option");
						optionDisabled.innerText = "부서 코드를 선택해주세요";
						optionDisabled.value = "0";
						optionDisabled.disabled = true;
						optionDisabled.selected = true;
						dep_select.appendChild(optionDisabled);
						
						for(depList of result.data){
							var dep_select_List = document.createElement("option");
							dep_select_List.value = depList.departmentVo.department_code;
							dep_select_List.name = depList.departmentVo.department_code;
							dep_select_List.innerText = depList.departmentVo.department_code;
							
							dep_select.appendChild(dep_select_List);
						}
					}
				}
				xhr.open("get" , "./getDepCodeProcess?company_code=" + companyCode); //리퀘스트 세팅..
				//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
				xhr.send(); //AJAX로 리퀘스트함..
			}
			
  			function passwordRule(){
  				var employee_password = document.getElementById("employee_password");
  				var employee_password_alert = document.getElementById("employee_password_alert");
  				var pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
  				
				if(!pwRule.test(employee_password.value)){
					employee_password_alert.innerText = "비밀 번호는 숫자/문자/특수문자가 포함된 8~15자리 이내의 형식이어야합니다";
					employee_password_alert.classList.add("text-danger");
					employee_password.focus();
					return;
				} else {
					employee_password_alert.innerHTML = "";
				}
			} 
			
			function passwordCheck(){
				var employee_password = document.getElementById("employee_password");
				var employee_password_check = document.getElementById("employee_password_check");
				var employee_password_check_alert = document.getElementById("employee_password_check_alert");
				
				if(employee_password.value == employee_password_check.value){
					employee_password_check_alert.innerHTML = "";
				} else {
					employee_password_check_alert.classList.add("text-danger");
					employee_password_check_alert.innerText = "비밀번호가 일치하지 않습니다";
					employee_password_check_alert.focus();
					return;
				}
			}
			
			function dep_change(){
				var dep_selectBox = document.getElementById("dep_selectBox");
				var department_code = document.getElementById("department_code");
				var dep_code_alert = document.getElementById("dep_code_alert");
				
				if(department_code.value != "0"){
					dep_code_alert.innerHTML = "";
				}
			}
			
			var isEmailChecked = false;
			
			function emailCheck(){
				var employee_email = document.getElementById("employee_email");
				var employee_email_alert = document.getElementById("employee_email_alert");
				var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				if(employee_email.value == ""){
					employee_email_alert.innerText = "필수 항목입니다.";
					employee_email_alert.classList.add("text-danger");
					employee_email.focus();
					return;
				}
				
 				if(!emailRule.test(employee_email.value)){
					employee_email_alert.innerText = "이메일 형식이 올바르지 않습니다";
					employee_email_alert.classList.add("text-danger");
					employee_email.focus();
					return;
				}
				
				var xhr = new XMLHttpRequest(); //AJAX 객체 생성
				xhr.onreadystatechange = function () {
					if(xhr.readyState == 4 && xhr.status == 200){
						var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
						
						if(result.data == "F"){
							isEmailChecked = true;
							employee_email_alert.classList.remove("text-danger");
							employee_email_alert.classList.add("text-success");
							employee_email_alert.innerText = "사용 가능한 이메일입니다.";
						} else {
							isEmailChecked = false;
							employee_email_alert.classList.add("text-danger");
							employee_email_alert.innerText = "이미 사용중이거나 탈퇴한 이메일입니다.";
						}
					}
				}
				xhr.open("get" , "./emailCheckProcess?employee_email=" + employee_email.value); //리퀘스트 세팅..
				//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
				xhr.send(); //AJAX로 리퀘스트함..
			}
			
			
			function doSubmit(){
				var form = document.getElementById("employeeRegister");
				
				var company_code = document.getElementById("company_code");
				var company_code_alert = document.getElementById("company_code_alert");
				var dep_selectBox = document.getElementById("dep_selectBox");
				var department_code = document.getElementById("department_code");
				var dep_code_alert = document.getElementById("dep_code_alert");
				var employee_email = document.getElementById("employee_email");
				var employee_email_alert = document.getElementById("employee_email_alert");
				var employee_password = document.getElementById("employee_password");
				var employee_password_alert = document.getElementById("employee_password_alert");
				var employee_password_check = document.getElementById("employee_password_check");
				var employee_password_check_alert = document.getElementById("employee_password_check_alert");
				var employee_name = document.getElementById("employee_name");
				var employee_name_alert = document.getElementById("employee_name_alert");
				
				if(company_code.value == "회사 코드를 선택해주세요."){
					company_code_alert.innerText = "필수 항목입니다.";
					company_code_alert.classList.add("text-danger");
					company_code.focus();
					return;
				} else {
					company_code_alert.innerHTML = "";
				}	
				
				if(department_code.value == "0"){
					dep_code_alert.innerText = "필수 항목입니다.";
					dep_code_alert.classList.add("text-danger");
					department_code.focus();
					return;
				} else {
					dep_code_alert.innerHTML = "";
				}
				
				if(employee_email.value == ""){
					employee_email_alert.innerText = "필수 항목입니다.";
					employee_email_alert.classList.add("text-danger");
					employee_email.focus();
					return;
				}
				if(isEmailChecked == false){
					return;
				}
				
				if(employee_password.value == ""){
					employee_password_alert.innerText = "필수 항목입니다.";
					employee_password_alert.classList.add("text-danger");
					employee_password.focus();
					return;
				} else {
					employee_password_alert.innerHTML = "";
				}
				
				if(employee_password_check.value == ""){
					employee_password_check_alert.innerText = "비밀번호가 일치하지 않습니다."
					employee_password_check_alert.classList.add("text-danger");
					employee_password_check.focus();
					return;
				} else {
					employee_password_check_alert.innerHTML = "";
				}
				
				if(employee_password.value != employee_password_check.value){
					employee_password_check_alert.innerText = "비밀번호가 일치하지 않습니다."
					employee_password_check_alert.classList.add("text-danger");
					employee_password_check.focus();
					return;
				}
				
				if(employee_name.value ==""){
					employee_name_alert.innerText = "필수 항목입니다.";
					employee_name_alert.classList.add("text-danger");
					employee_name.focus();
					return;
				} else {
					employee_name_alert.innerHTML = "";
				}
				
				form.submit();
				alert("등록하신 정보로 인증 메일이 전송되었습니다. 인증 후 로그인이 가능합니다.")
			}
			
			
	</script>
	
<title>회원가입</title>
</head>
<body>
    <div id="wrapper">
    	<div class="row border-bottom mt-3 mb-3">
    		<h2 class="fb-bold">회원가입</h2>
    	</div>
		<div id="info" class="row border p-3">
			<form id="employeeRegister" action="employeeRegisterProcess" method="post">
			<div class="col">
				<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="companyCode" class="form-label fw-bold">회사 코드</label>
				         	 <select id="company_code" name="company_code" onchange="chageCompanySelect()" class="form-select" aria-label="Default select example">
							   <option selected disabled>회사 코드를 선택해주세요.</option>
							   <c:forEach items="${companyCodeDataList}" var="data">
							     <option value="${data.companyVo.company_code }">${data.companyVo.company_code }</option>
							   </c:forEach>
							 </select>
							 <div id="company_code_alert"></div>
				         </div>
				         <div id="dep_selectBox">
				         </div>
				         <div id="dep_code_alert"></div>
					</div>
				</div>
			<div class="row mb-2">
					<div class="col">
						<label for="employee_email" class="form-label fw-bold">이메일</label>
							<input id="employee_email" onblur="emailCheck()" name="employee_email" type="text" class="form-control" placeholder="인증메일을 받기 위해 정확한 이메일 주소를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							<!-- <button class="btn btn-outline-primary mt-2" type="button" id="button-addon2">인증 번호 받기</button> -->
					</div>
					<div id="employee_email_alert"></div>
				</div>
			</div>
			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="employee_password" class="form-label fw-bold">비밀번호</label>
				             <input id="employee_password" onblur="passwordRule()" name="employee_password" type="password" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
				         <div id="employee_password_alert"></div>
				         
					</div>
			</div>
 			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="employee_password_check" class="form-label fw-bold">비밀번호 확인</label>
				             <input id="employee_password_check" onblur="passwordCheck()" name="employee_password_check" type="password" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
				         <div id="employee_password_check_alert"></div>
					</div>
			</div>	
			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="employee_name" class="form-label fw-bold">이름</label>
				             <input id="employee_name" name="employee_name" type="text" class="form-control" placeholder="이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
				         <div id="employee_name_alert"></div>
					</div>
			</div>			
			<div class="row">
				<div class="col text-center">
					<input type="button" onclick="doSubmit()" class="btn btn-primary" value="가입하기">
				</div>
			</div>
			
			</form>
		</div> 
    
    </div>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>