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
				
				warehouseList()
				
			}
		}
		
		xhr.open("post" , "./insertWarehouse");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_classification=" + WhCVal + "&warehouse_name=" + WhNVal);	
		
	}
	
	//기초. 창고 리스트
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
									
					var tBody = document.createElement("tbody");
					whList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
									
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myWarehouseList.warehouse.warehouse_code;
					bodyCheckBox.setAttribute("onclick","whChecked(this)");
					bodyTd1.appendChild(bodyCheckBox);
						
					var whCodeTh = document.createElement("th");
					whCodeTh.innerText = myWarehouseList.warehouse.warehouse_code;
					whCodeTh.setAttribute("onclick" , "areaList(this.innerText)");
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
		  
		var aNameVal = document.getElementById("aNameVal").value;
		var warehouseCode = document.getElementById("areaWarehouseCode").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("aNameVal").value = "";
				areaList(warehouseCode)
				
			}		
		}
		
		xhr.open("post" , "./areaInsert");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_area_name=" + aNameVal + "&warehouse_code=" + warehouseCode);
		
	}
	

	function areaList(warehouseCode){
		
		//var code = warehouseCode.innerText;
		var code = warehouseCode;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
							
				var btnCotroller = document.getElementById("btnCotroller");
				btnCotroller.innerHTML = "";
				
				var areaRegiBtn = document.createElement("button");
				areaRegiBtn.type = "button";
				areaRegiBtn.classList.add("btn");
				areaRegiBtn.classList.add("btn-light");
				areaRegiBtn.innerText = "등록";
				areaRegiBtn.setAttribute("data-bs-toggle","modal");
				areaRegiBtn.setAttribute("data-bs-target","#areaRegist");
				btnCotroller.appendChild(areaRegiBtn);	
				
				var areaUpBtn = document.createElement("button");
				areaUpBtn.type = "button";
				areaUpBtn.classList.add("btn");
				areaUpBtn.classList.add("btn-light");
				areaUpBtn.innerText = "수정";
				areaUpBtn.setAttribute("data-bs-toggle","modal");
				areaUpBtn.setAttribute("data-bs-target","#areaUpdate");
				btnCotroller.appendChild(areaUpBtn);				
				
				var areaList = document.getElementById("warehouseList");
				areaList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				areaList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "구역 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "구역 이름";
				headTr.appendChild(headTh2);
				
				var hiddenCode = document.getElementById("areaWarehouseCode");
				hiddenCode.innerHTML="";
				
				var hiddenInput = document.createElement("input");
				hiddenInput.setAttribute("type","hidden");
				hiddenInput.setAttribute("value", jsonObj.warehouseCode);
				hiddenCode.appendChild(hiddenInput);
				
				for(myAreaList of jsonObj.aList){
					
					var tBody = document.createElement("tbody");
					areaList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myAreaList.area.warehouse_area_code;
					bodyCheckBox.innerText = myAreaList.area.warehouse_code;
					bodyCheckBox.setAttribute("onclick","arChecked(this)");
					bodyTd1.appendChild(bodyCheckBox);
					
					var areaCodeTh = document.createElement("th");
					areaCodeTh.innerText = myAreaList.area.warehouse_area_code;
					areaCodeTh.setAttribute("onclick" , "rackList(this.innerText)");
					bodyTr.appendChild(areaCodeTh);		
					
					var areaName = document.createElement("td");
					areaName.innerText = myAreaList.area.warehouse_area_name;
					bodyTr.appendChild(areaName);
					
				}
				
			}		
		}
		
		xhr.open("get" , "./inWhAreaList?warehouseCode=" + code);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function rackList(areaCode){
		
		var code = areaCode;
				
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
							
				var btnCotroller = document.getElementById("btnCotroller");
				btnCotroller.innerHTML = "";
				
				var rackRegiBtn = document.createElement("button");
				rackRegiBtn.type = "button";
				rackRegiBtn.classList.add("btn");
				rackRegiBtn.classList.add("btn-light");
				rackRegiBtn.innerText = "등록";
				rackRegiBtn.setAttribute("data-bs-toggle","modal");
				rackRegiBtn.setAttribute("data-bs-target","#rackRegist");
				btnCotroller.appendChild(rackRegiBtn);					
				
				var rackUpBtn = document.createElement("button");
				rackUpBtn.type = "button";
				rackUpBtn.classList.add("btn");
				rackUpBtn.classList.add("btn-light");
				rackUpBtn.innerText = "수정";
				rackUpBtn.setAttribute("data-bs-toggle","modal");
				rackUpBtn.setAttribute("data-bs-target","#rackUpdate");
				btnCotroller.appendChild(rackUpBtn);
				
				var rackList = document.getElementById("warehouseList");
				rackList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				rackList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "랙 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "랙 이름";
				headTr.appendChild(headTh2);
				
				var hiddenCode = document.getElementById("rackAreaCode");
				hiddenCode.innerHTML="";
				
				var hiddenInput = document.createElement("input");
				hiddenInput.setAttribute("type","hidden");
				hiddenInput.setAttribute("value", jsonObj.areaCode);
				hiddenCode.appendChild(hiddenInput);
				
				for(myRackList of jsonObj.rList){
					
					var tBody = document.createElement("tbody");
					rackList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myRackList.rack.warehouse_rack_code;
					bodyCheckBox.innerText = myRackList.rack.warehouse_area_code;	
					bodyCheckBox.setAttribute("onclick","rkChecked(this)");
					bodyTd1.appendChild(bodyCheckBox);				
					
					var rackCodeTh = document.createElement("th");
					rackCodeTh.innerText = myRackList.rack.warehouse_rack_code;
					rackCodeTh.setAttribute("onclick" , "cellList(this.innerText)");
					bodyTr.appendChild(rackCodeTh);		
					
					var rackName = document.createElement("td");
					rackName.innerText = myRackList.rack.warehouse_rack_name;
					bodyTr.appendChild(rackName);
					
				}
				
			}		
		}
					
		xhr.open("get" , "./inArRackList?areaCode=" + code);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
		
	
	function rackInsert(){
		  
		var rNameVal = document.getElementById("rNameVal").value;
		var areaCode = document.getElementById("rackAreaCode").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("rNameVal").value = "";
				rackList(areaCode)
				
			}		
		}
		
		xhr.open("post" , "./rackInsert");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_rack_name=" + rNameVal + "&warehouse_area_code=" + areaCode);
		
	}
	
	
	function cellList(rackCode){
		
		var code = rackCode;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
							
				var btnCotroller = document.getElementById("btnCotroller");
				btnCotroller.innerHTML = "";
				
				var cellRegiBtn = document.createElement("button");
				cellRegiBtn.type = "button";
				cellRegiBtn.classList.add("btn");
				cellRegiBtn.classList.add("btn-light");
				cellRegiBtn.innerText = "등록";
				cellRegiBtn.setAttribute("data-bs-toggle","modal");
				cellRegiBtn.setAttribute("data-bs-target","#cellRegist");
				btnCotroller.appendChild(cellRegiBtn);	
				
				var cellUpBtn = document.createElement("button");
				cellUpBtn.type = "button";
				cellUpBtn.classList.add("btn");
				cellUpBtn.classList.add("btn-light");
				cellUpBtn.innerText = "수정";
				cellUpBtn.setAttribute("data-bs-toggle","modal");
				cellUpBtn.setAttribute("data-bs-target","#cellUpdate");
				btnCotroller.appendChild(cellUpBtn);			
				
				var cellList = document.getElementById("warehouseList");
				cellList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				cellList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "셀 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "셀 이름";
				headTr.appendChild(headTh2);
				
				var hiddenCode = document.getElementById("cellRackCode");
				hiddenCode.innerHTML="";
				
				var hiddenInput = document.createElement("input");
				hiddenInput.setAttribute("type","hidden");
				hiddenInput.setAttribute("value", jsonObj.rackCode);
				hiddenCode.appendChild(hiddenInput);
				
				for(myCellList of jsonObj.cList){
					
					var tBody = document.createElement("tbody");
					cellList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myCellList.cell.warehouse_cell_code;
					bodyCheckBox.innerText = myCellList.cell.warehouse_rack_code;	
					bodyCheckBox.setAttribute("onclick","clChecked(this)");
					bodyTd1.appendChild(bodyCheckBox);
					
					var cellCodeTh = document.createElement("th");
					cellCodeTh.innerText = myCellList.cell.warehouse_cell_code;
					bodyTr.appendChild(cellCodeTh);		
					
					var cellName = document.createElement("td");
					cellName.innerText = myCellList.cell.warehouse_cell_name;
					bodyTr.appendChild(cellName);
					
				}
				
			}		
		}
					
		xhr.open("get" , "./inRkCellList?rackCode=" + code);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function cellInsert(){
		
		var cNameVal = document.getElementById("cNameVal").value;
		var rackCode = document.getElementById("cellRackCode").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("cNameVal").value = "";
				cellList(rackCode)
				
			}		
		}
		
		xhr.open("post" , "./cellInsert");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_cell_name=" + cNameVal + "&warehouse_rack_code=" + rackCode);
		
	}
	
	function whChecked(selectedBox) {
		
		if (selectedBox.checked == true){
     		var selectedWh = document.getElementById("whCodeBox");
     		selectedWh.innerHTML = "";
 		
     		var hiddenSelect = document.createElement("input");
     		hiddenSelect.setAttribute("type","hidden");
     		hiddenSelect.setAttribute("value", selectedBox.value);
     		selectedWh.appendChild(hiddenSelect)   		
     		  		
     		
		}else{
     			var selectedWh = document.getElementById("whCodeBox");
         		selectedWh.innerHTML = "";
     		};
     		  	
	}

	
	function whUpdate(){
		
		var whNameVal = document.getElementById("upWhName").value;
		var whCalVal = document.getElementById("upWhClassification").value;
		var warehouse_code = document.getElementById("whCodeBox").firstChild.value;		
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("upWhClassification").value = "";
				document.getElementById("upWhName").value = "";
				warehouseList()
				
			}		
		}
		
		xhr.open("post" , "./whUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_name=" + whNameVal + "&warehouse_classification=" + whCalVal+ "&warehouse_code=" + warehouse_code);
		
	}
	
	function arChecked(selectedArBox){
		
		console.log(selectedArBox);
		
		if (selectedArBox.checked == true){
     		var selectedAr = document.getElementById("arCodeBox");
     		selectedAr.innerHTML = "";	
     		
     		var hiddenSelect = document.createElement("input");
     		hiddenSelect.setAttribute("type","hidden");
     		hiddenSelect.setAttribute("value", selectedArBox.value);  		
     		hiddenSelect.setAttribute("innerText", selectedArBox.innerText);
     		selectedAr.appendChild(hiddenSelect);
     		
     		console.log(hiddenSelect);
     		
     		
		}else{
     			var selectedAr = document.getElementById("arCodeBox");
     			selectedAr.innerHTML = "";
     		};
		
	}
	
	function arUpdate(){
		
		var arNameVal = document.getElementById("upArName").value;
		var warehouse_area_code = document.getElementById("arCodeBox").firstChild.value;		
		var warehouseCode = document.getElementById("arCodeBox").firstChild.innerText;
		
		console.log(warehouseCode);
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("upArName").value = "";
				areaList(warehouseCode);
				
			}		
		}
		
		xhr.open("post" , "./arUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_area_name=" + arNameVal + "&warehouse_area_code=" + warehouse_area_code);
		
	}
	
	function rkChecked(selectedRkBox){
			
		console.log(selectedRkBox);
		
			if (selectedRkBox.checked == true){
	     		var selectedRk = document.getElementById("rkCodeBox");
	     		selectedRk.innerHTML = "";	
	     		
	     		var hiddenSelect = document.createElement("input");
	     		hiddenSelect.setAttribute("type","hidden");
	     		hiddenSelect.setAttribute("value", selectedRkBox.value);  		
	     		hiddenSelect.setAttribute("innerText", selectedRkBox.innerText);
	     		selectedRk.appendChild(hiddenSelect);   		
	     		
			}else{
	     			var selectedAr = document.getElementById("rkCodeBox");
	     			selectedRk.innerHTML = "";
	     		};
			
		}
	
	function rkUpdate(){
		
		var rkNameVal = document.getElementById("upRkName").value;
		var warehouse_rack_code = document.getElementById("rkCodeBox").firstChild.value;		
		/* var warehouseCode = document.getElementById("arCodeBox").secondChild.value;	 */
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("upRkName").value = "";
				/* areaList(warehouseCode); */
				
			}		
		}
		
		xhr.open("post" , "./rkUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_rack_name=" + rkNameVal + "&warehouse_rack_code=" + warehouse_rack_code);
		
	}
	
	function clChecked(selectedClBox){
			
		console.log(selectedClBox);
		
			if (selectedClBox.checked == true){
	     		var selectedCl = document.getElementById("clCodeBox");
	     		selectedCl.innerHTML = "";	
	     		
	     		var hiddenSelect = document.createElement("input");
	     		hiddenSelect.setAttribute("type","hidden");
	     		hiddenSelect.setAttribute("value", selectedClBox.value);  		
	     		hiddenSelect.setAttribute("innerText", selectedClBox.innerText);
	     		selectedCl.appendChild(hiddenSelect);   		
	     		
			}else{
	     			var selectedCl = document.getElementById("clCodeBox");
	     			selectedCl.innerHTML = "";
	     		};
			
		}
	
	function clUpdate(){
		
		var clNameVal = document.getElementById("upClName").value;
		var warehouse_cell_code = document.getElementById("clCodeBox").firstChild.value;		
		/* var warehouseCode = document.getElementById("arCodeBox").secondChild.value;	 */
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("upClName").value = "";
				/* areaList(warehouseCode); */
				
			}		
		}
		
		xhr.open("post" , "./clUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_cell_name=" + clNameVal + "&warehouse_cell_code=" + warehouse_cell_code);
		
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
	        <div class="form-control mt-3" id="btnCotroller">
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#warehouseRegist">
	                등록
	             </button>
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#warehouseUpdate">
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
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">창고 목록</span>
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
	                                   		<div id="areaWarehouseCode">
	                                    		
	                                    	</div>	                                    	
		                                </div>
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer" id="areaSumbit">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="areaInsert()"data-bs-dismiss="modal" >등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 랙 등록 모달 -->
		 <div class="modal fade" id="rackRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">랙 등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">랙 이름</span>
		                                        <input type="text" class="form-control" id="rNameVal">
		                                    </div>
	                                   		<div id="rackAreaCode">
	                                    		
	                                    	</div>	                                    	
		                                </div>
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer" id="areaSumbit">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="rackInsert()"data-bs-dismiss="modal" >등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 셀 등록 모달 -->
		 <div class="modal fade" id="cellRegist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">셀 등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">셀 이름</span>
		                                        <input type="text" class="form-control" id="cNameVal">
		                                    </div>
	                                   		<div id="cellRackCode">
	                                    		
	                                    	</div>	                                    	
		                                </div>
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer" id="cellSumbit">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="cellInsert()"data-bs-dismiss="modal" >등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 창고 수정 모달 -->
		 <div class="modal fade" id="warehouseUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">창고 정보 수정</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">창고 구분</span>
		                                        <input type="text" class="form-control" id="upWhClassification">
		                                    </div>
		                                </div>
                            		</div>
                            		<div class="row my-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">창고 이름</span>
		                                        <input type="text" class="form-control" id="upWhName">
		                                    </div>
		                                </div>
                            		</div>
                            		<div id="whCodeBox">
                            		
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="whUpdate()" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 구역 정보 수정 모달 -->
		 <div class="modal fade" id="areaUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">창고 정보 수정</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                            		<div class="row my-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">구역 이름</span>
		                                        <input type="text" class="form-control" id="upArName">
		                                    </div>
		                                </div>
                            		</div>
                            		<div id="arCodeBox">
                            		
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="arUpdate()" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 랙 정보 수정 모달  -->
		 <div class="modal fade" id="rackUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">창고 정보 수정</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                            		<div class="row my-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">구역 이름</span>
		                                        <input type="text" class="form-control" id="upRkName">
		                                    </div>
		                                </div>
                            		</div>
                            		<div id="rkCodeBox">
                            		
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="rkUpdate()" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 셀 정보 수정 모달 -->
		 <div class="modal fade" id="cellUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">창고 정보 수정</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                            		<div class="row my-3">
		                                <div class="col">
		                                    <div class="input-group">
		                                        <span class="input-group-text">구역 이름</span>
		                                        <input type="text" class="form-control" id="upClName">
		                                    </div>
		                                </div>
                            		</div>
                            		<div id="clCodeBox">
                            		
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="clUpdate()" data-bs-dismiss="modal">등록</button>
					     </div>
				    </div>
			  </div>
		 </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>