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
<title>Insert title here</title>

<style>

	#wrapper{
	width: 1200px;
   }

</style>
	
<script>
	
	function lotRegist(){
		
		var productCodeVal = document.getElementById("lotItem").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
		
				lotListAll();
				
			}
		}
		
		xhr.open("post" , "./lotRegist");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("product_code=" + productCodeVal);	
				
	}

	function findPdToRegi(){
		
		var keyword = document.getElementById("searchWord").value;
			
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var addUi = document.getElementById("searchWindowUi");
				addUi.innerHTML = "";
				
				searchResult = document.createElement("div");
				searchResult.classList.add("col");
				addUi.appendChild(searchResult);
				
				resultUl = document.createElement("ul");
				resultUl.classList.add("list-group");
				searchResult.appendChild(resultUl);
									
				for (searchList of jsonObj.product){
					
					resultLi = document.createElement("li");
					resultLi.classList.add("list-group-item");
					resultLi.innerText = searchList.product.product_name;
					resultLi.setAttribute("onclick", "selPdToRegi(this)");
					resultUl.appendChild(resultLi);								
					
					resultHidden = document.createElement("input");
					resultHidden.setAttribute("type","hidden");
					resultHidden.value = searchList.product.product_code;
					resultLi.appendChild(resultHidden);
					
				}	
				
			}		
		}
					
		xhr.open("get" , "./findPdToRegi?productName=" + keyword);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function selPdToRegi(productInfo){
		
		var productCode = productInfo.children[0].value;
		 
		console.log(productCode);
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var infoBox = document.getElementById("productInfoUi");
				infoBox.innerHTML = "";				
				
				var productNameBox = document.createElement("div");
				productNameBox.classList.add("input-group");
				infoBox.appendChild(productNameBox);
				
				var formBox1 = document.createElement("div");
				formBox1.classList.add("form-floating");
				formBox1.setAttribute("style","width:50%");
				productNameBox.appendChild(formBox1);
				
				var nameVal = document.createElement("input");
				nameVal.setAttribute("readonly","true");
				nameVal.classList.add("form-control-plaintext");
				nameVal.id = "floatingPlaintextInput";
				nameVal.value = jsonObj.product.product.product_name;
				formBox1.appendChild(nameVal);
				
				var nameLabel = document.createElement("label");
				nameLabel.setAttribute("for","floatingPlaintextInput");
				nameLabel.innerText = "제품 이름";
				formBox1.appendChild(nameLabel);
				
				var productCodeBox = document.createElement("div");
				productCodeBox.classList.add("input-group");
				infoBox.appendChild(productCodeBox);
				
				var formBox2 = document.createElement("div");
				formBox2.classList.add("form-floating");
				formBox2.setAttribute("style","width:50%");
				productNameBox.appendChild(formBox2);
				
				var codeVal = document.createElement("input");
				codeVal.setAttribute("readonly","true");
				codeVal.classList.add("form-control-plaintext");
				codeVal.id = "floatingPlaintextInput";
				codeVal.value = jsonObj.product.product.product_code;
				formBox2.appendChild(codeVal);
				
				var codeLabel = document.createElement("label");
				codeLabel.setAttribute("for","floatingPlaintextInput");
				codeLabel.innerText = "제품 코드";
				formBox2.appendChild(codeLabel);
				
				var productMemoBox = document.createElement("div");
				productMemoBox.classList.add("input-group");
				infoBox.appendChild(productMemoBox);
				
				var formBox3 = document.createElement("div");
				formBox3.classList.add("form-floating");
				formBox3.setAttribute("style","width:100%");
				productNameBox.appendChild(formBox3);
				
				var memoVal = document.createElement("input");
				memoVal.setAttribute("readonly","true");
				memoVal.classList.add("form-control-plaintext");
				memoVal.id = "floatingPlaintextInput";
				memoVal.value = jsonObj.product.product.product_memo;
				formBox3.appendChild(memoVal);
				
				var memoLabel = document.createElement("label");
				memoLabel.setAttribute("for","floatingPlaintextInput");
				memoLabel.innerText = "제품 메모";
				formBox3.appendChild(memoLabel);		
				
				var lotProduct = document.getElementById("lotItem");
				lotProduct.innerHTML = "";
				
				var lotPdHiddenCode = document.createElement("input");
				lotPdHiddenCode.setAttribute("type","hidden");
				lotPdHiddenCode.value = jsonObj.product.product.product_code;
				lotProduct.appendChild(lotPdHiddenCode);
				
			}		
		}
					
		xhr.open("get" , "./selPdToRegi?productCode=" + productCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function lotListAll(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);				
				
				var lotList = document.getElementById("lotList");
				lotList.innerHTML = "";
				
				var thead = document.createElement("thead");
				lotList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "로트 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "제품 코드";
				headTr.appendChild(headTh2);
				
				var headTh3 = document.createElement("th");
				headTh3.innerText = "제품 이름";
				headTr.appendChild(headTh3);
		
				var headT4 = document.createElement("th");
				headT4.innerText = "등록일";
				headTr.appendChild(headT4);
				
				for(myLotList of jsonObj.lL){
					
					var tBody = document.createElement("tbody");
					lotList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
									
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = "";
					bodyCheckBox.setAttribute("onclick","");
					bodyTd1.appendChild(bodyCheckBox);
						
					var lotCodeTh = document.createElement("th");
					lotCodeTh.innerText = myLotList.lot.lot_code;
					bodyTr.appendChild(lotCodeTh)			
					
					var pdCodeTd = document.createElement("td");
					pdCodeTd.innerText = myLotList.lot.product_code;
					bodyTr.appendChild(pdCodeTd);
					
					var pdName = document.createElement("td");
					pdName.innerText = myLotList.product.product_name;
					bodyTr.appendChild(pdName);
					
					var regDate = document.createElement("td");
					regDate.innerText = myLotList.lot.lot_date;
					bodyTr.appendChild(regDate);
					
				}
				
			}		
		}
					
		xhr.open("get" , "./lotListAll");
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	
window.addEventListener("DOMContentLoaded" , function (){
		
		lotListAll();
		
		//setInterval(refreshCommentList , 3000);
		
	});	
	
	
