<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
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
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function exePostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
// 	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
// 	                document.getElementById("sample6_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('account_post_number').value = data.zonecode;
	            document.getElementById("account_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("account_address_detail").focus();
	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('account_post_number_update').value = data.zonecode;
	            document.getElementById("account_address_update").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("account_address_detail_update").focus();
	        }
	    }).open();
	}



	function check(){
		
		document.getElementById("account_representative_Alert").innerHTML = "";
		document.getElementById("company_code_Alert").innerHTML = "";
		document.getElementById("account_name_Alert").innerHTML = "";
		document.getElementById("account_registration_number_Alert").innerHTML = "";
		document.getElementById("account_corporate_registration_number_Alert").innerHTML = "";
		document.getElementById("account_phone_Alert").innerHTML = "";
		document.getElementById("account_pax_number_Alert").innerHTML = "";
		document.getElementById("account_email_Alert").innerHTML = "";
		document.getElementById("account_email_tax_Alert").innerHTML = "";
		document.getElementById("account_post_number_Alert").innerHTML = "";
		document.getElementById("account_address_Alert").innerHTML = "";
		document.getElementById("account_address_detail_Alert").innerHTML = "";
		document.getElementById("account_category_Alert").innerHTML = "";
		document.getElementById("account_registration_jpg_Alert").innerHTML = "";
		
		
		if(document.getElementById("account_representative").value == ""){
			document.getElementById("account_representative_Alert").innerText = "대표명을 먼저 입력해주세요.";
			document.getElementById("account_representative_Alert").classList.add("text-danger");
			document.getElementById("account_representative").focus();
			return;
		}else{	
			document.getElementById("account_representative_Alert").innerHTML = "";
		}
		
		if(document.getElementById("company_code").value == ""){
			document.getElementById("company_code_Alert").innerText = "로그인을 먼저 해주세요.";
			document.getElementById("company_code_Alert").classList.add("text-danger");
			document.getElementById("company_code").focus();
			return;
		}else{	
			document.getElementById("company_code_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_name").value == ""){
			document.getElementById("account_name_Alert").innerText = "회사명을 입력해주셔야 합니다.";
			document.getElementById("account_name_Alert").classList.add("text-danger");
			document.getElementById("account_name").focus();
			return;
		}else{	
			document.getElementById("account_name_Alert").innerHTML = "";
		}
		
		var registerNumRule = /^(\d{3,3})+[-]+(\d{2,2})+[-]+(\d{5,5})$/i;
		
		if(document.getElementById("account_registration_number").value == ""){
			document.getElementById("account_registration_number_Alert").innerText = "사업자번호를 입력해주셔야 합니다.";
			document.getElementById("account_registration_number_Alert").classList.add("text-danger");
			document.getElementById("account_registration_number").focus();
			return;
		}else if(!registerNumRule.test(document.getElementById("account_registration_number").value)){
			document.getElementById("account_registration_number_Alert").innerText = "사업자등록번호가 올바르지 않습니다. (ex : 110-11-11111)";
			document.getElementById("account_registration_number_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_registration_number_Alert").innerHTML = "";
		}
		
		var corporateNumRule = /^(\d{6,6})+[-]+(\d{7,7})$/i;
		
		if(document.getElementById("account_corporate_registration_number").value == ""){
			document.getElementById("account_corporate_registration_number_Alert").innerText = "법인등록번호를 입력해주셔야 합니다.";
			document.getElementById("account_corporate_registration_number_Alert").classList.add("text-danger");
			document.getElementById("account_corporate_registration_number").focus();
			return;
		}else if(!corporateNumRule.test(document.getElementById("account_corporate_registration_number").value)){
			document.getElementById("account_corporate_registration_number_Alert").innerText = "법인등록번호가 올바르지 않습니다. (ex : 111111-1111111)";
			document.getElementById("account_corporate_registration_number_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_corporate_registration_number_Alert").innerHTML = "";
		}
		
		if(document.getElementById("account_phone").value == ""){
			document.getElementById("account_phone_Alert").innerText = "전화번호를 입력해주셔야 합니다.";
			document.getElementById("account_phone_Alert").classList.add("text-danger");
			document.getElementById("account_phone").focus();
			return;
		}else{
			document.getElementById("account_phone_Alert").innerHTML = "";
		}
		
		if(document.getElementById("account_pax_number").value == ""){
			document.getElementById("account_pax_number_Alert").innerText = "팩스번호를 입력해주셔야 합니다.";
			document.getElementById("account_pax_number_Alert").classList.add("text-danger");
			document.getElementById("account_pax_number").focus();
			return;
		}else{
			document.getElementById("account_pax_number_Alert").innerHTML = "";
		}
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(document.getElementById("account_email").value == ""){
			document.getElementById("account_email_Alert").innerText = "이메일(일반)을 입력해주셔야 합니다.";
			document.getElementById("account_email_Alert").classList.add("text-danger");
			document.getElementById("account_email").focus();
			return;
		}else if(!emailRule.test(document.getElementById("account_email").value)){
			document.getElementById("account_email_Alert").innerText = "이메일(일반) 형식이 올바르지 않습니다.";
			document.getElementById("account_email_Alert").classList.add("text-danger");
			document.getElementById("account_email").focus();
			return;
		}
		else{
			document.getElementById("account_email_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_email_tax").value == ""){
			document.getElementById("account_email_tax_Alert").innerText = "이메일(세금계산서)를 입력해주셔야 합니다.";
			document.getElementById("account_email_tax_Alert").classList.add("text-danger");
			document.getElementById("account_email_tax").focus();
			return;
		}else if(!emailRule.test(document.getElementById("account_email_tax").value)){
			document.getElementById("account_email_tax_Alert").innerText = "이메일(세금계산서) 형식이 올바르지 않습니다.";
			document.getElementById("account_email_tax_Alert").classList.add("text-danger");
			document.getElementById("account_email_tax").focus();
			return;
		}else{
			document.getElementById("account_email_tax_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_post_number").value == ""){
			document.getElementById("account_post_number_Alert").innerText = "우편번호를 입력해주셔야 합니다.";
			document.getElementById("account_post_number_Alert").classList.add("text-danger");
			document.getElementById("account_post_number").focus();
			return;
		}else{
			document.getElementById("account_post_number_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_address").value == ""){
			document.getElementById("account_address_Alert").innerText = "주소를 입력해주셔야 합니다.";
			document.getElementById("account_address_Alert").classList.add("text-danger");
			document.getElementById("account_address").focus();
			return;
		}else{
			document.getElementById("account_address_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_address_detail").value == ""){
			document.getElementById("account_address_detail_Alert").innerText = "상세주소를 입력해주셔야 합니다.";
			document.getElementById("account_address_detail_Alert").classList.add("text-danger");
			document.getElementById("account_address_detail").focus();
			return;
		}else{
			document.getElementById("account_address_detail_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_category").value == ""){
			document.getElementById("account_category_Alert").innerText = "거래처 분류를 입력해주셔야 합니다.";
			document.getElementById("account_category_Alert").classList.add("text-danger");
			document.getElementById("account_category").focus();
			return;
		}else{
			document.getElementById("account_category_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_registration_jpg").value == ""){
			document.getElementById("account_registration_jpg_Alert").innerText = "거래처 분류를 입력해주셔야 합니다.";
			document.getElementById("account_registration_jpg_Alert").classList.add("text-danger");
			document.getElementById("account_registration_jpg").focus();
			return;
		}else{
			document.getElementById("account_registration_jpg_Alert").innerHTML = "";
		}
		
		document.getElementById("insertBtn").click();
		
	}
	
	function checkEmail(){
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(document.getElementById("account_email").value == ""){
			document.getElementById("account_email_Alert").innerHTML = "";
		}else if(!emailRule.test(document.getElementById("account_email").value)){
			document.getElementById("account_email_Alert").innerText = "이메일(일반) 형식이 올바르지 않습니다.";
			document.getElementById("account_email_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_email_Alert").innerHTML = "";
		}
	}
	
	
	function checkEmailTax(){
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(document.getElementById("account_email_tax").value == ""){
			document.getElementById("account_email_tax_Alert").innerHTML = "";
		}else if(!emailRule.test(document.getElementById("account_email_tax").value)){
			document.getElementById("account_email_tax_Alert").innerText = "이메일(세금계산서) 형식이 올바르지 않습니다.";
			document.getElementById("account_email_tax_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_email_tax_Alert").innerHTML = "";
		}
	}
	
	function checkRegisterNum(){
		
		var registerNumRule = /^(\d{3,3})+[-]+(\d{2,2})+[-]+(\d{5,5})$/i;
		
		if(document.getElementById("account_registration_number").value == ""){
			document.getElementById("account_registration_number_Alert").innerHTML = "";
		}else if(!registerNumRule.test(document.getElementById("account_registration_number").value)){
			document.getElementById("account_registration_number_Alert").innerText = "사업자등록번호가 올바르지 않습니다. (ex : 110-11-11111)";
			document.getElementById("account_registration_number_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_registration_number_Alert").innerHTML = "";
		}
	}
	
	function checkCorporateNum(){
		
		var corporateNumRule = /^(\d{6,6})+[-]+(\d{7,7})$/i;
		
		if(document.getElementById("account_corporate_registration_number").value == ""){
			document.getElementById("account_corporate_registration_number_Alert").innerHTML = "";
		}else if(!corporateNumRule.test(document.getElementById("account_corporate_registration_number").value)){
			document.getElementById("account_corporate_registration_number_Alert").innerText = "법인등록번호가 올바르지 않습니다. (ex : 111111-1111111)";
			document.getElementById("account_corporate_registration_number_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_corporate_registration_number_Alert").innerHTML = "";
		}
	}
	
	
	function checkEmailUpdate(){
			
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(document.getElementById("account_email_update").value == ""){
				document.getElementById("account_email_update_Alert").innerHTML = "";
			}else if(!emailRule.test(document.getElementById("account_email_update").value)){
				document.getElementById("account_email_update_Alert").innerText = "이메일(일반) 형식이 올바르지 않습니다.";
				document.getElementById("account_email_update_Alert").classList.add("text-danger");
				return;
			}else{
				document.getElementById("account_email_update_Alert").innerHTML = "";
			}
		}
	
	
	function checkEmailTaxUpdate(){
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(document.getElementById("account_email_tax_update").value == ""){
			document.getElementById("account_email_tax_update_Alert").innerHTML = "";
		}else if(!emailRule.test(document.getElementById("account_email_tax_update").value)){
			document.getElementById("account_email_tax_update_Alert").innerText = "이메일(세금계산서) 형식이 올바르지 않습니다.";
			document.getElementById("account_email_tax_update_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_email_tax_update_Alert").innerHTML = "";
		}
	}
	
	function checkRemove(){
		
		if(document.getElementById("account_representative").value != ""){
			document.getElementById("account_representative_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("company_code").value != ""){
			document.getElementById("company_code_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_name").value != ""){
			document.getElementById("account_name_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_registration_number").value != ""){
			document.getElementById("account_registration_number_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_corporate_registration_number").value != ""){
			document.getElementById("account_corporate_registration_number_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_phone").value != ""){
			document.getElementById("account_phone_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_pax_number").value != ""){
			document.getElementById("account_pax_number_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_post_number").value != ""){
			document.getElementById("account_post_number_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_address").value != ""){
			document.getElementById("account_address_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_address_detail").value != ""){
			document.getElementById("account_address_detail_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_category").value != ""){
			document.getElementById("account_category_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_registration_jpg").value != ""){
			document.getElementById("account_registration_jpg_Alert").innerHTML = "";
		}else{
			return;
		}
	}
	
	function checkUpdate(){
		
		document.getElementById("account_representative_update_Alert").innerHTML = "";
		document.getElementById("company_code_update_Alert").innerHTML = "";
		document.getElementById("account_name_update_Alert").innerHTML = "";
		document.getElementById("account_phone_update_Alert").innerHTML = "";
		document.getElementById("account_pax_number_update_Alert").innerHTML = "";
		document.getElementById("account_email_update_Alert").innerHTML = "";
		document.getElementById("account_email_tax_update_Alert").innerHTML = "";
		document.getElementById("account_post_number_update_Alert").innerHTML = "";
		document.getElementById("account_address_update_Alert").innerHTML = "";
		document.getElementById("account_address_detail_update_Alert").innerHTML = "";
		document.getElementById("account_category_update_Alert").innerHTML = "";
		document.getElementById("account_memo_update_Alert").innerHTML = "";
		
		
		if(document.getElementById("account_representative_update").value == ""){
			document.getElementById("account_representative_update_Alert").innerText = "대표명을 먼저 입력해주세요.";
			document.getElementById("account_representative_update_Alert").classList.add("text-danger");
			document.getElementById("account_representative_update").focus();
			return;
		}else{	
			document.getElementById("account_representative_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("company_code_update").value == ""){
			document.getElementById("company_code_update_Alert").innerText = "로그인을 먼저 해주세요.";
			document.getElementById("company_code_update_Alert").classList.add("text-danger");
			document.getElementById("company_code_update").focus();
			return;
		}else{	
			document.getElementById("company_code_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_name_update").value == ""){
			document.getElementById("account_name_update_Alert").innerText = "회사명을 입력해주셔야 합니다.";
			document.getElementById("account_name_update_Alert").classList.add("text-danger");
			document.getElementById("account_name_update").focus();
			return;
		}else{	
			document.getElementById("account_name_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("account_phone_update").value == ""){
			document.getElementById("account_phone_update_Alert").innerText = "전화번호를 입력해주셔야 합니다.";
			document.getElementById("account_phone_update_Alert").classList.add("text-danger");
			document.getElementById("account_phone_update").focus();
			return;
		}else{
			document.getElementById("account_phone_update_Alert").innerHTML = "";
		}
		
		if(document.getElementById("account_pax_number_update").value == ""){
			document.getElementById("account_pax_number_update_Alert").innerText = "팩스번호를 입력해주셔야 합니다.";
			document.getElementById("account_pax_number_update_Alert").classList.add("text-danger");
			document.getElementById("account_pax_number_update").focus();
			return;
		}else{
			document.getElementById("account_pax_number_update_Alert").innerHTML = "";
		}
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		
		if(document.getElementById("account_email_update").value == ""){
			document.getElementById("account_email_update_Alert").innerText = "이메일(일반)을 입력해주셔야 합니다.";
			document.getElementById("account_email_update_Alert").classList.add("text-danger");
			document.getElementById("account_email_update").focus();
			return;
		}else if(!emailRule.test(document.getElementById("account_email_update").value)){
			document.getElementById("account_email_update_Alert").innerText = "이메일(일반) 형식이 올바르지 않습니다.";
			document.getElementById("account_email_update_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_email_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_email_tax_update").value == ""){
			document.getElementById("account_email_tax_update_Alert").innerText = "이메일(세금계산서)를 입력해주셔야 합니다.";
			document.getElementById("account_email_tax_update_Alert").classList.add("text-danger");
			document.getElementById("account_email_tax_update").focus();
			return;
		}else if(!emailRule.test(document.getElementById("account_email_tax_update").value)){
			document.getElementById("account_email_tax_update_Alert").innerText = "이메일(세금계산서) 형식이 올바르지 않습니다.";
			document.getElementById("account_email_tax_update_Alert").classList.add("text-danger");
			return;
		}else{
			document.getElementById("account_email_tax_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_post_number_update").value == ""){
			document.getElementById("account_post_number_update_Alert").innerText = "우편번호를 입력해주셔야 합니다.";
			document.getElementById("account_post_number_update_Alert").classList.add("text-danger");
			document.getElementById("account_post_number_update").focus();
			return;
		}else{
			document.getElementById("account_post_number_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_address_update").value == ""){
			document.getElementById("account_address_update_Alert").innerText = "주소를 입력해주셔야 합니다.";
			document.getElementById("account_address_update_Alert").classList.add("text-danger");
			document.getElementById("account_address_update").focus();
			return;
		}else{
			document.getElementById("account_address_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_address_detail_update").value == ""){
			document.getElementById("account_address_detail_update_Alert").innerText = "상세주소를 입력해주셔야 합니다.";
			document.getElementById("account_address_detail_update_Alert").classList.add("text-danger");
			document.getElementById("account_address_detail_update").focus();
			return;
		}else{
			document.getElementById("account_address_detail_update_Alert").innerHTML = "";
		}
		
		
		if(document.getElementById("account_category_update").value == ""){
			document.getElementById("account_category_update_Alert").innerText = "거래처 분류를 입력해주셔야 합니다.";
			document.getElementById("account_category_update_Alert").classList.add("text-danger");
			document.getElementById("account_category_update").focus();
			return;
		}else{
			document.getElementById("account_category_update_Alert").innerHTML = "";
		}
		
		document.getElementById("updateBtn").click();


	}
	
	function checkUpdateRemove(){
		
		if(document.getElementById("account_representative_update").value != ""){
			document.getElementById("account_representative_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("company_code_update").value != ""){
			document.getElementById("company_code_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_name_update").value != ""){
			document.getElementById("account_name_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_phone_update").value != ""){
			document.getElementById("account_phone_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_pax_number_update").value != ""){
			document.getElementById("account_pax_number_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_email_update").value != ""){
			document.getElementById("account_email_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		
		if(document.getElementById("account_email_tax_update").value != ""){
			document.getElementById("account_email_tax_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_post_number_update").value != ""){
			document.getElementById("account_post_number_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_address_update").value != ""){
			document.getElementById("account_address_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_address_detail_update").value != ""){
			document.getElementById("account_address_detail_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_category_update").value != ""){
			document.getElementById("account_category_update_Alert").innerHTML = "";
		}else{
			return;
		}
		
		if(document.getElementById("account_category_update").value != ""){
			document.getElementById("account_representative_update_Alert").innerHTML = "";
		}else{
			return;
		}


	}
	
	function insertAccountInfo(){
		
		var FD = new FormData();

		var companyCodeVal = document.getElementById("company_code").value;
		var nameVal = document.getElementById("account_name").value;
		var accountRegistrationNumVal = document.getElementById("account_registration_number").value;
		var accountCorporateRegistrationregiNumVal = document.getElementById("account_corporate_registration_number").value;
		var accountRepresentativeVal = document.getElementById("account_representative").value;
		
		var accountPhoneVal = document.getElementById("account_phone").value;
		var accountPaxNumVal = document.getElementById("account_pax_number").value;
		var accountEmailVal = document.getElementById("account_email").value;
		var accountEmailTaxEmailVal = document.getElementById("account_email_tax").value;
		
		var accountPostNumVal = document.getElementById("account_post_number").value;
		var accountAddressVal = document.getElementById("account_address").value;
		var accountAddressDetailVal = document.getElementById("account_address_detail").value;
		var accountCategoryVal = document.getElementById("account_category").value;
		var accountMemoVal = document.getElementById("account_memo").value;
		
		var accountRegistrationJpg = document.getElementById("account_registration_jpg");
		var file = accountRegistrationJpg.files[0];
		
		console.log(accountRegistrationJpg);
		console.log("value = " + accountRegistrationJpg.value);
		
		console.log("궁금한 것 " + file);
		
// 	    for (let i = 0; i < files.length; i++) {
// 	        FD.append('files', files[i]);
// 	    }
		
		 FD.append("company_code",companyCodeVal);
		 FD.append("account_name",nameVal);
		 FD.append("account_registration_number", accountRegistrationNumVal); 
		 FD.append("account_corporate_registration_number", accountCorporateRegistrationregiNumVal);
		 FD.append("account_representative", accountRepresentativeVal);
		 
		 FD.append("account_phone", accountPhoneVal);
		 FD.append("account_pax_number", accountPaxNumVal);
		 FD.append("account_email", accountEmailVal);
		 FD.append("account_email_tax", accountEmailTaxEmailVal);
		 
		 FD.append("account_post_number", accountPostNumVal);
		 FD.append("account_address", accountAddressVal);
		 FD.append("account_address_detail", accountAddressDetailVal);
		 FD.append("account_category", accountCategoryVal);
		 FD.append("account_memo", accountMemoVal);
		 FD.append("file", file);
		 
		 
// 		 for(var pair of FD.entries()){
// 			 console.log(pair[0] + ',' + pair[1]);
// 		 }


		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				document.getElementById("account_name").value = "";
				document.getElementById("account_registration_number").value = "";
				document.getElementById("account_corporate_registration_number").value = "";
				document.getElementById("account_representative").value = "";
				document.getElementById("account_phone").value = "";
				document.getElementById("account_pax_number").value = "";
				document.getElementById("account_email").value = "";
				document.getElementById("account_email_tax").value = "";
				document.getElementById("account_post_number").value = "";
				document.getElementById("account_address").value = "";
				document.getElementById("account_address_detail").value = "";
				document.getElementById("account_category").value = "";
				document.getElementById("account_memo").value = "";
				document.getElementById("account_registration_jpg").value = "";
				
				refreshAccountInfo();
				
				
			}
		}
		
		xhr.open("post" , "./insertAccountInfo");
// 		xhr.setRequestHeader("Content-type", "multipart/form-data");
// 		xhr.send("company_code=" + companyCodeVal +"&account_name=" + nameVal + "&account_registration_number=" + accountRegistrationNumVal + "&account_corporate_registration_number=" + accountCorporateRegistrationregiNumVal + 
// 				"&account_representative=" + accountRepresentativeVal + "&account_phone=" + accountPhoneVal + "&account_pax_number=" + accountPaxNumVal + 
// 				"&account_email=" + accountEmailVal + "&account_email_tax=" + accountEmailTaxEmailVal + "&account_post_number=" + accountPostNumVal + 
// 				"&account_address=" + accountAddressVal + "&account_address_detail=" + accountAddressDetailVal + "&account_category=" + accountCategoryVal +
// 				"&account_memo=" + accountMemoVal
// 				);		
		xhr.send(FD);
		
		
	}
	
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
	    

		var accountCode	= document.getElementById("account_code_update");
		var companyCode	= document.getElementById("company_code_update");
		var accountName = document.getElementById("account_name_update");
		var accountRepresentative = document.getElementById("account_representative_update");
		var accountPhone = document.getElementById("account_phone_update");
		var accountPaxNum = document.getElementById("account_pax_number_update");
		var accountEmail = document.getElementById("account_email_update");
		var accountEmailTaxEmail = document.getElementById("account_email_tax_update");
		var accountPostNum = document.getElementById("account_post_number_update");
		var accountAddress = document.getElementById("account_address_update");
		var accountAddressDetail = document.getElementById("account_address_detail_update");
		var accountCategory = document.getElementById("account_category_update");
		var accountMemo = document.getElementById("account_memo_update");
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
					
					accountCode.value = jsonObj.account_code;
					companyCode.value = jsonObj.company_code;
					accountName.value = jsonObj.account_name;
					accountRepresentative.value = jsonObj.account_representative;
					accountPhone.value = jsonObj.account_phone;
					accountPaxNum.value = jsonObj.account_pax_number;
					accountEmail.value = jsonObj.account_email;
					accountEmailTaxEmail.value = jsonObj.account_email_tax;
					accountPostNum.value = jsonObj.account_post_number;
					accountAddress.value = jsonObj.account_address;
					accountAddressDetail.value = jsonObj.account_address_detail;
					accountCategory.value = jsonObj.account_category;
					accountMemo.value = jsonObj.account_memo;


					document.getElementById("updateModalStart").click();

					
					
				
			}
		}
		
		xhr.open("get", "./selectAccountInfo?account_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
	
	function cleanUpdateModal(){
		
		document.getElementById("account_code_update").value = "";
		document.getElementById("company_code_update").value = "";
		document.getElementById("account_name_update").value = "";
		document.getElementById("account_representative_update").value = "";
		document.getElementById("account_phone_update").value = "";
		document.getElementById("account_pax_number_update").value = "";
		document.getElementById("account_email_update").value = "";
		document.getElementById("account_email_tax_update").value = "";
		document.getElementById("account_post_number_update").value = "";
		document.getElementById("account_address_update").value = "";
		document.getElementById("account_address_detail_update").value = "";
		document.getElementById("account_category_update").value = "";
		document.getElementById("account_memo_update").value = "";
	}
		
	
	function updateAccountInfo(){
		
		var accountCodeVal = document.getElementById("account_code_update").value;
		var companyCodeVal = document.getElementById("company_code_update").value;
		var accountNameVal = document.getElementById("account_name_update").value;
		var accountRepresentativeVal = document.getElementById("account_representative_update").value;
		var accountPhoneVal = document.getElementById("account_phone_update").value;
		var accountPaxNumVal = document.getElementById("account_pax_number_update").value;
		var accountEmailVal = document.getElementById("account_email_update").value;
		var accountEmailTaxEmailVal = document.getElementById("account_email_tax_update").value;
		var accountPostNumVal = document.getElementById("account_post_number_update").value;
		var accountAddressVal = document.getElementById("account_address_update").value;
		var accountAddressDetailVal = document.getElementById("account_address_detail_update").value;
		var accountCategoryVal = document.getElementById("account_category_update").value;
		var accountMemoVal = document.getElementById("account_memo_update").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				document.getElementById("account_code_update").value = "";				
				document.getElementById("company_code_update").value = "";	
				document.getElementById("account_name_update").value = "";
				document.getElementById("account_representative_update").value = "";
				document.getElementById("account_phone_update").value = "";
				document.getElementById("account_pax_number_update").value = "";
				document.getElementById("account_email_update").value = "";
				document.getElementById("account_email_tax_update").value = "";
				document.getElementById("account_post_number_update").value = "";
				document.getElementById("account_address_update").value = "";
				document.getElementById("account_address_detail_update").value = "";
				document.getElementById("account_category_update").value = "";
				document.getElementById("account_memo_update").value = "";
				
			}
		}
		
		xhr.open("post" , "./updateAccountInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("account_code=" + accountCodeVal + "&company_code=" + companyCodeVal + "&account_name=" + accountNameVal + 
				"&account_representative=" + accountRepresentativeVal + "&account_phone=" + accountPhoneVal + "&account_pax_number=" + accountPaxNumVal + 
				"&account_email=" + accountEmailVal + "&account_email_tax=" + accountEmailTaxEmailVal + "&account_post_number=" + accountPostNumVal + 
				"&account_address=" + accountAddressVal + "&account_address_detail=" + accountAddressDetailVal + "&account_category=" + accountCategoryVal +
				"&account_memo=" + accountMemoVal);		
		
		refreshAccountInfo();
		
		
	}
	
 	function excelDowunload(){

	    var checkVal = new Array();
	    
        console.log(checkVal);
	    
	    var obj_length = document.getElementsByName("checkAccount").length;
	    console.log(obj_length);
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkAccount")[i].checked == true) {
            	
            	checkVal[i] = document.getElementsByName("checkAccount")[i].value;
            }
        }
        
		
		document.excelFo.code.value = checkVal;
		
		var excelForm = document.getElementById("excelForm");
		excelForm.submit();
		
		refreshAccountInfo();
        
 	}
 	
