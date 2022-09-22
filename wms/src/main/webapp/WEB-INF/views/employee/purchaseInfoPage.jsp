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

   .scrollTable {
	flex: 0 0 auto;
   }

    </style>
	
<script type="text/javascript">
	
	function insertPurchaseInfo(){
		
		var companyCodeVal = document.getElementById("company_code").value;
		var accountCodeVal = document.getElementById("account_code").value;
		var purchaseStateVal = document.getElementById("purchase_state").value;
		var purchaseManagerVal = document.getElementById("purchase_manager").value;
		var purchaseDateVal = document.getElementById("purchase_date").value;
		var purchaseDueDateVal = document.getElementById("purchase_due_date").value;
		var purchaseRegisterEmployeeVal = document.getElementById("purchase_register_employee").value;
		var purchaseUpdateEmployeeVal = document.getElementById("purchase_update_employee").value;
		var purchaseMemoVal = document.getElementById("purchase_memo").value;
		
		console.log(companyCodeVal);
		console.log(accountCodeVal);
		console.log(purchaseStateVal);
		console.log(purchaseManagerVal);
		console.log(purchaseDateVal);
		console.log(purchaseDueDateVal);
		console.log(purchaseRegisterEmployeeVal);
		console.log(purchaseUpdateEmployeeVal);
		console.log(purchaseMemoVal);

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				var companyCodeVal = document.getElementById("company_code").value;
				var accountCodeVal = document.getElementById("account_code").value;
				var purchaseStateVal = document.getElementById("purchase_state").value;
				var purchaseManagerVal = document.getElementById("purchase_manager").value;
				var purchaseDateVal = document.getElementById("purchase_date").value;
				var purchaseDueDateVal = document.getElementById("purchase_due_date").value;
				var purchaseRegisterEmployeeVal = document.getElementById("purchase_register_employee").value;
				var purchaseUpdateEmployeeVal = document.getElementById("purchase_update_employee").value;
				var purchaseMemoVal = document.getElementById("purchase_memo").value;
				refreshPurchaseInfo();
			}
		}
		
// 		xhr.open("post" , "./insertPurchaseInfo");
// 		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
// 		xhr.send("company_code=" + companyCodeVal + "&account_code=" + accountCodeVal + "&purchase_state=" + purchaseStateVal + 
// 				"&purchase_manager=" + purchaseManagerVal + "&purchase_date=" + purchaseDateVal + "&purchase_due_date=" + purchaseDueDateVal + 
// 				 "&purchase_register_employee=" + purchaseRegisterEmployeeVal + 
// 				"&purchase_update_employee=" + purchaseUpdateEmployeeVal + "&purchase_memo=" + purchaseMemoVal + "&product_code=" + productCodeVal +
// 				"&product_name=" + productNameVal + "&product_price=" + productPriceVal + "&product_amount=" + productAmountVal);		
		
		xhr.open("post" , "./insertPurchaseInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("company_code=" + companyCodeVal + "&account_code=" + accountCodeVal + "&purchase_state=" + purchaseStateVal + 
				"&purchase_manager=" + purchaseManagerVal + "&purchase_date=" + purchaseDateVal + "&purchase_due_date=" + purchaseDueDateVal + 
				 "&purchase_register_employee=" + purchaseRegisterEmployeeVal + "&purchase_update_employee=" + purchaseUpdateEmployeeVal + 
				 "&purchase_memo=" + purchaseMemoVal);	
		
	}
	
	function selectPurchase(){
		
	    var checkVal = "";
	    
	    var obj_length = document.getElementsByName("checkPurchase").length;
	    
	    var count = 0;
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkPurchase")[i].checked == true) {
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

            if (document.getElementsByName("checkPurchase")[i].checked == true) {
            	checkVal = document.getElementsByName("checkPurchase")[i].value;
            }
        }
        
        document.getElementById("purchase_code_update").value = "";
		document.getElementById("company_code_update").value = "";
		document.getElementById("account_code_update").value = "";
		document.getElementById("purchase_state_update").value = "";
		document.getElementById("purchase_manager_update").value = "";
		document.getElementById("purchase_date_update").value = "";
		document.getElementById("purchase_due_date_update").value = "";
		document.getElementById("purchase_register_employee_update").value = "";
		document.getElementById("purchase_update_employee_update").value = "";
		document.getElementById("purchase_memo_update").value = "";
	    
		var purchaseCode= document.getElementById("purchase_code_update");
		var companyCode = document.getElementById("company_code_update");
		var accountCode = document.getElementById("account_code_update");
		var purchaseState = document.getElementById("purchase_state_update");
		var purchaseManager = document.getElementById("purchase_manager_update");
		var purchaseDate = document.getElementById("purchase_date_update");
		var purchaseDueDate = document.getElementById("purchase_due_date_update");
		var purchaseRegisterEmployee = document.getElementById("purchase_register_employee_update");
		var purchaseUpdateEmployee = document.getElementById("purchase_update_employee_update");
		var purchaseMemo = document.getElementById("purchase_memo_update");
