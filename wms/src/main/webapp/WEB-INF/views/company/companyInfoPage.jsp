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
	//	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	//	                document.getElementById("sample6_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('companyPostNumber').value = data.zonecode;
	            document.getElementById("companyAddress").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("companyAddressDetail").focus();
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('uMPostNum').value = data.zonecode;
	            document.getElementById("uMAddress").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("uMAdDetail").focus();
		        }
		    }).open();
		}
			
	
	
	function insertCompanyInfo() {
			
		var nameVal = document.getElementById("companyName").value;
		var retVal = document.getElementById("companyRepresentative").value;
		var regiNumVal = document.getElementById("companyRegistrationNumber").value;
		var coRegiNumVal = document.getElementById("companyCorporateRegistrationNumber").value;
		var companyPhoneVal = document.getElementById("companyPhone").value;
		var paxNumberVal = document.getElementById("companyPaxNumber").value;
		var emailVal = document.getElementById("companyEmail").value;
		var taxEmailVal = document.getElementById("companyEmailTax").value;
		var postNumVal = document.getElementById("companyPostNumber").value;
		var addressVal = document.getElementById("companyAddress").value;
		var addressDetailVal = document.getElementById("companyAddressDetail").value;
		var memoVal = document.getElementById("companyMemo").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				document.getElementById("companyName").value = "";
				document.getElementById("companyRepresentative").value = "";
				document.getElementById("companyRegistrationNumber").value = "";
				document.getElementById("companyCorporateRegistrationNumber").value = "";
				document.getElementById("companyPhone").value = "";
				document.getElementById("companyPaxNumber").value = "";
				document.getElementById("companyEmail").value = "";
				document.getElementById("companyEmailTax").value = "";
				document.getElementById("companyPostNumber").value = "";
				document.getElementById("companyAddress").value = "";
				document.getElementById("companyAddressDetail").value = "";
				document.getElementById("companyMemo").value = "";
				
				refreshSession();
				viewCompanyInfo();
				
			}
		}
		
		xhr.open("post" , "./insertCompanyInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("company_name=" + nameVal + "&company_representative=" + retVal + "&company_registration_number=" + regiNumVal + 
				"&company_corporate_registration_number=" + coRegiNumVal + "&company_phone=" + companyPhoneVal + "&company_pax_number=" + paxNumberVal + 
				"&company_email=" + emailVal + "&company_email_tax=" + taxEmailVal + "&company_post_number=" + postNumVal + 
				"&company_address=" + addressVal + "&company_address_detail=" + addressDetailVal + "&company_memo=" + memoVal);		
		
	}
	
	
	function viewCompanyInfo() {
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);				
				
				if(jsonObj.company.company == null){
					
					var btnCotroller = document.getElementById("btnCotroller");
					btnCotroller.innerHTML = "";
					
					var regiBtn = document.createElement("button");
					regiBtn.type = "button";
					regiBtn.classList.add("btn");
					regiBtn.classList.add("btn-light");
					regiBtn.innerText = "등록";
					btnCotroller.appendChild(regiBtn);	
					
					var formbox = document.getElementById("companyInfoForm");
					formbox.classList.add("text-center");
					formbox.innerHTML = "";
					
					var nullWarning = document.createElement("div");
					nullWarning.classList.add("card-body");
					nullWarning.classList.add("text-center");
					nullWarning.classList.add("fs-2");
					nullWarning.classList.add("mt-5");				
					formbox.appendChild(nullWarning);
					
					var buildingIcon = document.createElement("i");
					buildingIcon.classList.add("bi");
					buildingIcon.classList.add("bi-building");
					nullWarning.appendChild(buildingIcon);
					
					var textSpan = document.createElement("span");
					textSpan.classList.add("fs-4");
					textSpan.innerText = " "+ " " + "아직 회사를 등록하지 않으셨습니다.";
					nullWarning.appendChild(textSpan);
					
					var row = document.createElement("div");
					row.classList.add("row");
					row.classList.add("mt-3");
					formbox.appendChild(row);
					
					var col1 = document.createElement("div");
					col1.classList.add("col");
					row.appendChild(col1);
					
					var col2 = document.createElement("div");
					col2.classList.add("col");
					col2.classList.add("d-grid")
					row.appendChild(col2);
					
					var warnBtn = document.createElement("button");
					warnBtn.type = "button";
					warnBtn.classList.add("btn");
					warnBtn.classList.add("btn-primary");
					warnBtn.innerText = "등록하기";
					warnBtn.setAttribute("data-bs-toggle","modal");
					warnBtn.setAttribute("data-bs-target","#companyRegist");
					col2.appendChild(warnBtn);
					
					var col3 = document.createElement("div");
					col3.classList.add("col");
					row.appendChild(col3);
					
					var row2 = document.createElement("div");
					row2.classList.add("row");
					row2.classList.add("mb-5");
					formbox.appendChild(row2);
					
				}else{
				
					var btnCotroller = document.getElementById("btnCotroller");
					btnCotroller.innerHTML = "";
					
					var updateBtn = document.createElement("button");
					updateBtn.type = "button";
					updateBtn.classList.add("btn");
					updateBtn.classList.add("btn-light");
					updateBtn.innerText = "수정";
					updateBtn.setAttribute("data-bs-toggle","modal");
					updateBtn.setAttribute("data-bs-target","#companyUpdate");
					btnCotroller.appendChild(updateBtn);
					
					//정보 표시
					
					var refName = document.getElementById("companyRef");
					refName.innerText = jsonObj.company.company.company_representative;
					
					var coCode = document.getElementById("companyCode");
					coCode.innerText = jsonObj.company.company.company_code;
					
					var coName = document.getElementById("companyName");
					coName.innerText = jsonObj.company.company.company_name;
					
					var regiDate = document.getElementById("regiDate");
					regiDate.innerText = moment(jsonObj.company.company.company_registration).format('YYYY.MM.DD');
					
					/* var fmtValue = document.createElement("fmt");
					fmtValue.setAttribute("formatDate","pattern=yy년MM월dd일");
					fmtValue.vlaue = jsonObj.company.company.company_registration;
					regiDate.appendChild(fmtValue);
					 */
					
					var regNum = document.getElementById("regNum");
					regNum.innerText = jsonObj.company.company.company_registration_number;
					 
					var corNum = document.getElementById("corNum");
					corNum.innerText = jsonObj.company.company.company_corporate_registration_number;
					 
					var phoneNum = document.getElementById("phoneNum");
					phoneNum.innerText = jsonObj.company.company.company_phone;
					 
					var faxNum = document.getElementById("faxNum");
					faxNum.innerText = jsonObj.company.company.company_pax_number;
					 
					var email = document.getElementById("email");
					email.innerText = jsonObj.company.company.company_email;
					 
					var tEamil = document.getElementById("tEmail");
					tEamil.innerText = jsonObj.company.company.company_email_tax;
					 
					var postNum = document.getElementById("postNum");
					postNum.innerText = jsonObj.company.company.company_post_number;
					 
					var address = document.getElementById("address");
					address.innerText = jsonObj.company.company.company_address;
					 
					var adDetail = document.getElementById("adDetail");
					adDetail.innerText = jsonObj.company.company.company_address_detail;
					 
					var memo = document.getElementById("memo");
					memo.innerText = jsonObj.company.company.company_memo;
					 
					//update modal 렌더링
					
				 	var uMRefName = document.getElementById("uMRefName");
					uMRefName.value = jsonObj.company.company.company_representative;
					
					var uMCoName = document.getElementById("uMCoName");
					uMCoName.value = jsonObj.company.company.company_name;
									
					/* var uMFmtValue = document.createElement("fmt");
					uMFmtValue.setAttribute("formatDate","pattern=yy년MM월dd일");
					uMFmtValue.vlaue = jsonObj.company.company.company_registration;
					uMRegiDate.appendChild(uMFmtValue);*/
					 			
					var uMRegNum = document.getElementById("uMRegNum");
					uMRegNum.value = jsonObj.company.company.company_registration_number;
					 
					var uMCorNum = document.getElementById("uMCorNum");
					uMCorNum.value = jsonObj.company.company.company_corporate_registration_number;
					 
					var uMPhoneNum = document.getElementById("uMPhoneNum");
					uMPhoneNum.value = jsonObj.company.company.company_phone;
					 
					var uMFaxNum = document.getElementById("uMFaxNum");
					uMFaxNum.value = jsonObj.company.company.company_pax_number;
					 
					var uMEmail = document.getElementById("uMEmail");
					uMEmail.value = jsonObj.company.company.company_email;
					 
					var uMTEamil = document.getElementById("uMTEamil");
					uMTEamil.value = jsonObj.company.company.company_email_tax;
					 
					var uMPostNum = document.getElementById("uMPostNum");
					uMPostNum.value = jsonObj.company.company.company_post_number;
					 
					var uMAddress = document.getElementById("uMAddress");
					uMAddress.value = jsonObj.company.company.company_address;
					 
					var uMAdDetail = document.getElementById("uMAdDetail");
					uMAdDetail.value = jsonObj.company.company.company_address_detail;
					 
					var uMMemo = document.getElementById("uMMemo");
					uMMemo.value = jsonObj.company.company.company_memo;
				
				}
				 
			}
		}
		
		xhr.open("get" , "./myCompanyInfo");
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("");		
		
	}
	
	function refreshSession(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				location.reload()
				
			}
		}
		
		xhr.open("get" , "./refreshSession");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();		
		
	}
	
	function updateCompany(){
		
		var upNameVal = document.getElementById("uMCoName").value;
		var upRetVal = document.getElementById("uMRefName").value;
		var upRegiNumVal = document.getElementById("uMRegNum").value;
		var upCoRegiNumVal = document.getElementById("uMCorNum").value;
		var upCompanyPhoneVal = document.getElementById("uMPhoneNum").value;
		var upPaxNumberVal = document.getElementById("uMFaxNum").value;
		var upEmailVal = document.getElementById("uMEmail").value;
		var upTaxEmailVal = document.getElementById("uMTEamil").value;
		var upPostNumVal = document.getElementById("uMPostNum").value;
		var upAddressVal = document.getElementById("uMAddress").value;
		var upAddressDetailVal = document.getElementById("uMAdDetail").value;
		var upMemoVal =document.getElementById("uMMemo").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				viewCompanyInfo()
				
			}
		}
		
		xhr.open("post" , "./updateMyCompany");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("company_name=" + upNameVal + "&company_representative=" + upRetVal + "&company_registration_number=" + upRegiNumVal + 
				"&company_corporate_registration_number=" + upCoRegiNumVal + "&company_phone=" + upCompanyPhoneVal + "&company_pax_number=" + upPaxNumberVal + 
				"&company_email=" + upEmailVal + "&company_email_tax=" + upTaxEmailVal + "&company_post_number=" + upPostNumVal + 
				"&company_address=" + upAddressVal + "&company_address_detail=" + upAddressDetailVal + "&company_memo=" + upMemoVal);		
		
	}
		
	function keepThisForm(){
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var registerNumRule = /^(\d{3,3})+[-]+(\d{2,2})+[-]+(\d{5,5})$/i;
		var corporateNumRule = /^(\d{6,6})+[-]+(\d{7,7})$/i;	
		
		if(document.getElementById("companyName").value == ""){
			document.getElementById("companyNameAlert").innerText = "회사명을 입력해주십시오.";
			document.getElementById("companyNameAlert").classList.add("text-danger");
			document.getElementById("companyName").focus();
			return;
		}else if(document.getElementById("companyRepresentative").value == ""){
			document.getElementById("companyRepresentativeAlert").innerText = "성명을 입력해주십시오.";
			document.getElementById("companyRepresentativeAlert").classList.add("text-danger");
			document.getElementById("companyRepresentative").focus();
			return;
		}else if(document.getElementById("companyPhone").value == ""){
			document.getElementById("companyPhoneAlert").innerText = "기업 전화번호를 입력해주십시오.";
			document.getElementById("companyPhoneAlert").classList.add("text-danger");
			document.getElementById("companyPhone").focus();
			return;
		}else if(document.getElementById("companyPaxNumber").value == ""){
			document.getElementById("companyPaxNumberAlert").innerText = "기업 팩스번호를 입력해주십시오.";
			document.getElementById("companyPaxNumberAlert").classList.add("text-danger");
			document.getElementById("companyPaxNumber").focus();
			return;
		}else if(document.getElementById("companyPostNumber").value == "" || document.getElementById("companyAddress").value = ""){
			document.getElementById("addressAlert").innerText = "주소 검색 기능을 이용해주십시오";
			document.getElementById("addressAlert").classList.add("text-danger");
			document.getElementById("companyPostNumber").focus();
			return;
		}else if(document.getElementById("companyAddressDetail").value == ""){
			document.getElementById("companyAddressDetailAlert").innerText = "상세 주소를 입력해주십시오.";
			document.getElementById("companyAddressDetailAlert").classList.add("text-danger");
			document.getElementById("companyAddressDetail").focus();
			return;
		}else if(document.getElementById("companyEmail").value == ""){
			document.getElementById("companyEmailAlert").innerText = "이메일을 입력해주십시오.";
			document.getElementById("companyEmailAlert").classList.add("text-danger");
			document.getElementById("companyEmail").focus();
			return
		}else if(document.getElementById("companyEmailTax").value == ""){
			document.getElementById("companyEmailTaxAlert").innerText = "세금계산서 이메일을 입력해주십시오.";
			document.getElementById("companyEmailTaxAlert").classList.add("text-danger");
			document.getElementById("companyEmailTax").focus();
			return;
		}else if(!emailRule.test(document.getElementById("companyEmail").value)){
			document.getElementById("companyEmailFormAlert").innerText = "이메일 형식이 올바르지 않습니다.";
			document.getElementById("companyEmailFormAlert").classList.add("text-danger");
			document.getElementById("companyEmail").focus();
			return;
		}else if(!emailRule.test(document.getElementById("companyEmailTax").value)){
			document.getElementById("companyEmailTaxFormAlert").innerText = "세금계산서 이메일 형식이 올바르지 않습니다.";
			document.getElementById("companyEmailTaxFormAlert").classList.add("text-danger");
			document.getElementById("companyEmailTax").focus();
			return;
		}else if(!registerNumRule.test(document.getElementById("companyRegistrationNumber").value)){
			document.getElementById("companyRegistrationNumberFormAlert").innerText = "사업자등록번호가 올바르지 않습니다. (ex : 110-11-11111)";
			document.getElementById("companyRegistrationNumberFormAlert").classList.add("text-danger");
			document.getElementById("companyRegistrationNumber").focus();
			return;
		}else if(document.getElementById("companyRegistrationNumber").value == ""){
			document.getElementById("companyRegistrationNumberAlert").innerText = "사업자등록번호를 입력해주십시오.";
			document.getElementById("companyRegistrationNumberAlert").classList.add("text-danger");
			document.getElementById("companyRegistrationNumber").focus();
			return;
		}else if(document.getElementById("companyCorporateRegistrationNumber").value == ""){
			document.getElementById("companyCorporateRegistrationNumberAlert").innerText = "법인등록번호를 입력해주십시오.";
			document.getElementById("companyCorporateRegistrationNumberAlert").classList.add("text-danger");
			document.getElementById("companyCorporateRegistrationNumber").focus();	
			return;
		}else if(!corporateNumRule.test(document.getElementById("companyCorporateRegistrationNumber").value)){
			document.getElementById("companyCorporateRegistrationNumberFormAlert").innerText = "법인등록번호가 올바르지 않습니다. (ex : 110-11-11111)";
			document.getElementById("companyCorporateRegistrationNumberFormAlert").classList.add("text-danger");
			document.getElementById("companyCorporateRegistrationNumber").focus();
			return;
		}else{
			insertCompanyInfo();
		}
	}
	
	function keepThisUpdateForm(){
		
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var registerNumRule = /^(\d{3,3})+[-]+(\d{2,2})+[-]+(\d{5,5})$/i;
		var corporateNumRule = /^(\d{6,6})+[-]+(\d{7,7})$/i;	
		
		if(document.getElementById("companyName").value == ""){
			document.getElementById("companyNameAlert").innerText = "회사명을 입력해주십시오.";
			document.getElementById("companyNameAlert").classList.add("text-danger");
			document.getElementById("companyName").focus();
			return;
		}else if(document.getElementById("companyRepresentative").value == ""){
			document.getElementById("companyRepresentativeAlert").innerText = "성명을 입력해주십시오.";
			document.getElementById("companyRepresentativeAlert").classList.add("text-danger");
			document.getElementById("companyRepresentative").focus();
			return;
		}else if(document.getElementById("companyPhone").value == ""){
			document.getElementById("companyPhoneAlert").innerText = "기업 전화번호를 입력해주십시오.";
			document.getElementById("companyPhoneAlert").classList.add("text-danger");
			document.getElementById("companyPhone").focus();
			return;
		}else if(document.getElementById("companyPaxNumber").value == ""){
			document.getElementById("companyPaxNumberAlert").innerText = "기업 팩스번호를 입력해주십시오.";
			document.getElementById("companyPaxNumberAlert").classList.add("text-danger");
			document.getElementById("companyPaxNumber").focus();
			return;
		}else if(document.getElementById("companyPostNumber").value == "" || document.getElementById("companyAddress").value = ""){
			document.getElementById("addressAlert").innerText = "주소 검색 기능을 이용해주십시오";
			document.getElementById("addressAlert").classList.add("text-danger");
			document.getElementById("companyPostNumber").focus();
			return;
		}else if(document.getElementById("companyAddressDetail").value == ""){
			document.getElementById("companyAddressDetailAlert").innerText = "상세 주소를 입력해주십시오.";
			document.getElementById("companyAddressDetailAlert").classList.add("text-danger");
			document.getElementById("companyAddressDetail").focus();
			return;
		}else if(document.getElementById("companyEmail").value == ""){
			document.getElementById("companyEmailAlert").innerText = "이메일을 입력해주십시오.";
			document.getElementById("companyEmailAlert").classList.add("text-danger");
			document.getElementById("companyEmail").focus();
			return
		}else if(document.getElementById("companyEmailTax").value == ""){
			document.getElementById("companyEmailTaxAlert").innerText = "세금계산서 이메일을 입력해주십시오.";
			document.getElementById("companyEmailTaxAlert").classList.add("text-danger");
			document.getElementById("companyEmailTax").focus();
			return;
		}else if(!emailRule.test(document.getElementById("companyEmail").value)){
			document.getElementById("companyEmailFormAlert").innerText = "이메일 형식이 올바르지 않습니다.";
			document.getElementById("companyEmailFormAlert").classList.add("text-danger");
			document.getElementById("companyEmail").focus();
			return;
		}else if(!emailRule.test(document.getElementById("companyEmailTax").value)){
			document.getElementById("companyEmailTaxFormAlert").innerText = "세금계산서 이메일 형식이 올바르지 않습니다.";
			document.getElementById("companyEmailTaxFormAlert").classList.add("text-danger");
			document.getElementById("companyEmailTax").focus();
			return;
		}else if(!registerNumRule.test(document.getElementById("companyRegistrationNumber").value)){
			document.getElementById("companyRegistrationNumberFormAlert").innerText = "사업자등록번호가 올바르지 않습니다. (ex : 110-11-11111)";
			document.getElementById("companyRegistrationNumberFormAlert").classList.add("text-danger");
			document.getElementById("companyRegistrationNumber").focus();
			return;
		}else if(document.getElementById("companyRegistrationNumber").value == ""){
			document.getElementById("companyRegistrationNumberAlert").innerText = "사업자등록번호를 입력해주십시오.";
			document.getElementById("companyRegistrationNumberAlert").classList.add("text-danger");
			document.getElementById("companyRegistrationNumber").focus();
			return;
		}else if(document.getElementById("companyCorporateRegistrationNumber").value == ""){
			document.getElementById("companyCorporateRegistrationNumberAlert").innerText = "법인등록번호를 입력해주십시오.";
			document.getElementById("companyCorporateRegistrationNumberAlert").classList.add("text-danger");
			document.getElementById("companyCorporateRegistrationNumber").focus();	
			return;
		}else if(!corporateNumRule.test(document.getElementById("companyCorporateRegistrationNumber").value)){
			document.getElementById("companyCorporateRegistrationNumberFormAlert").innerText = "법인등록번호가 올바르지 않습니다. (ex : 110-11-11111)";
			document.getElementById("companyCorporateRegistrationNumberFormAlert").classList.add("text-danger");
			document.getElementById("companyCorporateRegistrationNumber").focus();
			return;
		}else{
			
		}
		
	}
	
	window.addEventListener("DOMContentLoaded" , function (){
			
			viewCompanyInfo();
			
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
                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#companyRegist">
                   등록
                </button>
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
                            <span class="input-group-text">대표명</span>
                            <span class="form-control" id="companyRef"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">회사코드</span>
                            <span class="form-control" id="companyCode"></span>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">회사명</span>
                            <span class="form-control" id="companyName"></span>
                        </div>
                    </div>
                    <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">시스템 등록일</span>
                             <span class="form-control" id="regiDate"></span>
                         </div>
                     </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">사업자등록번호</span>
                            <span class="form-control" id="regNum"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">법인등록번호</span>
                            <span class="form-control" id ="corNum"></span>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">전화번호</span>
                            <span class="form-control" id="phoneNum"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">팩스번호</span>
                            <span class="form-control" id="faxNum"></span>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">이메일(일반)</span>
                            <span class="form-control" id="email"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">이메일(세금계산서)</span>
                            <span class="form-control" id="tEmail"></span>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">우편번호</span>
                            <span class="form-control" id="postNum"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">주소</span>
                            <span class="form-control" id="address"></span>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="input-group">
                            <span class="input-group-text">상세주소</span>
                            <span class="form-control" id="adDetail"></span>
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
                        <div class="card">
                            <div class="card-body" id="memo">
                            
                            </div>
                      </div>
                    </div>  
                </div>
                <div class="row mt-3">
                    <div class="input-group">
                        <label class="input-group-text" for="inputGroupFile01">회사 로고</label>
                        <input type="file" class="form-control" id="inputGroupFile01">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="input-group">
                        <label class="input-group-text" for="inputGroupFile01">배경화면</label>
                        <input type="file" class="form-control" id="inputGroupFile02">
                    </div>
                </div>
                <div class="row my-3">
                    <div class="input-group">
                        <label class="input-group-text" for="inputGroupFile01">사업자등록증</label>
                        <input type="file" class="form-control" id="inputGroupFile03">
                    </div>
                </div>                  
            </div>
        </div>
        <!-- 등록창 모달 -->
        <div class="modal fade" id="companyRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">회사 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="ent-list form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">대표명</span>
                                        <input type="text" class="form-control" id="companyRepresentative">
                                        <div id="companyRepresentativeAlert"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사명</span>
                                        <input type="text" class="form-control" id="companyName">
                                        <div id="companyNameAlert"></div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">사업자등록번호</span>
                                        <input type="text" class="form-control" id="companyRegistrationNumber">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">법인등록번호</span>
                                        <input type="text" class="form-control" id="companyCorporateRegistrationNumber">
                                        <div id="companyCorporateRegistrationNumberAlert"></div>
                                        <div id="companyCorporateRegistrationNumberFormAlert"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">전화번호</span>
                                        <input type="text" class="form-control" id="companyPhone">
                                        <div id="companyPhoneAlert"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">팩스번호</span>
                                        <input type="text" class="form-control" id="companyPaxNumber">
                                        <div id="companyPaxNumberAlert"> </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(일반)</span>
                                        <input type="text" class="form-control" id="companyEmail">
                                        <div id="companyEmailAlert"></div>
                                        <div id="companyEmailFormAlert"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(세금계산서)</span>
                                        <input type="text" class="form-control" id="companyEmailTax">
                                        <div id="companyEmailTaxAlert"></div>
                                        <div id="companyEmailTaxFormAlert"> </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">우편번호</span>
                                        <input type="text" class="form-control" id="companyPostNumber" onclick="exePostcode()" readonly>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주소</span>
                                        <input type="text" class="form-control" id="companyAddress" onclick="exePostcode()" readonly>
                                    </div>
                                </div>
                            </div>
                            <div id="addressAlert"></div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">상세주소</span>
                                        <input type="text" class="form-control" id="companyAddressDetail">
                                        <div id="companyAddressDetailAlert"></div>
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
                                    <textarea class="form-control" style="height: 100px" id="companyMemo"></textarea>                                  
                                </div>  
                            </div>
                            <div class="row mt-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">회사 로고</label>
                                    <input type="file" class="form-control" id="inputGroupFile01">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">배경화면</label>
                                    <input type="file" class="form-control" id="inputGroupFile02">
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">사업자등록증</label>
                                    <input type="file" class="form-control" id="inputGroupFile03">
                                </div>
                            </div>                  
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="insertCompanyInfo()" data-bs-dismiss="modal">등록</button>
                </div>
              </div>
            </div>
          </div>
		<!-- 수정창 모달 -->
        <div class="modal fade" id="companyUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">회사 정보 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="ent-list form-control mt-3">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">대표명</span>
                                        <input type="text" class="form-control" id="uMRefName">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사명</span>
                                        <input type="text" class="form-control" id="uMCoName">
                                    </div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">사업자등록번호</span>
                                        <input type="text" class="form-control" id="uMRegNum">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">법인등록번호</span>
                                        <input type="text" class="form-control" id="uMCorNum">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">전화번호</span>
                                        <input type="text" class="form-control" id="uMPhoneNum">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">팩스번호</span>
                                        <input type="text" class="form-control" id="uMFaxNum">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(일반)</span>
                                        <input type="text" class="form-control" id="uMEmail">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(세금계산서)</span>
                                        <input type="text" class="form-control" id="uMTEamil">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">우편번호</span>
                                        <input type="text" class="form-control" id="uMPostNum" onclick="exePostcode()" readonly>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주소</span>
                                        <input type="text" class="form-control" id="uMAddress" onclick="exePostcode()" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">상세주소</span>
                                        <input type="text" class="form-control" id="uMAdDetail">
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
                                    <textarea class="form-control" style="height: 100px" id="uMMemo"></textarea>                                  
                                </div>  
                            </div>
                            <div class="row mt-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">회사 로고</label>
                                    <input type="file" class="form-control" id="inputGroupFile01">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">배경화면</label>
                                    <input type="file" class="form-control" id="inputGroupFile02">
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">사업자등록증</label>
                                    <input type="file" class="form-control" id="inputGroupFile03">
                                </div>
                            </div>                  
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="updateCompany()" data-bs-dismiss="modal">수정</button>
                </div>
              </div>
            </div>
          </div>      
    	
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>     
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>