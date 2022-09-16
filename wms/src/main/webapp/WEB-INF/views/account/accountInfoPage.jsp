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
	
	function insertAccountInfo(){
		
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
		var accountRegistrationJpgVal = document.getElementById("account_registration_jpg").value;

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
				
			}
		}
		
		xhr.open("post" , "./insertAccountInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("account_name=" + nameVal + "&account_registration_number=" + accountRegistrationNumVal + "&account_corporate_registration_number=" + accountCorporateRegistrationregiNumVal + 
				"&account_representative=" + accountRepresentativeVal + "&account_phone=" + accountPhoneVal + "&account_pax_number=" + accountPaxNumVal + 
				"&account_email=" + accountEmailVal + "&account_email_tax=" + accountEmailTaxEmailVal + "&account_post_number=" + accountPostNumVal + 
				"&account_address=" + accountAddressVal + "&account_address_detail=" + accountAddressDetailVal + "&account_category=" + accountCategoryVal +
				"&account_memo=" + accountMemoVal + "&account_registration_jpg=" + accountRegistrationJpgVal);		
		
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
		var accountName = document.getElementById("account_name_update");
		var accountRegistrationNum = document.getElementById("account_registration_number_update");
		var accountCorporateRegistrationregiNum = document.getElementById("account_corporate_registration_number_update");
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
// 		var accountRegistrationJpg = document.getElementById("account_registration_jpg_update");
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
					accountCode.value = jsonObj.account_code;
					accountName.value = jsonObj.account_name;
					accountRegistrationNum.value = jsonObj.account_registration_number;
					accountCorporateRegistrationregiNum.value = jsonObj.account_corporate_registration_number;
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
// 					accountRegistrationJpg.value = "jsonObj.accountVo.account_registration_jpg";
// 					if(checkVal.value != ""){
// 						updateModal.click();
// 					}
// 					document.querySelector("input[id=updateModalStart]").click;

					document.getElementById("updateModalStart").click();
// 					var updateModal = document.getElementById("updateModalStart");
// 					updateModal.

					
					
				
			}
		}
		
		xhr.open("get", "./selectAccountInfo?account_code=" + checkVal);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
		
	}
	
	function cleanUpdateModal(){
		document.getElementById("account_code_update").value = "";
		document.getElementById("account_name_update").value = "";
		document.getElementById("account_registration_number_update").value = "";
		document.getElementById("account_corporate_registration_number_update").value = "";
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
// 		document.getElementById("account_registration_jpg_update").value = "";
	}
		
	
	function updateAccountInfo(){
		
		var accountCodeVal = document.getElementById("account_code_update").value;
		var accountNameVal = document.getElementById("account_name_update").value;
		var accountRegistrationNumVal = document.getElementById("account_registration_number_update").value;
		var accountCorporateRegistrationregiNumVal = document.getElementById("account_corporate_registration_number_update").value;
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
// 		var accountRegistrationJpgVal = document.getElementById("account_registration_jpg").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				document.getElementById("account_code").value = "";				
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
// 				document.getElementById("account_registration_jpg").value = "";
				
			}
		}
		
		xhr.open("post" , "./updateAccountInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("account_code=" + accountCodeVal + "&account_name=" + accountNameVal + "&account_registration_number=" + accountRegistrationNumVal + "&account_corporate_registration_number=" + accountCorporateRegistrationregiNumVal + 
				"&account_representative=" + accountRepresentativeVal + "&account_phone=" + accountPhoneVal + "&account_pax_number=" + accountPaxNumVal + 
				"&account_email=" + accountEmailVal + "&account_email_tax=" + accountEmailTaxEmailVal + "&account_post_number=" + accountPostNumVal + 
				"&account_address=" + accountAddressVal + "&account_address_detail=" + accountAddressDetailVal + "&account_category=" + accountCategoryVal +
				"&account_memo=" + accountMemoVal);		
		
				location.reload(true);
		
	}
	
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
		
		xhr.open("post" , "./deleteAccountInfo");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkVal);
		
		location.reload();
		
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

		for(var i = 0; i < list.length; i++) {
			if(list[i].checked == true){
				total.checked = true;
			}else{
				total.checked = false;
			}
		}
	}
	
// 	function refreshAccountInfo(){
		
// 	}
	
	
</script>
	
