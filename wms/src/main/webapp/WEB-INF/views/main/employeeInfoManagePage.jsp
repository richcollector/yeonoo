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
    
	.scroll-container {
     display: flex;
     flex-wrap: no-wrap;
     overflow-x: scroll;
     overflow-y: hidden;
   }

   #scrollTable {
	flex: 0 0 auto;
   }

    </style>
	
<script type="text/javascript">
	
	function selectAccount(){
		
	    var checkVal = "";
	    var obj_length = document.getElementsByName("checkAccount").length;
	    var count = 0;
	    
        for (var i = 0; i < obj_length; i++) {
            if (document.getElementsByName("checkAccount")[i].checked == true) {
            	count += 1;
            }
        }
        
        if(count == 0){
        	alert("적어도 하나는 선택하여 주십시오.");
        	cleanUpdateModal();
        	return;
        }else if(count > 1){
        	alert("하나만 선택해 주세요.");
        	cleanUpdateModal();
        	return;
        }
        
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkAccount")[i].checked == true) {
            	checkVal = document.getElementsByName("checkAccount")[i].value;
            }
        }
        
        cleanUpdateModal();
	    
        var company_code = document.getElementById("company_code").value;
		var employee_code = checkVal;
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				document.getElementById("updateModalStart").click();
			}
		}
		
		xhr.open("post", "./selectEmployeeInfo");	//리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send("company_code=" + company_code + "&employee_code=" + employee_code);	//AJAX로 리퀘스트함...
		
	}
	
	function cleanUpdateModal(){
		//document.getElementById("company_code").value = "";
		//document.getElementById("employee_rank_name_update").value = "";

	}
		
	
	function updateEmployeeAuthInfo(){
		var authority_code = document.getElementById("authority_code").value;
		var company_code = document.getElementById("company_code").value;
		var employee_code = document.getElementById("employee_code").value;
		var employee_rank_code = document.getElementById("employee_rank_code").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
			}
		}
		
		xhr.open("post" , "./employeeAuthUpdateProcess" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("company_code=" + company_code + "&employee_code=" + employee_code + "&authority_code=" + authority_code + "&employee_rank_code=" + employee_rank_code);		
		refreshAccountInfo();
		
	}
	
	function updateEmployeeRetire(){
		
	    var checkVal = new Array();
	    var company_code = document.getElementById("company_code").value;
	    var employee_code = document.getElementById("employee_code").value;
	    var obj_length = document.getElementsByName("checkAccount").length;
	    
        for (var i = 0; i < obj_length; i++) {
            if (document.getElementsByName("checkAccount")[i].checked == true) {
            	checkVal[i] = document.getElementsByName("checkAccount")[i].value;
            }
        }
	
        if(!confirm("퇴사처리 하시겠습니까?")){
        	
        } else {
        	var xhr = new XMLHttpRequest();
    		xhr.onreadystatechange = function () {
    			if(xhr.readyState == 4 && xhr.status == 200){
    				var result = JSON.parse(xhr.responseText);
    				
    			}
    		}
    		
    		xhr.open("post" , "./updateEmployeeRetireProcess" , false);
    		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    		xhr.send("code=" + checkVal + "&company_code=" + company_code);
    		refreshAccountInfo();
        }
		
	}
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=check_all]").checked;

		var list = document.getElementsByName("checkAccount");
		
		if(allCheckValue){
			for(var i = 0; i < list.length; i++){
				list[i].checked = true;
			}
		}else{
			for(var i = 0; i < list.length; i++){
				list[i].checked = false;
			};
		}
	}

	function checkOk(){

		var total = document.getElementById("check_all");
		var list = document.getElementsByName("checkAccount");
		var countCh = 0;
		
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked == true){
				countCh += 1;
				if(countCh == list.length){
				total.checked = true;
				}
			}else{
				total.checked = false;
			}
		}
	}
	
 	function refreshAccountInfo(){
 		
 		var company_code = document.getElementById("company_code").value;
 		
 		var clickSearchType = document.getElementById("searchType");
 		var clickSearchTypeVal = clickSearchType.value;
 		
 		var clickSearchWord = document.getElementById("searchWord");
 		var clickSearchWordVal = clickSearchWord.value;
 		
// 		var tableDiv = document.getElementById("scrollTable");
//  		tableDiv.innerHtml = "";

		var table1 = document.getElementById("createTable");
		table1.innerHTML = "";
		table1.classList.add("table");
		table1.classList.add("table-bordered");
		table1.classList.add("text-center");

		var thead1 = document.createElement("thead");
		table1.appendChild(thead1);

		var tr1 = document.createElement("tr");
		thead1.appendChild(tr1);

		var th1 = document.createElement("th");
		th1.setAttribute("style","width:4%");
		tr1.appendChild(th1);

		var input1 = document.createElement("input");
		input1.setAttribute("id","check_all");
		input1.setAttribute("onclick","allCheck()");
		input1.setAttribute("type","checkbox");
		th1.appendChild(input1);
		
		var th2 = document.createElement("th");
		th2.innerText = "사원코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "부서코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "직급코드";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.setAttribute("style","width:5%");
		th5.innerText = "권한";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "사원명";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.setAttribute("style","width:18%");
		th7.innerText = "이메일";
		tr1.appendChild(th7);
		
		var th8 = document.createElement("th");
		th8.setAttribute("style","width:5%");
		th8.innerText = "상태";
		tr1.appendChild(th8);
		
		var th9 = document.createElement("th");
		th9.innerText = "입사일";
		tr1.appendChild(th9);
		
		var th10 = document.createElement("th");
		th10.innerText = "퇴사일";
		tr1.appendChild(th10);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				for(commentData of jsonObj.employeeList){
					
				var tbody1 = document.createElement("tbody");
// 				tbody1.innerHtml = "";
				table1.appendChild(tbody1);

				var trIn1 = document.createElement("tr");
				tbody1.appendChild(trIn1);

				var td1 = document.createElement("td");
				trIn1.appendChild(td1);

				var inputIn1 = document.createElement("input");
				inputIn1.setAttribute("onclick","checkOk()");
				inputIn1.setAttribute("name","checkAccount");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("id", "employee_code");
				inputIn1.setAttribute("value",commentData.employee_code);
				td1.appendChild(inputIn1);

				var td2 = document.createElement("td");
				td2.innerText = commentData.employee_code;
				trIn1.appendChild(td2);
				
				var td3 = document.createElement("td");
				td3.innerText = commentData.department_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.employee_rank_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.authority_code;
				trIn1.appendChild(td5);
				
				var td6 = document.createElement("td");
				td6.innerText = commentData.employee_name;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = commentData.employee_email;
				trIn1.appendChild(td7);
				
				var td8 = document.createElement("td");
				td8.innerText = commentData.employee_state;
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.employee_join_date).format('YYYY.MM.DD');
				trIn1.appendChild(td9);
				
				var td10 = document.createElement("td");
				td10.innerText = moment(commentData.employee_leave_date).format('YYYY.MM.DD');
				trIn1.appendChild(td10);
				
				}
				
				var createUl = document.getElementById("pageUl");
				createUl.innerHTML = "";
				createUl.setAttribute("id","pageUl");
				createUl.classList.add("pagination");
				createUl.classList.add("justify-content-center");

				if(jsonObj.startPage <= 1){
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					inLi1.classList.add("disabled");
					createUl.appendChild(inLi1);

					var inA1 = document.createElement("a");
					inA1.setAttribute("href","#");
					inA1.setAttribute("aria-label","Previous");
					inA1.classList.add("page-link");
					inLi1.appendChild(inA1);

					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
				}else {
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					createUl.appendChild(inLi1);

					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("href","javascript:refreshAccountInfoPage("+(josonObj.startPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA1.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA1.setAttribute("aria-label","Previous");
					inLi1.appendChild(inA1);

					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
				}
				// var i = 0;
				// 	i += 1;
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
					if(i == jsonObj.currentPageNum){
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						createUl.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshAccountInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshAccountInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}
				}

				if(jsonObj.endPage >= jsonObj.totalPageCount){
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					inLi3.classList.add("disabled");
					createUl.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","#");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				}else {
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					createUl.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","javascript:refreshAccountInfoPage("+(josonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA3.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				}

			}
		}
		
		xhr.open("get", "../main/employeeInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal + "&company_code=" + company_code);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshAccountInfoPage(pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
 		var company_code = document.getElementById("company_code").value;
 		
		var table1 = document.getElementById("createTable");
		table1.innerHTML = "";
		table1.classList.add("table");
		table1.classList.add("table-bordered");
		table1.classList.add("text-center");

		var thead1 = document.createElement("thead");
		table1.appendChild(thead1);

		var tr1 = document.createElement("tr");
		thead1.appendChild(tr1);

		var th1 = document.createElement("th");
		th1.setAttribute("style","width:4%");
		tr1.appendChild(th1);

		var input1 = document.createElement("input");
		input1.setAttribute("id","check_all");
		input1.setAttribute("onclick","allCheck()");
		input1.setAttribute("type","checkbox");
		th1.appendChild(input1);

		var th2 = document.createElement("th");
		th2.innerText = "사원코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "부서코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "직급코드";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.setAttribute("style","width:5%");
		th5.innerText = "권한";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "사원명";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.setAttribute("style","width:18%");
		th7.innerText = "이메일";
		tr1.appendChild(th7);
		
		var th8 = document.createElement("th");
		th8.setAttribute("style","width:5%");
		th8.innerText = "상태";
		tr1.appendChild(th8);
		
		var th9 = document.createElement("th");
		th9.innerText = "입사일";
		tr1.appendChild(th9);
		
		var th10 = document.createElement("th");
		th10.innerText = "퇴사일";
		tr1.appendChild(th10);

		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				for(commentData of jsonObj.employeeList){
					
					var tbody1 = document.createElement("tbody");
//	 				tbody1.innerHtml = "";
					table1.appendChild(tbody1);

					var trIn1 = document.createElement("tr");
					tbody1.appendChild(trIn1);

					var td1 = document.createElement("td");
					trIn1.appendChild(td1);

					var inputIn1 = document.createElement("input");
					inputIn1.setAttribute("onclick","checkOk()");
					inputIn1.setAttribute("name","checkAccount");
					inputIn1.setAttribute("type","checkbox");
					inputIn1.setAttribute("id", "employee_code");
					inputIn1.setAttribute("value",commentData.employee_code);
					td1.appendChild(inputIn1);

					var td2 = document.createElement("td");
					td2.innerText = commentData.employee_code;
					trIn1.appendChild(td2);

					var td3 = document.createElement("td");
					td3.innerText = commentData.department_code;
					trIn1.appendChild(td3);

					var td4 = document.createElement("td");
					td4.innerText = commentData.employee_rank_code;
					trIn1.appendChild(td4);

					var td5 = document.createElement("td");
					td5.innerText = commentData.authority_code;
					trIn1.appendChild(td5);

					var td6 = document.createElement("td");
					td6.innerText = commentData.employee_name;
					trIn1.appendChild(td6);

					var td7 = document.createElement("td");
					td7.innerText = commentData.employee_email;
					trIn1.appendChild(td7);
					
					var td8 = document.createElement("td");
					td8.innerText = commentData.employee_state;
					trIn1.appendChild(td8);
					
					var td9 = document.createElement("td");
					td9.innerText = moment(commentData.employee_join_date).format('YYYY.MM.DD');
					trIn1.appendChild(td9);
					
					var td10 = document.createElement("td");
					td10.innerText = moment(commentData.employee_leave_date).format('YYYY.MM.DD');
					trIn1.appendChild(td10);
					
					}
				
				var createUl = document.getElementById("pageUl");
				createUl.innerHTML = "";
				createUl.setAttribute("id","pageUl");
				createUl.classList.add("pagination");
				createUl.classList.add("justify-content-center");
				
				if(jsonObj.startPage <= 1){
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					inLi1.classList.add("disabled");
					createUl.appendChild(inLi1);

					var inA1 = document.createElement("a");
					inA1.setAttribute("href","#");
					inA1.setAttribute("aria-label","Previous");
					inA1.classList.add("page-link");
					inLi1.appendChild(inA1);

					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
					
				}else {
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					createUl.appendChild(inLi1);

					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("href","javascript:refreshAccountInfoPage("+(josonObj.startPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA1.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA1.setAttribute("aria-label","Previous");
					inLi1.appendChild(inA1);

					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
				}
				// var i = 0;
				// 	i += 1;
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
					
					if(i == jsonObj.currentPageNum){
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						createUl.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshAccountInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshAccountInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}
				}

				if(jsonObj.endPage >= jsonObj.totalPageCount){
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					inLi3.classList.add("disabled");
					createUl.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","#");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				}else {
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					createUl.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","javascript:refreshAccountInfoPage("+(josonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA3.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				}

			}
		}
		
		xhr.open("get", "../main/employeeInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal + "&company_code=" + company_code);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}

	window.addEventListener("DOMContentLoaded" , function (){
	//사실상 처음 실행하는 코드 모음...
	refreshAccountInfo();
	//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
	});
	
</script>
	
<title>사원 관리</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">   
		<div class="row">
	        <div class="col form-control mt-3">
	        	<div class="row">
		        	<div class="col-6 mx-0">
			             <button onclick="selectAccount()" id="updateModal" type="button" class="btn btn-light">
			             	수정
			             </button>
   			             <button id="updateModalStart" type="button" hidden class="btn btn-light" data-bs-toggle="modal" data-bs-target="#accountUpdate">
			             	수정
			             </button>
		            	 <button onclick="updateEmployeeRetire()" type="button" class="btn btn-light">
		            		퇴사처리
		            	 </button>
		            </div>
		            <div class="col-6 text-end mx-0 pt-1">
		            	<span class="fs-5">사원 관리</span>
		            	<input type="hidden" name="company_code" id="company_code" value="${adminInfo.company_code }">
		            </div>
	            </div>
	        </div>   
        </div>
        <div class="row">
            <div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">사원 목록</span>
                    </div>
                    <div id="searchDiv" class="col-4">
							<div class="input-group mb-3">
									<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
										<option selected>선택</option>
										<option value="employee_code">사원코드</option>
										<option value="department_code">부서코드</option>
										<option value="employee_rank_code">직급코드</option>
										<option value="employee_name">사원명</option>
									  </select>
									<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
									<button type="button" onclick="refreshAccountInfo()" class="input-group-text bi bi-search" id="basic-addon1"></button>
							</div>
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 py-2 px-1">
						<div id="scrollTable">
							<table id="createTable" class="table table-bordered text-center" style="table-layout: fixed; width: 1187px;">
							
							</table>
						</div>
					</div>
					<div id="pageDiv" class="page mt-3" >
						<nav aria-label="Page navigation example">
							<ul id="pageUl" class="pagination justify-content-center">
<%-- 						  	<c:choose> --%>
<%-- 		  				  		<c:when test="${startPage <= 1 }"> --%>
<!-- 								<li class="page-item disabled"> -->
<!-- 									<a class="page-link" href="#" aria-label="Previous"> -->
<!-- 									<span aria-hidden="true">&laquo;</span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<%-- 								</c:when> --%>
<%-- 						  		<c:otherwise> --%>
<!-- 									<li class="page-item"> -->
<%-- 										<a class="page-link" href="./accountInfoPage?pageNum=${startPage - 1 }${additionalParam}" aria-label="Previous"> --%>
<!-- 										<span aria-hidden="true">&laquo;</span> -->
<!-- 										</a> -->
<!-- 									</li> -->
<%-- 						  		</c:otherwise> --%>
<%-- 					  		</c:choose> --%>
<%-- 	  					    <c:forEach begin="${startPage }" end="${endPage }" var="i"> --%>
<%-- 		  					    <c:choose> --%>
<%-- 			  					    <c:when test="${i == currentPageNum }"> --%>
<%-- 			  					    	<li class="page-item active"><a class="page-link" href="./accountInfoPage?pageNum=${i }${additionalParam}">${i }</a></li> --%>
<%-- 			  					    </c:when> --%>
<%-- 			  					    <c:otherwise> --%>
<%-- 			  					    	<li class="page-item"><a class="page-link" href="./accountInfoPage?pageNum=${i }${additionalParam}">${i }</a></li> --%>
<%-- 			  					    </c:otherwise> --%>
<%-- 								</c:choose> --%>
<%-- 							</c:forEach> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${endPage >= totalPageCount}"> --%>
<!-- 								<li class="page-item disabled"> -->
<!-- 									<a class="page-link" href="#" aria-label="Next"> -->
<!-- 									<span aria-hidden="true">&raquo;</span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 								<li class="page-item"> -->
<!-- 									<a class="page-link" href="./accountInfoPage?pageNum=${endPage+1}${additionalParam}" aria-label="Next"> -->
<!-- 									<span aria-hidden="true">&raquo;</span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<%-- 								</c:otherwise> --%>
<%-- 			    			</c:choose> --%>
							</ul>
						</nav>
					</div>
               	</div>
            </div>
        </div>
          
        <!-- 수정창 모달 -->
        <div class="modal fade" id="accountUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">권한 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                        	<input id="account_code_update" type="hidden" class="form-control">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">직급코드</span>
                                        <input id="employee_rank_code" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">권한코드</span>
                                        <input id="authority_code" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="updateEmployeeAuthInfo()" data-bs-dismiss="modal">수정</button>
                </div>
              </div>
            </div>
          </div>
          
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>