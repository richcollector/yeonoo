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

<script type="text/javascript">

	function insertWarehouse(){
		
		var WhCVal = document.getElementById("warehouseClassification").value;
		var WhNVal = document.getElementById("warehouseName").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				document.getElementById("warehouseClassification").value = "";
				document.getElementById("warehouseName").value = "";
				
			}
		}
		
		xhr.open("post" , "./insertWarehouse");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_classification=" + WhCVal + "&warehouse_name=" + WhNVal);	
		
	}
	

	function warehouseList(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var whList = document.getElementById("warehouseList");
				whList.innerHTML = "";
				
				var thead = document.createElement("thead");
				whList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "창고 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "창고 분류";
				headTr.appendChild(headTh2);
				
				var headTh3 = document.createElement("th");
				headTh3.innerText = "창고 이름";
				headTr.appendChild(headTh3);
				
				for(myWarehouseList of jsonObj.whList){
					
					console.log(jsonObj);
					
					var tBody = document.createElement("tbody");
					whList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyTd1.appendChild(bodyCheckBox);
					
					var whCodeTh = document.createElement("th");
					whCodeTh.innerText = myWarehouseList.warehouse.company_code;
					bodyTr.appendChild(whCodeTh)			
					
					var whClsTd = document.createElement("td");
					whClsTd.innerText = myWarehouseList.warehouse.warehouse_classification;
					bodyTr.appendChild(whClsTd);
					
					var whName = document.createElement("td");
					whName.innerText = myWarehouseList.warehouse.warehouse_name;
					bodyTr.appendChild(whName);
					
				}
								
			}
		}
		
		xhr.open("get" , "./myWarehouseList");
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	
	function areaInsert(){
		
		//warehouseCode = 
		
		var aNameVal = document.getElementById("aNameVal").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);					
				
				document.getElementById("aNameVal").value = "";
				
			}		
		}
		
		xhr.open("post" , "./areaInsert");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_code" + aCodeVal + "&warehouse_area_name=" + aNameVal + /*"&warehouseCode=" + warehouseCode*/);
		
	}
	

	function AreaList(whHb){
		
		warehouseCode = whHb.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
				
				
				
			}		
		}
		
		xhr.open("get" , "./inWhAreaList?warehouseCode=" + warehouseCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
window.addEventListener("DOMContentLoaded" , function (){
		
		warehouseList();
		
		//setInterval(refreshCommentList , 3000);
		
	});
	
	
</script>

</head>
<body>
<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">
		<div class="row">
	        <div class="form-control mt-3">
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#warehouseRegist" id="registBtn">
	                등록
	             </button>
	             <button type="button" class="btn btn-light">
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
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5">창고 목록</span>
                    </div>
                    <div class="col-4">
                    <form action="./accountInfoPage" method="get">
						<div class="input-group mb-3">
								<select name="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="account_code">창고 코드</option>
									<option value="account_name">구역 코드</option>
									<option value="account_representative">랙 코드</option>
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
							<table class="table table-bordered text-center" id="warehouseList">
							<thead>
								<tr>
								<th><input type="checkbox"></th>
								<th>창고 코드</th>
								<th>창고 분류</th>
								<th>창고 이름</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								</tr>
							</tbody>
							</table>
						</div>
					</div>
					<!-- 
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
					</div> -->
               	</div>
            </div>
        </div>
	     
	     <!-- 창고등록 모달 -->
	     <div class="modal fade" id="warehouseRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">창고 등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">창고 구분</span>
		                                        <input type="text" class="form-control" id="warehouseClassification">
		                                    </div>
		                                </div>
                            		</div>
                            		<div class="row my-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">창고 이름</span>
		                                        <input type="text" class="form-control" id="warehouseName">
		                                    </div>
		                                </div>
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="insertWarehouse()" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 구역 등록 모달 -->
		 <div class="modal fade" id="areaRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">구역 등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">구역 이름</span>
		                                        <input type="text" class="form-control" id="aNameVal">
		                                    </div>
		                                </div>
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="()" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>