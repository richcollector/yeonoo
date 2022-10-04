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

   #scrollTable {
	flex: 0 0 auto;
   }

    </style>
	
<script type="text/javascript">

	

	function findProduct(){
		console.log("파프옴?")
		var productName = document.getElementById("searchProduct").value;
		console.log("프네" + productName)
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
					console.log("들어오십시오....")
					var addUi = document.getElementById("upSearchWindowUi");
					addUi.innerHTML = "";
					
					searchResult = document.createElement("div");
					searchResult.classList.add("col");
					addUi.appendChild(searchResult);
					
					resultUl = document.createElement("ul");
					resultUl.classList.add("list-group");
					searchResult.appendChild(resultUl);
					
					for (product of jsonObj){
						 
						resultLi = document.createElement("li");
						resultLi.classList.add("list-group-item");
						resultLi.innerText = product.product_name + product.product_code;
						resultLi.setAttribute("onclick", "uploadProduct('"+product.product_name+"','"+product.product_code+"')");
						resultUl.appendChild(resultLi);
						
	//						resultHidden = document.createElement("input");
	//						resultHidden.setAttribute("type","hidden");
	//						resultHidden.value = product.product_name + product.product_code;
	//						resultLi.appendChild(resultHidden);
						
					}
				}
			}
			
			console.log("안뇽하세용");
			xhr.open("get", "./findProductNumName?productName=" + productName);	//리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send();	//AJAX로 리퀘스트함...
		
	}
	
	
	function findProductUpdate(){
		console.log("파프옴?")
		var productName = document.getElementById("searchProductUpdate").value;
		console.log("프네" + productName)
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
					console.log("들어오십시오....")
					var addUi = document.getElementById("upSearchWindowUiUpdate");
					addUi.innerHTML = "";
					
					searchResult = document.createElement("div");
					searchResult.classList.add("col");
					addUi.appendChild(searchResult);
					
					resultUl = document.createElement("ul");
					resultUl.classList.add("list-group");
					searchResult.appendChild(resultUl);
					
					for (product of jsonObj){
						 
						resultLi = document.createElement("li");
						resultLi.classList.add("list-group-item");
						resultLi.innerText = product.product_name + "         "+ product.product_code;
						resultLi.setAttribute("onclick", "uploadProductUpdate('"+product.product_name+"','"+product.product_code+"')");
						resultUl.appendChild(resultLi);
						
	//						resultHidden = document.createElement("input");
	//						resultHidden.setAttribute("type","hidden");
	//						resultHidden.value = product.product_name + product.product_code;
	//						resultLi.appendChild(resultHidden);
						
					}
				}
			}
			
			console.log("안뇽하세용");
			xhr.open("get", "./findProductNumName?productName=" + productName);	//리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send();	//AJAX로 리퀘스트함...
		
	}
	
	function uploadProduct(product_name,product_code){
		
		var productName = document.getElementById("product_name");
		productName.value = product_name;
		
		var productCode = document.getElementById("product_code");
		productCode.value = product_code;
		
		var productSerach = document.getElementById("searchProduct");
		productSerach.innerHTML = "";
		
		var addUi = document.getElementById("upSearchWindowUi");
		addUi.innerHTML = "";
		
		
	}
	
	function uploadProductUpdate(product_name,product_code){
	
		
		var productName = document.getElementById("product_name_update");
		productName.value = product_name;
		
		var productCode = document.getElementById("product_code_update");
		productCode.value = product_code;
		
		var productSerach = document.getElementById("searchProductUpdate");
		productSerach.innerHTML = "";
		
		var addUi = document.getElementById("upSearchWindowUiUpdate");
		addUi.innerHTML = "";
	}

	function check(){
		
		document.getElementById("company_code_Alert").innerHTML = "";
		document.getElementById("manufacture_state_Alert").innerHTML = "";
		document.getElementById("manufacture_manager_Alert").innerHTML = "";
		document.getElementById("manufacture_date_Alert").innerHTML = "";
		document.getElementById("manufacture_due_date_Alert").innerHTML = "";
		document.getElementById("manufacture_register_employee_Alert").innerHTML = "";
		
		
		if(document.getElementById("company_code").value == ""){
			document.getElementById("company_code_Alert").innerText = "로그인을 먼저 해주세요.";
			document.getElementById("company_code_Alert").classList.add("text-danger");
			document.getElementById("company_code").focus();
			return;
		}else{	
			document.getElementById("company_code_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_state").value == ""){
			document.getElementById("manufacture_state_Alert").innerText = "생산상태를 입력해주셔야합니다.";
			document.getElementById("manufacture_state_Alert").classList.add("text-danger");
			document.getElementById("manufacture_state").focus();
			return;
		}else{	
			document.getElementById("manufacture_state_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_manager").value == ""){
			document.getElementById("manufacture_manager_Alert").innerText = "생산담당자를 입력해주셔야합니다.";
			document.getElementById("manufacture_manager_Alert").classList.add("text-danger");
			document.getElementById("manufacture_manager").focus();
			return;
		}else{	
			document.getElementById("manufacture_manager_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_date").value == ""){
			document.getElementById("manufacture_date_Alert").innerText = "생산일을 입력해주셔야합니다.";
			document.getElementById("manufacture_date_Alert").classList.add("text-danger");
			document.getElementById("manufacture_date").focus();
			return;
		}else{	
			document.getElementById("manufacture_date_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_due_date").value == ""){
			document.getElementById("manufacture_due_date_Alert").innerText = "생산마감일을 입력해주셔야합니다.";
			document.getElementById("manufacture_due_date_Alert").classList.add("text-danger");
			document.getElementById("manufacture_due_date").focus();
			return;
		}else{	
			document.getElementById("manufacture_due_date_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_register_employee").value == ""){
			document.getElementById("manufacture_register_employee_Alert").innerText = "생산등록자를 입력해주셔야합니다.";
			document.getElementById("manufacture_register_employee_Alert").classList.add("text-danger");
			document.getElementById("manufacture_register_employee").focus();
			return;
		}else{	
			document.getElementById("manufacture_register_employee_Alert").innerHTML = "";
		}
		
		
		document.getElementById("insertBtn").click();
		
	}
	
	function checkRemove(){
		
		if(document.getElementById("company_code").value != ""){
			document.getElementById("company_code_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_state").value != ""){
			document.getElementById("manufacture_state_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_manager").value != ""){
			document.getElementById("manufacture_manager_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_date").value != ""){
			document.getElementById("manufacture_date_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_due_date").value != ""){
			document.getElementById("manufacture_due_date_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_register_employee").value != ""){
			document.getElementById("manufacture_register_employee_Alert").innerHTML = "";
		}else{
			return;
		}
		
	}
	
	function checkUpdate(){
		
		document.getElementById("company_code_update_Alert").innerHTML = "";
		document.getElementById("manufacture_code_update_Alert").innerHTML = "";
		document.getElementById("manufacture_state_update_Alert").innerHTML = "";
		document.getElementById("manufacture_manager_update_Alert").innerHTML = "";
		document.getElementById("manufacture_date_update_Alert").innerHTML = "";
		document.getElementById("manufacture_due_date_update_Alert").innerHTML = "";
		document.getElementById("manufacture_update_employee_update_Alert").innerHTML = "";
		
		if(document.getElementById("company_code_update").value == ""){
			document.getElementById("company_code_update_Alert").innerText = "로그인을 먼저 해주셔야 합니다.";
			document.getElementById("company_code_update_Alert").classList.add("text-danger");
			document.getElementById("company_code_update").focus();
			return;
		}else{	
			document.getElementById("company_code_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_code_update").value == ""){
			document.getElementById("manufacture_code_update_Alert").innerText = "생산코드를 입력해주셔야 합니다.";
			document.getElementById("manufacture_code_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_code_update").focus();
			return;
		}else{	
			document.getElementById("manufacture_code_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_state_update").value == ""){
			document.getElementById("manufacture_state_update_Alert").innerText = "생산상태를 입력해주셔야 합니다.";
			document.getElementById("manufacture_state_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_state_update").focus();
			return;
		}else{	
			document.getElementById("manufacture_state_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_manager_update").value == ""){
			document.getElementById("manufacture_manager_update_Alert").innerText = "생산담당자를 입력해주셔야 합니다.";
			document.getElementById("manufacture_manager_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_manager_update").focus();
			return;
		}else{	
			document.getElementById("manufacture_manager_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_date_update").value == ""){
			document.getElementById("manufacture_date_update_Alert").innerText = "생산일을 입력해주셔야 합니다.";
			document.getElementById("manufacture_date_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_date_update").focus();
			return;
		}else{	
			document.getElementById("manufacture_date_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_due_date_update").value == ""){
			document.getElementById("manufacture_due_date_update_Alert").innerText = "생산마감일을 입력해주셔야 합니다.";
			document.getElementById("manufacture_due_date_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_due_date_update").focus();
			return;
		}else{	
			document.getElementById("manufacture_due_date_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_update_employee_update").value == ""){
			document.getElementById("manufacture_update_employee_update_Alert").innerText = "생산수정자를 입력해주셔야 합니다.";
			document.getElementById("manufacture_update_employee_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_update_employee_update").focus();
			return;
		}else{	
			document.getElementById("manufacture_update_employee_update_Alert").innerHTML = "";
		}
		
		document.getElementById("updateBtn").click();
		
	
	}
	
	function checkUpdateRemove(){
		
		if(document.getElementById("company_code_update").value != ""){
			document.getElementById("company_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_code_update").value != ""){
			document.getElementById("manufacture_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_state_update").value != ""){
			document.getElementById("manufacture_state_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_manager_update").value != ""){
			document.getElementById("manufacture_manager_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_date_update").value != ""){
			document.getElementById("manufacture_date_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_due_date_update").value != ""){
			document.getElementById("manufacture_due_date_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_update_employee_update").value != ""){
			document.getElementById("manufacture_update_employee_update_Alert").innerHTML = "";
		}else{
			return;
		}
	
	}	
	
	function checkDetail(){
		
		document.getElementById("manufacture_code_in_detail_Alert").innerHTML = "";
		document.getElementById("product_code_Alert").innerHTML = "";
		document.getElementById("product_name_Alert").innerHTML = "";
		document.getElementById("product_price_Alert").innerHTML = "";
		document.getElementById("product_amount_Alert").innerHTML = "";
		
		if(document.getElementById("manufacture_code_in_detail").value == ""){
			document.getElementById("manufacture_code_in_detail_Alert").innerText = "생산코드를 입력해주셔야 합니다.";
			document.getElementById("manufacture_code_in_detail_Alert").classList.add("text-danger");
			document.getElementById("manufacture_code_in_detail").focus();
			return;
		}else{
			document.getElementById("manufacture_code_in_detail_Alert").innerHTML = "";
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
		
		if(document.getElementById("manufacture_code_in_detail").value != ""){
			document.getElementById("manufacture_code_in_detail_Alert").innerHTML = "";
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
	
	function checkDatailUpdate(){
		
		document.getElementById("manufacture_code_in_detail_update_Alert").innerHTML = "";
		document.getElementById("manufacture_detail_code_update_Alert").innerHTML = "";
		document.getElementById("product_code_update_Alert").innerHTML = "";
		document.getElementById("product_name_update_Alert").innerHTML = "";
		document.getElementById("product_price_update_Alert").innerHTML = "";
		document.getElementById("product_amount_update_Alert").innerHTML = "";
		
		if(document.getElementById("manufacture_code_in_detail_update").value == ""){
			document.getElementById("manufacture_code_in_detail_update_Alert").innerText = "생산코드를 입력해주셔야 합니다.";
			document.getElementById("manufacture_code_in_detail_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_code_in_detail_update").focus();
			return;
		}else{
			document.getElementById("manufacture_code_in_detail_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("manufacture_detail_code_update").value == ""){
			document.getElementById("manufacture_detail_code_update_Alert").innerText = "생산상세코드를 입력해주셔야 합니다.";
			document.getElementById("manufacture_detail_code_update_Alert").classList.add("text-danger");
			document.getElementById("manufacture_detail_code_update").focus();
			return;
		}else{
			document.getElementById("manufacture_detail_code_update_Alert").innerHTML = "";
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
		
		document.getElementById("updateDetailUpdateBtn").click();
		
	}
	
	function checkDetailUpdateRemove(){
		
		if(document.getElementById("manufacture_code_in_detail_update").value != ""){
			document.getElementById("manufacture_code_in_detail_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("manufacture_detail_code_update").value != ""){
			document.getElementById("manufacture_detail_code_update_Alert").innerHTML = "";
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
	
	
	function insertManufactureInfo(){
		
		var companyCodeVal = document.getElementById("company_code").value;
		var manufactureStateVal = document.getElementById("manufacture_state").value;
		var manufactureManagerVal = document.getElementById("manufacture_manager").value;
		var manufactureDateVal = document.getElementById("manufacture_date").value;
		var manufactureDueDateVal = document.getElementById("manufacture_due_date").value;
		var manufactureRegisterEmployeeVal = document.getElementById("manufacture_register_employee").value;
		var manufactureMemoVal = document.getElementById("manufacture_memo").value;
		
		var xhr = new XMLHttpRequest();
// 		xhr.onreadystatechange = function () {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var result = JSON.parse(xhr.responseText);	
					

				
// 			}
// 		}
		
		xhr.open("post" , "./insertManufactureInfo", false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("company_code=" + companyCodeVal + "&manufacture_state=" + manufactureStateVal + 
				"&manufacture_manager=" + manufactureManagerVal + "&manufacture_date=" + manufactureDateVal + 
				"&manufacture_due_date=" + manufactureDueDateVal +
				"&manufacture_register_employee=" + manufactureRegisterEmployeeVal +
				"&manufacture_update_employee=" + manufactureRegisterEmployeeVal +
				"&manufacture_memo=" + manufactureMemoVal);


		document.getElementById("manufacture_state").value = "";
		document.getElementById("manufacture_manager").value = "";
		document.getElementById("manufacture_date").value = "";
		document.getElementById("manufacture_due_date").value = "";
		document.getElementById("manufacture_memo").value = "";
		
		
		refreshManufactureInfo();
	}
	
	function selectManufacture(){
		
	    var checkVal = "";
	    
	    var obj_length = document.getElementsByName("checkManufacture").length;
	    
	    var count = 0;
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkManufacture")[i].checked == true) {
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

            if (document.getElementsByName("checkManufacture")[i].checked == true) {
            	checkVal = document.getElementsByName("checkManufacture")[i].value;
            }
        }
        
        document.getElementById("manufacture_code_update").value = "";
		document.getElementById("company_code_update").value = "";
		document.getElementById("manufacture_state_update").value = "";
		document.getElementById("manufacture_manager_update").value = "";
		document.getElementById("manufacture_date_update").value = "";
		document.getElementById("manufacture_due_date_update").value = "";
		document.getElementById("manufacture_update_employee_update").value ="";
		document.getElementById("manufacture_memo_update").value = "";
	    
		var manufactureCode = document.getElementById("manufacture_code_update");
		var companyCode = document.getElementById("company_code_update");
		var manufactureState = document.getElementById("manufacture_state_update");
		var manufactureManager = document.getElementById("manufacture_manager_update");
		var manufactureDate = document.getElementById("manufacture_date_update");
		var manufactureDueDate = document.getElementById("manufacture_due_date_update");
		var manufactureUpdateEmployee = document.getElementById("manufacture_update_employee_update");
		var manufactureMemo = document.getElementById("manufacture_memo_update");
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
				manufactureCode.value = jsonObj.manufacture_code;
				companyCode.value = jsonObj.company_code;
				manufactureState.value = jsonObj.manufacture_state;
				manufactureManager.value = jsonObj.manufacture_manager;
				manufactureDate.value = moment(jsonObj.manufacture_date).format('YYYY-MM-DD');
				manufactureDueDate.value = moment(jsonObj.manufacture_due_date).format('YYYY-MM-DD');
				manufactureUpdateEmployee.value = jsonObj.manufacture_update_employee;
				manufactureMemo.value = jsonObj.manufacture_memo;

				console.log("잉?" + jsonObj.manufacture_memo);
				
				document.getElementById("updateModalStart").click();

			}
		}
		
		xhr.open("get", "./selectManufactureInfo?manufacture_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
		
	
	function updateManufactureInfo(){
		
		var manufactureCodeVal = document.getElementById("manufacture_code_update").value;
		var companyCodeVal = document.getElementById("company_code_update").value;
		var manufactureStateVal = document.getElementById("manufacture_state_update").value;
		var manufactureManagerVal = document.getElementById("manufacture_manager_update").value;
		var manufactureDateVal = moment(document.getElementById("manufacture_date_update").value).format('YYYY-MM-DD');
		var manufactureDueDateVal = moment(document.getElementById("manufacture_due_date_update").value).format('YYYY-MM-DD');
		var manufactureUpdateEmployeeVal = document.getElementById("manufacture_update_employee_update").value;
		var manufactureMemoVal = document.getElementById("manufacture_memo_update").value;
		
		console.log("무엇" + manufactureMemoVal);
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
						

				
			}
		}
		
		xhr.open("post" , "./updateManufactureInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("manufacture_code=" + manufactureCodeVal + "&company_code=" + companyCodeVal + 
				"&manufacture_state=" + manufactureStateVal + "&manufacture_manager=" + manufactureManagerVal + 
				"&manufacture_date=" + manufactureDateVal + "&manufacture_due_date=" + manufactureDueDateVal + 
				"&manufacture_update_employee=" + manufactureUpdateEmployeeVal + 
				"&manufacture_memo=" + manufactureMemoVal);
		
		
        document.getElementById("manufacture_code_update").value = "";
		document.getElementById("company_code_update").value = "";
		document.getElementById("manufacture_state_update").value = "";
		document.getElementById("manufacture_manager_update").value = "";
		document.getElementById("manufacture_date_update").value = "";
		document.getElementById("manufacture_due_date_update").value = "";
		document.getElementById("manufacture_update_employee_update").value ="";
		document.getElementById("manufacture_memo_update").value = "";
		
		
		refreshManufactureInfo();
	}
	
	function deleteManufactureInfo(){
		
	    var checkVal = new Array();
	    
	    
	    var obj_length = document.getElementsByName("checkManufacture").length;
	    
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkManufacture")[i].checked == true) {
            	
            	checkVal[i] = document.getElementsByName("checkManufacture")[i].value;
            }
        }
 	
	
		var xhr = new XMLHttpRequest();
// 		xhr.onreadystatechange = function () {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var result = JSON.parse(xhr.responseText);	
					
				
// 			}
// 		}
		
		xhr.open("post" , "./deleteManufactureInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		
		refreshManufactureInfo();
		
		
	}
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=check_all]").checked;

		var list = document.getElementsByName("checkManufacture");
		
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
		var list = document.getElementsByName("checkManufacture");
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
	
 	function refreshManufactureInfo(){
 		

 		var clickSearchType = document.getElementById("searchType");
 		var clickSearchTypeVal = clickSearchType.value;
 		console.log(clickSearchTypeVal);
 		
 		var clickSearchWord = document.getElementById("searchWord");
 		var clickSearchWordVal = clickSearchWord.value;
 		console.log(clickSearchWordVal);
 		
 		var choseButtonBox = document.getElementById("choseButton");
 		choseButtonBox.innerHTML = "";
 		choseButtonBox.classList.add("col-6");
 		choseButtonBox.classList.add("mx-0");
 		
 		var registDetailBtn1 = document.createElement("button");
 		registDetailBtn1.classList.add("btn");
 		registDetailBtn1.classList.add("btn-light");
 		registDetailBtn1.setAttribute("type","button");
 		registDetailBtn1.setAttribute("data-bs-toggle","modal");
 		registDetailBtn1.setAttribute("data-bs-target","#manufactureRegist");
 		registDetailBtn1.innerText = "등록";
 		choseButtonBox.appendChild(registDetailBtn1);
 		
 		var selectDetailBtn1 = document.createElement("button");
 		selectDetailBtn1.classList.add("btn");
 		selectDetailBtn1.classList.add("btn-light");
 		selectDetailBtn1.setAttribute("type","button");
 		selectDetailBtn1.setAttribute("id","updateModal");
 		selectDetailBtn1.setAttribute("onclick","selectManufacture()");
 		selectDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(selectDetailBtn1);
 		
 		var updateDetailBtn1 = document.createElement("button");
 		updateDetailBtn1.classList.add("btn");
 		updateDetailBtn1.classList.add("btn-light");
 		updateDetailBtn1.setAttribute("type","button");
 		updateDetailBtn1.setAttribute("data-bs-toggle","modal");
 		updateDetailBtn1.setAttribute("data-bs-target","#manufactureUpdate");
 		updateDetailBtn1.setAttribute("id","updateModalStart");
 		updateDetailBtn1.hidden = true;
 		updateDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(updateDetailBtn1);
 		
 		var deliteDetailBtn1 = document.createElement("button");
 		deliteDetailBtn1.classList.add("btn");
 		deliteDetailBtn1.classList.add("btn-light");
 		deliteDetailBtn1.setAttribute("type","button");
 		deliteDetailBtn1.setAttribute("onclick","deleteManufactureInfo()");
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
		inSpan1.innerText = " 생산 목록 ";
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
		detailOption2.value = "manufacture_code";
		detailOption2.innerText = "생산코드";
		detailSelect1.appendChild(detailOption2);

		var detailOption3 = document.createElement("option");
		detailOption3.value = "manufacture_manager";
		detailOption3.innerText = "생산담당자";
		detailSelect1.appendChild(detailOption3);
		
		var detailOption4 = document.createElement("option");
		detailOption4.value = "manufacture_register_employee";
		detailOption4.innerText = "생산등록자";
		detailSelect1.appendChild(detailOption4);

		var searchWordBox1 = document.createElement("input");
		searchWordBox1.classList.add("form-control");
		searchWordBox1.setAttribute("id","searchWord");
		searchWordBox1.setAttribute("type","text");
		searchWordBox1.setAttribute("aria-label","Text input with dropdown button");
		selectBox.appendChild(searchWordBox1);

		var detailButton1 = document.createElement("button");
		detailButton1.setAttribute("type","button");
		detailButton1.setAttribute("onclick","refreshManufactureInfo()");
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
		th2.innerText = "생산코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "회사코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "생산상태";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "생산담당자";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "생산주문일";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "생산마감일";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "생산등록일";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "생산등록자";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "생산수정일";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "생산수정자";
		tr1.appendChild(th11);

		var th12 = document.createElement("th");
		th12.innerText = "비고";
		tr1.appendChild(th12);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.manufactureList){
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
				inputIn1.setAttribute("name","checkManufacture");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.manufacture_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				trIn1.appendChild(td2);
				
				var inA1 = document.createElement("div");
				inA1.innerText = commentData.manufacture_code;
				inA1.setAttribute("onclick","refreshManufactureDetailInfo(this.innerText)");
				inA1.setAttribute("style","color : blue;")
				td2.appendChild(inA1);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.manufacture_state;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.manufacture_manager;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = moment(commentData.manufacture_date).format('YYYY-MM-DD');
				trIn1.appendChild(td6);
				
				var td7 = document.createElement("td");
				td7.innerText = moment(commentData.manufacture_due_date).format('YYYY-MM-DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = moment(commentData.manufacture_register_date).format('YYYY-MM-DD');
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = commentData.manufacture_register_employee;
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = moment(commentData.manufacture_update_date).format('YYYY-MM-DD');
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.manufacture_update_employee;
				trIn1.appendChild(td11);

				var td12 = document.createElement("td");
				td12.innerText = commentData.manufacture_memo;
				trIn1.appendChild(td12);
				
				
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
					inA1.setAttribute("href","javascript:refreshManufactureInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshManufactureInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshManufactureInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshManufactureInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/manufactureInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshManufactureInfoPage(pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
//  		var clickSearchType = document.getElementById("searchType");
//  		var clickSearchTypeVal = clickSearchType.value;
//  		console.log(clickSearchTypeVal);
 		
//  		var clickSearchWord = document.getElementById("searchWord");
//  		var clickSearchWordVal = clickSearchWord.value;
//  		console.log(clickSearchWordVal);
 		
 		var choseButtonBox = document.getElementById("choseButton");
 		choseButtonBox.innerHTML = "";
 		choseButtonBox.classList.add("col-6");
 		choseButtonBox.classList.add("mx-0");
 		
 		var registDetailBtn1 = document.createElement("button");
 		registDetailBtn1.classList.add("btn");
 		registDetailBtn1.classList.add("btn-light");
 		registDetailBtn1.setAttribute("type","button");
 		registDetailBtn1.setAttribute("data-bs-toggle","modal");
 		registDetailBtn1.setAttribute("data-bs-target","#manufactureRegist");
 		registDetailBtn1.innerText = "등록";
 		choseButtonBox.appendChild(registDetailBtn1);
 		
 		var selectDetailBtn1 = document.createElement("button");
 		selectDetailBtn1.classList.add("btn");
 		selectDetailBtn1.classList.add("btn-light");
 		selectDetailBtn1.setAttribute("type","button");
 		selectDetailBtn1.setAttribute("id","updateModal");
 		selectDetailBtn1.setAttribute("onclick","selectManufacture()");
 		selectDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(selectDetailBtn1);
 		
 		var updateDetailBtn1 = document.createElement("button");
 		updateDetailBtn1.classList.add("btn");
 		updateDetailBtn1.classList.add("btn-light");
 		updateDetailBtn1.setAttribute("type","button");
 		updateDetailBtn1.setAttribute("data-bs-toggle","modal");
 		updateDetailBtn1.setAttribute("data-bs-target","#manufactureUpdate");
 		updateDetailBtn1.setAttribute("id","updateModalStart");
 		updateDetailBtn1.hidden = true;
 		updateDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(updateDetailBtn1);
 		
 		var deliteDetailBtn1 = document.createElement("button");
 		deliteDetailBtn1.classList.add("btn");
 		deliteDetailBtn1.classList.add("btn-light");
 		deliteDetailBtn1.setAttribute("type","button");
 		deliteDetailBtn1.setAttribute("onclick","deleteManufactureInfo()");
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
		inSpan1.innerText = " 생산 목록 ";
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
		detailOption2.value = "manufacture_code";
		detailOption2.innerText = "생산코드";
		detailSelect1.appendChild(detailOption2);

		var detailOption3 = document.createElement("option");
		detailOption3.value = "manufacture_manager";
		detailOption3.innerText = "생산담당자";
		detailSelect1.appendChild(detailOption3);
		
		var detailOption4 = document.createElement("option");
		detailOption4.value = "manufacture_register_employee";
		detailOption4.innerText = "생산등록자";
		detailSelect1.appendChild(detailOption4);

		var searchWordBox1 = document.createElement("input");
		searchWordBox1.classList.add("form-control");
		searchWordBox1.setAttribute("id","searchWord");
		searchWordBox1.setAttribute("type","text");
		searchWordBox1.setAttribute("aria-label","Text input with dropdown button");
		selectBox.appendChild(searchWordBox1);

		var detailButton1 = document.createElement("button");
		detailButton1.setAttribute("type","button");
		detailButton1.setAttribute("onclick","refreshManufactureInfo()");
		detailButton1.classList.add("input-group-text");
		detailButton1.classList.add("bi");
		detailButton1.classList.add("bi-search");
		detailButton1.setAttribute("id","basic-addon1");
		selectBox.appendChild(detailButton1);

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
		th2.innerText = "생산코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "회사코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "생산상태";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "생산담당자";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "생산주문일";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "생산마감일";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "생산등록일";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "생산등록자";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "생산수정일";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "생산수정자";
		tr1.appendChild(th11);

		var th12 = document.createElement("th");
		th12.innerText = "비고";
		tr1.appendChild(th12);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				

				
				for(commentData of jsonObj.manufactureList){
					
				var tbody1 = document.createElement("tbody");
// 				tbody1.innerHtml = "";
				table1.appendChild(tbody1);

				var trIn1 = document.createElement("tr");
				tbody1.appendChild(trIn1);

				var td1 = document.createElement("td");
				trIn1.appendChild(td1);

				var inputIn1 = document.createElement("input");
				inputIn1.setAttribute("onclick","checkOk()");
				inputIn1.setAttribute("name","checkManufacture");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.manufacture_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				trIn1.appendChild(td2);
				
				
				var inA1 = document.createElement("div");
				inA1.innerText = commentData.manufacture_code;
				inA1.setAttribute("onclick","refreshManufactureDetailInfo(this.innerText)");
				inA1.setAttribute("style","color : blue;")
				td2.appendChild(inA1);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.manufacture_state;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.manufacture_manager;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = moment(commentData.manufacture_date).format('YYYY-MM-DD');
				trIn1.appendChild(td6);
				
				var td7 = document.createElement("td");
				td7.innerText = moment(commentData.manufacture_due_date).format('YYYY-MM-DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = moment(commentData.manufacture_register_date).format('YYYY-MM-DD');
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = commentData.manufacture_register_employee;
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = moment(commentData.manufacture_update_date).format('YYYY-MM-DD');
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.manufacture_update_employee;
				trIn1.appendChild(td11);

				var td12 = document.createElement("td");
				td12.innerText = commentData.manufacture_memo;
				trIn1.appendChild(td12);
				
				
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
					inA1.setAttribute("href","javascript:refreshManufactureInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshManufactureInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshManufactureInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshManufactureInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/manufactureInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	
 	function refreshManufactureDetailInfo(manufacture_code){
 		

 		var clickSearchType = document.getElementById("searchType");
 		var clickSearchTypeVal = clickSearchType.value;
 		console.log(clickSearchTypeVal);
 		
 		var clickSearchWord = document.getElementById("searchWord");
 		var clickSearchWordVal = clickSearchWord.value;
 		console.log(clickSearchWordVal);
 		
 		var inputOtainCodeBox = document.getElementById("manufacture_code_in_detail");
 		inputOtainCodeBox.innerHTML = "";
 		inputOtainCodeBox.classList.add("form-control");
 		inputOtainCodeBox.setAttribute("type","text");
 		inputOtainCodeBox.setAttribute("id","manufacture_code_in_detail");
 		inputOtainCodeBox.value = manufacture_code;
 		
 		var choseButtonBox = document.getElementById("choseButton");
 		choseButtonBox.innerHTML = "";
 		choseButtonBox.classList.add("col-6");
 		choseButtonBox.classList.add("mx-0");
 		
 		var registDetailBtn1 = document.createElement("button");
 		registDetailBtn1.classList.add("btn");
 		registDetailBtn1.classList.add("btn-light");
 		registDetailBtn1.setAttribute("type","button");
 		registDetailBtn1.setAttribute("data-bs-toggle","modal");
 		registDetailBtn1.setAttribute("data-bs-target","#manufactureDetailRegist");
 		registDetailBtn1.innerText = "등록";
 		choseButtonBox.appendChild(registDetailBtn1);
 		
 		var selectDetailBtn1 = document.createElement("button");
 		selectDetailBtn1.classList.add("btn");
 		selectDetailBtn1.classList.add("btn-light");
 		selectDetailBtn1.setAttribute("type","button");
 		selectDetailBtn1.setAttribute("id","updateModal");
 		selectDetailBtn1.setAttribute("onclick","selectManufactureDetail()");
 		selectDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(selectDetailBtn1);
 		
 		var updateDetailBtn1 = document.createElement("button");
 		updateDetailBtn1.classList.add("btn");
 		updateDetailBtn1.classList.add("btn-light");
 		updateDetailBtn1.setAttribute("type","button");
 		updateDetailBtn1.setAttribute("data-bs-toggle","modal");
 		updateDetailBtn1.setAttribute("data-bs-target","#manufactureDetailUpdate");
 		updateDetailBtn1.setAttribute("id","updateDetailModalStart");
 		updateDetailBtn1.hidden = true;
 		updateDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(updateDetailBtn1);
 		
 		var deliteDetailBtn1 = document.createElement("button");
 		deliteDetailBtn1.classList.add("btn");
 		deliteDetailBtn1.classList.add("btn-light");
 		deliteDetailBtn1.setAttribute("type","button");
 		deliteDetailBtn1.setAttribute("onclick","deleteManufactureDetailInfo()");
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
		inSpan1.innerText = " 생산 상세 목록 ";
		listDetailNew.appendChild(inSpan1);
		
		var inA1 = document.createElement("a");
		inA1.setAttribute("onclick","refreshManufactureInfo()");
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
		detailButton1.setAttribute("onclick","refreshManufactureInfo(this.value)");
		detailButton1.classList.add("input-group-text");
		detailButton1.classList.add("bi");
		detailButton1.value = manufacture_code;
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
		th2.innerText = "생산상세코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "생산코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "제품코드";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "제품명";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "제품가격";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "제품수량";
		tr1.appendChild(th7);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.manufactureDetailList){
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
				inputIn1.setAttribute("name","checkManufacture");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.manufacture_detail_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.manufacture_detail_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.manufacture_code;
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
					inA1.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/manufactureDetailInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal + "&manufacture_code=" + manufacture_code);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshManufactureDetailInfoPage(manufacture_code,pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
//  		var clickSearchType = document.getElementById("searchType");
//  		var clickSearchTypeVal = clickSearchType.value;
//  		console.log(clickSearchTypeVal);
 		
//  		var clickSearchWord = document.getElementById("searchWord");
//  		var clickSearchWordVal = clickSearchWord.value;
//  		console.log(clickSearchWordVal);

 		var inputOtainCodeBox = document.getElementById("manufacture_code_in_detail");
 		inputOtainCodeBox.innerHTML = "";
 		inputOtainCodeBox.classList.add("form-control");
 		inputOtainCodeBox.setAttribute("type","text");
 		inputOtainCodeBox.setAttribute("id","manufacture_code_in_detail");
 		inputOtainCodeBox.value = manufacture_code;
 		
 		var choseButtonBox = document.getElementById("choseButton");
 		choseButtonBox.innerHTML = "";
 		choseButtonBox.classList.add("col-6");
 		choseButtonBox.classList.add("mx-0");
 		
 		var registDetailBtn1 = document.createElement("button");
 		registDetailBtn1.classList.add("btn");
 		registDetailBtn1.classList.add("btn-light");
 		registDetailBtn1.setAttribute("type","button");
 		registDetailBtn1.setAttribute("data-bs-toggle","modal");
 		registDetailBtn1.setAttribute("data-bs-target","#manufactureDetailRegist");
 		registDetailBtn1.innerText = "등록";
 		choseButtonBox.appendChild(registDetailBtn1);
 		
 		var selectDetailBtn1 = document.createElement("button");
 		selectDetailBtn1.classList.add("btn");
 		selectDetailBtn1.classList.add("btn-light");
 		selectDetailBtn1.setAttribute("type","button");
 		selectDetailBtn1.setAttribute("id","updateModal");
 		selectDetailBtn1.setAttribute("onclick","selectManufactureDetail()");
 		selectDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(selectDetailBtn1);
 		
 		var updateDetailBtn1 = document.createElement("button");
 		updateDetailBtn1.classList.add("btn");
 		updateDetailBtn1.classList.add("btn-light");
 		updateDetailBtn1.setAttribute("type","button");
 		updateDetailBtn1.setAttribute("data-bs-toggle","modal");
 		updateDetailBtn1.setAttribute("data-bs-target","#manufactureDetailUpdate");
 		updateDetailBtn1.setAttribute("id","updateDetailModalStart");
 		updateDetailBtn1.hidden = true;
 		updateDetailBtn1.innerText = "수정";
 		choseButtonBox.appendChild(updateDetailBtn1);
 		
 		var deliteDetailBtn1 = document.createElement("button");
 		deliteDetailBtn1.classList.add("btn");
 		deliteDetailBtn1.classList.add("btn-light");
 		deliteDetailBtn1.setAttribute("type","button");
 		deliteDetailBtn1.setAttribute("onclick","deleteManufactureDetailInfo()");
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
		inSpan1.innerText = " 생산 상세 목록 ";
		listDetailNew.appendChild(inSpan1);
		
		var inA1 = document.createElement("a");
		inA1.setAttribute("onclick","refreshManufactureInfo()");
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
		detailButton1.setAttribute("onclick","refreshManufactureDetailInfo(this.value)");
		detailButton1.classList.add("input-group-text");
		detailButton1.classList.add("bi");
		detailButton1.value = manufacture_code;
		detailButton1.classList.add("bi-search");
		detailButton1.setAttribute("id","basic-addon1");
		selectBox.appendChild(detailButton1);

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
		th2.innerText = "생산상세코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "생산코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "제품코드";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "제품명";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "제품가격";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "제품수량";
		tr1.appendChild(th7);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				

				
				for(commentData of jsonObj.manufactureDetailList){
					
				var tbody1 = document.createElement("tbody");
// 				tbody1.innerHtml = "";
				table1.appendChild(tbody1);

				var trIn1 = document.createElement("tr");
				tbody1.appendChild(trIn1);

				var td1 = document.createElement("td");
				trIn1.appendChild(td1);

				var inputIn1 = document.createElement("input");
				inputIn1.setAttribute("onclick","checkOk()");
				inputIn1.setAttribute("name","checkManufacture");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.manufacture_detail_code);
				td1.appendChild(inputIn1);
				
				var td2 = document.createElement("td");
				td2.innerText = commentData.manufacture_detail_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.manufacture_code;
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
					inA1.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshManufactureDetailInfoPage('"+manufacture_code+"',"+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../employee/manufactureDetailInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal + "&manufacture_code=" + manufacture_code);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
	function insertManufactureDetailInfo(){
		
		
		var manufactureStateVal = document.getElementById("manufacture_code_in_detail").value;
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
				
				
				refreshManufactureDetailInfo(manufactureStateVal);
				
			}
		}
		
		xhr.open("post" , "./insertManufactureDetailInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("manufacture_code=" + manufactureStateVal + 
				"&product_code=" + productCodeVal + "&product_name=" + productNameVal +
				"&product_price=" + productPriceVal + "&product_amount=" + productAmountVal);
		


	}
	
	function selectManufactureDetail(){
		
	    var checkVal = "";
	    
	    var obj_length = document.getElementsByName("checkManufacture").length;
	    
	    var count = 0;
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkManufacture")[i].checked == true) {
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

            if (document.getElementsByName("checkManufacture")[i].checked == true) {
            	checkVal = document.getElementsByName("checkManufacture")[i].value;
            }
        }
        
        console.log("셀ㄺ투우");
        
        document.getElementById("manufacture_code_in_detail_update").value = "";
		document.getElementById("manufacture_detail_code_update").value = "";
		document.getElementById("product_code_update").value = "";
		document.getElementById("product_name_update").value = "";
		document.getElementById("product_price_update").value = "";
		document.getElementById("product_amount_update").value = "";
	    
		var manufactureCodeInDetail = document.getElementById("manufacture_code_in_detail_update");
		var manufactureDetailCode = document.getElementById("manufacture_detail_code_update");
		var productCode = document.getElementById("product_code_update");
		var productName = document.getElementById("product_name_update");
		var productPrice = document.getElementById("product_price_update");
		var productAmount = document.getElementById("product_amount_update");
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
				manufactureCodeInDetail.value = jsonObj.manufacture_code;
				manufactureDetailCode.value = jsonObj.manufacture_detail_code;
				productCode.value = jsonObj.product_code;
				productName.value = jsonObj.product_name;
				productPrice.value = parseInt(jsonObj.product_price);
				productAmount.value = parseInt(jsonObj.product_amount);
				
				document.getElementById("updateDetailModalStart").click();

			}
		}
		
		xhr.open("get", "./selectManufactureDetailInfo?manufacture_detail_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
		
	
	function updateManufactureDetailInfo(){
		
		var manufactureCodeInDetailVal = document.getElementById("manufacture_code_in_detail_update").value;
		var manufactureDetailCodeVal = document.getElementById("manufacture_detail_code_update").value;
		var productCodeVal = document.getElementById("product_code_update").value;
		var productNameVal = document.getElementById("product_name_update").value;
		var productPriceVal = parseInt(document.getElementById("product_price_update").value);
		var productAmountVal = parseInt(document.getElementById("product_amount_update").value);
		
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
						

				
			}
		}
		
		xhr.open("post" , "./updateManufactureDetailInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("manufacture_code=" + manufactureCodeInDetailVal + "&manufacture_detail_code=" + manufactureDetailCodeVal + 
				"&product_code=" + productCodeVal + "&product_name=" + productNameVal +
				"&product_price=" + productPriceVal + "&product_amount=" + productAmountVal);
		
		
        document.getElementById("manufacture_code_in_detail_update").value = "";
		document.getElementById("manufacture_detail_code_update").value = "";
		document.getElementById("product_code_update").value = "";
		document.getElementById("product_name_update").value = "";
		document.getElementById("product_price_update").value = "";
		document.getElementById("product_amount_update").value = "";
		
		
		refreshManufactureDetailInfo(manufactureCodeInDetailVal);
	}
	
	function deleteManufactureDetailInfo(){
		
	    var checkVal = new Array();
	    
	    
	    var obj_length = document.getElementsByName("checkManufacture").length;
	    
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkManufacture")[i].checked == true) {
            	
            	checkVal[i] = document.getElementsByName("checkManufacture")[i].value;
            }
        }
 	
	
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				refreshManufactureDetailInfo(result.manufacture_code);
			}
		}
		
		xhr.open("post" , "./deleteManufactureDetailInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		
		
		
		
	}

	window.addEventListener("DOMContentLoaded" , function (){
	//사실상 처음 실행하는 코드 모음...
	refreshManufactureInfo();
	//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
	
	});
	
	
</script>
	
<title>생산정보</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">   
		<div class="row">
	        <div class="col form-control mt-3">
	        	<div class="row">
		        	<div id="choseButton" class="col-6 mx-0">
			             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#manufactureRegist">
			                등록
			             </button>
			             <button onclick="selectManufacture()" id="updateModal" type="button" class="btn btn-light">
			             	수정
			             </button>
   			             <button id="updateModalStart" type="button" hidden class="btn btn-light" data-bs-toggle="modal" data-bs-target="#manufactureUpdate">
			             	수정
			             </button>
		            	 <button onclick="deleteManufactureInfo()" type="button" class="btn btn-light">
		            		삭제
		            	 </button>
		            </div>
		            <div class="col-6 text-end mx-0 pt-1">
		            	<span class="fs-5">생산 관리</span>
		            </div>
	            </div>
	        </div>   
        </div>
        <div class="row">
            <div class="form-control mt-3">
                <div class="row">
                    <div id="listNew" class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">생산 목록</span>
                    </div>
                    <div id="searchDiv" class="col-4">
<!-- 	                    <form action="../account/accountInfoPage" method="get"> -->
							<div id="selectNew" class="input-group mb-3">
									<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
										<option selected>선택</option>
										<option value="manufacture_code">생산코드</option>
										<option value="manufacture_manager">생산담당자</option>
										<option value="manufacture_register_employee">생산등록자</option>
									  </select>
									<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
									<button type="button" onclick="refreshManufactureInfo()" class="input-group-text bi bi-search" id="basic-addon1"></button>
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
        <div class="modal fade" id="manufactureRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">생산 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="company_code" onblur="checkRemove()" type="text"  readonly value="${employeeInfo.company_code }${adminInfo.company_code }" class="form-control">
                                    </div>
                                    <div id="company_code_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산상태</span>
                                        <input id="manufacture_state" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="manufacture_state_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산담당자</span>
                                        <input id="manufacture_manager" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="manufacture_manager_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산주문일</span>
                                        <input id="manufacture_date" onblur="checkRemove()" type="date" class="form-control">
                                    </div>
                                    <div id="manufacture_date_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산마감일</span>
                                        <input id="manufacture_due_date" onblur="checkRemove()" type="date" class="form-control">
                                    </div>
                                    <div id="manufacture_due_date_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산등록자</span>
                                        <input id="manufacture_register_employee" onblur="checkRemove()" type="text"  readonly value="${employeeInfo.employee_name }${adminInfo.admin_email }" class="form-control" id="companyEmail">
                                    </div>
                                    <div id="manufacture_register_employee_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="manufacture_memo" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="check()">등록</button>
                  <button id="insertBtn" type="button" class="btn btn-primary" onclick="insertManufactureInfo()" data-bs-dismiss="modal" hidden>등록</button>
                </div>
              </div>
            </div>
          </div>
          
          
        <!-- 수정창 모달 -->
        <div class="modal fade" id="manufactureUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">생산 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                        	<div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="company_code_update" type="text" onblur="checkUpdateRemove()"  readonly value="${employeeInfo.company_code }${adminInfo.company_code }" class="form-control">
                                    </div>
                                    <div id="company_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">수주코드</span>
                                        <input id="manufacture_code_update" type="text" onblur="checkUpdateRemove()"  readonly value="${employeeInfo.company_code }${adminInfo.company_code }" class="form-control">
                                    </div>
                                    <div id="manufacture_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산상태</span>
                                        <input id="manufacture_state_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="manufacture_state_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산담당자</span>
                                        <input id="manufacture_manager_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="manufacture_manager_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산주문일</span>
                                        <input id="manufacture_date_update" onblur="checkUpdateRemove()" type="date" class="form-control">
                                    </div>
                                    <div id="manufacture_date_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산마감일</span>
                                        <input id="manufacture_due_date_update" onblur="checkUpdateRemove()" type="date" class="form-control">
                                    </div>
                                    <div id="manufacture_due_date_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산수정자</span>
                                        <input id="manufacture_update_employee_update" onblur="checkUpdateRemove()"  readonly value="${employeeInfo.employee_name }${adminInfo.admin_email }" type="text" class="form-control">
                                    </div>
                                    <div id="manufacture_update_employee_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="manufacture_memo_update" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>              
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="checkUpdate()">수정</button>
                  <button id="updateBtn" type="button" class="btn btn-primary" onclick="updateManufactureInfo()" data-bs-dismiss="modal" hidden>수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
          
          
          
          
          
           <!-- 디테일 등록창 모달 -->
        <div class="modal fade" id="manufactureDetailRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">생산 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산코드</span>
                                        <input id="manufacture_code_in_detail" onblur="checkDetailRemove()" type="text" readonly class="form-control">
                                    </div>
                                    <div id="manufacture_code_in_detail_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품검색</span>
                                        <input id="searchProduct" type="text" class="form-control" onkeyup="findProduct()">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3" id="upSearchWindowUi">
                       		</div>
                       		<div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품명</span>
                                        <input id="product_name" readonly type="text" onblur="checkDetailRemove()" class="form-control">
                                    </div>
                                    <div id="product_name_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품코드</span>
                                        <input id="product_code" readonly type="text" onblur="checkDetailRemove()" class="form-control">
                                    </div>
                                    <div id="product_code_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품가격</span>
                                        <input id="product_price" type="text" onblur="checkDetailRemove()" class="form-control">
                                    </div>
                                    <div id="product_price_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품수량</span>
                                        <input id="product_amount" type="text" onblur="checkDetailRemove()" class="form-control">
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
                  <button id="insertDetailBtn" type="button" class="btn btn-primary" onclick="insertManufactureDetailInfo()" data-bs-dismiss="modal" hidden>등록</button>
                </div>
              </div>
            </div>
          </div>
          
          
        <!-- 수정창 모달 -->
        <div class="modal fade" id="manufactureDetailUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">생산 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                        	<div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="manufacture_detail_code_update"  onblur="checkDetailUpdateRemove()" readonly type="text" class="form-control">
                                    </div>
                                    <div id="manufacture_detail_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">생산코드</span>
                                        <input id="manufacture_code_in_detail_update"  onblur="checkDetailUpdateRemove()" readonly type="text" class="form-control">
                                    </div>
                                    <div id="manufacture_code_in_detail_update_Alert" class="mb-3"></div>
                                </div>
                           </div>  
                           <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품검색</span>
                                        <input id="searchProductUpdate" type="text" class="form-control" onkeyup="findProductUpdate()">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3" id="upSearchWindowUiUpdate">
                       		</div>
                       		<div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품명</span>
                                        <input id="product_name_update" readonly onblur="checkDetailUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="product_name_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품코드</span>
                                        <input id="product_code_update" readonly onblur="checkDetailUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="product_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품가격</span>
                                        <input id="product_price_update" onblur="checkDetailUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="product_price_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품수량</span>
                                        <input id="product_amount_update" onblur="checkDetailUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="product_amount_update_Alert" class="mb-3"></div>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="checkDatailUpdate()">수정</button>
                  <button id="updateDetailUpdateBtn" type="button" class="btn btn-primary" onclick="updateManufactureDetailInfo()" data-bs-dismiss="modal" hidden>수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>