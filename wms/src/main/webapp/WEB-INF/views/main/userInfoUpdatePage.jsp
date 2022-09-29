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
    }
    
    .ent-list{
		background-color: rgb(184, 184, 184);
    }
    
    </style>
	
<script type="text/javascript">

	function passwordRule(){
		var employee_password_update = document.getElementById("employee_password_update");
		var employee_password_update_alert = document.getElementById("employee_password_update_alert");
		var pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
		
		if(!pwRule.test(employee_password_update.value)){
			employee_password_update_alert.innerText = "비밀 번호는 숫자/문자/특수문자가 포함된 8~15자리 이내의 형식이어야합니다";
			employee_password_update_alert.classList.add("text-danger");
			employee_password_update_alert.setAttribute("style" , "font-size:0.8rem");
			employee_password_update.focus();
			return;
		} else {
			employee_password_update_alert.innerHTML = "";
		}
	}
	
	function passwordCheck(){
		var employee_password_update = document.getElementById("employee_password_update");
		var employee_password_update_check = document.getElementById("employee_password_update_check");
		var employee_password_update_check_alert = document.getElementById("employee_password_update_check_alert");
		
		if(employee_password_update.value == employee_password_update_check.value){
			employee_password_update_check_alert.innerHTML = "";
		} else {
			employee_password_update_check_alert.classList.add("text-danger");
			employee_password_update_check_alert.innerText = "비밀번호가 일치하지 않습니다";
			employee_password_update_check_alert.setAttribute("style" , "font-size:0.8rem");
			employee_password_update_check.focus();
			return;
		}

	}
	function dosubmit(){
		var form = document.getElementById("updateEmployeeInfo")
		
		var employee_password_update = document.getElementById("employee_password_update");
		var employee_password_update_alert = document.getElementById("employee_password_update_alert");
		var employee_password_update_check = document.getElementById("employee_password_update_check");
		var employee_password_update_check_alert = document.getElementById("employee_password_update_check_alert");
		
		if(employee_password_update.value == ""){
			employee_password_update_alert.innerText = "변경할 비밀번호를 입력해주세요.";
			employee_password_update_alert.classList.add("text-danger");
			employee_password_update_alert.setAttribute("style" , "font-size:0.8rem");
			employee_password_update.focus();
			return;
			
		} else {
			employee_password_update_alert.innerText = "";
		}
		
		if(employee_password_update.value != employee_password_update_check.value){
			employee_password_update_check_alert.innerText = "비밀번호가 일치하지 않습니다."
			employee_password_update_check_alert.classList.add("text-danger");
			employee_password_update_check_alert.setAttribute("style" , "font-size:0.8rem");
			employee_password_update_check.focus();
			return;
		}
		
		form.submit();
		alert("재로그인이 필요합니다. 로그인을 다시 해주세요")
	}
	
	window.addEventListener("DOMContentLoaded" , function (){
		
			//setInterval(refreshCommentList , 3000);
		});
	
