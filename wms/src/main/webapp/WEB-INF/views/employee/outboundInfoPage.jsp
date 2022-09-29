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
	
	function insertOutboundInfo(){
		
		var companyCodeVal = document.getElementById("company_code").value;
		var accountCodeVal = document.getElementById("account_code").value;
		var outboundDateVal = document.getElementById("outbound_date").value;
		var outboundManagerVal = document.getElementById("outbound_manager").value;
		var outboundRegisterDateVal = document.getElementById("outbound_register_date").value;
		var outboundRegisterEmployeeVal = document.getElementById("outbound_register_employee").value;
		var outboundUpdateDateVal = document.getElementById("outbound_update_date").value;
		var outboundUpdateEmployeeVal = document.getElementById("outbound_update_employee").value;
		var outboundMemoVal = document.getElementById("outbound_memo").value;
		
		
		var xhr = new XMLHttpRequest();
// 		xhr.onreadystatechange = function () {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var result = JSON.parse(xhr.responseText);	
					

				
// 			}
// 		}
		
		xhr.open("post" , "./insertOutboundInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("company_code=" + companyCodeVal + "&account_code=" + accountCodeVal + 
				"&outbound_date=" + outboundDateVal + 
				"&outbound_manager=" + outboundManagerVal + 
				"&outbound_register_date=" + outboundRegisterDateVal + 
				"&outbound_register_employee=" + outboundRegisterEmployeeVal +
				"&outbound_update_date=" + outboundUpdateDateVal + 
				"&outbound_update_employee=" + outboundUpdateEmployeeVal +
				"&outbound_memo=" + outboundMemoVal);
		
		
		document.getElementById("company_code").value = "";
		document.getElementById("account_code").value = "";
		document.getElementById("outbound_date").value = "";
		document.getElementById("outbound_manager").value = "";
		document.getElementById("outbound_register_date").value = "";
		document.getElementById("outbound_register_employee").value = "";
		document.getElementById("outbound_update_date").value = "";
		document.getElementById("outbound_update_employee").value ="";
		document.getElementById("outbound_memo").value = "";
		
		
		refreshOutboundInfo();
	}
	
	function selectOutbound(){
		
	    var checkVal = "";
	    
	    var obj_length = document.getElementsByName("checkOutbound").length;
	    
	    var count = 0;
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkOutbound")[i].checked == true) {
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

            if (document.getElementsByName("checkOutbound")[i].checked == true) {
            	checkVal = document.getElementsByName("checkOutbound")[i].value;
            }
        }
        
        document.getElementById("outbound_code_update").value = "";
		document.getElementById("company_code_update").value = "";
		document.getElementById("account_code_update").value = "";
		document.getElementById("outbound_date_update").value = "";
		document.getElementById("outbound_manager_update").value = "";
		document.getElementById("outbound_register_employee_update").value = "";
		document.getElementById("outbound_update_employee_update").value ="";
		document.getElementById("outbound_memo_update").value = "";
	    
		var outboundCode = document.getElementById("outbound_code_update");
		var companyCode = document.getElementById("company_code_update");
		var accountCode = document.getElementById("account_code_update");
		var outboundDate = document.getElementById("outbound_date_update");
		var outboundManager = document.getElementById("outbound_manager_update");
		var outboundRegisterEmployee = document.getElementById("outbound_register_employee_update");
		var outboundUpdateEmployee = document.getElementById("outbound_update_employee_update");
		var outboundMemo = document.getElementById("outbound_memo_update");
		
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
				outboundCode.value = jsonObj.outbound_code;
				companyCode.value = jsonObj.company_code;
				accountCode.value = jsonObj.account_code;
				outboundDate.value = moment(jsonObj.outbound_date).format('YYYY-MM-DD');
				outboundManager.value = jsonObj.outbound_manager;
				outboundRegisterEmployee.value = jsonObj.outbound_register_employee;
				outboundUpdateEmployee.value = moment(jsonObj.outbound_update_employee).format('YYYY-MM-DD');
				outboundMemo.value = jsonObj.outbound_memo;
				
				console.log("잉?" + jsonObj.outbound_code);
				
				document.getElementById("updateModalStart").click();

			}
		}
		
		xhr.open("get", "./selectOutboundInfo?Outbound_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
		
	
	function updateOutboundInfo(){
		
		var outboundCodeVal = document.getElementById("outbound_code_update").value;
		var companyCodeVal = document.getElementById("company_code_update").value;
		var accountCodeVal = document.getElementById("account_code_update").value;
		var outboundDateVal = document.getElementById("outbound_date_update").value;
		var outboundManagerVal = document.getElementById("outbound_manager_update").value;
		var outboundRegisterEmployeeVal = document.getElementById("outbound_register_employee_update").value;
		var outboundUpdateEmployeeVal = document.getElementById("outbound_update_employee_update").value;
		var outboundMemoVal = document.getElementById("outbound_memo_update").value;
		
		var xhr = new XMLHttpRequest();
		
// 		xhr.onreadystatechange = function () {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var result = JSON.parse(xhr.responseText);	
						

				
// 			}
// 		}

// 		xhr.open("post" , "./updateObtainOrderInfo" , false);
// 		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
// 		xhr.send("obtain_order_code=" + obtainOrderCodeVal + "&company_code=" + companyCodeVal + 
// 				"&account_code=" + accountCodeVal + "&obtain_order_state=" + obtainOrderStateVal + 
// 				"&obtain_order_manager=" + obtainOrderManagerVal +
// 				"&obtain_order_register_employee=" + obtainOrderRegisterEmployeeVal + 
// 				"&obtain_order_update_employee=" + obtainOrderUpdateEmployeeVal +
// 				"&obtain_order_memo=" + obtainOrderMemoVal);
		
		xhr.open("post" , "./updateOutboundInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("outbound_code=" + outboundCodeVal + "&company_code=" + companyCodeVal + 
				"&account_code=" + accountCodeVal + "&outbound_date=" + outboundDateVal + 
				"&outbound_manager=" + outboundManagerVal + "&outbound_register_employee=" + outboundRegisterEmployeeVal + 
				"&outbound_update_employee=" + outboundUpdateEmployeeVal + 
				"&outbound_memo=" + outboundMemoVal);
		
		var outboundCodeVal = document.getElementById("outbound_code_update").value;
		var companyCodeVal = document.getElementById("company_code_update").value;
		var accountCodeVal = document.getElementById("account_code_update").value;
		var outboundDateVal = document.getElementById("outbound_date_update").value;
		var outboundManagerVal = document.getElementById("outbound_manager_update").value;
		var outboundRegisterEmployeeVal = document.getElementById("outbound_register_employee_update").value;
		var outboundUpdateEmployeeVal = document.getElementById("outbound_update_employee_update").value;
		var outboundMemoVal = document.getElementById("outbound_memo_update").value;
		
		
        document.getElementById("outbound_code_update").value = "";
		document.getElementById("company_code_update").value = "";
		document.getElementById("account_code_update").value = "";
		document.getElementById("outbound_date_update").value = "";
		document.getElementById("outbound_manager_update").value = "";
		document.getElementById("outbound_register_employee_update").value = "";
		document.getElementById("outbound_update_employee_update").value ="";
		document.getElementById("outbound_memo_update").value = "";
		
		
		refreshOutboundInfo();
	}
	
	function deleteOutboundInfo(){
		
	    var checkVal = new Array();
	    
	    
	    var obj_length = document.getElementsByName("checkOutbound").length;
	    
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkOutbound")[i].checked == true) {
            	
            	checkVal[i] = document.getElementsByName("checkOutbound")[i].value;
            }
        }
 	
	
		var xhr = new XMLHttpRequest();
