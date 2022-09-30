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

	function check(){
		
		document.getElementById("company_code_Alert").innerHTML = "";
		document.getElementById("account_code_Alert").innerHTML = "";
		document.getElementById("purchase_state_Alert").innerHTML = "";
		document.getElementById("purchase_manager_Alert").innerHTML = "";
		document.getElementById("purchase_date_Alert").innerHTML = "";
		document.getElementById("purchase_due_date_Alert").innerHTML = "";
		document.getElementById("purchase_register_employee_Alert").innerHTML = "";
		
		
		if(document.getElementById("company_code").value == ""){
			document.getElementById("company_code_Alert").innerText = "로그인을 먼저 해주세요.";
			document.getElementById("company_code_Alert").classList.add("text-danger");
			document.getElementById("company_code").focus();
			return;
		}else{	
			document.getElementById("company_code_Alert").innerHTML = "";
		}
		
		if(document.getElementById("account_code").value == ""){
			document.getElementById("account_code_Alert").innerText = "거래처명을 입력해주셔야 합니다.";
			document.getElementById("account_code_Alert").classList.add("text-danger");
			document.getElementById("account_code").focus();
			return;
		}else{	
			document.getElementById("account_code_Alert").innerHTML = "";
		}
		
		if(document.getElementById("purchase_state").value == ""){
			document.getElementById("purchase_state_Alert").innerText = "발주상태를 입력해주셔야 합니다.";
			document.getElementById("purchase_state_Alert").classList.add("text-danger");
			document.getElementById("purchase_state").focus();
			return;
		}else{	
			document.getElementById("purchase_state_Alert").innerHTML = "";
		}
		
		if(document.getElementById("purchase_manager").value == ""){
			document.getElementById("purchase_manager_Alert").innerText = "발주담당자를 입력해주셔야 합니다.";
			document.getElementById("purchase_manager_Alert").classList.add("text-danger");
			document.getElementById("purchase_manager").focus();
			return;
		}else{
			document.getElementById("purchase_manager_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("purchase_date").value == ""){
			document.getElementById("purchase_date_Alert").innerText = "발주일을 입력해주셔야 합니다.";
			document.getElementById("purchase_date_Alert").classList.add("text-danger");
			document.getElementById("purchase_date").focus();
			return;
		}else{
			document.getElementById("purchase_date_Alert").innerHTML = "";
		}
		
		if(document.getElementById("purchase_due_date").value == ""){
			document.getElementById("purchase_due_date_Alert").innerText = "발주마감일을 입력해주셔야 합니다.";
			document.getElementById("purchase_due_date_Alert").classList.add("text-danger");
			document.getElementById("purchase_due_date").focus();
			return;
		}else{
			document.getElementById("purchase_due_date_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("purchase_register_employee").value == ""){
			document.getElementById("purchase_register_employee_Alert").innerText = "발주등록자를 입력해주셔야 합니다.";
			document.getElementById("purchase_register_employee_Alert").classList.add("text-danger");
			document.getElementById("purchase_register_employee").focus();
			return;
		}else{
			document.getElementById("purchase_register_employee_Alert").innerHTML = "";
		}
		
		document.getElementById("insertBtn").click();
		
	}
	
	function checkRemove(){
		
		if(document.getElementById("company_code").value != ""){
			document.getElementById("company_code_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_code").value != ""){
			document.getElementById("account_code_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_state").value != ""){
			document.getElementById("purchase_state_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_manager").value != ""){
			document.getElementById("purchase_manager_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_date").value != ""){
			document.getElementById("purchase_date_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_due_date").value != ""){
			document.getElementById("purchase_due_date_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_register_employee").value != ""){
			document.getElementById("purchase_register_employee_Alert").innerHTML = "";
		}else{
			return;
		}
		
	}
	
	function checkUpdate(){
		
		document.getElementById("company_code_update_Alert").innerHTML = "";
		document.getElementById("purchase_code_update_Alert").innerHTML = "";
		document.getElementById("account_code_update_Alert").innerHTML = "";
		document.getElementById("purchase_state_update_Alert").innerHTML = "";
		document.getElementById("purchase_manager_update_Alert").innerHTML = "";
		document.getElementById("purchase_date_update_Alert").innerHTML = "";
		document.getElementById("purchase_due_date_update_Alert").innerHTML = "";
		document.getElementById("purchase_update_employee_update_Alert").innerHTML = "";
		
		if(document.getElementById("company_code_update").value == ""){
			document.getElementById("company_code_update_Alert").innerText = "로그인을 먼저 해주세요.";
			document.getElementById("company_code_update_Alert").classList.add("text-danger");
			document.getElementById("company_code_update").focus();
			return;
		}else{	
			document.getElementById("company_code_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("account_code_update").value == ""){
			document.getElementById("account_code_update_Alert").innerText = "거래처코드를 입력해주셔야 합니다.";
			document.getElementById("account_code_update_Alert").classList.add("text-danger");
			document.getElementById("account_code_update").focus();
			return;
		}else{	
			document.getElementById("account_code_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("purchase_state_update").value == ""){
			document.getElementById("purchase_state_update_Alert").innerText = "발주상태를 입력해주셔야 합니다.";
			document.getElementById("purchase_state_update_Alert").classList.add("text-danger");
			document.getElementById("purchase_state_update").focus();
			return;
		}else{	
			document.getElementById("purchase_state_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("purchase_manager_update").value == ""){
			document.getElementById("purchase_manager_update_Alert").innerText = "발주 담당자를 입력해주셔야 합니다.";
			document.getElementById("purchase_manager_update_Alert").classList.add("text-danger");
			document.getElementById("purchase_manager_update").focus();
			return;
		}else{
			document.getElementById("purchase_manager_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("purchase_date_update").value == ""){
			document.getElementById("purchase_date_update_Alert").innerText = "발주일을 입력해주셔야 합니다.";
			document.getElementById("purchase_date_update_Alert").classList.add("text-danger");
			document.getElementById("purchase_date_update").focus();
			return;
		}else{
			document.getElementById("purchase_date_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("purchase_due_date_update").value == ""){
			document.getElementById("purchase_due_date_update_Alert").innerText = "발주마감일을 입력해주셔야 합니다.";
			document.getElementById("purchase_due_date_update_Alert").classList.add("text-danger");
			document.getElementById("purchase_due_date_update").focus();
			return;
		}else{
			document.getElementById("purchase_due_date_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("purchase_update_employee_update").value == ""){
			document.getElementById("purchase_update_employee_update_Alert").innerText = "발주수정자를 입력해주셔야 합니다.";
			document.getElementById("purchase_update_employee_update_Alert").classList.add("text-danger");
			document.getElementById("purchase_update_employee_update").focus();
			return;
		}else{
			document.getElementById("purchase_update_employee_update_Alert").innerHTML = "";
		}
		
		document.getElementById("updateBtn").click();
		
	
	}
	
	function checkUpdateRemove(){
		
		if(document.getElementById("company_code_update").value != ""){
			document.getElementById("company_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_code_update").value != ""){
			document.getElementById("purchase_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_code_update").value != ""){
			document.getElementById("account_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_manager_update").value != ""){
			document.getElementById("purchase_manager_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_date_update").value != ""){
			document.getElementById("purchase_date_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_due_date_update").value != ""){
			document.getElementById("purchase_due_date_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_update_employee_update").value != ""){
			document.getElementById("purchase_update_employee_update_Alert").innerHTML = "";
		}else{
			return;
		}
	
	
	}	
	
	function checkDetail(){
		
		document.getElementById("purchase_code_in_detail_Alert").innerHTML = "";
		document.getElementById("product_code_Alert").innerHTML = "";
		document.getElementById("product_name_Alert").innerHTML = "";
		document.getElementById("product_price_Alert").innerHTML = "";
		document.getElementById("product_amount_Alert").innerHTML = "";
		
		if(document.getElementById("purchase_code_in_detail").value == ""){
			document.getElementById("purchase_code_in_detail_Alert").innerText = "발주코드를 입력해주셔야 합니다.";
			document.getElementById("purchase_code_in_detail_Alert").classList.add("text-danger");
			document.getElementById("purchase_code_in_detail").focus();
			return;
		}else{
			document.getElementById("purchase_code_in_detail_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_code").value == ""){
			document.getElementById("product_code_Alert").innerText = "제품코드를 입력해주셔야 합니다.";
			document.getElementById("product_code_Alert").classList.add("text-danger");
			document.getElementById("product_code").focus();
			return;
		}else{
			document.getElementById("product_code_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_name").value == ""){
			document.getElementById("product_name_Alert").innerText = "제품명를 입력해주셔야 합니다.";
			document.getElementById("product_name_Alert").classList.add("text-danger");
			document.getElementById("product_name").focus();
			return;
		}else{
			document.getElementById("product_name_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_price").value == ""){
			document.getElementById("product_price_Alert").innerText = "제품가격을 입력해주셔야 합니다.";
			document.getElementById("product_price_Alert").classList.add("text-danger");
			document.getElementById("product_price").focus();
			return;
		}else{
			document.getElementById("product_price_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_amount").value == ""){
			document.getElementById("product_amount_Alert").innerText = "제품수량을 입력해주셔야 합니다.";
			document.getElementById("product_amount_Alert").classList.add("text-danger");
			document.getElementById("product_amount").focus();
			return;
		}else{
			document.getElementById("product_amount_Alert").innerHTML = "";
		}
		
		document.getElementById("insertDetailBtn").click();
		
	}
	
	function checkDetailRemove(){
		
		if(document.getElementById("purchase_code_in_detail").value != ""){
			document.getElementById("purchase_code_in_detail_Alert").innerHTML = "";
		}else{
			return;
		}
		
		
		if(document.getElementById("product_code").value != ""){
			document.getElementById("product_code_Alert").innerHTML = "";
		}else{
			return;
		}
		
		
		if(document.getElementById("product_name").value != ""){
			document.getElementById("product_name_Alert").innerHTML = "";
		}else{
			return;
		}
		
		
		if(document.getElementById("product_price").value != ""){
			document.getElementById("product_price_Alert").innerHTML = "";
		}else{
			return;
		}
		
		
		if(document.getElementById("product_amount").value != ""){
			document.getElementById("product_amount_Alert").innerHTML = "";
		}else{
			return;
		}
		
	}
	
	function checkDetailUpdate(){
		
		document.getElementById("purchase_code_in_detail_update_Alert").innerHTML = "";
		document.getElementById("purchase_detail_code_update_Alert").innerHTML = "";
		document.getElementById("product_code_update_Alert").innerHTML = "";
		document.getElementById("product_name_update_Alert").innerHTML = "";
		document.getElementById("product_price_update_Alert").innerHTML = "";
		document.getElementById("product_amount_update_Alert").innerHTML = "";
		
		
		if(document.getElementById("purchase_detail_code_update").value == ""){
			document.getElementById("purchase_detail_code_update_Alert").innerText = "발주상세코드를 입력해주셔야 합니다.";
			document.getElementById("purchase_detail_code_update_Alert").classList.add("text-danger");
			document.getElementById("purchase_detail_code_update").focus();
			return;
		}else{
			document.getElementById("purchase_detail_code_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("purchase_code_in_detail_update").value == ""){
			document.getElementById("purchase_code_in_detail_update_Alert").innerText = "발주코드를 입력해주셔야 합니다.";
			document.getElementById("purchase_code_in_detail_update_Alert").classList.add("text-danger");
			document.getElementById("purchase_code_in_detail_update").focus();
			return;
		}else{
			document.getElementById("purchase_code_in_detail_update_Alert").innerHTML = "";
		}
	
		
		if(document.getElementById("product_code_update").value == ""){
			document.getElementById("product_code_update_Alert").innerText = "제품코드를 입력해주셔야 합니다.";
			document.getElementById("product_code_update_Alert").classList.add("text-danger");
			document.getElementById("product_code_update").focus();
			return;
		}else{
			document.getElementById("product_code_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_name_update").value == ""){
			document.getElementById("product_name_update_Alert").innerText = "제품명을 입력해주셔야 합니다.";
			document.getElementById("product_name_update_Alert").classList.add("text-danger");
			document.getElementById("product_name_update").focus();
			return;
		}else{
			document.getElementById("product_name_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_price_update").value == ""){
			document.getElementById("product_price_update_Alert").innerText = "제품가격을 입력해주셔야 합니다.";
			document.getElementById("product_price_update_Alert").classList.add("text-danger");
			document.getElementById("product_price_update").focus();
			return;
		}else{
			document.getElementById("product_price_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_amount_update").value == ""){
			document.getElementById("product_amount_update_Alert").innerText = "제품수량을 입력해주셔야 합니다.";
			document.getElementById("product_amount_update_Alert").classList.add("text-danger");
			document.getElementById("product_amount_update").focus();
			return;
		}else{
			document.getElementById("product_amount_update_Alert").innerHTML = "";
		}
		
		document.getElementById("updateDetailBtn").click();
		
	}

	function checkDetailUpdateRemove(){
		
		if(document.getElementById("purchase_detail_code_update").value != ""){
			document.getElementById("purchase_detail_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("purchase_code_in_detail_update").value != ""){
			document.getElementById("purchase_code_in_detail_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_code_update").value != ""){
			document.getElementById("product_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_name_update").value != ""){
			document.getElementById("product_name_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_price_update").value != ""){
			document.getElementById("product_price_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_amount_update").value != ""){
			document.getElementById("product_amount_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
	}
	
	function insertPurchaseInfo(){
		
		var companyCodeVal = document.getElementById("company_code").value;
		var accountCodeVal = document.getElementById("account_code").value;
		var purchaseStateVal = document.getElementById("purchase_state").value;
		var purchaseManagerVal = document.getElementById("purchase_manager").value;
		var purchaseDateVal = moment(document.getElementById("purchase_date").value).format("YYYY-MM-DD");
		var purchaseDueDateVal = moment(document.getElementById("purchase_due_date").value).format("YYYY-MM-DD");
		var purchaseRegisterEmployeeVal = document.getElementById("purchase_register_employee").value;
		var purchaseMemoVal = document.getElementById("purchase_memo").value;
		


		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				document.getElementById("account_code").value = "";
				document.getElementById("purchase_state").value = "";
				document.getElementById("purchase_manager").value = "";
				document.getElementById("purchase_date").value = "";
				document.getElementById("purchase_due_date").value = "";
				document.getElementById("purchase_register_employee").value = "";
				document.getElementById("purchase_memo").value = "";
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
		
		xhr.open("post" , "./insertPurchaseInfo",);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("company_code=" + companyCodeVal + "&account_code=" + accountCodeVal + "&purchase_state=" + purchaseStateVal + 
				"&purchase_manager=" + purchaseManagerVal + "&purchase_date=" + purchaseDateVal + "&purchase_due_date=" + purchaseDueDateVal + 
				 "&purchase_register_employee=" + purchaseRegisterEmployeeVal + "&purchase_update_employee=" + purchaseRegisterEmployeeVal + 
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
		document.getElementById("purchase_update_employee_update").value = "";
		document.getElementById("purchase_memo_update").value = "";
	    
		var purchaseCode= document.getElementById("purchase_code_update");
		var companyCode = document.getElementById("company_code_update");
		var accountCode = document.getElementById("account_code_update");
		var purchaseState = document.getElementById("purchase_state_update");
		var purchaseManager = document.getElementById("purchase_manager_update");
		var purchaseDate = document.getElementById("purchase_date_update");
		var purchaseDueDate = document.getElementById("purchase_due_date_update");
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
				purchaseDate.value = moment(jsonObj.purchase_date).format('YYYY-MM-DD');
				purchaseDueDate.value = moment(jsonObj.purchase_due_date).format('YYYY-MM-DD');
				purchaseUpdateEmployee.value = jsonObj.purchase_update_employee;
				purchaseMemo.value = jsonObj.purchase_memo;

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
		document.getElementById("purchase_update_employee").value = "";
		document.getElementById("purchase_memo").value = "";
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
				document.getElementById("purchase_update_employee_update").value = "";
				document.getElementById("purchase_memo_update").value = "";
				
			}
		}
		
		xhr.open("post" , "./updatePurchaseInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("purchase_code=" + purchaseCodeVal + "&company_code=" + companyCodeVal + "&account_code=" + accountCodeVal + "&purchase_state=" + purchaseStateVal + 
				"&purchase_manager=" + purchaseManagerVal + "&purchase_date=" + purchaseDateVal + "&purchase_due_date=" + purchaseDueDateVal + 
				"&purchase_register_employee=" + purchaseUpdateEmployeeVal + "&purchase_update_employee=" + purchaseUpdateEmployeeVal + "&purchase_memo=" + purchaseMemoVal);
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
 		
 		var clickSearchWord = document.getElementById("searchWord");
 		var clickSearchWordVal = clickSearchWord.value;
 		
 		
 		var choseButtonBox = document.getElementById("choseButton");
 		choseButtonBox.innerHTML = "";
 		choseButtonBox.classList.add("col-6");
 		choseButtonBox.classList.add("mx-0");
 		
 		var registDetailBtn1 = document.createElement("button");
 		registDetailBtn1.classList.add("btn");
 		registDetailBtn1.classList.add("btn-light");
 		registDetailBtn1.setAttribute("type","button");
 		registDetailBtn1.setAttribute("data-bs-toggle","modal");
 		registDetailBtn1.setAttribute("data-bs-target","#purchaseRegist");
 		registDetailBtn1.innerText = "등록";
 		choseButtonBox.appendChild(registDetailBtn1);
 		
 		var selectDetailBtn1 = document.createElement("button");
 		selectDetailBtn1.classList.add("btn");
 		selectDetailBtn1.classList.add("btn-light");
 		selectDetailBtn1.setAttribute("type","button");
 		selectDetailBtn1.setAttribute("id","updateDetailModal");
 		selectDetailBtn1.setAttribute("onclick","selectPurchase()");
 		selectDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(selectDetailBtn1);
 		
 		var updateDetailBtn1 = document.createElement("button");
 		updateDetailBtn1.classList.add("btn");
 		updateDetailBtn1.classList.add("btn-light");
 		updateDetailBtn1.setAttribute("type","button");
 		updateDetailBtn1.setAttribute("data-bs-toggle","modal");
 		updateDetailBtn1.setAttribute("data-bs-target","#purchaseUpdate");
 		updateDetailBtn1.setAttribute("id","updateModalStart");
 		updateDetailBtn1.hidden = true;
 		updateDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(updateDetailBtn1);
 		
 		var deliteDetailBtn1 = document.createElement("button");
 		deliteDetailBtn1.classList.add("btn");
 		deliteDetailBtn1.classList.add("btn-light");
 		deliteDetailBtn1.setAttribute("type","button");
 		deliteDetailBtn1.setAttribute("onclick","deletePurchaseInfo()");
 		deliteDetailBtn1.innerText = "삭제";
 		choseButtonBox.appendChild(deliteDetailBtn1);
 			
 			
 		var listDetailNew = document.getElementById("listNew");
 		listDetailNew.innerHTML = "";
 		listDetailNew.classList.add("col");

 		var inI1 = document.createElement("i");
 		inI1.classList.add("bi");
 		inI1.classList.add("bi-list");
 		inI1.classList.add("fs-5");
 		listDetailNew.appendChild(inI1);

 		var inSpan1 = document.createElement("span");
 		inSpan1.classList.add("fs-5");
 		inSpan1.innerText = " 발주 목록 ";
 		listDetailNew.appendChild(inSpan1);

 		var selectBox = document.getElementById("selectNew");
 		selectBox.innerHTML = "";
 		selectBox.classList.add("input-group");
 		selectBox.classList.add("mb-3");

 		var detailSelect1 = document.createElement("select");
 		detailSelect1.classList.add("form-select");
 		detailSelect1.setAttribute("style","width: 10px;");
 		detailSelect1.setAttribute("aria-label","Default select example");
 		detailSelect1.setAttribute("id","searchType");
 		selectBox.appendChild(detailSelect1);
 		
 		var detailOption1 = document.createElement("option");
 		detailOption1.value = "";
 		detailOption1.innerText = "선택";
 		detailSelect1.appendChild(detailOption1);

 		var detailOption2 = document.createElement("option");
 		detailOption2.value = "purchase_code";
 		detailOption2.innerText = "발주코드";
 		detailSelect1.appendChild(detailOption2);

 		var detailOption3 = document.createElement("option");
 		detailOption3.value = "purchase_manager";
 		detailOption3.innerText = "발주담당자";
 		detailSelect1.appendChild(detailOption3);
 		
 		var detailOption4 = document.createElement("option");
 		detailOption4.value = "purchase_register_employee";
 		detailOption4.innerText = "발주등록자";
 		detailSelect1.appendChild(detailOption4);

 		var searchWordBox1 = document.createElement("input");
 		searchWordBox1.classList.add("form-control");
 		searchWordBox1.setAttribute("id","searchWord");
 		searchWordBox1.setAttribute("type","text");
 		searchWordBox1.setAttribute("aria-label","Text input with dropdown button");
 		selectBox.appendChild(searchWordBox1);

 		var detailButton1 = document.createElement("button");
 		detailButton1.setAttribute("type","button");
 		detailButton1.setAttribute("onclick","refreshPurchaseInfo()");
 		detailButton1.classList.add("input-group-text");
 		detailButton1.classList.add("bi");
 		detailButton1.classList.add("bi-search");
 		detailButton1.setAttribute("id","basic-addon1");
 		selectBox.appendChild(detailButton1);
 		
// 		var tableDiv = document.getElementById("scrollTable");
//  		tableDiv.innerHtml = "";

		var table1 = document.getElementById("createTable");
		table1.innerHTML = "";
		table1.classList.add("table");
		table1.classList.add("table-bordered");
		table1.classList.add("text-center");
		table1.setAttribute("style","width:1178px;");

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
				trIn1.appendChild(td2);
				
				var inA1 = document.createElement("div");
				inA1.innerText = commentData.purchase_code;
				inA1.setAttribute("onclick","refreshPurchaseDetailInfo(this.innerText)");
				inA1.setAttribute("style","color : blue;")
				td2.appendChild(inA1);
				
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
				td7.innerText = moment(commentData.purchase_date).format('YYYY-MM-DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = moment(commentData.purchase_due_date).format('YYYY-MM-DD');
				trIn1.appendChild(td8);
				
				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.purchase_register_date).format('YYYY-MM-DD');
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.purchase_register_employee;
				trIn1.appendChild(td10);
				
				var td11 = document.createElement("td");
				td11.innerText = moment(commentData.purchase_update_date).format('YYYY-MM-DD');
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
					inA1.setAttribute("href","javascript:refreshPurchaseInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshPurchaseInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
 		
//  		var clickSearchType = document.getElementById("searchType");
//  		var clickSearchTypeVal = clickSearchType.value;
 		
//  		var clickSearchWord = document.getElementById("searchWord");
//  		var clickSearchWordVal = clickSearchWord.value;
 		
 		
 		var choseButtonBox = document.getElementById("choseButton");
 		choseButtonBox.innerHTML = "";
 		choseButtonBox.classList.add("col-6");
 		choseButtonBox.classList.add("mx-0");
 		
 		var registDetailBtn1 = document.createElement("button");
 		registDetailBtn1.classList.add("btn");
 		registDetailBtn1.classList.add("btn-light");
 		registDetailBtn1.setAttribute("type","button");
 		registDetailBtn1.setAttribute("data-bs-toggle","modal");
 		registDetailBtn1.setAttribute("data-bs-target","#purchaseRegist");
 		registDetailBtn1.innerText = "등록";
 		choseButtonBox.appendChild(registDetailBtn1);
 		
 		var selectDetailBtn1 = document.createElement("button");
 		selectDetailBtn1.classList.add("btn");
 		selectDetailBtn1.classList.add("btn-light");
 		selectDetailBtn1.setAttribute("type","button");
 		selectDetailBtn1.setAttribute("id","updateDetailModal");
 		selectDetailBtn1.setAttribute("onclick","selectPurchase()");
 		selectDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(selectDetailBtn1);
 		
 		var updateDetailBtn1 = document.createElement("button");
 		updateDetailBtn1.classList.add("btn");
 		updateDetailBtn1.classList.add("btn-light");
 		updateDetailBtn1.setAttribute("type","button");
 		updateDetailBtn1.setAttribute("data-bs-toggle","modal");
 		updateDetailBtn1.setAttribute("data-bs-target","#purchaseUpdate");
 		updateDetailBtn1.setAttribute("id","updateModalStart");
 		updateDetailBtn1.hidden = true;
 		updateDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(updateDetailBtn1);
 		
 		var deliteDetailBtn1 = document.createElement("button");
 		deliteDetailBtn1.classList.add("btn");
 		deliteDetailBtn1.classList.add("btn-light");
 		deliteDetailBtn1.setAttribute("type","button");
 		deliteDetailBtn1.setAttribute("onclick","deletePurchaseInfo()");
 		deliteDetailBtn1.innerText = "삭제";
 		choseButtonBox.appendChild(deliteDetailBtn1);
 			
 			
 		var listDetailNew = document.getElementById("listNew");
 		listDetailNew.innerHTML = "";
 		listDetailNew.classList.add("col");

 		var inI1 = document.createElement("i");
 		inI1.classList.add("bi");
 		inI1.classList.add("bi-list");
 		inI1.classList.add("fs-5");
 		listDetailNew.appendChild(inI1);

 		var inSpan1 = document.createElement("span");
 		inSpan1.classList.add("fs-5");
 		inSpan1.innerText = " 발주 목록 ";
 		listDetailNew.appendChild(inSpan1);

 		var selectBox = document.getElementById("selectNew");
 		selectBox.innerHTML = "";
 		selectBox.classList.add("input-group");
 		selectBox.classList.add("mb-3");

 		var detailSelect1 = document.createElement("select");
 		detailSelect1.classList.add("form-select");
 		detailSelect1.setAttribute("style","width: 10px;");
 		detailSelect1.setAttribute("aria-label","Default select example");
 		detailSelect1.setAttribute("id","searchType");
 		selectBox.appendChild(detailSelect1);
 		
 		var detailOption1 = document.createElement("option");
 		detailOption1.value = "";
 		detailOption1.innerText = "선택";
 		detailSelect1.appendChild(detailOption1);

 		var detailOption2 = document.createElement("option");
 		detailOption2.value = "purchase_code";
 		detailOption2.innerText = "발주코드";
 		detailSelect1.appendChild(detailOption2);

 		var detailOption3 = document.createElement("option");
 		detailOption3.value = "purchase_manager";
 		detailOption3.innerText = "발주담당자";
 		detailSelect1.appendChild(detailOption3);
 		
 		var detailOption4 = document.createElement("option");
 		detailOption4.value = "purchase_register_employee";
 		detailOption4.innerText = "발주등록자";
 		detailSelect1.appendChild(detailOption4);

 		var searchWordBox1 = document.createElement("input");
 		searchWordBox1.classList.add("form-control");
 		searchWordBox1.setAttribute("id","searchWord");
 		searchWordBox1.setAttribute("type","text");
 		searchWordBox1.setAttribute("aria-label","Text input with dropdown button");
 		selectBox.appendChild(searchWordBox1);

 		var detailButton1 = document.createElement("button");
 		detailButton1.setAttribute("type","button");
 		detailButton1.setAttribute("onclick","refreshPurchaseInfo()");
 		detailButton1.classList.add("input-group-text");
 		detailButton1.classList.add("bi");
 		detailButton1.classList.add("bi-search");
 		detailButton1.setAttribute("id","basic-addon1");
 		selectBox.appendChild(detailButton1);
 		
 		
// 		var tableDiv = document.getElementById("scrollTable");
//  		tableDiv.innerHtml = "";

		var table1 = document.getElementById("createTable");
		table1.innerHTML = "";
		table1.classList.add("table");
		table1.classList.add("table-bordered");
		table1.classList.add("text-center");
		table1.setAttribute("style","width:1178px;");

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
				trIn1.appendChild(td2);
				
				var inA1 = document.createElement("div");
				inA1.innerText = commentData.purchase_code;
				inA1.setAttribute("onclick","refreshPurchaseDetailInfo(this.innerText)");
				inA1.setAttribute("style","color : blue;")
				td2.appendChild(inA1);
				
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
				td7.innerText = moment(commentData.purchase_date).format('YYYY-MM-DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = moment(commentData.purchase_due_date).format('YYYY-MM-DD');
				trIn1.appendChild(td8);
				
				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.purchase_register_date).format('YYYY-MM-DD');
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.purchase_register_employee;
				trIn1.appendChild(td10);
				
				var td11 = document.createElement("td");
				td11.innerText = moment(commentData.purchase_update_date).format('YYYY-MM-DD');
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
					inA1.setAttribute("href","javascript:refreshPurchaseInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshPurchaseInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
 	
 	
function refreshPurchaseDetailInfo(purchase_code){
 		
	var clickSearchType = document.getElementById("searchType");
	var clickSearchTypeVal = clickSearchType.value;
	
	var clickSearchWord = document.getElementById("searchWord");
	var clickSearchWordVal = clickSearchWord.value;
	
	var inputOtainCodeBox = document.getElementById("purchase_code_in_detail");
	inputOtainCodeBox.innerHTML = "";
	inputOtainCodeBox.classList.add("form-control");
	inputOtainCodeBox.setAttribute("type","text");
	inputOtainCodeBox.setAttribute("id","purchase_code_in_detail");
	inputOtainCodeBox.value = purchase_code;
	
	
	var choseButtonBox = document.getElementById("choseButton");
	choseButtonBox.innerHTML = "";
	choseButtonBox.classList.add("col-6");
	choseButtonBox.classList.add("mx-0");
	
	var registDetailBtn1 = document.createElement("button");
	registDetailBtn1.classList.add("btn");
	registDetailBtn1.classList.add("btn-light");
	registDetailBtn1.setAttribute("type","button");
	registDetailBtn1.setAttribute("data-bs-toggle","modal");
	registDetailBtn1.setAttribute("data-bs-target","#purchaseDetailRegist");
	registDetailBtn1.innerText = "등록";
	choseButtonBox.appendChild(registDetailBtn1);
	
	var selectDetailBtn1 = document.createElement("button");
	selectDetailBtn1.classList.add("btn");
	selectDetailBtn1.classList.add("btn-light");
	selectDetailBtn1.setAttribute("type","button");
	selectDetailBtn1.setAttribute("id","updateDetailModal");
	selectDetailBtn1.setAttribute("onclick","selectPurchaseDetail()");
	selectDetailBtn1.innerText = "수정";
	choseButtonBox.appendChild(selectDetailBtn1);
	
	var updateDetailBtn1 = document.createElement("button");
	updateDetailBtn1.classList.add("btn");
	updateDetailBtn1.classList.add("btn-light");
	updateDetailBtn1.setAttribute("type","button");
	updateDetailBtn1.setAttribute("data-bs-toggle","modal");
	updateDetailBtn1.setAttribute("data-bs-target","#purchaseDetailUpdate");
	updateDetailBtn1.setAttribute("id","updateDetailModalStart");
	updateDetailBtn1.hidden = true;
	updateDetailBtn1.innerText = "수정";
	choseButtonBox.appendChild(updateDetailBtn1);
	
	var deliteDetailBtn1 = document.createElement("button");
	deliteDetailBtn1.classList.add("btn");
	deliteDetailBtn1.classList.add("btn-light");
	deliteDetailBtn1.setAttribute("type","button");
	deliteDetailBtn1.setAttribute("onclick","deletePurchaseDetailInfo()");
	deliteDetailBtn1.innerText = "삭제";
	choseButtonBox.appendChild(deliteDetailBtn1);
		
		
	var listDetailNew = document.getElementById("listNew");
	listDetailNew.innerHTML = "";
	listDetailNew.classList.add("col");

	var inI1 = document.createElement("i");
	inI1.classList.add("bi");
	inI1.classList.add("bi-list");
	inI1.classList.add("fs-5");
	listDetailNew.appendChild(inI1);

	var inSpan1 = document.createElement("span");
	inSpan1.classList.add("fs-5");
	inSpan1.innerText = " 발주 상세 목록 ";
	listDetailNew.appendChild(inSpan1);
	
	var inA1 = document.createElement("a");
	inA1.setAttribute("onclick","refreshPurchaseInfo()");
	listDetailNew.appendChild(inA1);
	
	var inI1 = document.createElement("i")
	inI1.classList.add("bi");
	inI1.classList.add("bi-arrow-left-square");
	inI1.classList.add("fs-5");
	inA1.appendChild(inI1);

	var selectBox = document.getElementById("selectNew");
	selectBox.innerHTML = "";
	selectBox.classList.add("input-group");
	selectBox.classList.add("mb-3");

	var detailSelect1 = document.createElement("select");
	detailSelect1.classList.add("form-select");
	detailSelect1.setAttribute("style","width: 10px;");
	detailSelect1.setAttribute("aria-label","Default select example");
	detailSelect1.setAttribute("id","searchType");
	selectBox.appendChild(detailSelect1);
	
	var detailOption1 = document.createElement("option");
	detailOption1.value = "";
	detailOption1.innerText = "선택";
	detailSelect1.appendChild(detailOption1);

	var detailOption2 = document.createElement("option");
	detailOption2.value = "product_code";
	detailOption2.innerText = "제품코드";
	detailSelect1.appendChild(detailOption2);

	var detailOption3 = document.createElement("option");
	detailOption3.value = "product_name";
	detailOption3.innerText = "제품명";
	detailSelect1.appendChild(detailOption3);

	var searchWordBox1 = document.createElement("input");
	searchWordBox1.classList.add("form-control");
	searchWordBox1.setAttribute("id","searchWord");
	searchWordBox1.setAttribute("type","text");
	searchWordBox1.setAttribute("aria-label","Text input with dropdown button");
	selectBox.appendChild(searchWordBox1);

	var detailButton1 = document.createElement("button");
	detailButton1.setAttribute("type","button");
	detailButton1.setAttribute("onclick","refreshPurchaseDetailInfo(this.value)");
	detailButton1.classList.add("input-group-text");
	detailButton1.classList.add("bi");
	detailButton1.value = purchase_code;
	detailButton1.classList.add("bi-search");
	detailButton1.setAttribute("id","basic-addon1");
	selectBox.appendChild(detailButton1);
 		
// 		var tableDiv = document.getElementById("scrollTable");
//  		tableDiv.innerHtml = "";

		var table1 = document.getElementById("createTable");
		table1.innerHTML = "";
		table1.classList.add("table");
		table1.classList.add("table-bordered");
		table1.classList.add("text-center");
		table1.setAttribute("style","width:1178px;");

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
		th2.innerText = "발주상세코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "발주코드";
		tr1.appendChild(th3);

		var th5 = document.createElement("th");
		th5.innerText = "제품코드";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "제품명";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "제품가격";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "제품수량";
		tr1.appendChild(th8);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.purchaseDetailList){
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
				inputIn1.setAttribute("value",commentData.purchase_detail_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.purchase_detail_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.purchase_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.product_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.product_name;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.product_price;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = commentData.product_amount;
				trIn1.appendChild(td7);
				
				
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
					inA1.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/purchaseDetailInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal + "&purchase_code=" + purchase_code);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshPurchaseDetailInfoPage(purchase_code,pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
//  		var clickSearchType = document.getElementById("searchType");
//  		var clickSearchTypeVal = clickSearchType.value;
 		
//  		var clickSearchWord = document.getElementById("searchWord");
//  		var clickSearchWordVal = clickSearchWord.value;
 		
 		var inputOtainCodeBox = document.getElementById("purchase_code_in_detail");
 		inputOtainCodeBox.innerHTML = "";
 		inputOtainCodeBox.classList.add("form-control");
 		inputOtainCodeBox.setAttribute("type","text");
 		inputOtainCodeBox.setAttribute("id","purchase_code_in_detail");
 		inputOtainCodeBox.value = purchase_code;
 		
 		
 		var choseButtonBox = document.getElementById("choseButton");
 		choseButtonBox.innerHTML = "";
 		choseButtonBox.classList.add("col-6");
 		choseButtonBox.classList.add("mx-0");
 		
 		var registDetailBtn1 = document.createElement("button");
 		registDetailBtn1.classList.add("btn");
 		registDetailBtn1.classList.add("btn-light");
 		registDetailBtn1.setAttribute("type","button");
 		registDetailBtn1.setAttribute("data-bs-toggle","modal");
 		registDetailBtn1.setAttribute("data-bs-target","#purchaseDetailRegist");
 		registDetailBtn1.innerText = "등록";
 		choseButtonBox.appendChild(registDetailBtn1);
 		
 		var selectDetailBtn1 = document.createElement("button");
 		selectDetailBtn1.classList.add("btn");
 		selectDetailBtn1.classList.add("btn-light");
 		selectDetailBtn1.setAttribute("type","button");
 		selectDetailBtn1.setAttribute("id","updateDetailModal");
 		selectDetailBtn1.setAttribute("onclick","selectPurchaseDetail()");
 		selectDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(selectDetailBtn1);
 		
 		var updateDetailBtn1 = document.createElement("button");
 		updateDetailBtn1.classList.add("btn");
 		updateDetailBtn1.classList.add("btn-light");
 		updateDetailBtn1.setAttribute("type","button");
 		updateDetailBtn1.setAttribute("data-bs-toggle","modal");
 		updateDetailBtn1.setAttribute("data-bs-target","#purchaseDetailUpdate");
 		updateDetailBtn1.setAttribute("id","updateDetailModalStart");
 		updateDetailBtn1.hidden = true;
 		updateDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(updateDetailBtn1);
 		
 		var deliteDetailBtn1 = document.createElement("button");
 		deliteDetailBtn1.classList.add("btn");
 		deliteDetailBtn1.classList.add("btn-light");
 		deliteDetailBtn1.setAttribute("type","button");
 		deliteDetailBtn1.setAttribute("onclick","deletePurchaseDetailInfo()");
 		deliteDetailBtn1.innerText = "삭제";
 		choseButtonBox.appendChild(deliteDetailBtn1);
 			
 			
 		var listDetailNew = document.getElementById("listNew");
 		listDetailNew.innerHTML = "";
 		listDetailNew.classList.add("col");

 		var inI1 = document.createElement("i");
 		inI1.classList.add("bi");
 		inI1.classList.add("bi-list");
 		inI1.classList.add("fs-5");
 		listDetailNew.appendChild(inI1);

 		var inSpan1 = document.createElement("span");
 		inSpan1.classList.add("fs-5");
 		inSpan1.innerText = " 발주 상세 목록 ";
 		listDetailNew.appendChild(inSpan1);
 		
 		var inA1 = document.createElement("a");
 		inA1.setAttribute("onclick","refreshPurchaseInfo()");
 		listDetailNew.appendChild(inA1);
 		
 		var inI1 = document.createElement("i")
 		inI1.classList.add("bi");
 		inI1.classList.add("bi-arrow-left-square");
 		inI1.classList.add("fs-5");
 		inA1.appendChild(inI1);

 		var selectBox = document.getElementById("selectNew");
 		selectBox.innerHTML = "";
 		selectBox.classList.add("input-group");
 		selectBox.classList.add("mb-3");

 		var detailSelect1 = document.createElement("select");
 		detailSelect1.classList.add("form-select");
 		detailSelect1.setAttribute("style","width: 10px;");
 		detailSelect1.setAttribute("aria-label","Default select example");
 		detailSelect1.setAttribute("id","searchType");
 		selectBox.appendChild(detailSelect1);
 		
 		var detailOption1 = document.createElement("option");
 		detailOption1.value = "";
 		detailOption1.innerText = "선택";
 		detailSelect1.appendChild(detailOption1);

 		var detailOption2 = document.createElement("option");
 		detailOption2.value = "product_code";
 		detailOption2.innerText = "제품코드";
 		detailSelect1.appendChild(detailOption2);

 		var detailOption3 = document.createElement("option");
 		detailOption3.value = "product_name";
 		detailOption3.innerText = "제품명";
 		detailSelect1.appendChild(detailOption3);

 		var searchWordBox1 = document.createElement("input");
 		searchWordBox1.classList.add("form-control");
 		searchWordBox1.setAttribute("id","searchWord");
 		searchWordBox1.setAttribute("type","text");
 		searchWordBox1.setAttribute("aria-label","Text input with dropdown button");
 		selectBox.appendChild(searchWordBox1);

 		var detailButton1 = document.createElement("button");
 		detailButton1.setAttribute("type","button");
 		detailButton1.setAttribute("onclick","refreshPurchaseDetailInfo(this.value)");
 		detailButton1.classList.add("input-group-text");
 		detailButton1.classList.add("bi");
 		detailButton1.value = purchase_code;
 		detailButton1.classList.add("bi-search");
 		detailButton1.setAttribute("id","basic-addon1");
 		selectBox.appendChild(detailButton1);
 	 		
// 	 		var tableDiv = document.getElementById("scrollTable");
// 	  		tableDiv.innerHtml = "";

 			var table1 = document.getElementById("createTable");
 			table1.innerHTML = "";
 			table1.classList.add("table");
 			table1.classList.add("table-bordered");
 			table1.classList.add("text-center");
 			table1.setAttribute("style","width:1178px;");

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
		th2.innerText = "발주상세코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "발주코드";
		tr1.appendChild(th3);

		var th5 = document.createElement("th");
		th5.innerText = "제품코드";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "제품명";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "제품가격";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "제품수량";
		tr1.appendChild(th8);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.purchaseDetailList){
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
				inputIn1.setAttribute("value",commentData.purchase_detail_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.purchase_detail_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.purchase_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.product_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.product_name;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.product_price;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = commentData.product_amount;
				trIn1.appendChild(td7);
				
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
					inA1.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshPurchaseDetailInfoPage('"+purchase_code+"',"+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/purchaseDetailInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal + "&purchase_code=" + purchase_code);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	
function insertPurchaseDetailInfo(){
		
	var purchaseCodeInDetailVal = document.getElementById("purchase_code_in_detail").value;
	var productCodeVal = document.getElementById("product_code").value;
	var productNameVal = document.getElementById("product_name").value;
	var productPriceVal = document.getElementById("product_price").value;
	var productAmountVal = document.getElementById("product_amount").value;
		


		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					

				document.getElementById("product_code").value = "";
				document.getElementById("product_name").value = "";
				document.getElementById("product_price").value = "";
				document.getElementById("product_amount").value = "";
				
				refreshPurchaseDetailInfo(purchaseCodeInDetailVal);
			}
		}
		
// 		xhr.open("post" , "./insertPurchaseInfo");
// 		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
// 		xhr.send("company_code=" + companyCodeVal + "&account_code=" + accountCodeVal + "&purchase_state=" + purchaseStateVal + 
// 				"&purchase_manager=" + purchaseManagerVal + "&purchase_date=" + purchaseDateVal + "&purchase_due_date=" + purchaseDueDateVal + 
// 				 "&purchase_register_employee=" + purchaseRegisterEmployeeVal + 
// 				"&purchase_update_employee=" + purchaseUpdateEmployeeVal + "&purchase_memo=" + purchaseMemoVal + "&product_code=" + productCodeVal +
// 				"&product_name=" + productNameVal + "&product_price=" + productPriceVal + "&product_amount=" + productAmountVal);		
		
		xhr.open("post" , "./insertPurchaseDetailInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("purchase_code=" + purchaseCodeInDetailVal +
				"&product_code=" + productCodeVal + "&product_name=" + productNameVal +
				"&product_price=" + productPriceVal + "&product_amount=" + productAmountVal);
		
	}
	
	function selectPurchaseDetail(){
		
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
        
        document.getElementById("purchase_code_in_detail_update").value = "";
		document.getElementById("purchase_detail_code_update").value = "";
		document.getElementById("product_code_update").value = "";
		document.getElementById("product_name_update").value = "";
		document.getElementById("product_price_update").value = "";
		document.getElementById("product_amount_update").value = "";
	    
		var purchaseCodeInDetail = document.getElementById("purchase_code_in_detail_update");
		var purchaseDetailCode = document.getElementById("purchase_detail_code_update");
		var productCode = document.getElementById("product_code_update");
		var productName = document.getElementById("product_name_update");
		var productPrice = document.getElementById("product_price_update");
		var productAmount = document.getElementById("product_amount_update");
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				purchaseCodeInDetail.value = jsonObj.purchase_code;
				purchaseDetailCode.value = jsonObj.purchase_detail_code;
				productCode.value = jsonObj.product_code;
				productName.value = jsonObj.product_name;
				productPrice.value = parseInt(jsonObj.product_price);
				productAmount.value = parseInt(jsonObj.product_amount);

				document.getElementById("updateDetailModalStart").click();
				
			}
		}
		
		xhr.open("get", "./selectPurchaseDetailInfo?purchase_detail_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
		
	
	function updatePurchaseDetailInfo(){
		
		var purchaseInDetailVal = document.getElementById("purchase_code_in_detail_update").value;
		var purchaseDetailCodeVal = document.getElementById("purchase_detail_code_update").value;
		var productCodeVal = document.getElementById("product_code_update").value;
		var productNameVal = document.getElementById("product_name_update").value;
		var productPriceVal = parseInt(document.getElementById("product_price_update").value);
		var productAmountVal = parseInt(document.getElementById("product_amount_update").value);
		
		var xhr = new XMLHttpRequest();
// 		xhr.onreadystatechange = function () {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var result = JSON.parse(xhr.responseText);	
					

// 			}
// 		}
		
		xhr.open("post" , "./updatePurchaseDetailInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("purchase_code=" + purchaseInDetailVal + "&purchase_detail_code=" + purchaseDetailCodeVal +
				"&product_code=" + productCodeVal + "&product_name=" + productNameVal +
				"&product_price=" + productPriceVal + "&product_amount=" + productAmountVal);
		
        document.getElementById("purchase_code_in_detail_update").value = "";
		document.getElementById("purchase_detail_code_update").value = "";
		document.getElementById("product_code_update").value = "";
		document.getElementById("product_name_update").value = "";
		document.getElementById("product_price_update").value = "";
		document.getElementById("product_amount_update").value = "";
		
	
		refreshPurchaseDetailInfo(purchaseInDetailVal);

		
		
	}
	
	function deletePurchaseDetailInfo(){
		
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
					
				refreshPurchaseDetailInfo(result.purchase_code);
			}
		}
		
		xhr.open("post" , "./deletePurchaseDetailInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		

		
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
		        	<div id="choseButton" class="col-6 mx-0">
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
                    <div id="listNew" class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">발주 목록</span>
                    </div>
                    <div class="col-4">
<!--                     <form action="./purchaseInfo" method="get"> -->
						<div id="selectNew" class="input-group mb-3">
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
                                        <input id="company_code" onblur="checkRemove()" type="text" readonly value="${employeeInfo.company_code }${adminInfo.company_code }" class="form-control">
                                    </div>
									<div id="company_code_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처코드</span>
                                        <input id="account_code" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
									<div id="account_code_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주문상태</span>
                                        <input id="purchase_state" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
									<div id="purchase_state_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 담당자</span>
                                        <input id="purchase_manager" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
									<div id="purchase_manager_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주일</span>
                                        <input id="purchase_date" onblur="checkRemove()" type="date" class="form-control">
                                    </div>
									<div id="purchase_date_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주납기일</span>
                                        <input id="purchase_due_date" onblur="checkRemove()" type="date" class="form-control">
                                    </div>
									<div id="purchase_due_date_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 등록자</span>
                                        <input id="purchase_register_employee" onblur="checkRemove()" readonly value="${employeeInfo.employee_name }${adminInfo.admin_email }" type="text" class="form-control">
                                    </div>
									<div id="purchase_register_employee_Alert" class="mb-3"></div>
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
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="check()">등록</button>
                  <button id="insertBtn" type="button" class="btn btn-primary" onclick="insertPurchaseInfo()" data-bs-dismiss="modal" hidden>등록</button>
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
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="company_code_update" onblur="checkUpdateRemove()" readonly value="${employeeInfo.company_code }${adminInfo.company_code }" type="text" class="form-control">
                                    </div>
									<div id="company_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주코드</span>
                                        <input id="purchase_code_update" onblur="checkUpdateRemove()" readonly type="text" class="form-control">
                                    </div>
									<div id="purchase_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처코드</span>
                                        <input id="account_code_update"  onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
									<div id="account_code_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주문상태</span>
                                        <input id="purchase_state_update"  onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
									<div id="purchase_state_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 담당자</span>
                                        <input id="purchase_manager_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
									<div id="purchase_manager_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 접수일</span>
                                        <input id="purchase_date_update" onblur="checkUpdateRemove()" type="date" class="form-control">
                                    </div>
									<div id="purchase_date_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 마감일</span>
                                        <input id="purchase_due_date_update" onblur="checkUpdateRemove()" type="date" class="form-control">
                                    </div>
									<div id="purchase_due_date_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주 수정자</span>
                                        <input id="purchase_update_employee_update" onblur="checkUpdateRemove()" readonly value="${employeeInfo.employee_name }${adminInfo.admin_email }" type="text" class="form-control">
                                    </div>
									<div id="purchase_update_employee_update_Alert" class="mb-3"></div>
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
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="checkUpdate()">수정</button>
                  <button id="updateBtn" type="button" class="btn btn-primary" onclick="updatePurchaseInfo()" data-bs-dismiss="modal" hidden>수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
           <!-- 디테일 등록창 모달 -->
        <div class="modal fade" id="purchaseDetailRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">발주 상세 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주코드</span>
                                        <input id="purchase_code_in_detail" onblur="checkDetailRemove()"  readonly type="text" class="form-control">
                                    </div>
                                	<div id="purchase_code_in_detail_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품코드</span>
                                        <input id="product_code" onblur="checkDetailRemove()"  type="text" class="form-control">
                                    </div>
                                	<div id="product_code_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품명</span>
                                        <input id="product_name" onblur="checkDetailRemove()"  type="text" class="form-control">
                                    </div>
                                	<div id="product_name_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품가격</span>
                                        <input id="product_price" onblur="checkDetailRemove()"  type="text" class="form-control">
                                    </div>
                                	<div id="product_price_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품수량</span>
                                        <input id="product_amount" onblur="checkDetailRemove()"  type="text" class="form-control">
                                    </div>
                                	<div id="product_amount_Alert" class="mb-3"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="checkDetail()">등록</button>
                  <button id="insertDetailBtn" type="button" class="btn btn-primary" onclick="insertPurchaseDetailInfo()" data-bs-dismiss="modal" hidden>등록</button>
               </div>
              </div>
            </div>
          </div>
          
          
        <!-- 디테일 수정창 모달 -->
        <div class="modal fade" id="purchaseDetailUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">발주 상세 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                 <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주상세코드</span>
                                        <input id="purchase_detail_code_update" onblur="checkDetailUpdateRemove()"  readonly type="text" class="form-control">
                                    </div>
									<div id="purchase_detail_code_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">발주코드</span>
                                        <input id="purchase_code_in_detail_update" onblur="checkDetailUpdateRemove()"  readonly type="text" class="form-control">
                                    </div>
									<div id="purchase_code_in_detail_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품코드</span>
                                        <input id="product_code_update" onblur="checkDetailUpdateRemove()"  type="text" class="form-control">
                                    </div>
									<div id="product_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품명</span>
                                        <input id="product_name_update" onblur="checkDetailUpdateRemove()"  type="text" class="form-control">
                                    </div>
									<div id="product_name_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품가격</span>
                                        <input id="product_price_update" onblur="checkDetailUpdateRemove()"  type="text" class="form-control">
                                    </div>
									<div id="product_price_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품수량</span>
                                        <input id="product_amount_update" onblur="checkDetailUpdateRemove()"  type="text" class="form-control">
                                    </div>
									<div id="product_amount_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="checkDetailUpdate()">수정</button>
                  <button id="updateDetailBtn" type="button" class="btn btn-primary" onclick="updatePurchaseDetailInfo()" data-bs-dismiss="modal" hidden>수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>