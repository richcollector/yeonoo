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
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()");
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
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
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
		if (warehouseCode != null){
			code = warehouseCode
		}else{
			code = document.getElementById("areaWarehouseCode").firstChild.value;
		}
		
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
				areaUpBtn.setAttribute("onclick","beforeUpdateAr()");
				areaUpBtn.setAttribute("data-bs-toggle","modal");
				areaUpBtn.setAttribute("data-bs-target","#areaUpdate");
				btnCotroller.appendChild(areaUpBtn);				
				
				var areaUpBtn = document.createElement("button");
				areaUpBtn.type = "button";
				areaUpBtn.classList.add("btn");
				areaUpBtn.classList.add("btn-light");
				areaUpBtn.innerText = "구역 삭제";
				areaUpBtn.setAttribute("data-bs-toggle","modal");
				areaUpBtn.setAttribute("data-bs-target","#areaDeleteAlert");			
				btnCotroller.appendChild(areaUpBtn);		
					
				var backToWhList = document.createElement("button");
				backToWhList.type = "button";
				backToWhList.classList.add("btn");
				backToWhList.classList.add("btn-light");
				backToWhList.innerText = "뒤로가기";
				backToWhList.value = "";
				backToWhList.setAttribute("onclick","warehouseList()");
				btnCotroller.appendChild(backToWhList);					
				
				var areaList = document.getElementById("warehouseList");
				areaList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				areaList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
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
				
				var hiddenCode2 = document.getElementById("codeForAreaList");
				hiddenCode2.innerHTML="";
				
				var hiddenInput2 = document.createElement("input");
				hiddenInput2.setAttribute("type","hidden");
				hiddenInput2.setAttribute("value", jsonObj.warehouseCode);
				hiddenCode2.appendChild(hiddenInput2);		
				
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
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyTd1.appendChild(bodyCheckBox);
					
					var areaCodeTh = document.createElement("th");
					areaCodeTh.innerText = myAreaList.area.warehouse_area_code;
					areaCodeTh.setAttribute("onclick" , "newArRackList(this.innerText)");
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
	
	/* function rackList(areaCode){
		
		if(areaCode != null){
			code = areaCode
		}else{
			code = document.getElementById("rackAreaCode").firstChild.value;
		}
		
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
				rackUpBtn.setAttribute("onclick","beforeUpdateRk()");
				rackUpBtn.setAttribute("data-bs-target","#rackUpdate");
				btnCotroller.appendChild(rackUpBtn);
				
				var rackDelBtn = document.createElement("button");
				rackDelBtn.type = "button";
				rackDelBtn.classList.add("btn");
				rackDelBtn.classList.add("btn-light");
				rackDelBtn.innerText = "랙 삭제";
				rackDelBtn.setAttribute("data-bs-toggle","modal");
				rackDelBtn.setAttribute("data-bs-target","#rackDeleteAlert");			
				btnCotroller.appendChild(rackDelBtn);		
				
				var backToArList = document.createElement("button");
				backToArList.type = "button";
				backToArList.classList.add("btn");
				backToArList.classList.add("btn-light");
				backToArList.innerText = "뒤로가기";
				backToArList.setAttribute("onclick","areaList()")				
				btnCotroller.appendChild(backToArList);
				
				var rackList = document.getElementById("warehouseList");
				rackList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				rackList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "랙 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "랙 이름";
				headTr.appendChild(headTh2);
				
				var hiddenCode = document.getElementById("rackAreaCode");
				hiddenCode.innerHTML = "";
				
				var hiddenInput = document.createElement("input");
				hiddenInput.setAttribute("type","hidden");
				hiddenInput.setAttribute("value", jsonObj.areaCode);
				hiddenCode.appendChild(hiddenInput);
				
				var hiddenCode2 = document.getElementById("codeForRackList");
				hiddenCode2.innerHTML="";
				
				var hiddenInput2 = document.createElement("input");
				hiddenInput2.setAttribute("type","hidden");
				hiddenInput2.setAttribute("value", jsonObj.areaCode);
				hiddenCode2.appendChild(hiddenInput2);			
				
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
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
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
		
	} */
		
	
	function rackInsert(){
		  
		var rNameVal = document.getElementById("rNameVal").value;
		var areaCode = document.getElementById("rackAreaCode").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("rNameVal").value = "";
				newArRackList(areaCode);
				
			}		
		}
		
		xhr.open("post" , "./rackInsert");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_rack_name=" + rNameVal + "&warehouse_area_code=" + areaCode);
		
	}
	
	
	/* function cellList(rackCode){
		
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
				cellUpBtn.setAttribute("onclick","beforeUpdateRk()");
				cellUpBtn.setAttribute("data-bs-target","#cellUpdate");
				btnCotroller.appendChild(cellUpBtn);			
				
				var cellDelBtn = document.createElement("button");
				cellDelBtn.type = "button";
				cellDelBtn.classList.add("btn");
				cellDelBtn.classList.add("btn-light");
				cellDelBtn.innerText = "셀 삭제";
				cellDelBtn.setAttribute("onclick","deleteCell()")				
				btnCotroller.appendChild(cellDelBtn);
						
				var backTorkList = document.createElement("button");
				backTorkList.type = "button";
				backTorkList.classList.add("btn");
				backTorkList.classList.add("btn-light");
				backTorkList.innerText = "뒤로가기";
				backTorkList.setAttribute("onclick","rackList()")				
				btnCotroller.appendChild(backTorkList);
				
				var cellList = document.getElementById("warehouseList");
				cellList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				cellList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
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
				
				var hiddenCode2 = document.getElementById("codeForCellList");
				hiddenCode2.innerHTML="";
				
				var hiddenInput2 = document.createElement("input");
				hiddenInput2.setAttribute("type","hidden");
				hiddenInput2.setAttribute("value", jsonObj.rackCode);
				hiddenCode2.appendChild(hiddenInput2);
							
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
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
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
		
	} */
		
	
	function cellInsert(){
		
		var cNameVal = document.getElementById("cNameVal").value;
		var rackCode = document.getElementById("cellRackCode").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var result = JSON.parse(xhr.responseText);									
				
				document.getElementById("cNameVal").value = "";
				newRkCellList(rackCode);
				
			}		
		}
		
		xhr.open("post" , "./cellInsert");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_cell_name=" + cNameVal + "&warehouse_rack_code=" + rackCode);
		
	}
	
	//전체 체크
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=checkAll]").checked;

		var checkList = document.getElementsByName("selectedCode");
		
		if(allCheckValue){
			for(var i = 0; i < checkList.length; i++){
				checkList[i].checked = true;
			}
		}else{
			for(var i = 0; i < checkList.length; i++){
				checkList[i].checked = false;
			};
		}
	}
	
	//부분 체크
	function isChecked(){
		
		var total = document.getElementById("checkAll");
		var checkList = document.getElementsByName("selectedCode");
		var countCh = 0;
		
		for(var i = 0; i < checkList.length; i++) {
			if(checkList[i].checked == true){
				countCh += 1;
				if(countCh == checkList.length){
				total.checked = true;
				}
			}else{
				total.checked = false;
			}
		}
	}
	
	function beforeUpdateWh(){
		
		var checkVal = "";		
		var checkedLength = document.getElementsByName("selectedCode").length;		
		var count = 0;
		
		for (var i = 0; i < checkedLength; i++) {

            if (document.getElementsByName("selectedCode")[i].checked == true) {
            	count += 1;
            }
        }
		
		if(count == 0){
        	alert("수정할 창고가 선택되지 않았습니다.");
        	location.reload()
        	return;
        }else if(count > 1){
        	alert("한 개의 창고만 수정할 수 있습니다.");
        	location.reload()
        	return;
        }else if (count==1){
        	
        	 for (var i = 0; i < checkedLength; i++) {						 
        		 
                 if (document.getElementsByName("selectedCode")[i].checked == true) {
                 	checkVal = document.getElementsByName("selectedCode")[i].value;
                 	
                 	var updateHiddenBox = document.getElementById("updateWhValue");
                	updateHiddenBox.innerHTML = "";
                	
                	updateHiddenValue = document.createElement("input");
                	updateHiddenValue.setAttribute("type","hidden");
                	updateHiddenValue.value = checkVal;
                	updateHiddenBox.appendChild(updateHiddenValue);

                 }
             }       	
        }		
	}
	
	function whUpdate(){
		
		var whCodeVal = document.getElementById("updateWhValue").firstChild.value;
		var whClaVal = document.getElementById("upWhClassification").value;
		var whNameVal = document.getElementById("upWhName").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
		
				warehouseList()
				
			}
		}
			
		xhr.open("post" , "./whUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_code=" + whCodeVal + "&warehouse_classification=" + whClaVal + "&warehouse_name=" +whNameVal);	
							
	}
	
	function beforeUpdateAr(){
			
		var checkVal = "";		
		var checkedLength = document.getElementsByName("selectedCode").length;		
		var count = 0;
		
		for (var i = 0; i < checkedLength; i++) {

            if (document.getElementsByName("selectedCode")[i].checked == true) {
            	count += 1;
            }
        }
		
		if(count == 0){
        	alert("수정할 구역이 선택되지 않았습니다.");        	
        	location.reload();
        	return;
        }else if(count > 1){
        	alert("한 개의 구역만 수정할 수 있습니다.");
        	location.reload();
        	return;
        }else if (count==1){
        	
        	 for (var i = 0; i < checkedLength; i++) {						 
        		 
                 if (document.getElementsByName("selectedCode")[i].checked == true) {
                 	checkVal = document.getElementsByName("selectedCode")[i].value;
                 	
                 	var updateHiddenBox = document.getElementById("updateArValue");
                	updateHiddenBox.innerHTML = "";
                	
                	updateHiddenValue = document.createElement("input");
                	updateHiddenValue.setAttribute("type","hidden");
                	updateHiddenValue.value = checkVal;
                	updateHiddenBox.appendChild(updateHiddenValue);

                 }
             }       	
        }		
	}
	
	
	function arUpdate(){
		
		var arCodeVal = document.getElementById("updateArValue").firstChild.value;		
		var arNameVal = document.getElementById("upArName").value;
		var warehouseCode = document.getElementById("codeForAreaList").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
		
				areaList(warehouseCode)
				
			}
		}
			
		xhr.open("post" , "./arUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_area_code=" + arCodeVal + "&warehouse_area_name=" + arNameVal);	
							
	}
	
	function beforeUpdateRk(){
		
		var checkVal = "";		
		var checkedLength = document.getElementsByName("selectedCode").length;		
		var count = 0;
		
		for (var i = 0; i < checkedLength; i++) {

            if (document.getElementsByName("selectedCode")[i].checked == true) {
            	count += 1;
            }
        }
		
		if(count == 0){
        	alert("수정할 구역이 선택되지 않았습니다.");
        	location.reload()
        	return;
        }else if(count > 1){
        	alert("한 개의 구역만 수정할 수 있습니다.");
        	location.reload()
        	return;
        }else if (count==1){
        	
        	 for (var i = 0; i < checkedLength; i++) {						 
        		 
                 if (document.getElementsByName("selectedCode")[i].checked == true) {
                 	checkVal = document.getElementsByName("selectedCode")[i].value;
                 	
                 	var updateHiddenBox = document.getElementById("updateRkValue");
                	updateHiddenBox.innerHTML = "";
                	
                	updateHiddenValue = document.createElement("input");
                	updateHiddenValue.setAttribute("type","hidden");
                	updateHiddenValue.value = checkVal;
                	updateHiddenBox.appendChild(updateHiddenValue);

                 }
             }       	
        }		
	}
	
	function rkUpdate(){
		
		var rkCodeVal = document.getElementById("updateRkValue").firstChild.value;		
		var rkNameVal = document.getElementById("upRkName").value;
		var areaCode = document.getElementById("codeForRackList").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
		
				newArRackList(areaCode);
				
			}
		}
			
		xhr.open("post" , "./rkUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_rack_code=" + rkCodeVal + "&warehouse_rack_name=" + rkNameVal);	
							
	}
	
	
	function beforeUpdateCl(){
		
		var checkVal = "";		
		var checkedLength = document.getElementsByName("selectedCode").length;		
		var count = 0;
		
		for (var i = 0; i < checkedLength; i++) {

            if (document.getElementsByName("selectedCode")[i].checked == true) {
            	count += 1;
            }
        }
		
		if(count == 0){
        	alert("수정할 구역이 선택되지 않았습니다.");
        	location.reload()
        	return;
        }else if(count > 1){
        	alert("한 개의 구역만 수정할 수 있습니다.");
        	location.reload()
        	return;
        }else if (count==1){
        	
        	 for (var i = 0; i < checkedLength; i++) {						 
        		 
                 if (document.getElementsByName("selectedCode")[i].checked == true) {
                 	checkVal = document.getElementsByName("selectedCode")[i].value;
                 	
                 	var updateHiddenBox = document.getElementById("updateClValue");
                	updateHiddenBox.innerHTML = "";
                	
                	updateHiddenValue = document.createElement("input");
                	updateHiddenValue.setAttribute("type","hidden");
                	updateHiddenValue.value = checkVal;
                	updateHiddenBox.appendChild(updateHiddenValue);

                 }
             }       	
        }		
	}
	
	function clUpdate(){
		
		var clCodeVal = document.getElementById("updateRkValue").firstChild.value;		
		var clNameVal = document.getElementById("upClName").value;
		var rackCode = document.getElementById("codeForCellList").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
		
				newRkCellList(rackCode);
				
			}
		}
			
		xhr.open("post" , "./clUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("warehouse_cell_code=" + clCodeVal + "&warehouse_cell_name=" + clNameVal);	
							
	}
	
	function deleteCell(){
		
	var checkList = new Array();
	var rackCode = document.getElementById("codeForCellList").firstChild.value;
	
		var listLength = document.getElementsByName("selectedCode").length;
		
		for (var i = 0; i < listLength; i++) {

            if (document.getElementsByName("selectedCode")[i].checked == true) {
            	
            	checkList[i] = document.getElementsByName("selectedCode")[i].value;
            	
            }
        }		

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				newRkCellList(rackCode)
				
			}
		}
		
		xhr.open("post" , "./deleteCell" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkList);
	
	}
	
	function deleteRack(){
		
		var checkList = new Array();
		var areaCode = document.getElementById("codeForRackList").firstChild.value;
		
			var listLength = document.getElementsByName("selectedCode").length;
			
			for (var i = 0; i < listLength; i++) {

	            if (document.getElementsByName("selectedCode")[i].checked == true) {
	            	
	            	checkList[i] = document.getElementsByName("selectedCode")[i].value;
	            	
	            }
	        }		

			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText);	
					
					newArRackList(areaCode);
					
				}
			}
			
			xhr.open("post" , "./deleteRack" , false);
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send("code=" + checkList);
		
		}
		
	
	function deleteByAreaCode(){
		
		var checkList = new Array();
		var warehouseCode = document.getElementById("codeForAreaList").firstChild.value;
		
			var listLength = document.getElementsByName("selectedCode").length;
			
			for (var i = 0; i < listLength; i++) {

	            if (document.getElementsByName("selectedCode")[i].checked == true) {
	            	
	            	checkList[i] = document.getElementsByName("selectedCode")[i].value;
	            	
	            }
	        }		

			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText);	
					
					newArRackList(areaCode);
					
				}
			}
			
			xhr.open("post" , "./deleteByAreaCode" , false);
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send("code=" + checkList);
		
		}
	
	function deleteByWarehouseCode(){
		
		var checkList = new Array();
		
			var listLength = document.getElementsByName("selectedCode").length;
			
			for (var i = 0; i < listLength; i++) {

	            if (document.getElementsByName("selectedCode")[i].checked == true) {
	            	
	            	checkList[i] = document.getElementsByName("selectedCode")[i].value;
	            	
	            }
	        }		

			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText);	
					
					warehouseList()
					
				}
			}
			
			xhr.open("post" , "./deleteByWarehouseCode" , false);
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send("code=" + checkList);
		
		}
	
	function newArRackList(areaCode){
		
		if(areaCode != null){
			code = areaCode
		}else{
			code = document.getElementById("rackAreaCode").firstChild.value;
		}
		
		document.getElementById("stockListBase").innerHTML = "" ;
		
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
				rackUpBtn.setAttribute("onclick","beforeUpdateRk()");
				rackUpBtn.setAttribute("data-bs-target","#rackUpdate");
				btnCotroller.appendChild(rackUpBtn);
				
				var rackDelBtn = document.createElement("button");
				rackDelBtn.type = "button";
				rackDelBtn.classList.add("btn");
				rackDelBtn.classList.add("btn-light");
				rackDelBtn.innerText = "랙 삭제";
				rackDelBtn.setAttribute("data-bs-toggle","modal");
				rackDelBtn.setAttribute("data-bs-target","#rackDeleteAlert");			
				btnCotroller.appendChild(rackDelBtn);		
				
				var backToArList = document.createElement("button");
				backToArList.type = "button";
				backToArList.classList.add("btn");
				backToArList.classList.add("btn-light");
				backToArList.innerText = "뒤로가기";
				backToArList.setAttribute("onclick","areaList()")				
				btnCotroller.appendChild(backToArList);
				
				var rackList = document.getElementById("warehouseList");
				rackList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				rackList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "랙 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "랙 이름";
				headTr.appendChild(headTh2);
				
				var hiddenCode = document.getElementById("rackAreaCode");
				hiddenCode.innerHTML = "";
				
				var hiddenInput = document.createElement("input");
				hiddenInput.setAttribute("type","hidden");
				hiddenInput.setAttribute("value", jsonObj.areaCode);
				hiddenCode.appendChild(hiddenInput);
				
				var hiddenCode2 = document.getElementById("codeForRackList");
				hiddenCode2.innerHTML="";
				
				var hiddenInput2 = document.createElement("input");
				hiddenInput2.setAttribute("type","hidden");
				hiddenInput2.setAttribute("value", jsonObj.areaCode);
				hiddenCode2.appendChild(hiddenInput2);			
				
				for(myRackList of jsonObj.rList){
					
					var tBody = document.createElement("tbody");
					rackList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myRackList.warehouse_rack_code;
					bodyCheckBox.innerText = myRackList.warehouse_area_code;	
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyTd1.appendChild(bodyCheckBox);				
					
					var rackCodeTh = document.createElement("th");
					rackCodeTh.innerText = myRackList.warehouse_rack_code;
					rackCodeTh.setAttribute("onclick" , "newRkCellList(this.innerText)");
					bodyTr.appendChild(rackCodeTh);		
					
					var rackName = document.createElement("td");
					rackName.innerText = myRackList.warehouse_rack_name;
					bodyTr.appendChild(rackName);	
					
				}
				
				var pageController = document.getElementById("pageUi");
				pageController.innerHTML = "";
				pageController.setAttribute("id","pageUi");
				pageController.classList.add("pagination");
				pageController.classList.add("justify-content-center");
				
				if (jsonObj.startPage <= 1){
									
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					inLi1.classList.add("disabled");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.setAttribute("href","#");
					inA1.setAttribute("aria-label","Previous");
					inA1.classList.add("page-link");
					inLi1.appendChild(inA1);
	
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);	
				
				}else{
					
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("aria-label","Previous");					
					inA1.setAttribute("href","javascript:newArRackListPagenation("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inLi1.appendChild(inA1);
					
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
					
				}
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
									
					if(i == jsonObj.currentPageNum){
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newArRackListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
										
					}else{
											
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newArRackListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}	
				}
				
				if(jsonObj.endPage >= jsonObj.totalPageCount){
					
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					inLi3.classList.add("disabled");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","#");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				
				}else{
					
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","javascript:newArRackListPagenation("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
					
				}				
			}		
		}
					
		xhr.open("get" , "./newArRackList?areaCode=" + code);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function newArRackListPagenation(pageNumVal){
		
		var code = document.getElementById("rackAreaCode").firstChild.value;
		
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
				rackUpBtn.setAttribute("onclick","beforeUpdateRk()");
				rackUpBtn.setAttribute("data-bs-target","#rackUpdate");
				btnCotroller.appendChild(rackUpBtn);
				
				var rackDelBtn = document.createElement("button");
				rackDelBtn.type = "button";
				rackDelBtn.classList.add("btn");
				rackDelBtn.classList.add("btn-light");
				rackDelBtn.innerText = "랙 삭제";
				rackDelBtn.setAttribute("data-bs-toggle","modal");
				rackDelBtn.setAttribute("data-bs-target","#rackDeleteAlert");			
				btnCotroller.appendChild(rackDelBtn);		
				
				var backToArList = document.createElement("button");
				backToArList.type = "button";
				backToArList.classList.add("btn");
				backToArList.classList.add("btn-light");
				backToArList.innerText = "뒤로가기";
				backToArList.setAttribute("onclick","areaList()")				
				btnCotroller.appendChild(backToArList);
				
				var rackList = document.getElementById("warehouseList");
				rackList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				rackList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "랙 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "랙 이름";
				headTr.appendChild(headTh2);
				
				var hiddenCode = document.getElementById("rackAreaCode");
				hiddenCode.innerHTML = "";
				
				var hiddenInput = document.createElement("input");
				hiddenInput.setAttribute("type","hidden");
				hiddenInput.setAttribute("value", jsonObj.areaCode);
				hiddenCode.appendChild(hiddenInput);
				
				var hiddenCode2 = document.getElementById("codeForRackList");
				hiddenCode2.innerHTML="";
				
				var hiddenInput2 = document.createElement("input");
				hiddenInput2.setAttribute("type","hidden");
				hiddenInput2.setAttribute("value", jsonObj.areaCode);
				hiddenCode2.appendChild(hiddenInput2);			
				
				for(myRackList of jsonObj.rList){
					
					var tBody = document.createElement("tbody");
					rackList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myRackList.warehouse_rack_code;
					bodyCheckBox.innerText = myRackList.warehouse_area_code;	
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyTd1.appendChild(bodyCheckBox);				
					
					var rackCodeTh = document.createElement("th");
					rackCodeTh.innerText = myRackList.warehouse_rack_code;
					rackCodeTh.setAttribute("onclick" , "newRkCellList(this.innerText)");
					bodyTr.appendChild(rackCodeTh);		
					
					var rackName = document.createElement("td");
					rackName.innerText = myRackList.warehouse_rack_name;
					bodyTr.appendChild(rackName);	
					
				}
				
				var pageController = document.getElementById("pageUi");
				pageController.innerHTML = "";
				pageController.setAttribute("id","pageUi");
				pageController.classList.add("pagination");
				pageController.classList.add("justify-content-center");				
				
				if (jsonObj.startPage <= 1){
								
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					inLi1.classList.add("disabled");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.setAttribute("href","#");
					inA1.setAttribute("aria-label","Previous");
					inA1.classList.add("page-link");
					inLi1.appendChild(inA1);
	
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);	
				
				}else{
					
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("aria-label","Previous");					
					inA1.setAttribute("href","javascript:newArRackListPagenation("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inLi1.appendChild(inA1);
					
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
					
				}
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
					
					if(i == jsonObj.currentPageNum){
												
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newArRackListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
						
					}else{
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newArRackListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}	
				}
				
				if(jsonObj.endPage >= jsonObj.totalPageCount){
										
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					inLi3.classList.add("disabled");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","#");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				
				}else{
					
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","javascript:newArRackListPagenation("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
					
				}				
			}		
		}
					
		xhr.open("get" , "./newArRackList?areaCode=" + code +"&pageNum="+ pageNumVal);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	
	function newRkCellList(rackCode){
		
		if(rackCode != null){
			code = rackCode
		}else{
			code = document.getElementById("cellRackCode").firstChild.value;
		}
		
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
				cellUpBtn.setAttribute("onclick","beforeUpdateRk()");
				cellUpBtn.setAttribute("data-bs-target","#cellUpdate");
				btnCotroller.appendChild(cellUpBtn);			
				
				var cellDelBtn = document.createElement("button");
				cellDelBtn.type = "button";
				cellDelBtn.classList.add("btn");
				cellDelBtn.classList.add("btn-light");
				cellDelBtn.innerText = "셀 삭제";
				cellDelBtn.setAttribute("onclick","deleteCell()")				
				btnCotroller.appendChild(cellDelBtn);
						
				var backTorkList = document.createElement("button");
				backTorkList.type = "button";
				backTorkList.classList.add("btn");
				backTorkList.classList.add("btn-light");
				backTorkList.innerText = "뒤로가기";
				backTorkList.setAttribute("onclick","newArRackList()")				
				btnCotroller.appendChild(backTorkList);
				
				var cellList = document.getElementById("warehouseList");
				cellList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				cellList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
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
				
				var hiddenCode2 = document.getElementById("codeForCellList");
				hiddenCode2.innerHTML="";
				
				var hiddenInput2 = document.createElement("input");
				hiddenInput2.setAttribute("type","hidden");
				hiddenInput2.setAttribute("value", jsonObj.rackCode);
				hiddenCode2.appendChild(hiddenInput2);
							
				for(myCellList of jsonObj.cList){
					
					var tBody = document.createElement("tbody");
					cellList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myCellList.warehouse_cell_code;
					bodyCheckBox.innerText = myCellList.warehouse_rack_code;	
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyTd1.appendChild(bodyCheckBox);
					
					var cellCodeTh = document.createElement("th");
					cellCodeTh.innerText = myCellList.warehouse_cell_code;
					cellCodeTh.setAttribute("onclick","stockListInCell(this.innerText)");
					bodyTr.appendChild(cellCodeTh);		
					
					var cellName = document.createElement("td");
					cellName.innerText = myCellList.warehouse_cell_name;
					bodyTr.appendChild(cellName);
					
				}
				
				var pageController = document.getElementById("pageUi");
				pageController.innerHTML = "";
				pageController.setAttribute("id","pageUi");
				pageController.classList.add("pagination");
				pageController.classList.add("justify-content-center");
				
				if (jsonObj.startPage <= 1){
									
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					inLi1.classList.add("disabled");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.setAttribute("href","#");
					inA1.setAttribute("aria-label","Previous");
					inA1.classList.add("page-link");
					inLi1.appendChild(inA1);
	
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);	
				
				}else{
					
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("aria-label","Previous");					
					inA1.setAttribute("href","javascript:newRkCellListPagenation("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inLi1.appendChild(inA1);
					
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
					
				}
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
									
					if(i == jsonObj.currentPageNum){
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newRkCellListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
										
					}else{
											
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newRkCellListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}	
				}
				
				if(jsonObj.endPage >= jsonObj.totalPageCount){
					
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					inLi3.classList.add("disabled");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","#");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				
				}else{
					
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","javascript:newRkCellListPagenation("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);				
					
				}				
			}		
		}
					
		xhr.open("get" , "./newRkCellList?rackCode=" + code);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function newRkCellListPagenation(pageNumVal){
		
		var code = document.getElementById("cellRackCode").firstChild.value;
		
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
				cellUpBtn.setAttribute("onclick","beforeUpdateRk()");
				cellUpBtn.setAttribute("data-bs-target","#cellUpdate");
				btnCotroller.appendChild(cellUpBtn);			
				
				var cellDelBtn = document.createElement("button");
				cellDelBtn.type = "button";
				cellDelBtn.classList.add("btn");
				cellDelBtn.classList.add("btn-light");
				cellDelBtn.innerText = "셀 삭제";
				cellDelBtn.setAttribute("onclick","deleteCell()")				
				btnCotroller.appendChild(cellDelBtn);
						
				var backTorkList = document.createElement("button");
				backTorkList.type = "button";
				backTorkList.classList.add("btn");
				backTorkList.classList.add("btn-light");
				backTorkList.innerText = "뒤로가기";
				backTorkList.setAttribute("onclick","newArRackList()")				
				btnCotroller.appendChild(backTorkList);
				
				var cellList = document.getElementById("warehouseList");
				cellList.innerHTML = "";							
				
				var thead = document.createElement("thead");
				cellList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
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
				
				var hiddenCode2 = document.getElementById("codeForCellList");
				hiddenCode2.innerHTML="";
				
				var hiddenInput2 = document.createElement("input");
				hiddenInput2.setAttribute("type","hidden");
				hiddenInput2.setAttribute("value", jsonObj.rackCode);
				hiddenCode2.appendChild(hiddenInput2);
							
				for(myCellList of jsonObj.cList){
					
					var tBody = document.createElement("tbody");
					cellList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
					
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.value = myCellList.warehouse_cell_code;
					bodyCheckBox.innerText = myCellList.warehouse_rack_code;	
					bodyCheckBox.setAttribute("name","selectedCode");				
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyTd1.appendChild(bodyCheckBox);
					
					var cellCodeTh = document.createElement("th");
					cellCodeTh.innerText = myCellList.warehouse_cell_code;
					cellCodeTh.setAttribute("onclick","stockListInCell(this.innerText)");
					bodyTr.appendChild(cellCodeTh);		
					
					var cellName = document.createElement("td");
					cellName.innerText = myCellList.warehouse_cell_name;
					bodyTr.appendChild(cellName);
					
				}
				
				var pageController = document.getElementById("pageUi");
				pageController.innerHTML = "";
				pageController.setAttribute("id","pageUi");
				pageController.classList.add("pagination");
				pageController.classList.add("justify-content-center");
				
				if (jsonObj.startPage <= 1){
									
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					inLi1.classList.add("disabled");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.setAttribute("href","#");
					inA1.setAttribute("aria-label","Previous");
					inA1.classList.add("page-link");
					inLi1.appendChild(inA1);
	
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);	
				
				}else{
					
					var inLi1 = document.createElement("li"); 
					inLi1.classList.add("page-item");
					pageController.appendChild(inLi1);
					
					var inA1 = document.createElement("a");
					inA1.classList.add("page-link");
					inA1.setAttribute("aria-label","Previous");					
					inA1.setAttribute("href","javascript:newRkCellListPagenation("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inLi1.appendChild(inA1);
					
					var inSpan1 = document.createElement("span");
					inSpan1.setAttribute("aria-hidden","true");
					inSpan1.textContent = "<<";
					inA1.appendChild(inSpan1);
					
				}
				
				for(var i = jsonObj.startPage ; i <= jsonObj.endPage ; i++){
									
					if(i == jsonObj.currentPageNum){
						
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						inLi2.classList.add("active");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newRkCellListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
										
					}else{
											
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newRkCellListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
					}	
				}
				
				if(jsonObj.endPage >= jsonObj.totalPageCount){
					
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					inLi3.classList.add("disabled");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","#");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
				
				}else{
					
					var inLi3 = document.createElement("li"); 
					inLi3.classList.add("page-item");
					pageController.appendChild(inLi3);

					var inA3 = document.createElement("a");
					inA3.classList.add("page-link");
					inA3.setAttribute("href","javascript:newRkCellListPagenation("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);
					
				}				
			}		
		}
					
		xhr.open("get" , "./newRkCellList?rackCode=" + code + "&pageNum=" + pageNumVal);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function stockListInCell(cellCode){
		
		var code = cellCode;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var stockUi = document.getElementById("stockListBase");
				stockUi.innerHTML = "";
				
				var stockForm = document.createElement("div");
				stockForm.classList.add("form-control");
				stockForm.classList.add("mt-3");
				stockUi.appendChild(stockForm);
				
				var stockRow = document.createElement("row")
				stockForm.appendChild(stockRow);
				
				var stockContainer = document.createElement("div");
				stockContainer.classList.add("scroll-container");
				stockContainer.classList.add("mt-1");
				stockRow.appendChild(stockContainer);
				
				var stockScroll = document.createElement("div");
				stockScroll.classList.add("scrollTable");
				stockContainer.appendChild(stockScroll);
				
				var stockTable = document.createElement("table");
				stockTable.classList.add("table");
				stockTable.classList.add("table-bordered");
				stockTable.classList.add("text-center");
				stockContainer.appendChild(stockTable);
				
				var stThead = document.createElement("thead");
				stockTable.appendChild(stThead);
				
				var stHeadTr = document.createElement("tr");
				stThead.appendChild(stHeadTr);	
						
				var stHeadTh1 = document.createElement("th");
				stHeadTh1.innerText = "재고 코드";
				stHeadTr.appendChild(stHeadTh1);
				
				var stHeadTh2 = document.createElement("th");
				stHeadTh2.innerText = "제품 코드";
				stHeadTr.appendChild(stHeadTh2);
				
				var stHeadTh3 = document.createElement("th");
				stHeadTh3.innerText = "제품 이름";
				stHeadTr.appendChild(stHeadTh3);
				
				var stHeadTh4 = document.createElement("th");
				stHeadTh4.innerText = "재고량";
				stHeadTr.appendChild(stHeadTh4);
				
				var stHeadTh5 = document.createElement("th");
				stHeadTh5.innerText = "비고";
				stHeadTr.appendChild(stHeadTh5);
				
				var stHeadTh6 = document.createElement("th");
				stHeadTh6.innerText = "재고 등록일";
				stHeadTr.appendChild(stHeadTh6);
				
				var stHeadTh7 = document.createElement("th");
				stHeadTh7.innerText = "재고 수정일";
				stHeadTr.appendChild(stHeadTh7);
						
					for(stockList of jsonObj.stockInCell){
					
					var sTBody = document.createElement("tbody");
					stockTable.appendChild(sTBody);
					
					var bodySTr = document.createElement("tr");
					sTBody.appendChild(bodySTr);
									
					var scth = document.createElement("th");
					scth.innerText = stockList.stock_code;
					bodySTr.appendChild(scth);		
					
					var pcTd = document.createElement("td");
					pcTd.innerText = stockList.product_code;
					bodySTr.appendChild(pcTd);
					
					var pnTd = document.createElement("td");
					pnTd.innerText = stockList.product_name;
					bodySTr.appendChild(pnTd);
					
					var saTd = document.createElement("td");
					saTd.innerText = stockList.stock_amount;
					bodySTr.appendChild(saTd);
					
					var smTd = document.createElement("td");
					smTd.innerText = stockList.stock_memo;
					bodySTr.appendChild(smTd);
					
					var srTd = document.createElement("td");
					srTd.innerText = moment(stockList.stock_resiter_date).format('YYYY.MM.DD');
					bodySTr.appendChild(srTd);
					
					var suTd = document.createElement("td");
					suTd.innerText = moment(stockList.stock_update_date).format('YYYY.MM.DD');
					bodySTr.appendChild(suTd);
					
				}			
			}							
		}	
		
		xhr.open("get" , "./stockListInCell?cellCode=" + code);
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
	        <div class="form-control mt-3" id="btnCotroller">
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#warehouseRegist">
	                등록
	             </button>
	             <button type="button" class="btn btn-light" onclick="beforeUpdateWh()" data-bs-toggle="modal" data-bs-target="#warehouseUpdate">
	             	수정
	             </button>
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#warehouseDeleteAlert">
	             	창고 삭제
	             </button>
	        </div>
	     </div>
	     <div class="row">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">창고 목록</span>
                    </div>
                    <div class="col-4">
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
               	<div class="page mt-3" >
					<nav aria-label="Page navigation example">
						<ul id="pageUi" class="pagination justify-content-center"></ul>
					</nav>
				</div>
            </div>
        </div>
	    <div class="row" id="stockListBase">
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
                            		<div id="updateWhValue">
                            		
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="whUpdate()" data-bs-dismiss="modal">수정</button>
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
                            		<div id="updateArValue">
                            		
                            		</div>
                            		<div id="codeForAreaList"></div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="arUpdate()" data-bs-dismiss="modal">수정</button>
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
                            		<div id="updateRkValue">
                            		
                            		</div>
                            		<div id="codeForRackList">
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
                            		<div id="updateRkValue">                           		
                            		</div>
                            		<div id="codeForCellList">
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
		 <!-- 랙 삭제 경고 모달 -->
		 <div class="modal fade" id="rackDeleteAlert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">랙 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<h6 class="modal-title" id="exampleModalLabel">랙을 삭제하실 경우 하위의 셀도 같이 삭제됩니다. <br> 정말로 삭제하시겠습니까?</h6>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" onclick="deleteRack()" data-bs-dismiss="modal">삭제</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 구역 삭제 경고 모달 -->
		 <div class="modal fade" id="areaDeleteAlert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">구역 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<h6 class="modal-title" id="exampleModalLabel">구역을 삭제하실 경우 하위 요소가 전부 삭제됩니다. <br> 정말로 삭제하시겠습니까?</h6>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" onclick="deleteByAreaCode()" data-bs-dismiss="modal">삭제</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 창고 삭제 경고 모달 -->
		 <div class="modal fade" id="warehouseDeleteAlert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">창고 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<h6 class="modal-title" id="exampleModalLabel">창고를 삭제하실 경우 하위 요소가 전부 삭제됩니다. <br> 정말로 삭제하시겠습니까?</h6>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" onclick="deleteByWarehouseCode()" data-bs-dismiss="modal">삭제</button>
					     </div>
				    </div>
			  </div>
		 </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>