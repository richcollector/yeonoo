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
      
    </style>
	
<script type="text/javascript">
	
	function findLotToRegi(){
		
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
									
				for (searchList of jsonObj.lot){
					 
					resultLi = document.createElement("li");
					resultLi.classList.add("list-group-item");
					resultLi.innerText = searchList.lot.lot_code;
					resultLi.setAttribute("onclick", "foundedLotInfo(this)");
					resultUl.appendChild(resultLi);								
					
					resultHidden = document.createElement("input");
					resultHidden.setAttribute("type","hidden");
					resultHidden.value = searchList.lot.lot_code;
					resultLi.appendChild(resultHidden);
					
				}	
				
			}		
		}
					
			xhr.open("get" , "./findLotToRegi?lotCode=" + keyword);
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
			
		}
	
	function foundedLotInfo(lotInfo){
		
		var lotCode = lotInfo.children[0].value;
	
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var infoBox = document.getElementById("LotInfoUi");
				infoBox.innerHTML = "";
				
				var productNameBox = document.createElement("div");
				productNameBox.classList.add("input-group");
				infoBox.appendChild(productNameBox);
				
				var formBox1 = document.createElement("div");
				formBox1.classList.add("form-floating");
				formBox1.setAttribute("style","width:50%");
				productNameBox.appendChild(formBox1);
				
				var lotVal = document.createElement("input");
				lotVal.setAttribute("readonly","true");
				lotVal.classList.add("form-control-plaintext");
				lotVal.id = "floatingPlaintextInput";
				lotVal.value = jsonObj.lot.lot.lot_code;
				formBox1.appendChild(lotVal);
				
				var nameLabel = document.createElement("label");
				nameLabel.setAttribute("for","floatingPlaintextInput");
				nameLabel.innerText = "로트 번호";
				formBox1.appendChild(nameLabel);
				
				var productCodeBox = document.createElement("div");
				productCodeBox.classList.add("input-group");
				infoBox.appendChild(productCodeBox);
				
				var formBox2 = document.createElement("div");
				formBox2.classList.add("form-floating");
				formBox2.setAttribute("style","width:50%");			
				formBox2.setAttribute("onclick","helpProduct(this)")
				productNameBox.appendChild(formBox2);
				
				var hbbox = document.createElement("input");
				hbbox.setAttribute("type","hidden");
				hbbox.value = jsonObj.lot.lot.product_code;	
				formBox2.appendChild(hbbox);
				
				var codeVal = document.createElement("input");
				codeVal.setAttribute("readonly","true");
				codeVal.classList.add("form-control-plaintext");
				codeVal.id = "floatingPlaintextInput";
				codeVal.value = jsonObj.lot.lot.product_code;			
				formBox2.appendChild(codeVal);
					
				var codeLabel = document.createElement("label");
				codeLabel.setAttribute("for","floatingPlaintextInput");
				codeLabel.innerText = "제품 코드";
				formBox2.appendChild(codeLabel);
				
				var lotDateBox = document.createElement("div");
				lotDateBox.classList.add("input-group");
				infoBox.appendChild(lotDateBox);
				
				var formBox3 = document.createElement("div");
				formBox3.classList.add("form-floating");
				formBox3.setAttribute("style","width:100%");
				productNameBox.appendChild(formBox3);
				
				var dateVal = document.createElement("input");
				dateVal.setAttribute("readonly","true");
				dateVal.classList.add("form-control-plaintext");
				dateVal.id = "floatingPlaintextInput";
				dateVal.value = moment(jsonObj.lot.lot.lot_date).format('YYYY.MM.DD');
				formBox3.appendChild(dateVal);
				
				var dateLabel = document.createElement("label");
				dateLabel.setAttribute("for","floatingPlaintextInput");
				dateLabel.innerText = "로트 등록일";
				formBox3.appendChild(dateLabel);		
				
				var lotCodeValInput = document.getElementById("lotCode");
				lotCodeValInput.value = jsonObj.lot.lot.lot_code;
				
				var productCodeValInput = document.getElementById("productCode");
				productCodeValInput.value = jsonObj.lot.lot.product_code;			
				
				var cleanUI = document.getElementById("helpBox");
				cleanUI.innerHTML = "";
				
			}		
		}
					
			xhr.open("get" , "./foundedLotInfo?lotCode=" + lotCode);
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
			
		}
	
	function helpProduct(infoCallBox){
		
		var code = infoCallBox.children[0].value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);				
				
				var helpWindow = document.getElementById("helpBox");
				helpWindow.innerHTML = "";
				
				var productNameBox = document.createElement("div");
				productNameBox.classList.add("input-group");
				helpWindow.appendChild(productNameBox);
				
				var formBox1 = document.createElement("div");
				formBox1.classList.add("form-floating");
				formBox1.setAttribute("style","width:50%");
				productNameBox.appendChild(formBox1);
				
				var lotVal = document.createElement("input");
				lotVal.setAttribute("readonly","true");
				lotVal.classList.add("form-control-plaintext");
				lotVal.id = "floatingPlaintextInput";
				lotVal.value = jsonObj.product.product.product_name;
				formBox1.appendChild(lotVal);
				
				var nameLabel = document.createElement("label");
				nameLabel.setAttribute("for","floatingPlaintextInput");
				nameLabel.innerText = "제품 이름";
				formBox1.appendChild(nameLabel);
				
				var productCodeBox = document.createElement("div");
				productCodeBox.classList.add("input-group");
				helpWindow.appendChild(productCodeBox);
				
				var formBox2 = document.createElement("div");
				formBox2.classList.add("form-floating");
				formBox2.setAttribute("style","width:50%");			
				formBox2.setAttribute("onclick","helpProduct(this)")
				productNameBox.appendChild(formBox2);
				
				var codeVal = document.createElement("input");
				codeVal.setAttribute("readonly","true");
				codeVal.classList.add("form-control-plaintext");
				codeVal.id = "floatingPlaintextInput";
				codeVal.value = jsonObj.product.product.product_memo;			
				formBox2.appendChild(codeVal);
					
				var codeLabel = document.createElement("label");
				codeLabel.setAttribute("for","floatingPlaintextInput");
				codeLabel.innerText = "제품 메모";
				formBox2.appendChild(codeLabel);				
				
			}
		}	
		
		xhr.open("get" , "./helpProduct?productCode=" + code);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function warehouseSelector(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
			
				var warehouseList = document.getElementById("warehouseCode");
				warehouseList.setAttribute("onchange", "areaSelector(this)");
				warehouseList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "창고 선택";
				warehouseList.appendChild(listSample);
				
				for (whSelector of jsonObj.whSel){
					
					var listContents = document.createElement("option");
					listContents.value = whSelector.warehouse.warehouse_code;
					listContents.innerText = whSelector.warehouse.warehouse_name;
					warehouseList.appendChild(listContents);

					
				}
				
			}
		}
		
		xhr.open("get" , "./whSel");
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	

	function areaSelector(whList){		
			
		whCode = whList.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
			
				var areaList = document.getElementById("areaCode");
				areaList.setAttribute("onchange", "rackSelector(this)");
				areaList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "구역 선택";
				areaList.appendChild(listSample);
				
				for (arSelector of jsonObj.arSel){
					
					var listContents = document.createElement("option");
					listContents.value = arSelector.area.warehouse_area_code;
					listContents.innerText = arSelector.area.warehouse_area_name;
					areaList.appendChild(listContents);
				}
			}
		}
		
		xhr.open("get" , "./arSel?warehouseCode=" + whCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	
		
	function rackSelector(arList){
		
		arCode = arList.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var rackList = document.getElementById("rackCode");
				rackList.setAttribute("onchange", "cellSelector(this)");
				rackList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "랙 선택";
				rackList.appendChild(listSample);
				
				for (rkSelector of jsonObj.rkSel){
					
					var listContents = document.createElement("option");
					listContents.value = rkSelector.rack.warehouse_rack_code;
					listContents.innerText = rkSelector.rack.warehouse_rack_name;
					rackList.appendChild(listContents);
					
				}
			}
		}
		
		xhr.open("get" , "./rkSel?areaCode=" + arCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	
		
	function cellSelector(rkList){
		
		var rackCode = rkList.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var cellList = document.getElementById("cellCode");
				cellList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "셀 선택";
				cellList.appendChild(listSample);
				
				for (clSelector of jsonObj.clSel){
					
					var listContents = document.createElement("option");
					listContents.value = clSelector.cell.warehouse_cell_code;
					listContents.innerText = clSelector.cell.warehouse_cell_name;
					cellList.appendChild(listContents);
					
				}
			}
		}
		
		xhr.open("get" , "./clSel?rackCode=" + rackCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	
	
	function inboundRegist(){
		
		var lotCodeVal = document.getElementById("lotCode").value;
		var productCodeVal = document.getElementById("productCode").value;
		var whCodeVal = document.getElementById("warehouseCode").value;
		var arCodeVal = document.getElementById("areaCode").value;
		var rkCodeVal = document.getElementById("rackCode").value;
		var clCodeVal = document.getElementById("cellCode").value;
		var amountVal = document.getElementById("inboundAmount").value;
		var memoVal = document.getElementById("inboundMemo").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				document.getElementById("lotCode").value = "";
				document.getElementById("productCode").value = "";
				document.getElementById("warehouseCode").value = "";
				document.getElementById("areaCode").value = "";
				document.getElementById("rackCode").value = "";
				document.getElementById("cellCode").value = "";
				document.getElementById("inboundAmount").value = "";
				document.getElementById("inboundMemo").value = "";				
			
				inboundList()
				
			}
		}
		
		xhr.open("post" , "./registInbound");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("lot_code=" + lotCodeVal + "&product_code=" + productCodeVal + "&warehouse_code=" + whCodeVal + "&warehouse_area_code="+ arCodeVal
				+ "&warehouse_rack_code=" + rkCodeVal + "&warehouse_cell_code=" + clCodeVal + "&inbound_amount=" + amountVal + "&inbound_memo=" +memoVal);	
		
	}
	
	function inboundList(){
				
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var ibList = document.getElementById("inboundList");
				ibList.innerHTML = "";
				
				var thead = document.createElement("thead");
				ibList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headCheckBox = document.createElement("input");
				headCheckBox.setAttribute("type","checkbox");
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
				headTr.appendChild(headCheckBox);		
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "입고 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "로트 코드";
				headTr.appendChild(headTh2);
				
				var headTh3 = document.createElement("th");
				headTh3.innerText = "상품 코드";
				headTr.appendChild(headTh3);
		
				var headT4 = document.createElement("th");
				headT4.innerText = "창고 코드";
				headTr.appendChild(headT4);
				
				var headT5 = document.createElement("th");
				headT5.innerText = "구역 코드";
				headTr.appendChild(headT5);
				
				var headT6 = document.createElement("th");
				headT6.innerText = "랙 코드";
				headTr.appendChild(headT6);
				
				var headT7 = document.createElement("th");
				headT7.innerText = "셀 코드";
				headTr.appendChild(headT7);
				
				var headT8 = document.createElement("th");
				headT8.innerText = "입고량";
				headTr.appendChild(headT8);
			
				var headT9 = document.createElement("th");
				headT9.innerText = "입고 담당자";
				headTr.appendChild(headT9);
	
				var headT10 = document.createElement("th");
				headT10.innerText = "입고 등록일";
				headTr.appendChild(headT10);
							
				for(companyInbound of jsonObj.inboundList){
					
					var tBody = document.createElement("tbody");
					ibList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
									
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.setAttribute("name","selectedIb");
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyCheckBox.value = companyInbound.inbound_code;
					bodyTd1.appendChild(bodyCheckBox);
						
					var inboundCodeTh = document.createElement("th");
					inboundCodeTh.innerText = companyInbound.inbound_code;
					bodyTr.appendChild(inboundCodeTh)			
					
					var coCodeTd = document.createElement("td");
					coCodeTd.innerText = companyInbound.company_code;
					bodyTr.appendChild(coCodeTd);
					
					var pdCode = document.createElement("td");
					pdCode.innerText = companyInbound.product_code;
					bodyTr.appendChild(pdCode);
					
					var whCode = document.createElement("td");
					whCode.innerText = companyInbound.warehouse_code;
					bodyTr.appendChild(whCode);
					
					var arCode = document.createElement("td");
					arCode.innerText = companyInbound.warehouse_area_code;
					bodyTr.appendChild(arCode);
					
					var rkCode = document.createElement("td");
					rkCode.innerText = companyInbound.warehouse_rack_code;
					bodyTr.appendChild(rkCode);
					
					var clCode = document.createElement("td");
					clCode.innerText = companyInbound.warehouse_cell_code;
					bodyTr.appendChild(clCode);
					
					var ibAmount = document.createElement("td");
					ibAmount.innerText = companyInbound.inbound_amount;
					bodyTr.appendChild(ibAmount);
					
					var ibManager = document.createElement("td");
					ibManager.innerText = companyInbound.inbound_restiger_employee;
					bodyTr.appendChild(ibManager);
					
					var ibDate = document.createElement("td");
					ibDate.innerText = moment(companyInbound.inbound_resiter_date).format('YYYY.MM.DD');
					bodyTr.appendChild(ibDate);
					
					
				}
				
				
			}
		}
		
		
		xhr.open("get" , "./companyInboundList");
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=checkAll]").checked;

		var checkList = document.getElementsByName("selectedIb");
		
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
	
	function isChecked(){
		
		var total = document.getElementById("checkAll");
		var checkList = document.getElementsByName("selectedIb");
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
	
	function beforeUpdateIb(){
			
			var checkVal = "";		
			var checkedLength = document.getElementsByName("selectedIb").length;		
			var count = 0;
			
			for (var i = 0; i < checkedLength; i++) {
	
	            if (document.getElementsByName("selectedIb")[i].checked == true) {
	            	count += 1;
	            }
	        }
			
			if(count == 0){
	        	alert("수정할 입고사항이 선택되지 않았습니다.");
	        	location.reload()
	        	return;
	        }else if(count > 1){
	        	alert("한 개의 입고사항만 수정할 수 있습니다.");
	        	location.reload()
	        	return;
	        }else if (count==1){
	        	
	        	 for (var i = 0; i < checkedLength; i++) {						 
	        		 
	                 if (document.getElementsByName("selectedIb")[i].checked == true) {
	                 		                	
	                	checkVal = document.getElementsByName("selectedIb")[i].value;
	                	console.log(checkVal);
	                 	var thisUpdate = document.getElementById("upIbCodeInfo");
	                 	thisUpdate.innerText = checkVal;
	                 	
	                 	var updateHiddenBox = document.getElementById("selectedForUpdate");
	                	updateHiddenBox.innerHTML = "";
	                	
	                	updateHiddenValue = document.createElement("input");
	                	updateHiddenValue.setAttribute("type","hiden");
	                	updateHiddenValue.value = checkVal;
	                	updateHiddenBox.appendChild(updateHiddenValue);
	
	                 }
	             }
	        	
	        }		
			
		}
	
	function findLotToUp(){
		
		var keyword = document.getElementById("upSearchWord").value;
			
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var addUi = document.getElementById("upSearchWindowUi");
				addUi.innerHTML = "";
				
				searchResult = document.createElement("div");
				searchResult.classList.add("col");
				addUi.appendChild(searchResult);
				
				resultUl = document.createElement("ul");
				resultUl.classList.add("list-group");
				searchResult.appendChild(resultUl);
									
				for (searchList of jsonObj.lot){
					 
					resultLi = document.createElement("li");
					resultLi.classList.add("list-group-item");
					resultLi.innerText = searchList.lot.lot_code;
					resultLi.setAttribute("onclick", "upFoundedLotInfo(this)");
					resultUl.appendChild(resultLi);								
					
					resultHidden = document.createElement("input");
					resultHidden.setAttribute("type","hidden");
					resultHidden.value = searchList.lot.lot_code;
					resultLi.appendChild(resultHidden);
					
				}	
				
			}		
		}
					
			xhr.open("get" , "./findLotToRegi?lotCode=" + keyword);
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
			
		}
	
	function upFoundedLotInfo(lotInfo){
		
		var lotCode = lotInfo.children[0].value;
	
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
			
				var infoBox = document.getElementById("upLotInfoUi");
				infoBox.innerHTML = "";
				
				var productNameBox = document.createElement("div");
				productNameBox.classList.add("input-group");
				infoBox.appendChild(productNameBox);
				
				var formBox1 = document.createElement("div");
				formBox1.classList.add("form-floating");
				formBox1.setAttribute("style","width:50%");
				productNameBox.appendChild(formBox1);
				
				var lotVal = document.createElement("input");
				lotVal.setAttribute("readonly","true");
				lotVal.classList.add("form-control-plaintext");
				lotVal.id = "floatingPlaintextInput";
				lotVal.value = jsonObj.lot.lot.lot_code;
				formBox1.appendChild(lotVal);
				
				var nameLabel = document.createElement("label");
				nameLabel.setAttribute("for","floatingPlaintextInput");
				nameLabel.innerText = "로트 번호";
				formBox1.appendChild(nameLabel);
				
				var productCodeBox = document.createElement("div");
				productCodeBox.classList.add("input-group");
				infoBox.appendChild(productCodeBox);
				
				var formBox2 = document.createElement("div");
				formBox2.classList.add("form-floating");
				formBox2.setAttribute("style","width:50%");			
				formBox2.setAttribute("onclick","upHelpProduct(this)")
				productNameBox.appendChild(formBox2);
				
				var hbbox = document.createElement("input");
				hbbox.setAttribute("type","hidden");
				hbbox.value = jsonObj.lot.lot.product_code;	
				formBox2.appendChild(hbbox);
				
				var codeVal = document.createElement("input");
				codeVal.setAttribute("readonly","true");
				codeVal.classList.add("form-control-plaintext");
				codeVal.id = "floatingPlaintextInput";
				codeVal.value = jsonObj.lot.lot.product_code;			
				formBox2.appendChild(codeVal);
					
				var codeLabel = document.createElement("label");
				codeLabel.setAttribute("for","floatingPlaintextInput");
				codeLabel.innerText = "제품 코드";
				formBox2.appendChild(codeLabel);
				
				var lotDateBox = document.createElement("div");
				lotDateBox.classList.add("input-group");
				infoBox.appendChild(lotDateBox);
				
				var formBox3 = document.createElement("div");
				formBox3.classList.add("form-floating");
				formBox3.setAttribute("style","width:100%");
				productNameBox.appendChild(formBox3);
				
				var dateVal = document.createElement("input");
				dateVal.setAttribute("readonly","true");
				dateVal.classList.add("form-control-plaintext");
				dateVal.id = "floatingPlaintextInput";
				dateVal.value = moment(jsonObj.lot.lot.lot_date).format('YYYY.MM.DD');
				formBox3.appendChild(dateVal);
				
				var dateLabel = document.createElement("label");
				dateLabel.setAttribute("for","floatingPlaintextInput");
				dateLabel.innerText = "로트 등록일";
				formBox3.appendChild(dateLabel);		
				
				var lotCodeValInput = document.getElementById("upLotCode");
				lotCodeValInput.innerHTML = "";
				
				var lotCodeVlaue = document.createElement("input");
				lotCodeVlaue.setAttribute("type","hiden");			
				lotCodeVlaue.value = jsonObj.lot.lot.lot_code;
				lotCodeValInput.appendChild(lotCodeVlaue);
								
				var productCodeValInput = document.getElementById("upProductCode");
				productCodeValInput.innerHTML = "";		
				
				var productCodeVlaue = document.createElement("input");
				productCodeVlaue.setAttribute("type","hiden");			
				productCodeVlaue.value = jsonObj.lot.lot.product_code;
				productCodeValInput.appendChild(productCodeVlaue);
				
				var upCleanUI = document.getElementById("upHelpBox");
				upCleanUI.innerHTML = "";
				
				
			}		
		}
					
			xhr.open("get" , "./foundedLotInfo?lotCode=" + lotCode);
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
			
		}
	
	
	function upHelpProduct(infoCallBox){
		
		var code = infoCallBox.children[0].value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);				
				
				var helpWindow = document.getElementById("upHelpBox");
				helpWindow.innerHTML = "";
				
				var productNameBox = document.createElement("div");
				productNameBox.classList.add("input-group");
				helpWindow.appendChild(productNameBox);
				
				var formBox1 = document.createElement("div");
				formBox1.classList.add("form-floating");
				formBox1.setAttribute("style","width:50%");
				productNameBox.appendChild(formBox1);
				
				var lotVal = document.createElement("input");
				lotVal.setAttribute("readonly","true");
				lotVal.classList.add("form-control-plaintext");
				lotVal.id = "floatingPlaintextInput";
				lotVal.value = jsonObj.product.product.product_name;
				formBox1.appendChild(lotVal);
				
				var nameLabel = document.createElement("label");
				nameLabel.setAttribute("for","floatingPlaintextInput");
				nameLabel.innerText = "제품 이름";
				formBox1.appendChild(nameLabel);
				
				var productCodeBox = document.createElement("div");
				productCodeBox.classList.add("input-group");
				helpWindow.appendChild(productCodeBox);
				
				var formBox2 = document.createElement("div");
				formBox2.classList.add("form-floating");
				formBox2.setAttribute("style","width:50%");			
				formBox2.setAttribute("onclick","helpProduct(this)")
				productNameBox.appendChild(formBox2);
				
				var codeVal = document.createElement("input");
				codeVal.setAttribute("readonly","true");
				codeVal.classList.add("form-control-plaintext");
				codeVal.id = "floatingPlaintextInput";
				codeVal.value = jsonObj.product.product.product_memo;			
				formBox2.appendChild(codeVal);
					
				var codeLabel = document.createElement("label");
				codeLabel.setAttribute("for","floatingPlaintextInput");
				codeLabel.innerText = "제품 메모";
				formBox2.appendChild(codeLabel);				
				
			}
		}	
		
		xhr.open("get" , "./helpProduct?productCode=" + code);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function upWarehouseSelector(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
			
				var warehouseList = document.getElementById("upWarehouseCode");
				warehouseList.setAttribute("onchange", "upAreaSelector(this)");
				warehouseList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "창고 선택";
				warehouseList.appendChild(listSample);
				
				for (whSelector of jsonObj.whSel){
					
					var listContents = document.createElement("option");
					listContents.value = whSelector.warehouse.warehouse_code;
					listContents.innerText = whSelector.warehouse.warehouse_name;
					warehouseList.appendChild(listContents);

					
				}
				
			}
		}
		
		xhr.open("get" , "./whSel");
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	

	function upAreaSelector(whList){		
			
		whCode = whList.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
			
				var areaList = document.getElementById("upAreaCode");
				areaList.setAttribute("onchange", "upRackSelector(this)");
				areaList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "구역 선택";
				areaList.appendChild(listSample);
				
				for (arSelector of jsonObj.arSel){
					
					var listContents = document.createElement("option");
					listContents.value = arSelector.area.warehouse_area_code;
					listContents.innerText = arSelector.area.warehouse_area_name;
					areaList.appendChild(listContents);
				}
			}
		}
		
		xhr.open("get" , "./arSel?warehouseCode=" + whCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	
		
	function upRackSelector(arList){
		
		arCode = arList.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var rackList = document.getElementById("upRackCode");
				rackList.setAttribute("onchange", "upCellSelector(this)");
				rackList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "랙 선택";
				rackList.appendChild(listSample);
				
				for (rkSelector of jsonObj.rkSel){
					
					var listContents = document.createElement("option");
					listContents.value = rkSelector.rack.warehouse_rack_code;
					listContents.innerText = rkSelector.rack.warehouse_rack_name;
					rackList.appendChild(listContents);
					
				}
			}
		}
		
		xhr.open("get" , "./rkSel?areaCode=" + arCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	
		
	function upCellSelector(rkList){
		
		var rackCode = rkList.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var cellList = document.getElementById("upCellCode");
				cellList.innerHTML = "";
				
				var listSample = document.createElement("option");
				listSample.setAttribute("selected","true");
				listSample.innerText = "셀 선택";
				cellList.appendChild(listSample);
				
				for (clSelector of jsonObj.clSel){
					
					var listContents = document.createElement("option");
					listContents.value = clSelector.cell.warehouse_cell_code;
					listContents.innerText = clSelector.cell.warehouse_cell_name;
					cellList.appendChild(listContents);
					
				}
			}
		}
		
		xhr.open("get" , "./clSel?rackCode=" + rackCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}	
	
	
	function updateIbound(){
		
		var upIbCodeVal = document.getElementById("selectedForUpdate").firstChild.value
		var upLotCodeVal = document.getElementById("upLotCode").firstChild.value;
		var upProductCodeVal = document.getElementById("upProductCode").firstChild.value;
		var upWhCodeVal = document.getElementById("upWarehouseCode").value;
		var upArCodeVal = document.getElementById("upAreaCode").value;
		var upRkCodeVal = document.getElementById("upRackCode").value;
		var upClCodeVal = document.getElementById("upCellCode").value;
		var upAmountVal = document.getElementById("upInboundAmount").value;
		var upMemoVal = document.getElementById("upInboundMemo").value;	
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				document.getElementById("selectedForUpdate").firstChild.value
				document.getElementById("upLotCode").firstChild.value;
				document.getElementById("upProductCode").firstChild.value;
				document.getElementById("upWarehouseCode").value = "";
				document.getElementById("upAreaCode").value = "";
				document.getElementById("upRackCode").value = "";
				document.getElementById("upCellCode").value = "";
				document.getElementById("upInboundAmount").value = "";
				document.getElementById("upInboundMemo").value = "";
				
				inboundList()
				
			}
		}
		
		xhr.open("post" , "./updateInbound");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("lot_code=" + upIbCodeVal + "&product_code=" + upProductCodeVal + "&warehouse_code=" + upWhCodeVal + 
				"&warehouse_area_code="+ upArCodeVal + "&warehouse_rack_code=" + upRkCodeVal + "&warehouse_cell_code=" + upClCodeVal + 
				"&inbound_amount=" + upAmountVal + "&inbound_memo=" + upMemoVal +"&inbound_code=" + upIbCodeVal);	
		
	}
	
	
	
	window.addEventListener("DOMContentLoaded" , function (){			
		
		inboundList()
		warehouseSelector()
		upWarehouseSelector()
		
		});