// 		var productCodeVal = document.getElementById("product_code").value;
// 		var productNameVal = document.getElementById("product_name").value;
// 		var productPriceVal = document.getElementById("product_price").value;
// 		var productAmountVal = document.getElementById("product_amount").value;
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				purchaseCode.value = jsonObj.purchase_code;
				companyCode.value = jsonObj.company_code;
				accountCode.value = jsonObj.account_code;
				purchaseState.value = jsonObj.purchase_state;
				purchaseManager.value = jsonObj.purchase_manager;
				purchaseDate.value = moment(jsonObj.purchase_date).format('YYYY.MM.DD');
				purchaseDueDate.value = moment(jsonObj.purchase_due_date).format('YYYY.MM.DD');
// 				purchaseRegisterDateVal = jsonObj.purchase_register_date;
				purchaseRegisterEmployee.value = jsonObj.purchase_register_employee;
// 				purchaseUpdateDateVal = jsonObj.purchase_update_date;
				purchaseUpdateEmployee.value = jsonObj.purchase_update_employee;
				purchaseMemo.value = jsonObj.purchase_memo;
// 				productCodeVal = jsonObj.product_code;
// 				productNameVal = jsonObj.product_name;
// 				productPriceVal = jsonObj.product_price;
// 				productAmountVal = jsonObj.product_amount;

				document.getElementById("updateModalStart").click();
				
			}
		}
		
		xhr.open("get", "./selectPurchaseInfo?purchase_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
	
	function cleanUpdateModal(){
		document.getElementById("company_code").value = "";
		document.getElementById("account_code").value = "";
		document.getElementById("purchase_state").value = "";
		document.getElementById("purchase_manager").value = "";
		document.getElementById("purchase_date").value = "";
		document.getElementById("purchase_due_date").value = "";
// 		document.getElementById("purchase_register_date").value = "";
		document.getElementById("purchase_register_employee").value = "";
// 		document.getElementById("purchase_update_date").value = "";
		document.getElementById("purchase_update_employee").value = "";
		document.getElementById("purchase_memo").value = "";
// 		document.getElementById("product_code").value = "";
// 		document.getElementById("product_name").value = "";
// 		document.getElementById("product_price").value = "";
// 		document.getElementById("product_amount").value = "";
	}
	
	function getModalVal(){
		var companyCodeVal = document.getElementById("company_code").value;
		var accountCodeVal = document.getElementById("account_code").value;
		var purchaseStateVal = document.getElementById("purchase_state").value;
		var purchaseManagerVal = document.getElementById("purchase_manager").value;
		var purchaseDateVal = document.getElementById("purchase_date").value;
		var purchaseDueDateVal = document.getElementById("purchase_due_date").value;
		var purchaseRegisterEmployeeVal = document.getElementById("purchase_register_employee").value;
		var purchaseUpdateEmployeeVal = document.getElementById("purchase_update_employee").value;
		var purchaseMemoVal = document.getElementById("purchase_memo").value;
// 		var productCodeVal = document.getElementById("product_code").value;
// 		var productNameVal = document.getElementById("product_name").value;
// 		var productPriceVal = document.getElementById("product_price").value;
// 		var productAmountVal = document.getElementById("product_amount").value;
	}
		
	
	function updatePurchaseInfo(){
		
		var purchaseCodeVal = document.getElementById("purchase_code_update").value;
		var companyCodeVal = document.getElementById("company_code_update").value;
		var accountCodeVal = document.getElementById("account_code_update").value;
		var purchaseStateVal = document.getElementById("purchase_state_update").value;
		var purchaseManagerVal = document.getElementById("purchase_manager_update").value;
		var purchaseDateVal = moment(document.getElementById("purchase_date_update").value).format('YYYY-MM-DD');
		var purchaseDueDateVal = moment(document.getElementById("purchase_due_date_update").value).format('YYYY-MM-DD');
		var purchaseRegisterEmployeeVal = document.getElementById("purchase_register_employee_update").value;
		var purchaseUpdateEmployeeVal = document.getElementById("purchase_update_employee_update").value;
		var purchaseMemoVal = document.getElementById("purchase_memo_update").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				document.getElementById("purchase_code_update").value = "";
				document.getElementById("company_code_update").value = "";
				document.getElementById("account_code_update").value = "";
				document.getElementById("purchase_state_update").value = "";
				document.getElementById("purchase_manager_update").value = "";
				document.getElementById("purchase_date_update").value = "";
				document.getElementById("purchase_due_date_update").value = "";
				document.getElementById("purchase_register_employee_update").value = "";
				document.getElementById("purchase_update_employee_update").value = "";
				document.getElementById("purchase_memo_update").value = "";
				
			}
		}
		
		xhr.open("post" , "./updatePurchaseInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("purchase_code=" + purchaseCodeVal + "&company_code=" + companyCodeVal + "&account_code=" + accountCodeVal + "&purchase_state=" + purchaseStateVal + 
				"&purchase_manager=" + purchaseManagerVal + "&purchase_date=" + purchaseDateVal + "&purchase_due_date=" + purchaseDueDateVal + 
				"&purchase_register_employee=" + purchaseRegisterEmployeeVal + "&purchase_update_employee=" + purchaseUpdateEmployeeVal + "&purchase_memo=" + purchaseMemoVal);
		refreshPurchaseInfo();
		
	}
	
	function deletePurchaseInfo(){
		
	    var checkVal = new Array();
	    
        console.log(checkVal);
	    
	    var obj_length = document.getElementsByName("checkPurchase").length;
	    console.log(obj_length);
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkPurchase")[i].checked == true) {
            	
            	checkVal[i] = document.getElementsByName("checkPurchase")[i].value;
            }
        }
        
        console.log(checkVal);
 	
	
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				
			}
		}
		
		xhr.open("post" , "./deletePurchaseInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		
		refreshPurchaseInfo();
		
	}
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=check_all]").checked;

		var list = document.getElementsByName("checkPurchase");
		
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
		var list = document.getElementsByName("checkPurchase");
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
	
 	function refreshPurchaseInfo(){
 		
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
		th2.innerText = "발주번호";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "회사번호";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "거래처번호";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "발주상태";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "발주담당자";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "발주일";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "발주납기일";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "발주등록일";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "발주등록자";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "발주수정일";
		tr1.appendChild(th11);

		var th12 = document.createElement("th");
		th12.innerText = "발주수정자";
		tr1.appendChild(th12);

		var th13 = document.createElement("th");
		th13.innerText = "비고";
		tr1.appendChild(th13);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.purchaseList){
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
				inputIn1.setAttribute("name","checkPurchase");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.purchase_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.purchase_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.account_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.purchase_state;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.purchase_manager;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = moment(commentData.purchase_date).format('YYYY.MM.DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = moment(commentData.purchase_due_date).format('YYYY.MM.DD');
				trIn1.appendChild(td8);
				
				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.purchase_register_date).format('YYYY.MM.DD');
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.purchase_register_employee;
				trIn1.appendChild(td10);
				
				var td11 = document.createElement("td");
				td11.innerText = moment(commentData.purchase_update_date).format('YYYY.MM.DD');
				trIn1.appendChild(td11);

				var td10 = document.createElement("td");
				td10.innerText = commentData.purchase_update_employee;
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.purchase_memo;
				trIn1.appendChild(td11);

// 				var td15 = document.createElement("td");
// 				td15.innerText = moment(commentData.account_registration).format(' YYYY.MM.DD ');
// 				trIn1.appendChild(td15);
				
				
				}
				
				var createUl = document.getElementById("pageUl");
				createUl.innerHTML = "";
				createUl.setAttribute("id","pageUl");
				createUl.classList.add("pagination");
				createUl.classList.add("justify-content-center");

				
				console.log(jsonObj.startPage);
				
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
					inA1.setAttribute("href","javascript:refreshPurchaseInfoPage("+i-1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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

						console.log(jsonObj.endPage);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshPurchaseInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshPurchaseInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshPurchaseInfoPage("+i+1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/purchaseInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshPurchaseInfoPage(pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
 		console.log(pageNumVal);
//  		var clickSearchType = document.getElementById("searchType");
//  		var clickSearchTypeVal = clickSearchType.value;
 		console.log(clickSearchTypeVal);
 		
//  		var clickSearchWord = document.getElementById("searchWord");
//  		var clickSearchWordVal = clickSearchWord.value;
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
		th2.innerText = "발주번호";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "회사번호";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "거래처번호";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "발주상태";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "발주담당자";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "발주일";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "발주납기일";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "발주등록일";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "발주등록자";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "발주수정일";
		tr1.appendChild(th11);

		var th12 = document.createElement("th");
		th12.innerText = "발주수정자";
		tr1.appendChild(th12);

		var th13 = document.createElement("th");
		th13.innerText = "비고";
		tr1.appendChild(th13);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.purchaseList){
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
				inputIn1.setAttribute("name","checkPurchase");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.purchase_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.purchase_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.account_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.purchase_state;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.purchase_manager;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = moment(commentData.purchase_date).format('YYYY.MM.DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = moment(commentData.purchase_due_date).format('YYYY.MM.DD');
				trIn1.appendChild(td8);
				
				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.purchase_register_date).format('YYYY.MM.DD');
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.purchase_register_employee;
				trIn1.appendChild(td10);
				
				var td11 = document.createElement("td");
				td11.innerText = moment(commentData.purchase_update_date).format('YYYY.MM.DD');
				trIn1.appendChild(td11);

				var td10 = document.createElement("td");
				td10.innerText = commentData.purchase_update_employee;
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.purchase_memo;
				trIn1.appendChild(td11);

// 				var td15 = document.createElement("td");
// 				td15.innerText = moment(commentData.account_registration).format(' YYYY.MM.DD ');
// 				trIn1.appendChild(td15);
				
				
				}
				
				var createUl = document.getElementById("pageUl");
				createUl.innerHTML = "";
				createUl.setAttribute("id","pageUl");
				createUl.classList.add("pagination");
				createUl.classList.add("justify-content-center");

				
				console.log(jsonObj.startPage);
				
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
					inA1.setAttribute("href","javascript:refreshPurchaseInfoPage("+i-1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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

						console.log(jsonObj.endPage);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshPurchaseInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshPurchaseInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshPurchaseInfoPage("+i+1+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/purchaseInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}

	window.addEventListener("DOMContentLoaded" , function (){
	//사실상 처음 실행하는 코드 모음...
	refreshPurchaseInfo();
	//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
	
	});
	

	
	
</script>
	
<title>발주정보</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">   
		<div class="row">
	        <div class="col form-control mt-3">
	        	<div class="row">
		        	<div class="col-6 mx-0">
			             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#purchaseRegist">
			                등록
			             </button>
			             <button onclick="selectPurchase()" id="updateModal" type="button" class="btn btn-light">
			             	수정
			             </button>
   			             <button id="updateModalStart" type="button" hidden class="btn btn-light" data-bs-toggle="modal" data-bs-target="#purchaseUpdate">
			             	수정
			             </button>
		            	 <button onclick="deletePurchaseInfo()" type="button" class="btn btn-light">
		            		삭제
		            	 </button>
		            </div>
		            <div class="col-6 text-end mx-0 pt-1">
		            	<span class="fs-5">발주 관리</span>
		            </div>
	            </div>
	        </div>   
        </div>
        <div class="row">
            <div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">발주 목록</span>
                    </div>
                    <div class="col-4">
<!--                     <form action="./purchaseInfo" method="get"> -->
						<div class="input-group mb-3">
								<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="purchase_code">발주 번호</option>
									<option value="purchase_manager">발주 담당자</option>
									<option value="purchase_register_employee">발주 등록자</option>
								  </select>
								<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
								<button class="input-group-text bi bi-search" onclick="refreshPurchaseInfo()" id="basic-addon1"></button>
						</div>
<!-- 						</form> -->
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 py-2 px-1">
						<div class="scrollTable">
							<table id="createTable" class="table table-bordered text-center">
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 								<th><input id="check_all" onclick="allCheck()" type="checkbox"></th> -->
<!-- 								<th>발주번호</th> -->
<!-- 								<th>회사번호</th> -->
<!-- 								<th>거래처번호</th> -->
<!-- 								<th>발주상태</th> -->
<!-- 								<th>발주담당자</th> -->
<!-- 								<th>발주일</th> -->
<!-- 								<th>발주납기입</th> -->
<!-- 								<th>발주등록일</th> -->
<!-- 								<th>발주등록자</th> -->
<!-- 								<th>발주수정일</th> -->
<!-- 								<th>발주수정자</th> -->
<!-- 								<th>비고</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<%-- 							<c:forEach items="${purchaseList}" var="data"> --%>
<!-- 							<tbody> -->
<!-- 								<tr> -->
<%-- 								<td><input onclick="checkOk()" name="checkPurchase" type="checkbox" value="${data.purchase_code }"></td> --%>
<%-- 								<th>${data.purchase_code }</th> --%>
<%-- 								<td>${data.company_code }</td> --%>
<%-- 								<td>${data.account_code }</td> --%>
<%-- 								<td>${data.purchase_state }</td> --%>
<%-- 								<td>${data.purchase_manager }</td> --%>
<%-- 								<td>${data.purchase_date }</td> --%>
<%-- 								<td>${data.purchase_due_date }</td> --%>
<%-- 								<td>${data.purchase_register_date }</td> --%>
<%-- 								<td>${data.purchase_register_employee }</td> --%>
<%-- 								<td>${data.purchase_update_date}</td> --%>
<%-- 								<td>${data.purchase_update_employee}</td> --%>
<%-- 								<td>${data.purchase_memo}</td> --%>
<!-- 								</tr> -->
<!-- 							</tbody> -->
<%-- 							</c:forEach> --%>
							</table>
						</div>
					</div>
					<div class="page mt-3" >
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
<%-- 										<a class="page-link" href="./purchaseInfo?pageNum=${startPage - 1 }${additionalParam}" aria-label="Previous"> --%>
<!-- 										<span aria-hidden="true">&laquo;</span> -->
<!-- 										</a> -->
<!-- 									</li> -->
<%-- 						  		</c:otherwise> --%>
<%-- 					  		</c:choose> --%>
<%-- 	  					    <c:forEach begin="${startPage }" end="${endPage }" var="i"> --%>
<%-- 		  					    <c:choose> --%>
<%-- 			  					    <c:when test="${i == currentPageNum }"> --%>
<%-- 			  					    	<li class="page-item active"><a class="page-link" href="./purchaseInfo?pageNum=${i }${additionalParam}">${i }</a></li> --%>
<%-- 			  					    </c:when> --%>
<%-- 			  					    <c:otherwise> --%>
<%-- 			  					    	<li class="page-item"><a class="page-link" href="./purchaseInfo?pageNum=${i }${additionalParam}">${i }</a></li> --%>
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
<%-- 									<a class="page-link" href="./purchaseInfo?pageNum=${endPage+1}${additionalParam}" aria-label="Next"> --%>
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
        <div class="modal fade" id="purchaseRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">발주 등록</h5>
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
                                        <span class="input-group-text">주문상태</span>
                                        <input id="purchase_state" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 담당자</span>
                                        <input id="purchase_manager" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 접수일</span>
                                        <input id="purchase_date" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 마감일</span>
                                        <input id="purchase_due_date" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 등록자</span>
                                        <input id="purchase_register_employee" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 수정자</span>
                                        <input id="purchase_update_employee" type="text" class="form-control">
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
                                    <textarea id="purchase_memo" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>
<!--                             <div class="row mt-3"> -->
<!--                                 <div class="col"> -->
<!--                                     <div class="input-group"> -->
<!--                                         <span class="input-group-text">상품 코드</span> -->
<!--                                         <input id="product_code" type="text" class="form-control"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="row my-3"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-text" for="inputGroupFile01">상품 명</label> -->
<!--                                     <input id="product_name" type="file" class="form-control"> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="row my-3"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-text" for="inputGroupFile01">상품 가격</label> -->
<!--                                     <input id="product_price" type="file" class="form-control"> -->
<!--                                 </div> -->
<!--                             </div>     -->
<!--                             <div class="row my-3"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-text" for="inputGroupFile01">상품 수량</label> -->
<!--                                     <input id="product_amount" type="file" class="form-control"> -->
<!--                                 </div> -->
<!--                             </div>                   -->
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="insertPurchaseInfo()" data-bs-dismiss="modal">등록</button>
                </div>
              </div>
            </div>
          </div>
          
          
        <!-- 수정창 모달 -->
        <div class="modal fade" id="purchaseUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">발주 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                 <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                        	<input id="purchase_code_update" type="hidden" class="form-control">
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
                                        <span class="input-group-text">주문상태</span>
                                        <input id="purchase_state_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 담당자</span>
                                        <input id="purchase_manager_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 접수일</span>
                                        <input id="purchase_date_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 마감일</span>
                                        <input id="purchase_due_date_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
<!--                             <div class="row mt-3"> -->
<!--                                 <div class="col"> -->
<!--                                     <div class="input-group"> -->
<!--                                         <span class="input-group-text">발주 등록일</span> -->
<!--                                         <input id="purchase_register_date" type="text" class="form-control" id="companyEmail"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 등록자</span>
                                        <input id="purchase_register_employee_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
<!--                                 <div class="col"> -->
<!--                                     <div class="input-group"> -->
<!--                                         <span class="input-group-text">발주 수정일</span> -->
<!--                                         <input id="purchase_update_date" type="text" class="form-control" id="companyPostNumber"> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 수정자</span>
                                        <input id="purchase_update_employee_update" type="text" class="form-control">
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
                                    <textarea id="purchase_memo_update" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>
<!--                             <div class="row mt-3"> -->
<!--                                 <div class="col"> -->
<!--                                     <div class="input-group"> -->
<!--                                         <span class="input-group-text">상품 코드</span> -->
<!--                                         <input id="product_code" type="text" class="form-control"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="row my-3"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-text" for="inputGroupFile01">상품 명</label> -->
<!--                                     <input id="product_name" type="file" class="form-control"> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="row my-3"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-text" for="inputGroupFile01">상품 가격</label> -->
<!--                                     <input id="product_price" type="file" class="form-control"> -->
<!--                                 </div> -->
<!--                             </div>     -->
<!--                             <div class="row my-3"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-text" for="inputGroupFile01">상품 수량</label> -->
<!--                                     <input id="product_amount" type="file" class="form-control"> -->
<!--                                 </div> -->
<!--                             </div>                   -->
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="updatePurchaseInfo()" data-bs-dismiss="modal">수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>