<title>거래처</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">   
		<div class="row">
	        <div class="col form-control mt-3">
	        	<div class="row">
		        	<div class="col-6 mx-0">
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
		            <div class="col-6 text-end mx-0 pt-1">
		            	<span class="fs-5">거래처 관리</span>
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
                    <div class="col-4">
                    <form action="./accountInfoPage" method="get">
						<div class="input-group mb-3">
								<select name="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="account_code">거래처 번호</option>
									<option value="account_name">회사 이름</option>
									<option value="account_representative">대표명</option>
								  </select>
								<input name="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
								<button class="input-group-text bi bi-search" id="basic-addon1"></button>
						</div>
						</form>
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 py-2 px-1">
						<div class="scrollTable">
							<table class="table table-bordered text-center">
							<thead>
								<tr>
								<th><input id="check_all" onclick="allCheck()" type="checkbox"></th>
								<th>거래처 번호</th>
								<th>회사 이름</th>
								<th>사업자등록번호</th>
								<th>법인등록번호</th>
								<th>대표명</th>
								<th>전화번호</th>
								<th>팩스번호</th>
								<th>이메일번호</th>
								<th>이메일번호(세금)</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>상세주소</th>
								<th>거래처 분류</th>
								<th>비고</th>
								<th>메모</th>
								<th>사업자등록증</th>
								</tr>
							</thead>
							<c:forEach items="${accountList}" var="data">
							<c:set var="n" value="${n+1}"/>
							<tbody>
								<tr>
								<td><input onclick="checkOk()" name="checkAccount" type="checkbox" value="${data.account_code }"></td>
								<th>${data.account_code }</th>
								<td>${data.account_name }</td>
								<td>${data.account_registration_number }</td>
								<td>${data.account_corporate_registration_number }</td>
								<td>${data.account_representative }</td>
								<td>${data.account_phone }</td>
								<td>${data.account_pax_number }</td>
								<td>${data.account_email }</td>
								<td>${data.account_email_tax }</td>
								<td>${data.account_post_number}</td>
								<td>${data.account_address}</td>
								<td>${data.account_address_detail}</td>
								<td>${data.account_category}</td>
								<td>${data.account_registration}</td>
								<td>${data.account_memo}</td>
								<td>${data.account_registration_jpg}</td>
								</tr>
							</tbody>
							</c:forEach>
							</table>
						</div>
					</div>
					<div class="page mt-3" >
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
						  	<c:choose>
		  				  		<c:when test="${startPage <= 1 }">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								</c:when>
						  		<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="./accountInfoPage?pageNum=${startPage - 1 }${additionalParam}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
						  		</c:otherwise>
					  		</c:choose>
	  					    <c:forEach begin="${startPage }" end="${endPage }" var="i">
		  					    <c:choose>
			  					    <c:when test="${i == currentPageNum }">
			  					    	<li class="page-item active"><a class="page-link" href="./accountInfoPage?pageNum=${i }${additionalParam}">${i }</a></li>
			  					    </c:when>
			  					    <c:otherwise>
			  					    	<li class="page-item"><a class="page-link" href="./accountInfoPage?pageNum=${i }${additionalParam}">${i }</a></li>
			  					    </c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${endPage >= totalPageCount}">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
								</c:when>
								<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
								</c:otherwise>
			    			</c:choose>
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
                                        <input id="account_representative" type="text" class="form-control" id="companyRepresentative">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사명</span>
                                        <input id="account_name" type="text" class="form-control" id="companyName">
                                    </div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">사업자등록번호</span>
                                        <input id="account_registration_number" type="text" class="form-control" id="companyRegistrationNumber">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">법인등록번호</span>
                                        <input id="account_corporate_registration_number" type="text" class="form-control" id="companyCorporateRegistrationNumber">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">전화번호</span>
                                        <input id="account_phone" type="text" class="form-control" id="companyPhone">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">팩스번호</span>
                                        <input id="account_pax_number" type="text" class="form-control" id="companyPaxNumber">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(일반)</span>
                                        <input id="account_email" type="text" class="form-control" id="companyEmail">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(세금계산서)</span>
                                        <input id="account_email_tax" type="text" class="form-control" id="companyEmailTax">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">우편번호</span>
                                        <input id="account_post_number" type="text" class="form-control" id="companyPostNumber">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주소</span>
                                        <input id="account_address" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">상세주소</span>
                                        <input id="account_address_detail" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처 분류</span>
                                        <input id="account_category" type="text" class="form-control">
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
                                    <textarea id="account_memo" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>

                            <div class="row my-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">사업자등록증</label>
                                    <input id="account_registration_jpg" type="file" class="form-control">
                                </div>
                            </div>                  
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="insertAccountInfo()" data-bs-dismiss="modal">등록</button>
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
                        <div class="form-control mt-3">
                        	<input id="account_code_update" type="hidden" class="form-control">
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">대표명</span>
                                        <input id="account_representative_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">회사명</span>
                                        <input id="account_name_update" type="text" class="form-control" id="companyName">
                                    </div>
                                </div>                               
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">사업자등록번호</span>
                                        <input id="account_registration_number_update" type="text" class="form-control" id="companyRegistrationNumber">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">법인등록번호</span>
                                        <input id="account_corporate_registration_number_update" type="text" class="form-control" id="companyCorporateRegistrationNumber">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">전화번호</span>
                                        <input id="account_phone_update" type="text" class="form-control" id="companyPhone">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">팩스번호</span>
                                        <input id="account_pax_number_update" type="text" class="form-control" id="companyPaxNumber">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(일반)</span>
                                        <input id="account_email_update" type="text" class="form-control" id="companyEmail">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">이메일(세금계산서)</span>
                                        <input id="account_email_tax_update" type="text" class="form-control" id="companyEmailTax">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">우편번호</span>
                                        <input id="account_post_number_update" type="text" class="form-control" id="companyPostNumber">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">주소</span>
                                        <input id="account_address_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">상세주소</span>
                                        <input id="account_address_detail_update" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="input-group">
                                        <span class="input-group-text">거래처 분류</span>
                                        <input id="account_category_update" type="text" class="form-control">
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
                                    <textarea id="account_memo_update" class="form-control" style="height: 100px"></textarea>                                  
                                </div>  
                            </div>

                            <div class="row my-3">
                                <div class="input-group">
                                    <label class="input-group-text" for="inputGroupFile01">사업자등록증</label>
                                    <input id="account_registration_jpg_update" type="file" class="form-control">
                                </div>
                            </div>                  
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary" onclick="updateAccountInfo()" data-bs-dismiss="modal">수정</button>
                </div>
              </div>
            </div>
          </div>
          
          
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>