</script>
	
</head>


<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">
		<div class="row">
	        <div class="form-control mt-3" id="btnCotroller">
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#lotRegistModal">
	                등록
	             </button>
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#">
	             	수정
	             </button>
	             <button type="button" class="btn btn-light">
	             	삭제
	             </button>
	        </div>
	     </div>
	  <div class="row">
            <div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">로트 관리</span>
                    </div>
                    <div class="col-4">
                    <form action="./accountInfoPage" method="get">
						<div class="input-group mb-3">
								<select name="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="account_code">로트 코드</option>
									<option value="account_name">제품 코드</option>
								  </select>
								<input name="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button">
								<button class="input-group-text bi bi-search" id="basic-addon1"></button>
						</div>
						</form>
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 ">
						<div class="scrollTable">
							<table class="table table-bordered text-center" id="lotList">
							<thead>
								<tr>
								<th><input type="checkbox"></th>
								<th>로트 코드</th>
								<th>제품 코드</th>
								<th>제품 이름</th>
								<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								</tr>
							</tbody>
							</table>
						</div>
					</div>
               	</div>
            </div>
        </div>
		<!-- 로트 등록 모달 -->
		<div class="modal fade" id="lotRegistModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">LOT 등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
                        				<span>제품 이름 입력</span>
		                                <div class="col mt-3">
		                                    <div class="input-group">		                                        
		                                        <input type="text" class="form-control" placeholder="검색 후 선택 버튼을 눌러주세요" id="searchWord" onkeyup="findPdToRegi()">
  												<button class="btn btn-outline-secondary" type="button">선택</button>
  											</div>
		                                </div>
                            		</div>
                            		<div class="row mt-1" id="searchWindowUi">
                            		</div>
                            		<div class="row mt-3" id="productInfoUi">
                            		</div>
                            		<div id="lotItem"></div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="lotRegist()" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		
		<!-- 로트 수정 모달 -->
		<div class="modal fade" id="" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">로트 정보 수정</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">제품 이름</span>
		                                        <input type="text" class="form-control" id="">
		                                    </div>
		                                </div>
                            		</div>                            		
                            		<div class="row" id="">
                            		
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 모달 끝 -->
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>