</script>
	
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">	        
		<div class="row">
            <div class="form-control mt-3" id="btnCotroller">
                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#companyUpdate">
                	수정
                </button>
            </div>            
        </div>
        <div class="row">
            <div class="form-control mt-3 ent-list" id="companyInfoForm">
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">사원번호</span>
                            <span class="form-control" id="employee_code">${employeeInfo.employee_code }</span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">회사코드</span>
                            <span class="form-control" id="company_code">${employeeInfo.company_code }</span>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">부서코드</span>
                            <span class="form-control" id="department_code">${employeeInfo.department_code }</span>
                        </div>
                    </div>
                    <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">직급코드</span>
                             <span class="form-control" id="employee_rank_code">${employeeInfo.employee_rank_code }</span>
                         </div>
                     </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">이메일</span>
                            <span class="form-control" id="employee_email">${employeeInfo.employee_email }</span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">입사일</span>
                            <span class="form-control" id="employee_join_date">
                            <fmt:formatDate value="${employeeInfo.employee_join_date }" type="date"  dateStyle="short"/> 
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">이름</span>
                            <span class="form-control" id="employee_name">${employeeInfo.employee_name }</span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">퇴사일</span>
                            <span class="form-control" id="employee_leave_date">
                            <fmt:formatDate value="${employeeInfo.employee_leave_date }" type="date"  dateStyle="short"/>
                            </span>
                        </div>
                    </div>
                </div>
          </div>
        </div>
        </div>
		<!-- 수정창 모달 -->
        <div class="modal fade" id="companyUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">정보 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="ent-list form-control mt-3">
                    <form id="updateEmployeeInfo" action="updateEmployeePwProcess" method="post">
	                <div class="row mt-3">
	                    <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">사원번호</span>
	                            <input type="hidden" name="employee_code" value="${employeeInfo.employee_code }">
	                            <span class="form-control" id="employee_code_update" >${employeeInfo.employee_code }</span>
	                        </div>
	                    </div>
	                    <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">회사코드</span>
	                            <input type="hidden" name="company_code" value="${employeeInfo.company_code }">
	                            <span class="form-control" id="company_code_update">${employeeInfo.company_code }</span>
	                        </div>
	                    </div>
	                </div>
	                <div class="row mt-3">
	                    <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">부서코드</span>
	                            <span class="form-control" id="department_code_update">${employeeInfo.department_code }</span>
	                        </div>
	                    </div>
	                    <div class="col">
	                         <div class="input-group">
	                             <span class="input-group-text">직급코드</span>
	                             <span class="form-control" id="employee_rank_code_update">${employeeInfo.employee_rank_code }</span>
	                         </div>
	                     </div>
	                </div>
	                <div class="row mt-3">
	                    <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">이메일</span>
	                            <span class="form-control" id="employee_email_update">${employeeInfo.employee_email }</span>
	                        </div>
	                    </div>
	                </div>
	                <div class="row mt-3">
	                    <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">이름</span>
	                            <span class="form-control" id="employee_name_update">${employeeInfo.employee_name }</span>
	                        </div>
	                    </div>
	                    <div class="col">
	                        <div class="input-group">
	                       	   <span class="input-group-text">상태</span>
	                           <span class="form-control" id="employee_state">${employeeInfo.employee_state }</span>
	                        </div>
	                    </div>
	                </div>
	                <div class="row mt-3">
	                    <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">입사일</span>
	                            <span class="form-control" id="employee_join_date_update">
	                            <fmt:formatDate value="${employeeInfo.employee_join_date }" type="date"  dateStyle="short"/>
	                            </span>
	                        </div>
	                    </div>
	                    <div class="col">
	                       <div class="input-group">
	                            <span class="input-group-text">퇴사일</span>
	                            <span class="form-control" id="employee_leave_date_update">
	                            <fmt:formatDate value="${employeeInfo.employee_leave_date }" type="date"  dateStyle="short"/>
	                            </span>
	                       </div>
	                   </div>
                        </div>
                    <div class="row mt-3">
                        <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">비밀번호</span>
	                            <input id="employee_password_update" name="employee_password" onblur="passwordRule()" type="password" class="form-control" aria-label="Username" aria-describedby="addon-wrapping" autoComplete="off">
	                        </div>
	                        <div class="mt-1" id="employee_password_update_alert"></div>
	                    </div>
	                </div>
	                <div class="row mt-3">
	                    <div class="col">
	                        <div class="input-group">
	                            <span class="input-group-text">비밀번호 확인</span>
	                            <input id="employee_password_update_check" onblur="passwordCheck()" type="password" class="form-control" aria-label="Username1" aria-describedby="addon-wrapping" autoComplete="off">
	                        </div>
	                        <div class="mt-1" id="employee_password_update_check_alert"></div>
	                    </div>
	                 </div>
	                 </form>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="dosubmit()">수정</button>
                </div>
              </div>
            </div>
          </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>