// 		xhr.onreadystatechange = function () {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var result = JSON.parse(xhr.responseText);	
					
				
// 			}
// 		}
		
		xhr.open("post" , "./deleteOutboundInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		refreshOutboundInfo();
		
		
	}
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=check_all]").checked;

		var list = document.getElementsByName("checkOutbound");
		
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
		var list = document.getElementsByName("checkOutbound");
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
	
 	function refreshOutboundInfo(){
 		
 		var clickSearchType = document.getElementById("searchType");
 		var clickSearchTypeVal = clickSearchType.value;
 		console.log(clickSearchTypeVal);
 		
 		var clickSearchWord = document.getElementById("searchWord");
 		var clickSearchWordVal = clickSearchWord.value;
 		console.log(clickSearchWordVal);
 		
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
		tr1.appendChild(th1);

		var input1 = document.createElement("input");
		input1.setAttribute("id","check_all");
		input1.setAttribute("onclick","allCheck()");
		input1.setAttribute("type","checkbox");
		th1.appendChild(input1);

		var th2 = document.createElement("th");
		th2.innerText = "출하코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "회사코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "거래처코드";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "출하주문일";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "출하담당자";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "출하등록일";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "출하등록자";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "출하수정일";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "출하수정자";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "비고";
		tr1.appendChild(th11);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.outboundList){
// 				console.log(commentData.account_code);
					
				var tbody1 = document.createElement("tbody");
// 				tbody1.innerHtml = "";
				table1.appendChild(tbody1);

				var trIn1 = document.createElement("tr");
				tbody1.appendChild(trIn1);

				var td1 = document.createElement("td");
				trIn1.appendChild(td1);

				var inputIn1 = document.createElement("input");
				inputIn1.setAttribute("onclick","checkOk()");
				inputIn1.setAttribute("name","checkOutbound");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.outbound_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.outbound_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.account_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.outbound_date;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.outbound_manager;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = moment(commentData.outbound_register_date).format('YYYY-MM-DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = commentData.outbound_register_employee;
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.outbound_update_date).format('YYYY-MM-DD');
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.outbound_update_employee;
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.outbound_memo;
				trIn1.appendChild(td11);
				
				
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
					console.log(jsonObj.startPage);
				}else {
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					createUl.appendChild(inLi1);

					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("href","javascript:refreshOutboundInfoPage("+i-1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA1.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA1.setAttribute("aria-label","Previous");
					inLi1.appendChild(inA1);

					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
					console.log(jsonObj.startPage);
				}



				// var i = 0;
				// 	i += 1;
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
					console.log(jsonObj.startPage);
					if(i == jsonObj.currentPageNum){
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						createUl.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshOutboundInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshOutboundInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshOutboundInfoPage("+i+1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/outboundInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshOutboundInfoPage(pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
//  		console.log(pageNumVal);
//  		var clickSearchType = document.getElementById("searchType");
//  		var clickSearchTypeVal = clickSearchType.value;
//  		console.log(clickSearchTypeVal);
 		
//  		var clickSearchWord = document.getElementById("searchWord");
//  		var clickSearchWordVal = clickSearchWord.value;
//  		console.log(clickSearchWordVal);
 		
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
		tr1.appendChild(th1);

		var input1 = document.createElement("input");
		input1.setAttribute("id","check_all");
		input1.setAttribute("onclick","allCheck()");
		input1.setAttribute("type","checkbox");
		th1.appendChild(input1);

		var th2 = document.createElement("th");
		th2.innerText = "출하코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "회사코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "거래처코드";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "출하주문일";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "출하담당자";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "출하등록일";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "출하등록자";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "출하수정일";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "출하수정자";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "비고";
		tr1.appendChild(th11);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.outboundList){
// 				console.log(commentData.account_code);
					
				var tbody1 = document.createElement("tbody");
// 				tbody1.innerHtml = "";
				table1.appendChild(tbody1);

				var trIn1 = document.createElement("tr");
				tbody1.appendChild(trIn1);

				var td1 = document.createElement("td");
				trIn1.appendChild(td1);

				var inputIn1 = document.createElement("input");
				inputIn1.setAttribute("onclick","checkOk()");
				inputIn1.setAttribute("name","checkOutbound");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.outbound_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.outbound_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.account_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.outbound_date;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.outbound_manager;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = moment(commentData.outbound_register_date).format('YYYY-MM-DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = commentData.outbound_register_employee;
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.outbound_update_date).format('YYYY-MM-DD');
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.outbound_update_employee;
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.outbound_memo;
				trIn1.appendChild(td11);
				
				
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
					console.log(jsonObj.startPage);
				}else {
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					createUl.appendChild(inLi1);

					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("href","javascript:refreshOutboundInfoPage("+i-1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA1.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA1.setAttribute("aria-label","Previous");
					inLi1.appendChild(inA1);

					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
					console.log(jsonObj.startPage);
				}



				// var i = 0;
				// 	i += 1;
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
					console.log(jsonObj.startPage);
					if(i == jsonObj.currentPageNum){
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						createUl.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshOutboundInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshOutboundInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshOutboundInfoPage("+i+1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/outboundInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}

	window.addEventListener("DOMContentLoaded" , function (){
	//사실상 처음 실행하는 코드 모음...
	refreshOutboundInfo();
	//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
	
	});
	
	
</script>
	
<title>출하정보</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">   
		<div class="row">
	        <div class="col form-control mt-3">
	        	<div class="row">
		        	<div class="col-6 mx-0">
			             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#outboundRegist">
			                등록
			             </button>
			             <button onclick="selectOutbound()" id="updateModal" type="button" class="btn btn-light">
			             	수정
			             </button>
   			             <button id="updateModalStart" type="button" hidden class="btn btn-light" data-bs-toggle="modal" data-bs-target="#outboundUpdate">
			             	수정
			             </button>
		            	 <button onclick="deleteOutboundInfo()" type="button" class="btn btn-light">
		            		삭제
		            	 </button>
		            </div>
		            <div class="col-6 text-end mx-0 pt-1">
		            	<span class="fs-5">츨하 관리</span>
		            </div>
	            </div>
	        </div>   
        </div>
        <div class="row">
            <div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">출하 목록</span>
                    </div>
                    <div id="searchDiv" class="col-4">
<!-- 	                    <form action="../account/accountInfoPage" method="get"> -->
							<div class="input-group mb-3">
									<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
										<option selected>선택</option>
										<option value="outbound_code">출하번호</option>
										<option value="outbound_manager">출하담당자</option>
										<option value="outbound_register_employee">출하등록자</option>
									  </select>
									<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
									<button type="button" onclick="refreshOutboundInfo()" class="input-group-text bi bi-search" id="basic-addon1"></button>
<!-- 									<button class="input-group-text bi bi-search" id="basic-addon1"></button> -->
							</div>
<!-- 						</form> -->
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 py-2 px-1">
						<div id="scrollTable">
							<table id="createTable" class="table table-bordered text-center">
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 								<th><input id="check_all" onclick="allCheck()" type="checkbox"></th> -->
<!-- 								<th>거래처 번호</th> -->
<!-- 								<th>회사 이름</th> -->
<!-- 								<th>사업자등록번호</th> -->
<!-- 								<th>법인등록번호</th> -->
<!-- 								<th>대표명</th> -->
<!-- 								<th>전화번호</th> -->
<!-- 								<th>팩스번호</th> -->
<!-- 								<th>이메일번호</th> -->
<!-- 								<th>이메일번호(세금)</th> -->
<!-- 								<th>우편번호</th> -->
<!-- 								<th>주소</th> -->
<!-- 								<th>상세주소</th> -->
<!-- 								<th>거래처분류</th> -->
<!-- 								<th>거래처등록일</th> -->
<!-- 								<th>메모</th> -->
<!-- 								<th>사업자등록증</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<%-- 							<c:forEach items="${accountList}" var="data"> --%>
<%-- 							<c:set var="n" value="${n+1}"/> --%>
<!-- 							<tbody> -->
<!-- 								<tr> -->
<%-- 								<td><input onclick="checkOk()" name="checkAccount" type="checkbox" value="${data.account_code }"></td> --%>
<%-- 								<th>${data.account_code }</th> --%>
<%-- 								<td>${data.account_name }</td> --%>
<%-- 								<td>${data.account_registration_number }</td> --%>
<%-- 								<td>${data.account_corporate_registration_number }</td> --%>
<%-- 								<td>${data.account_representative }</td> --%>
<%-- 								<td>${data.account_phone }</td> --%>
<%-- 								<td>${data.account_pax_number }</td> --%>
<%-- 								<td>${data.account_email }</td> --%>
<%-- 								<td>${data.account_email_tax }</td> --%>
<%-- 								<td>${data.account_post_number}</td> --%>
<%-- 								<td>${data.account_address}</td> --%>
<%-- 								<td>${data.account_address_detail}</td> --%>
<%-- 								<td>${data.account_category}</td> --%>
<%-- 								<td><fmt:formatDate value="${data.account_registration}" pattern="yy.MM.dd"/></td> --%>
<%-- 								<td>${data.account_memo}</td> --%>
<%-- 								<td>${data.account_registration_jpg}</td> --%>
<!-- 								</tr> -->
<!-- 							</tbody> -->
<%-- 							</c:forEach> --%>
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



        <!-- 등록창 모달 -->
        <div class="modal fade" id="outboundRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">출하 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="company_code" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처코드</span>
                                        <input id="account_code" type="text" class="form-control">
                                    </div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하주문일</span>
                                        <input id="outbound_date" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하담당자</span>
                                        <input id="outbound_manager" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하등록일</span>
                                        <input id="outbound_register_date" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하등록자</span>
                                        <input id="outbound_register_employee" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하수정일</span>
                                        <input id="outbound_update_date" type="text" class="form-control" id="companyEmail">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하수정자</span>
                                        <input id="outbound_update_employee" type="text" class="form-control" id="companyEmail">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="outbound_memo" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="insertOutboundInfo()" data-bs-dismiss="modal">등록</button>
                </div>
              </div>
            </div>
          </div>
          
          
        <!-- 수정창 모달 -->
        <div class="modal fade" id="outboundUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">출하 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                        	<input id="outbound_code_update" type="hidden" class="form-control">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="company_code_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처코드</span>
                                        <input id="account_code_update" type="text" class="form-control">
                                    </div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하주문일</span>
                                        <input id="outbound_date_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하담당자</span>
                                        <input id="outbound_manager_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하등록자</span>
                                        <input id="outbound_register_employee_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">출하수정자</span>
                                        <input id="outbound_update_employee_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="outbound_memo_update" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>              
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="updateOutboundInfo()" data-bs-dismiss="modal">수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>