</script>
	
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">	        
		<div class="row">
            <div class="form-control mt-3" id="btnCotroller">
                <button type="button" class="btn btn-light" onclick="inboundRegist()">
                   등록
                </button>
                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#updateInbound" onclick = "beforeUpdateIb()">
                	수정
                </button>
                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="">
                	삭제
                </button>
            </div>            
        </div>
		<div class="row">
             <div class="ent-list form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">입고 등록</span>
                    </div>
                 <div class="row mt-3">
                     <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">로트</span>
                             <input class="form-control" type="text" aria-label="readonly input example" id="lotCode" data-bs-toggle="modal" data-bs-target="#productFind" readonly>
                         </div>
                     </div>
                     <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">제품</span>
                             <input type="text" class="form-control" id="productCode" data-bs-toggle="modal" data-bs-target="#productFind" readonly>
                         </div>
                     </div>
                     <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">수량</span>
                             <input type="text" class="form-control" id="inboundAmount">
                         </div>
                     </div>
                 </div>       
                 <div class="row mt-3">
                     <div class="col d-grid">
                         <div class="input-group">
                             <span class="input-group-text">창고</span>
								  <select class="form-select" aria-label="Default select example" id="warehouseCode"></select>					  
                         </div>
                     </div>
                     <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">구역</span>
                             	<select class="form-select" aria-label="Default select example" id="areaCode"></select>
                         </div>
                     </div>  
                     <div class="col">
                         	<div class="input-group">
	                             <span class="input-group-text">랙</span>	                         
										 <select class="form-select" aria-label="Default select example" id="rackCode"></select>
							</div>
                     </div> 
                     <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">셀</span>
							 <select class="form-select" aria-label="Default select example" id="cellCode"></select>
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
                         <textarea class="form-control" style="height: 50px" id="inboundMemo"></textarea>                                  
                     </div>  
                 </div>        
             </div>
 			<!-- 입고 리스트 -->		
			<div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">입고 목록</span>
                    </div>
                    <div class="col-4">
                    <form action="./accountInfoPage" method="get">
						<div class="input-group mb-3">
								<select name="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="account_code"></option>
									<option value="account_name"><option>
									<option value="account_representative"></option>
								  </select>
								<input name="" type="text" class="form-control" aria-label="Text input with dropdown button">
								<button class="input-group-text bi bi-search" id="basic-addon1"></button>
						</div>
						</form>
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 ">
						<div class="scrollTable">
							<table class="table table-bordered text-center" id="inboundList">
							<thead>
								<tr>
								<th><input type="checkbox"></th>
								<th>입고 코드</th>
								<th>로트 코드</th>
								<th>창고 코드</th>
								<th>구역 코드</th>
								<th>랙 코드</th>
								<th>셀 코드</th>
								<th>입고량</th>
								<th>입고 담당자</th>
								<th>입고 등록일</th>
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
 
 
 		<!-- 상품 선택 모달 -->            
		<div class="modal fade" id="productFind" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">로트,제품 통합 등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
                        				<span>로트 번호로 정보 입력</span>
		                                <div class="col mt-3">
		                                    <div class="input-group">		                                        
		                                        <input type="text" class="form-control" placeholder="검색 후 로트 번호를 클릭하세요" id="searchWord" onkeyup="findLotToRegi()">
  												<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
  											</div>
		                                </div>
                            		</div>
                            		<div class="row mt-2">
                        				<span>검색 후 제품 코드를 클릭하면 해당 제품 정보가 나옵니다.</span>
                        			</div>
                            		<div class="row mt-2" id="searchWindowUi">
                            		</div>
                            		<div class="row mt-3" id="LotInfoUi">
                            		</div>
                            		<div id="lotItem"></div>
                            		<div id="helpBox"></div>                           		
                        		</div>
                        	</div>                       	
					     </div>			     
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="" data-bs-dismiss="modal">선택</button>
					     </div>
				    </div>
			  </div>
		 </div>               
         <!-- 입고 수정 모달 -->
         <div class="modal fade" id="updateInbound" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">입고 수정</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<span>현재 선택된 입고 코드:</span>
                        			<span id="upIbCodeInfo"></span>
                        			<div class="row mt-3">
                        				<span>로트 번호로 정보 입력</span>
		                                <div class="col mt-3">
		                                    <div class="input-group">		                                        
		                                        <input type="text" class="form-control" placeholder="검색 후 로트 번호를 클릭하세요" id="upSearchWord" onkeyup="findLotToUp()">
  												<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
  											</div>
		                                </div>
                            		</div>
                            		<div class="row mt-2">
                        				<span>검색 후 제품 코드를 클릭하면 해당 제품 정보가 나옵니다.</span>
                        			</div>
                            		<div class="row mt-2" id="upSearchWindowUi">
                            		</div>
                            		<div class="row mt-3" id="upLotInfoUi">
                            		</div>
                            		<div id="uplotItem"></div>
                            		<div id="upHelpBox"></div>
                            		<div id="selectedForUpdate"></div>
                            		<div id="upLotCode"></div>
                            		<div id="upProductCode"></div>
                        		</div>
                        	</div>                       	
				  <div class="row mt-4">
                     <div class="col d-grid">
                         <div class="input-group">
                             <span class="input-group-text">창고</span>
								  <select class="form-select" aria-label="Default select example" id="upWarehouseCode"></select>					  
                         </div>
                     </div>
                     <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">구역</span>
                             	<select class="form-select" aria-label="Default select example" id="upAreaCode"></select>
                         </div>
                     </div>
                  </div>
                  <div class="row mt-3">     
                     <div class="col">
                         	<div class="input-group">
	                             <span class="input-group-text">랙</span>	                         
										 <select class="form-select" aria-label="Default select example" id="upRackCode"></select>
							</div>
                     </div> 
                     <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">셀</span>
							 <select class="form-select" aria-label="Default select example" id="upCellCode"></select>
                         </div>
                     </div>                  
                 </div>
                 <div class="row mt-3">
                      <div class="col">
                         <div class="input-group">
                             <span class="input-group-text">수량</span>
                             <input type="text" class="form-control" id="upInboundAmount">
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
                         <textarea class="form-control" style="height: 50px" id="upInboundMemo"></textarea>                                  
                     </div>  
                 </div>
                   										     
			</div>							     
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="updateIbound()" data-bs-dismiss="modal">수정</button>
					     </div>
				    </div>
			  </div>
		 </div> 
         
         
         </div>
         
         
    </div>
    
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>     
</body>
</html>