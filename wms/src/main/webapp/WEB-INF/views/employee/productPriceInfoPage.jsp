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

//원 표시 자동변환 script
function changeMoneyUnit() {
	var moneyValue = document.querySelectorAll(".money");
	const moneyUnit = "원"
	var regex = /[^0-9]/g;
	for(i of moneyValue){
		result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		result = result.concat(moneyUnit);
		i.innerText = result;
	}
}

// 자동변환 script
function changeAmountUnit() {
	var moneyValue = document.querySelectorAll(".amount");
	const moneyUnit = ""
	var regex = /[^0-9]/g;
	for(i of moneyValue){
		result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		result = result.concat(moneyUnit);
		i.innerText = result;
	}
}

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


	function excelDowunload(){
	
	    var checkVal = new Array();
	    
	    console.log(checkVal);
	    
	    var obj_length = document.getElementsByName("checkProductPrice").length;
	    console.log(obj_length);
	    
	    for (var i = 0; i < obj_length; i++) {
	
	        if (document.getElementsByName("checkProductPrice")[i].checked == true) {
	        	
	        	checkVal[i] = document.getElementsByName("checkProductPrice")[i].value;
	        }
	    }
		
		document.excelFo.code.value = checkVal;
		
		var excelForm = document.getElementById("excelForm");
		excelForm.submit();
		
		refreshProductInfo();
	    
		}

	function check(){

		document.getElementById("company_code_Alert").innerHTML = "";
		document.getElementById("product_code_Alert").innerHTML = "";
		document.getElementById("product_name_Alert").innerHTML = "";
		document.getElementById("product_price_purchase_Alert").innerHTML = "";
		document.getElementById("product_price_purchase_date_Alert").innerHTML = "";
		document.getElementById("product_price_selling_Alert").innerHTML = "";
		document.getElementById("product_price_selling_date_Alert").innerHTML = "";
		
		
		if(document.getElementById("company_code").value == ""){
			document.getElementById("company_code_Alert").innerText = "로그인을 먼저 해주세요.";
			document.getElementById("company_code_Alert").classList.add("text-danger");
			document.getElementById("company_code").focus();
			return;
		}else{	
			document.getElementById("company_code_Alert").innerHTML = "";
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
			document.getElementById("product_name_Alert").innerText = "제품명을 입력해주셔야 합니다.";
			document.getElementById("product_name_Alert").classList.add("text-danger");
			document.getElementById("product_name").focus();
			return;
		}else{	
			document.getElementById("product_name_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_price_purchase").value == ""){
			document.getElementById("product_price_purchase_Alert").innerText = "제품구매단가를 입력해주셔야 합니다.";
			document.getElementById("product_price_purchase_Alert").classList.add("text-danger");
			document.getElementById("product_price_purchase").focus();
			return;
		}else{
			document.getElementById("product_price_purchase_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("product_price_purchase_date").value == ""){
			document.getElementById("product_price_purchase_date_Alert").innerText = "제품구매일을 입력해주셔야 합니다.";
			document.getElementById("product_price_purchase_date_Alert").classList.add("text-danger");
			document.getElementById("product_price_purchase_date").focus();
			return;
		}else{
			document.getElementById("product_price_purchase_date_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_price_selling").value == ""){
			document.getElementById("product_price_selling_Alert").innerText = "제품판매단가를 입력해주셔야 합니다.";
			document.getElementById("product_price_selling_Alert").classList.add("text-danger");
			document.getElementById("product_price_selling").focus();
			return;
		}else{
			document.getElementById("product_price_selling_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_price_selling_date").value == ""){
			document.getElementById("product_price_selling_date_Alert").innerText = "제품판매일을 입력해주셔야 합니다.";
			document.getElementById("product_price_selling_date_Alert").classList.add("text-danger");
			document.getElementById("product_price_selling_date").focus();
			return;
		}else{
			document.getElementById("product_price_selling_date_Alert").innerHTML = "";
		}
		
		
		document.getElementById("insertBtn").click();
		
	}
	
	function checkRemove(){
		
		if(document.getElementById("company_code").value != ""){
			document.getElementById("company_code_Alert").innerHTML = "";
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
		
		if(document.getElementById("product_price_purchase").value != ""){
			document.getElementById("product_price_purchase_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_price_purchase_date").value != ""){
			document.getElementById("product_price_purchase_date_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_price_selling").value != ""){
			document.getElementById("product_price_selling_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_price_selling_date").value != ""){
			document.getElementById("product_price_selling_date_Alert").innerHTML = "";
		}else{
			return;
		}
		
	}
	
	function checkUpdate(){
		
		document.getElementById("company_code_update_Alert").innerHTML = "";
		document.getElementById("product_code_update_Alert").innerHTML = "";
		document.getElementById("product_name_update_Alert").innerHTML = "";
		document.getElementById("product_price_purchase_update_Alert").innerHTML = "";
		document.getElementById("product_price_purchase_date_update_Alert").innerHTML = "";
		document.getElementById("product_price_selling_update_Alert").innerHTML = "";
		document.getElementById("product_price_selling_date_update_Alert").innerHTML = "";
		
		
		if(document.getElementById("company_code_update").value == ""){
			document.getElementById("company_code_update_Alert").innerText = "로그인을 먼저 해주세요.";
			document.getElementById("company_code_update_Alert").classList.add("text-danger");
			document.getElementById("company_code_update").focus();
			return;
		}else{	
			document.getElementById("company_code_Alert").innerHTML = "";
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
		
		if(document.getElementById("product_price_purchase_update").value == ""){
			document.getElementById("product_price_purchase_update_Alert").innerText = "제품구매단가를 입력해주셔야 합니다.";
			document.getElementById("product_price_purchase_update_Alert").classList.add("text-danger");
			document.getElementById("product_price_purchase_update").focus();
			return;
		}else{
			document.getElementById("product_price_purchase_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("product_price_purchase_date_update").value == ""){
			document.getElementById("product_price_purchase_date_update_Alert").innerText = "제품구매일을 입력해주셔야 합니다.";
			document.getElementById("product_price_purchase_date_update_Alert").classList.add("text-danger");
			document.getElementById("product_price_purchase_date_update").focus();
			return;
		}else{
			document.getElementById("product_price_purchase_date_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_price_selling_update").value == ""){
			document.getElementById("product_price_selling_update_Alert").innerText = "제품판매단가를 입력해주셔야 합니다.";
			document.getElementById("product_price_selling_update_Alert").classList.add("text-danger");
			document.getElementById("product_price_selling_update").focus();
			return;
		}else{
			document.getElementById("product_price_selling_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("product_price_selling_date_update").value == ""){
			document.getElementById("product_price_selling_date_update_Alert").innerText = "제품판매일을 입력해주셔야 합니다.";
			document.getElementById("product_price_selling_date_update_Alert").classList.add("text-danger");
			document.getElementById("product_price_selling_date_update").focus();
			return;
		}else{
			document.getElementById("product_price_selling_date_update_Alert").innerHTML = "";
		}
		
		document.getElementById("updateBtn").click();
		
	
	}
	
	function checkUpdateRemove(){
		
		if(document.getElementById("company_code_update").value != ""){
			document.getElementById("company_code_update_Alert").innerHTML = "";
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
		
		if(document.getElementById("product_price_purchase_update").value != ""){
			document.getElementById("product_price_purchase_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_price_purchase_date_update").value != ""){
			document.getElementById("product_price_purchase_date_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_price_selling_update").value != ""){
			document.getElementById("product_price_selling_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("product_price_selling_date_update").value != ""){
			document.getElementById("product_price_selling_date_update_Alert").innerHTML = "";
		}else{
			return;
		}
	
	
	}
	
	function insertProductPriceInfo(){
		console.log("뭐니");
		var productCodeVal = document.getElementById("product_code").value;
		var companyCodeVal = document.getElementById("company_code").value;
		var productNameVal = document.getElementById("product_name").value;
		var productPricePurchaseVal = parseInt(document.getElementById("product_price_purchase").value);
		var productPricePurchaseDateVal = document.getElementById("product_price_purchase_date").value;
		var productPriceSellingVal = parseInt(document.getElementById("product_price_selling").value);
		var productPriceSellingDateVal = document.getElementById("product_price_selling_date").value;
		var productPriceMemoVal = document.getElementById("product_price_memo").value;
		
// 		document.writeln(typeof productCodeVal);
// 		document.writeln(typeof productNameVal);
// 		document.writeln(typeof productPricePurchaseVal);
// 		document.writeln(typeof productPricePurchaseDateVal);
// 		document.writeln(typeof productPriceSellingVal);
// 		document.writeln(typeof productPriceSellingDateVal);
// 		document.writeln(typeof productPriceMemoVal);
		
		
		console.log("여기양");
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
			document.getElementById("product_code").value = "";
			document.getElementById("product_name").value = "";
			document.getElementById("product_price_purchase").value = "";
			document.getElementById("product_price_purchase_date").value = "";
			document.getElementById("product_price_selling").value = "";
			document.getElementById("product_price_selling_date").value = "";
			document.getElementById("product_price_memo").value = "";
			
			
			refreshProductPriceInfo();
				
			}
		}
		
		xhr.open("post" , "./insertProductPriceInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("product_code=" + productCodeVal + "&company_code=" + companyCodeVal + 
				"&product_name=" + productNameVal + 
				"&product_price_purchase=" + productPricePurchaseVal + 
				"&product_price_purchase_date=" + productPricePurchaseDateVal + 
				"&product_price_selling=" + productPriceSellingVal + 
				"&product_price_selling_date=" + productPriceSellingDateVal +
				"&product_price_memo=" + productPriceMemoVal);
		
		

	}
	
	function selectProductPrice(){
		
	    var checkVal = "";
	    
	    var obj_length = document.getElementsByName("checkProductPrice").length;
	    
	    var count = 0;
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkProductPrice")[i].checked == true) {
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

            if (document.getElementsByName("checkProductPrice")[i].checked == true) {
            	checkVal = document.getElementsByName("checkProductPrice")[i].value;
            }
        }
        
        document.getElementById("product_price_code_update").value = "";
		document.getElementById("company_code_update").value = "";
		document.getElementById("product_code_update").value = "";
		document.getElementById("product_name_update").value = "";
		document.getElementById("product_price_purchase_update").value = "";
		document.getElementById("product_price_purchase_date_update").value = "";
		document.getElementById("product_price_selling_update").value = "";
		document.getElementById("product_price_selling_date_update").value = "";
		document.getElementById("product_price_memo_update").value = "";
	    
		var productPriceCode = document.getElementById("product_price_code_update");
		var companyCode = document.getElementById("company_code_update");
		var productCode = document.getElementById("product_code_update");
		var productName = document.getElementById("product_name_update");
		var productPricePurchase = document.getElementById("product_price_purchase_update");
		var productPricePurchaseDate = document.getElementById("product_price_purchase_date_update");
		var productPriceSelling = document.getElementById("product_price_selling_update");
		var productPriceSellingDate = document.getElementById("product_price_selling_date_update");
		var productPriceMemo = document.getElementById("product_price_memo_update");
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
				productPriceCode.value = jsonObj.product_price_code;
				companyCode.value = jsonObj.company_code;
				productCode.value = jsonObj.product_code;
				productName.value = jsonObj.product_name;
				productPricePurchase.value = parseInt(jsonObj.product_price_purchase);
				productPricePurchaseDate.value = moment(jsonObj.product_price_purchase_date).format('YYYY-MM-DD');
				productPriceSelling.value = parseInt(jsonObj.product_price_selling);
				productPriceSellingDate.value = moment(jsonObj.product_price_selling_date).format('YYYY-MM-DD');
				productPriceMemo.value = jsonObj.product_price_memo;
				
				document.getElementById("updateModalStart").click();

			}
		}
		
		xhr.open("get", "./selectProductPriceInfo?product_price_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
		
	
	function updateProductPriceInfo(){
		
		var productPriceCodeVal = document.getElementById("product_price_code_update").value;
		var companyCodeVal = document.getElementById("company_code_update").value;
		var productCodeVal = document.getElementById("product_code_update").value;
		var productNameVal = document.getElementById("product_name_update").value;
		var productPricePurchaseVal = parseInt(document.getElementById("product_price_purchase_update").value);
		var productPricePurchaseDateVal = moment(document.getElementById("product_price_purchase_date_update").value).format('YYYY-MM-DD');
		var productPriceSellingVal = parseInt(document.getElementById("product_price_selling_update").value);
		var productPriceSellingDateVal = moment(document.getElementById("product_price_selling_date_update").value).format('YYYY-MM-DD');
		var productPriceMemoVal = document.getElementById("product_price_memo_update").value;
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
		        document.getElementById("product_price_code_update").value = "";
		        document.getElementById("company_code_update").value = "";
				document.getElementById("product_code_update").value = "";
				document.getElementById("product_name_update").value = "";
				document.getElementById("product_price_purchase_update").value = "";
				document.getElementById("product_price_purchase_date_update").value = "";
				document.getElementById("product_price_selling_update").value = "";
				document.getElementById("product_price_selling_date_update").value = "";
				document.getElementById("product_price_memo_update").value = "";
				
				
				refreshProductPriceInfo();	

				
			}
		}

// 		xhr.open("post" , "./updateObtainOrderInfo" , false);
// 		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
// 		xhr.send("obtain_order_code=" + obtainOrderCodeVal + "&company_code=" + companyCodeVal + 
// 				"&account_code=" + accountCodeVal + "&obtain_order_state=" + obtainOrderStateVal + 
// 				"&obtain_order_manager=" + obtainOrderManagerVal +
// 				"&obtain_order_register_employee=" + obtainOrderRegisterEmployeeVal + 
// 				"&obtain_order_update_employee=" + obtainOrderUpdateEmployeeVal +
// 				"&obtain_order_memo=" + obtainOrderMemoVal);
		
		xhr.open("post" , "./updateProductPriceInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("product_price_code=" + productPriceCodeVal + "&company_code=" + companyCodeVal +
				"&product_code=" + productCodeVal + 
				"&product_name=" + productNameVal + "&product_price_purchase=" + productPricePurchaseVal + 
				"&product_price_purchase_date=" + productPricePurchaseDateVal + "&product_price_selling=" + productPriceSellingVal + 
				"&product_price_selling_date=" + productPriceSellingDateVal + 
				"&product_price_memo=" + productPriceMemoVal);


	}
	
	function deleteProductPriceInfo(){
		
	    var checkVal = new Array();
	    
	    
	    var obj_length = document.getElementsByName("checkProductPrice").length;
	    
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkProductPrice")[i].checked == true) {
            	
            	checkVal[i] = document.getElementsByName("checkProductPrice")[i].value;
            }
        }
 	
	
		var xhr = new XMLHttpRequest();
// 		xhr.onreadystatechange = function () {
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var result = JSON.parse(xhr.responseText);	
					
				
// 			}
// 		}
		
		xhr.open("post" , "./deleteProductPriceInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		refreshProductPriceInfo();
		
		
	}
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=check_all]").checked;

		var list = document.getElementsByName("checkProductPrice");
		
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
		var list = document.getElementsByName("checkProductPrice");
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
	
 	function refreshProductPriceInfo(){
 		
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
		th2.innerText = "제품단가코드";
		tr1.appendChild(th2);
		
		var th2 = document.createElement("th");
		th2.innerText = "회사코드";
		tr1.appendChild(th2);

		var th4 = document.createElement("th");
		th4.innerText = "제품코드";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "제품명";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "제품구매단가";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "제품구매일";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "제품판매단가";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "제품판매일";
		tr1.appendChild(th9);
		
		var th10 = document.createElement("th");
		th10.innerText = "비고";
		tr1.appendChild(th10);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.productPriceList){
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
				inputIn1.setAttribute("name","checkProductPrice");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.product_price_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.product_price_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.product_code;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.product_name;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.product_price_purchase;
				td6.classList.add("money");
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = moment(commentData.product_price_purchase_date).format('YYYY-MM-DD');
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = commentData.product_price_selling;
				td8.classList.add("money");
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = moment(commentData.product_price_selling_date).format('YYYY-MM-DD');
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.product_price_memo;
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
					inA1.setAttribute("href","javascript:refreshProductPriceInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshProductPriceInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshProductPriceInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshProductPriceInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA3.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				}
				changeMoneyUnit();
				changeAmountUnit();
			}
		}
		
		xhr.open("get", "../employee/productPriceInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshProductPriceInfoPage(pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
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
		th2.innerText = "제품단가코드";
		tr1.appendChild(th2);

		var th3 = document.createElement("th");
		th3.innerText = "제품코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "제품명";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "제품구매단가";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "제품구매일";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "제품판매단가";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "제품판매일";
		tr1.appendChild(th8);
		
		var th9 = document.createElement("th");
		th9.innerText = "비고";
		tr1.appendChild(th9);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.productPriceList){
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
				inputIn1.setAttribute("name","checkProductPrice");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.product_price_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.product_price_code;
				trIn1.appendChild(td2);
				
// 				console.log(td2.innerText);

				var td3 = document.createElement("td");
				td3.innerText = commentData.product_code;
				trIn1.appendChild(td3);

				var td4 = document.createElement("td");
				td4.innerText = commentData.product_name;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.product_price_purchase;
				td5.classList.add("money");
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = moment(commentData.product_price_purchase_date).format('YYYY-MM-DD');
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = commentData.product_price_selling;
				td7.classList.add("money");
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = moment(commentData.product_price_selling_date).format('YYYY-MM-DD');
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = commentData.product_price_memo;
				trIn1.appendChild(td9);
				
				
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
					inA1.setAttribute("href","javascript:refreshProductPriceInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:refreshProductPriceInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 						inA2.setAttribute("href","./accountInfo?pageNum="+i+jsonObj.additionalParam);
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}else{
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						createUl.appendChild(inLi2);

						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:refreshProductPriceInfoPage("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshProductPriceInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
// 					inA3.setAttribute("href","./accountInfo?pageNum="+startPage+-1+additionalParam);
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				}
				changeMoneyUnit();
				changeAmountUnit();
			}
		}
		
		xhr.open("get", "../employee/productPriceInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}

	window.addEventListener("DOMContentLoaded" , function (){
	//사실상 처음 실행하는 코드 모음...
	refreshProductPriceInfo();
	//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
	
	});
	
	
</script>
	
<title>제품단가정보</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">   
		<div class="row">
	        <div class="col form-control mt-3">
	        	<div class="row">
		        	<div class="col-6 mx-0">
			             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#productPriceRegist">
			                등록
			             </button>
			             <button onclick="selectProductPrice()" id="updateModal" type="button" class="btn btn-light">
			             	수정
			             </button>
   			             <button id="updateModalStart" type="button" hidden class="btn btn-light" data-bs-toggle="modal" data-bs-target="#productPriceUpdate">
			             	수정
			             </button>
		            	 <button onclick="deleteProductPriceInfo()" type="button" class="btn btn-light">
		            		삭제
		            	 </button>
		            </div>
		            <div class="col-6 text-end mx-0 pt-1">
		            	<div class="row">
			            	<div class="col">
	  				             <form id="excelForm" name="excelFo" action="../employee/productPrice/excel/download" method="post">
					             	<input type="hidden" name="code" value="">
									<input type="button" value="Excel 다운로드" onclick="excelDowunload()" type="button" class="btn btn-light">
								</form>
		            		</div>
		            		<div class="col-2 ps-0">
	      				             <form id="excelUploadForm" name="excelUploadFo" action="#" method="post">
					             	<input type="hidden" name="code" value="">
									<input type="button" value="Excel 업로드" onclick="excelUpload()" type="button" class="btn btn-light">
								</form>
		            		</div>
		            		<div class="col-3">
			            		<span class="fs-5">제품 단가 관리</span>
			            	</div>
		            	</div>
		            </div>
	            </div>
	        </div>   
        </div>
        <div class="row">
            <div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">제품 단가 목록</span>
                    </div>
                    <div id="searchDiv" class="col-4">
<!-- 	                    <form action="../account/accountInfoPage" method="get"> -->
							<div class="input-group mb-3">
									<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
										<option selected>선택</option>
										<option value="product_price_code">제품단가코드</option>
										<option value="product_code">제품코드</option>
										<option value="product_name">제품명</option>
									  </select>
									<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
									<button type="button" onclick="refreshProductPriceInfo()" class="input-group-text bi bi-search" id="basic-addon1"></button>
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
        <div class="modal fade" id="productPriceRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">제품 단가 등록</h5>
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
                                        <span class="input-group-text">제품검색</span>
                                        <input id="searchProduct" type="text" class="form-control" onkeyup="findProduct()">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품명</span>
                                        <input id="product_name" readonly onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="product_name_Alert" class="mb-3"></div>
                                </div>                               
                            </div>                            
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품코드</span>
                                        <input id="product_code" readonly onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                </div>
                            	<div id="product_code_Alert" class="mb-3"></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품구매단가</span>
                                        <input id="product_price_purchase" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="product_price_purchase_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품구매일</span>
                                        <input id="product_price_purchase_date" onblur="checkRemove()" type="date" class="form-control">
                                    </div>
                                    <div id="product_price_purchase_date_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품판매단가</span>
                                        <input id="product_price_selling" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="product_price_selling_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품판매일</span>
                                        <input id="product_price_selling_date" onblur="checkRemove()" type="date" class="form-control">
                                    </div>
                                     <div id="product_price_selling_date_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="product_price_memo" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="check()">등록</button>
                  <button id="insertBtn" type="button" class="btn btn-primary" onclick="insertProductPriceInfo()" data-bs-dismiss="modal" hidden>등록</button>
                </div>
              </div>
            </div>
          </div>
          
          
        <!-- 수정창 모달 -->
        <div class="modal fade" id="productPriceUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">제품 단가 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                        	<div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="company_code_update" onblur="checkUpdateRemove()" readonly type="text" class="form-control">
                                    </div>
                                     <div id="company_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품단가코드</span>
                                        <input id="product_price_code_update" onblur="checkUpdateRemove()" readonly type="text" class="form-control">
                                    </div>
                                     <div id="product_price_code_update_Alert" class="mb-3"></div>
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
                                        <input id="product_name_update" readonly onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                     <div id="product_name_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>                                                        
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품코드</span>
                                        <input id="product_code_update" readonly onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                     <div id="product_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품구매단가</span>
                                        <input id="product_price_purchase_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                      <div id="product_price_purchase_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품구매일</span>
                                        <input id="product_price_purchase_date_update" onblur="checkUpdateRemove()" type="date" class="form-control">
                                    </div>
                                      <div id="product_price_purchase_date_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품판매단가</span>
                                        <input id="product_price_selling_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                      <div id="product_price_selling_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">제품판매일</span>
                                        <input id="product_price_selling_date_update" type="date" class="form-control">
                                    </div>
                                      <div id="product_price_selling_date_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="product_price_memo_update" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>              
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="checkUpdate()">수정</button>
                  <button id="updateBtn" type="button" class="btn btn-primary" onclick="updateProductPriceInfo()" data-bs-dismiss="modal" hidden>수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>