//  	function excelUpload(){

// 	    var checkVal = new Array();
	    
//         console.log(checkVal);
	    
// 	    var obj_length = document.getElementsByName("checkAccount").length;
// 	    console.log(obj_length);
	    
//         for (var i = 0; i < obj_length; i++) {

//             if (document.getElementsByName("checkAccount")[i].checked == true) {
            	
//             	checkVal[i] = document.getElementsByName("checkAccount")[i].value;
//             }
//         }
        
		
// 		document.excelFo.code.value = checkVal;
		
// 		var excelForm = document.getElementById("excelForm");
// 		excelForm.submit();
		
// 		refreshAccountInfo();
        
//  	}

	
	function deleteAccountInfo(){
		
	    var checkVal = new Array();
	    
        console.log(checkVal);
	    
	    var obj_length = document.getElementsByName("checkAccount").length;
	    console.log(obj_length);
	    
        for (var i = 0; i < obj_length; i++) {

            if (document.getElementsByName("checkAccount")[i].checked == true) {
            	
            	checkVal[i] = document.getElementsByName("checkAccount")[i].value;
            }
        }
        
        console.log(checkVal);
 	
	
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				
			}
		}
		
		xhr.open("post" , "./deleteAccountInfo" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		refreshAccountInfo();
		
		
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
		th2.innerText = "거래처코드";
		tr1.appendChild(th2);
		
		var th3 = document.createElement("th");
		th3.innerText = "회사코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "회사명";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "사업자등록번호";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "법인등록번호";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "대표명";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "전화번호";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "팩스번호";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "이메일번호";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "이메일번호(세금)";
		tr1.appendChild(th11);

		var th12 = document.createElement("th");
		th12.innerText = "우편번호";
		tr1.appendChild(th12);

		var th13 = document.createElement("th");
		th13.innerText = "주소";
		tr1.appendChild(th13);

		var th14 = document.createElement("th");
		th14.innerText = "상세주소";
		tr1.appendChild(th14);

		var th15 = document.createElement("th");
		th15.innerText = "거래처분류";
		tr1.appendChild(th15);

		var th16 = document.createElement("th");
		th16.innerText = "거래처등록일";
		tr1.appendChild(th16);

		var th17 = document.createElement("th");
		th17.innerText = "메모";
		tr1.appendChild(th17);

		var th18 = document.createElement("th");
		th18.innerText = "사업자등록증(클릭확인)";
		tr1.appendChild(th18);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.accountList){
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
				inputIn1.setAttribute("name","checkAccount");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.account_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.account_code;
				trIn1.appendChild(td2);
				
				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);
				
