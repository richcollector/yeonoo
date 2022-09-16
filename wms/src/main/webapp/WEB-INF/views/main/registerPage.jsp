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
				
				var company_select = document.getElementById("company_select");
				var companyCode = company_select.options[company_select.selectedIndex].value;
				var dep_selectBox = document.getElementById("dep_selectBox");
				
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
						dep_select.setAttribute("name" , "department_code");
						dep_selectBox.appendChild(dep_select);
						
						var optionDisabled = document.createElement("option");
						optionDisabled.innerText = "부서코드를 선택해주세요";
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
			
			
			window.addEventListener("DOMContentLoaded" , function(){
				
				
			});
		
	</script>
	
<title>회원가입</title>
</head>
<body>
    <div id="wrapper">
    	<div class="row border-bottom mt-3 mb-3">
    		<h2 class="fb-bold">회원가입</h2>
    	</div>
		<div id="info" class="row border p-3">
			<form action="employeeRegisterProcess" method="post">
			<div class="col">
				<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="companyCode" class="form-label fw-bold">회사 코드</label>
				         	 <select id="company_select" onchange="chageCompanySelect()" class="form-select" aria-label="Default select example">
							   <option selected disabled>회사 코드를 선택해주세요.</option>
							   <c:forEach items="${companyCodeDataList}" var="data">
							     <option value="${data.companyVo.company_code }">${data.companyVo.company_code }</option>
							   </c:forEach>
							 </select>
				         </div>
				         <div id="dep_selectBox">
				         </div>
					</div>
				</div>
			<div class="row mb-2">
					<div class="col">
						<label for="email" class="form-label fw-bold">이메일</label>
							<input id="email" name="employee_email" type="text" class="form-control" placeholder="이메일 주소를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							<!-- <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증 번호 받기</button> -->
					</div>
				</div>
			<!-- <div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="emailCheckCode" class="form-label fw-bold">인증 번호</label>
				             <input id="emailCheckCode" type="text" class="form-control" placeholder="인증 번호를 입력해 주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
					</div>
				</div> -->
			</div>
			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="employeePassword" class="form-label fw-bold">비밀번호</label>
				             <input id="employeePassword" name="employee_password" type="text" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
					</div>
			</div>
<!-- 			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="employeePasswordCheck" class="form-label fw-bold">비밀번호 확인</label>
				             <input id="employeePasswordCheck" name="employee_password_check" type="text" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
					</div>
			</div> -->		
			<div class="row mb-2">
					<div class="col">
				         <div>
				             <label for="employeeName" class="form-label fw-bold">이름</label>
				             <input id="employeeName" name="employee_name" type="text" class="form-control" placeholder="이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				         </div>
					</div>
			</div>			
			<div class="row">
				<div class="col text-center">
					<button class="btn btn-primary">가입완료</button>
				</div>
			</div>
			
			</form>
		</div> 
    
    </div>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>