// 				console.log(td2.innerText);

				var td4 = document.createElement("td");
				td4.innerText = commentData.account_name;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.account_registration_number;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.account_corporate_registration_number;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = commentData.account_representative;
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = commentData.account_phone;
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = commentData.account_pax_number;
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.account_email;
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.account_email_tax;
				trIn1.appendChild(td11);

				var td12 = document.createElement("td");
				td12.innerText = commentData.account_post_number;
				trIn1.appendChild(td12);

				var td13 = document.createElement("td");
				td13.innerText = commentData.account_address;
				trIn1.appendChild(td13);

				var td14 = document.createElement("td");
				td14.innerText = commentData.account_address_detail;
				trIn1.appendChild(td14);

				var td15 = document.createElement("td");
				td15.innerText = commentData.account_category;
				trIn1.appendChild(td15);

				var td16 = document.createElement("td");
				td16.innerText = moment(commentData.account_registration).format('YYYY-MM-DD');
				trIn1.appendChild(td16);

				var td17 = document.createElement("td");
				td17.innerText = commentData.account_memo;
				trIn1.appendChild(td17);

				var td18 = document.createElement("td");
				td18.innerText = commentData.account_registration_jpg;
                td18.setAttribute("style","color:blue;");
				td18.setAttribute("onclick","location.href='../../uploadFilesWms/"+ commentData.account_registration_jpg +"'")
				trIn1.appendChild(td18);
				
				
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
					inA1.setAttribute("href","javascript:refreshAccountInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshAccountInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../account/accountInfo?searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
 	function refreshAccountInfoPage(pageNumVal,clickSearchTypeVal,clickSearchWordVal){
 		
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
		th2.innerText = "거래처코드";
		tr1.appendChild(th2);
		
		var th3 = document.createElement("th");
		th3.innerText = "회사코드";
		tr1.appendChild(th3);

		var th4 = document.createElement("th");
		th4.innerText = "회사명";
		tr1.appendChild(th4);

		var th5 = document.createElement("th");
		th5.innerText = "사업자등록번호";
		tr1.appendChild(th5);

		var th6 = document.createElement("th");
		th6.innerText = "법인등록번호";
		tr1.appendChild(th6);

		var th7 = document.createElement("th");
		th7.innerText = "대표명";
		tr1.appendChild(th7);

		var th8 = document.createElement("th");
		th8.innerText = "전화번호";
		tr1.appendChild(th8);

		var th9 = document.createElement("th");
		th9.innerText = "팩스번호";
		tr1.appendChild(th9);

		var th10 = document.createElement("th");
		th10.innerText = "이메일번호";
		tr1.appendChild(th10);

		var th11 = document.createElement("th");
		th11.innerText = "이메일번호(세금)";
		tr1.appendChild(th11);

		var th12 = document.createElement("th");
		th12.innerText = "우편번호";
		tr1.appendChild(th12);

		var th13 = document.createElement("th");
		th13.innerText = "주소";
		tr1.appendChild(th13);

		var th14 = document.createElement("th");
		th14.innerText = "상세주소";
		tr1.appendChild(th14);

		var th15 = document.createElement("th");
		th15.innerText = "거래처분류";
		tr1.appendChild(th15);

		var th16 = document.createElement("th");
		th16.innerText = "거래처등록일";
		tr1.appendChild(th16);

		var th17 = document.createElement("th");
		th17.innerText = "메모";
		tr1.appendChild(th17);

		var th18 = document.createElement("th");
		th18.innerText = "사업자등록증(클릭확인)";
		tr1.appendChild(th18);
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
// 				console.log(jsonObj.accountList);
				
// 				console.log(jsonObj.startPage);
				
				for(commentData of jsonObj.accountList){
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
				inputIn1.setAttribute("name","checkAccount");
				inputIn1.setAttribute("type","checkbox");
				inputIn1.setAttribute("value",commentData.account_code);
				td1.appendChild(inputIn1);
				
// 				console.log(inputIn1.value);

				var td2 = document.createElement("td");
				td2.innerText = commentData.account_code;
				trIn1.appendChild(td2);
				
				var td3 = document.createElement("td");
				td3.innerText = commentData.company_code;
				trIn1.appendChild(td3);
				
// 				console.log(td2.innerText);

				var td4 = document.createElement("td");
				td4.innerText = commentData.account_name;
				trIn1.appendChild(td4);

				var td5 = document.createElement("td");
				td5.innerText = commentData.account_registration_number;
				trIn1.appendChild(td5);

				var td6 = document.createElement("td");
				td6.innerText = commentData.account_corporate_registration_number;
				trIn1.appendChild(td6);

				var td7 = document.createElement("td");
				td7.innerText = commentData.account_representative;
				trIn1.appendChild(td7);

				var td8 = document.createElement("td");
				td8.innerText = commentData.account_phone;
				trIn1.appendChild(td8);

				var td9 = document.createElement("td");
				td9.innerText = commentData.account_pax_number;
				trIn1.appendChild(td9);

				var td10 = document.createElement("td");
				td10.innerText = commentData.account_email;
				trIn1.appendChild(td10);

				var td11 = document.createElement("td");
				td11.innerText = commentData.account_email_tax;
				trIn1.appendChild(td11);

				var td12 = document.createElement("td");
				td12.innerText = commentData.account_post_number;
				trIn1.appendChild(td12);

				var td13 = document.createElement("td");
				td13.innerText = commentData.account_address;
				trIn1.appendChild(td13);

				var td14 = document.createElement("td");
				td14.innerText = commentData.account_address_detail;
				trIn1.appendChild(td14);

				var td15 = document.createElement("td");
				td15.innerText = commentData.account_category;
				trIn1.appendChild(td15);

				var td16 = document.createElement("td");
				td16.innerText = moment(commentData.account_registration).format('YYYY-MM-DD');
				trIn1.appendChild(td16);

				var td17 = document.createElement("td");
				td17.innerText = commentData.account_memo;
				trIn1.appendChild(td17);

				var td18 = document.createElement("td");
				td18.innerText = commentData.account_registration_jpg;
                td18.setAttribute("style","color:blue;");
				td18.setAttribute("onclick","location.href='../../uploadFilesWms/"+ commentData.account_registration_jpg +"'")
				trIn1.appendChild(td18);
				
				
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
					inA1.setAttribute("href","javascript:refreshAccountInfoPage("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:refreshAccountInfoPage("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
		
		xhr.open("get", "../account/accountInfo?pageNum="+ pageNumVal +"&searchType=" + clickSearchTypeVal + "&searchWord=" + clickSearchWordVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
 	}
 	
// 	$( "#btn-bundle-regist" ).on( "click", function() {
			
// 	        $("#excelUploadForm").ajaxSubmit( {
	        	
// 	        	success : function(data) {
	        		
// 	        		if( !$.isArray( data ) || data.length == 0 ) {
// 	        			alert( "추가된 사용자가 없습니다." );
// 	        			return;
// 	        		}
	        		
// 	            	if( data ) {
// 	                	alert("수신자번호 추가가 완료되었습니다.");
// 	            	} 
// 	            	else {
// 	            		alert("데이터 업로드에 실패하였습니다. 잠시 후 다시 시도해 주세요.");
// 	            	}
// 	            }
// 	            ,type : "POST"
// 	//            ,async : false
// 	            ,error: function (e) {
// 	            	console.log("ERROR : ", e);
// 	            }
// 	        } );
		    
// 		} );
 	


	window.addEventListener("DOMContentLoaded" , function (){
	//사실상 처음 실행하는 코드 모음...
	refreshAccountInfo();
	//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
	
	});
	
	
</script>
	
<title>거래처</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">   
		<div class="row">
	        <div class="col form-control mt-3">
	        	<div class="row">
		        	<div class="col-4 mx-0">
			             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#accountRegist">
			                등록
			             </button>
			             <button onclick="selectAccount()" id="updateModal" type="button" class="btn btn-light">
			             	수정
			             </button>
   			             <button id="updateModalStart" type="button" hidden class="btn btn-light" data-bs-toggle="modal" data-bs-target="#accountUpdate">
			             	수정
			             </button>
		            	 <button onclick="deleteAccountInfo()" type="button" class="btn btn-light">
		            		삭제
		            	 </button>
		            </div>
		            <div class="col-8 text-end mx-0 pt-1">
		            	<div class="row">
		            		<div class="col">
       				             <form id="excelForm" name="excelFo" action="../account/excel/download" method="post">
					             	<input type="hidden" name="code" value="">
									<input type="button" value="Excel 다운로드" onclick="excelDowunload()" type="button" class="btn btn-light">
								</form>
		            		</div>
		            		<div class="col ps-0">
								<form id="excelUploadForm"  name="excelUploadForm" enctype="multipart/form-data" method="post" 
								action= "../account/excel/read_excel">
									<div class="row">
										<div class="col">
	                                    	<input id="excelFile" name="excelFile" type="file" accept=".xlsx" class="form-control">
										</div>
										<div class="col-3 ps-0 ms-0">
											<input type="submit" value="Excel 업로드" type="button" class="btn btn-light">
										</div>
									</div>
								</form>
		            		</div>
		            		<div class="col-2">
		            			<span class="fs-5">거래처 관리</span>
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
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">거래처 목록</span>
                    </div>
                    <div id="searchDiv" class="col-4">
<!-- 	                    <form action="../account/accountInfoPage" method="get"> -->
							<div class="input-group mb-3">
									<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
										<option selected>선택</option>
										<option value="account_code">거래처코드</option>
										<option value="account_name">회사명</option>
										<option value="account_representative">대표명</option>
									  </select>
									<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
									<button type="button" onclick="refreshAccountInfo()" class="input-group-text bi bi-search" id="basic-addon1"></button>
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
        <div class="modal fade" id="accountRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">거래처 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">대표명</span>
                                        <input id="account_representative" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_representative_Alert" class="mb-3"></div>
                                </div>
                            </div>
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
                                        <span class="input-group-text">회사명</span>
                                        <input id="account_name" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_name_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">사업자등록번호</span>
                                        <input id="account_registration_number" onblur="checkRegisterNum()" type="text" class="form-control">
                                    </div>
                                    <div id="account_registration_number_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">법인등록번호</span>
                                        <input id="account_corporate_registration_number" onblur="checkCorporateNum()" type="text" class="form-control">
                                    </div>
                                    <div id="account_corporate_registration_number_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">전화번호</span>
                                        <input id="account_phone" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_phone_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">팩스번호</span>
                                        <input id="account_pax_number" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_pax_number_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(일반)</span>
                                        <input id="account_email" onblur="checkEmail()" type="text" class="form-control">
                                    </div>
                                    <div id="account_email_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(세금계산서)</span>
                                        <input id="account_email_tax" onblur="checkEmailTax()" type="text" class="form-control">
                                    </div>
                                    <div id="account_email_tax_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">우편번호</span>
                                        <input id="account_post_number" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_post_number_Alert" onblur="checkRemove()" class="mb-3"></div>
                                </div>
                                <div class="col">
                                        <input value="우편번호 찾기" onclick="exePostcode()" class="btn btn-outline-primary" style="width:200px;">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주소</span>
                                        <input id="account_address" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_address_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">상세주소</span>
                                        <input id="account_address_detail" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_address_detail_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처 분류</span>
                                        <input id="account_category" onblur="checkRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_category_Alert" class="mb-3"></div>
                                </div>
                            </div>
                             <div class="row my-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">사업자등록증</label>
                                    <input id="account_registration_jpg" onblur="checkRemove()" type="file" accept="image/*" class="form-control">
                                </div>
                                <div id="account_registration_jpg_Alert" class="mb-3"></div> 
                            </div>   
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="account_memo" class="form-control" style="height: 100px"></textarea>
                                </div>
                            </div>      
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="check()">등록</button>
                  <button type="button" id="insertBtn" class="btn btn-primary" onclick="insertAccountInfo()" data-bs-dismiss="modal" hidden>등록</button>
                </div>
              </div>
            </div>
          </div>
          
          
        <!-- 수정창 모달 -->
        <div class="modal fade" id="accountUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">거래처 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        	<div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처코드</span>
                                        <input id="account_code_update" readonly onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_code_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">대표명</span>
                                        <input id="account_representative_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_representative_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사코드</span>
                                        <input id="company_code_update" onblur="checkUpdateRemove()" type="text"  readonly value="${employeeInfo.company_code }${adminInfo.company_code }" class="form-control">
                                    </div>
                                    <div id="company_code_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사명</span>
                                        <input id="account_name_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_name_update_Alert" class="mb-3"></div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">전화번호</span>
                                        <input id="account_phone_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_phone_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">팩스번호</span>
                                        <input id="account_pax_number_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_pax_number_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(일반)</span>
                                        <input id="account_email_update" onblur="checkEmailUpdate()" type="text" class="form-control">
                                    </div>
                                    <div id="account_email_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(세금계산서)</span>
                                        <input id="account_email_tax_update" onblur="checkEmailTaxUpdate()" type="text" class="form-control">
                                    </div>
                                    <div id="account_email_tax_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">우편번호</span>
                                        <input id="account_post_number_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_post_number_update_Alert" class="mb-3"></div>
                                </div>
                                <div class="col">
                                        <input value="우편번호 찾기" onclick="exePostcode()" class="btn btn-outline-primary" style="width:200px;">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주소</span>
                                        <input id="account_address_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_address_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">상세주소</span>
                                        <input id="account_address_detail_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_address_detail_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처 분류</span>
                                        <input id="account_category_update" onblur="checkUpdateRemove()" type="text" class="form-control">
                                    </div>
                                    <div id="account_category_update_Alert" class="mb-3"></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <input class="form-control text-center" type="text" value="비고" aria-label="Disabled input example" disabled readonly>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <textarea id="account_memo_update" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                                <div id="account_memo_update_Alert" class="mb-3"></div>
                            </div>              
                        </div>
                    </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="checkUpdate()">수정</button>
                  <button type="button" id="updateBtn" class="btn btn-primary" onclick="updateAccountInfo()" data-bs-dismiss="modal" hidden>수정</button>
                </div>
              </div>
            </div>
          </div>
          
          

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>