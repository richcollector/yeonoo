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
      
    .topInfo{
		border: solid 1px;
		color: rgb(210, 210, 210);
	}
         
    .textColor{
		
		color: grey;
		
	}  
      
    #wrapper{
	width: 1200px;
  	
  	}
    
</style>

<script>

	function vanillaStockList(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var searchList = document.getElementById("stockList");
				searchList.innerHTML = "";
				
				var thead = document.createElement("thead");
				searchList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headTh1 = document.createElement("th");
				headTh1.innerText = "재고 코드";
				headTr.appendChild(headTh1);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "로트 코드";
				headTr.appendChild(headTh2);
				
				var headTh3 = document.createElement("th");
				headTh3.innerText = "상품 코드";
				headTr.appendChild(headTh3);
		
				var headTh4 = document.createElement("th");
				headTh4.innerText = "창고 코드";
				headTr.appendChild(headTh4);
				
				var headTh5 = document.createElement("th");
				headTh5.innerText = "구역 코드";
				headTr.appendChild(headTh5);
				
				var headTh6 = document.createElement("th");
				headTh6.innerText = "랙 코드";
				headTr.appendChild(headTh6);
				
				var headTh7 = document.createElement("th");
				headTh7.innerText = "셀 코드";
				headTr.appendChild(headTh7);
				
				var headTh8 = document.createElement("th");
				headTh8.innerText = "재고량";
				headTr.appendChild(headTh8);
			
				var headTh9 = document.createElement("th");
				headTh9.innerText = "재고 등록일";
				headTr.appendChild(headTh9);
				
				for (searchedStock of jsonObj.stockList){
					 
					var tBody = document.createElement("tbody");
					searchList.appendChild(tBody)
					
					var searchTr = document.createElement("tr");
					tBody.appendChild(searchTr);
									
					var stockCodeTh = document.createElement("th");
					stockCodeTh.innerText = searchedStock.stock_code;
					searchTr.appendChild(stockCodeTh);
					
					var lotCodeTd = document.createElement("td");
					lotCodeTd.innerText = searchedStock.lot_code;
					searchTr.appendChild(lotCodeTd);
					
					var pdCodeTd = document.createElement("td");
					pdCodeTd.innerText = searchedStock.product_code;
					searchTr.appendChild(pdCodeTd);
					
					var whCodeTd = document.createElement("td");
					whCodeTd.innerText = searchedStock.warehouse_code;
					searchTr.appendChild(whCodeTd);
					
					var arCodeTd = document.createElement("td");
					arCodeTd.innerText = searchedStock.warehouse_area_code;
					searchTr.appendChild(arCodeTd);
					
					var rkCodeTd = document.createElement("td");
					rkCodeTd.innerText = searchedStock.warehouse_rack_code;
					searchTr.appendChild(rkCodeTd);
					
					var clCodeTd = document.createElement("td");
					clCodeTd.innerText = searchedStock.warehouse_cell_code;
					searchTr.appendChild(clCodeTd);
					
					var stockAmountTd = document.createElement("td");
					stockAmountTd.innerText = searchedStock.stock_amount;
					searchTr.appendChild(stockAmountTd);
				
					var stockDateTd = document.createElement("td");
					stockDateTd.innerText = moment(searchedStock.stock_resiter_date).format('YYYY.MM.DD');
					searchTr.appendChild(stockDateTd);										
					
					
				}					
			}		
		}
					
			xhr.open("get" , "./vanillaStockList");
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
		
	}
	//검색기 선택
	function searchOptionSelector(){
		
		var searchOption = document.getElementById("selectSearch").value;
		
		document.getElementById("searchElement").value = "";
		document.getElementById("infoElement").innerHTML = "";
		document.getElementById("infoHelpElement").innerHTML = "";
		vanillaStockList()
		
		if(searchOption == 1){
			
			var stockSearchWork = document.getElementById("searchElement");
			stockSearchWork.setAttribute("onkeyup","stockSearcher()");				
			
		}else if(searchOption == 2){
			
			var productSearchWork = document.getElementById("searchElement");
			productSearchWork.setAttribute("onkeyup","productSearcher()");

			
		}else if(searchOption == 3){
			
			var warehouseSearchWork = document.getElementById("searchElement");
			warehouseSearchWork.setAttribute("onkeyup","warehouseSearcher()");
			
		}else if(searchOption == 4){
			
			var areaSearchWork = document.getElementById("searchElement");
			areaSearchWork.setAttribute("onkeyup","areaSearcher()");
			
		}else if(searchOption == 5){
			
			var rackSearchWork = document.getElementById("searchElement");
			rackSearchWork.setAttribute("onkeyup","rackSearcher()");
			
		}	
		
		
	}
	
	function cannotSearch(){
		
		alert("검색 유형을 선택해주십시오.");
		document.getElementById("searchElement").value = "";		
		
	}
	
	//재고검색기
	function stockSearcher(){
		
		var searchValue = document.getElementById("searchElement").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var searchList = document.getElementById("stockList");
				searchList.innerHTML = "";
				
				var thead = document.createElement("thead");
				searchList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "로트 코드";
				headTr.appendChild(headTh2);				
		
				var headTh4 = document.createElement("th");
				headTh4.innerText = "창고 코드";
				headTr.appendChild(headTh4);
				
				var headTh5 = document.createElement("th");
				headTh5.innerText = "구역 코드";
				headTr.appendChild(headTh5);
				
				var headTh6 = document.createElement("th");
				headTh6.innerText = "랙 코드";
				headTr.appendChild(headTh6);
				
				var headTh7 = document.createElement("th");
				headTh7.innerText = "셀 코드";
				headTr.appendChild(headTh7);
				
				var headTh8 = document.createElement("th");
				headTh8.innerText = "재고량";
				headTr.appendChild(headTh8);
			
				var headTh9 = document.createElement("th");
				headTh9.innerText = "재고 등록일";
				headTr.appendChild(headTh9);
				
				for(searchStockList of jsonObj.stockList){				
															
					var tBody = document.createElement("tbody");
					searchList.appendChild(tBody)
					
					var searchTr = document.createElement("tr");
					tBody.appendChild(searchTr);									
					
					var lotCodeTd = document.createElement("td");
					lotCodeTd.innerText = searchStockList.lot_code;
					searchTr.appendChild(lotCodeTd);					
					
					var whCodeTd = document.createElement("td");
					whCodeTd.innerText = searchStockList.warehouse_code;
					searchTr.appendChild(whCodeTd);
					
					var arCodeTd = document.createElement("td");
					arCodeTd.innerText = searchStockList.warehouse_area_code;
					searchTr.appendChild(arCodeTd);
					
					var rkCodeTd = document.createElement("td");
					rkCodeTd.innerText = searchStockList.warehouse_rack_code;
					searchTr.appendChild(rkCodeTd);
					
					var clCodeTd = document.createElement("td");
					clCodeTd.innerText = searchStockList.warehouse_cell_code;
					searchTr.appendChild(clCodeTd);
					
					var stockAmountTd = document.createElement("td");
					stockAmountTd.innerText = searchStockList.stock_amount;
					searchTr.appendChild(stockAmountTd);
				
					var stockDateTd = document.createElement("td");
					stockDateTd.innerText = moment(searchStockList.stock_resiter_date).format('YYYY.MM.DD');
					searchTr.appendChild(stockDateTd);					
										
				}
								
					if (jsonObj.totalStock != null){
					
						var infoBox = document.getElementById("infoElement");
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
						lotVal.value = jsonObj.totalStock.product_name;
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
						
						var nameLabel = document.createElement("label");
						nameLabel.setAttribute("for","floatingPlaintextInput");
						nameLabel.innerText = "해당 로트의 제품명";
						nameLabel.classList.add("text-center");
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
						codeVal.classList.add("text-center");
						codeVal.id = "floatingPlaintextInput";
						codeVal.value = jsonObj.totalStock.amountSum;		
						formBox2.appendChild(codeVal);						
						
						var codeLabel = document.createElement("label");
						codeLabel.setAttribute("for","floatingPlaintextInput");
						codeLabel.classList.add("text-center");
						codeLabel.innerText = "총 재고량";
						formBox2.appendChild(codeLabel);
					
					}else{
						
						var infoBox = document.getElementById("infoElement");
						infoBox.innerHTML = "";
						
						var productNameBox = document.createElement("div");
						productNameBox.classList.add("input-group");
						infoBox.appendChild(productNameBox);
						
						var formBox1 = document.createElement("div");
						formBox1.classList.add("form-floating");
						formBox1.setAttribute("style","width:100%");
						productNameBox.appendChild(formBox1);
						
						var lotVal = document.createElement("input");
						lotVal.setAttribute("readonly","true");
						lotVal.classList.add("form-control-plaintext");
						lotVal.id = "floatingPlaintextInput";
						lotVal.value = "해당 로트의 정보, 총 재고량을 보시려면 더 정확한 키워드로 검색하십시오.";
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
						
					}
			}
		}
		
		xhr.open("get" , "./stockSearcher?lot_code=" + searchValue);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function productSearcher(){
		
		var searchValue = document.getElementById("searchElement").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var searchList = document.getElementById("stockList");
				searchList.innerHTML = "";
				
				var thead = document.createElement("thead");
				searchList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)				
				
				var headTh3 = document.createElement("th");
				headTh3.innerText = "제품 코드";
				headTr.appendChild(headTh3);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "제품 이름";
				headTr.appendChild(headTh2);
				
				var headTh4 = document.createElement("th");
				headTh4.innerText = "창고 코드";
				headTr.appendChild(headTh4);
				
				var headTh5 = document.createElement("th");
				headTh5.innerText = "구역 코드";
				headTr.appendChild(headTh5);
				
				var headTh6 = document.createElement("th");
				headTh6.innerText = "랙 코드";
				headTr.appendChild(headTh6);
				
				var headTh7 = document.createElement("th");
				headTh7.innerText = "셀 코드";
				headTr.appendChild(headTh7);
				
				var headTh8 = document.createElement("th");
				headTh8.innerText = "재고량";
				headTr.appendChild(headTh8);
			
				var headTh9 = document.createElement("th");
				headTh9.innerText = "재고 등록일";
				headTr.appendChild(headTh9);
				
				for(searchProductList of jsonObj.searchItem){				
					
					var tBody = document.createElement("tbody");
					searchList.appendChild(tBody)
					
					var searchTr = document.createElement("tr");
					tBody.appendChild(searchTr);
													
					var pdCodeTd = document.createElement("td");
					pdCodeTd.innerText = searchProductList.product_code;
					searchTr.appendChild(pdCodeTd);
					
					var pdnameTd = document.createElement("td");
					pdnameTd.innerText = searchProductList.product_name;
					searchTr.appendChild(pdnameTd);
					
					var whCodeTd = document.createElement("td");
					whCodeTd.innerText = searchProductList.warehouse_code;
					searchTr.appendChild(whCodeTd);
					
					var arCodeTd = document.createElement("td");
					arCodeTd.innerText = searchProductList.warehouse_area_code;
					searchTr.appendChild(arCodeTd);
					
					var rkCodeTd = document.createElement("td");
					rkCodeTd.innerText = searchProductList.warehouse_rack_code;
					searchTr.appendChild(rkCodeTd);
					
					var clCodeTd = document.createElement("td");
					clCodeTd.innerText = searchProductList.warehouse_cell_code;
					searchTr.appendChild(clCodeTd);
					
					var stockAmountTd = document.createElement("td");
					stockAmountTd.innerText = searchProductList.stock_amount;
					searchTr.appendChild(stockAmountTd);
				
					var stockDateTd = document.createElement("td");
					stockDateTd.innerText = moment(searchProductList.stock_resiter_date).format('YYYY.MM.DD');
					searchTr.appendChild(stockDateTd);					
					
					}
					
					if (jsonObj.totalProduct != null){
						
						var infoBox = document.getElementById("infoElement");
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
						lotVal.value = jsonObj.totalProduct.product_name;
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
						
						var nameLabel = document.createElement("label");
						nameLabel.setAttribute("for","floatingPlaintextInput");
						nameLabel.innerText = "검색한 제품명";
						nameLabel.classList.add("text-center");
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
						codeVal.classList.add("text-center");
						codeVal.id = "floatingPlaintextInput";
						codeVal.value = jsonObj.totalProduct.amountSum;		
						formBox2.appendChild(codeVal);						
						
						var codeLabel = document.createElement("label");
						codeLabel.setAttribute("for","floatingPlaintextInput");
						codeLabel.classList.add("text-center");
						codeLabel.innerText = "총 재고량";
						formBox2.appendChild(codeLabel);
					
					}else{
						
						var infoBox = document.getElementById("infoElement");
						infoBox.innerHTML = "";
						
						var productNameBox = document.createElement("div");
						productNameBox.classList.add("input-group");
						infoBox.appendChild(productNameBox);
						
						var formBox1 = document.createElement("div");
						formBox1.classList.add("form-floating");
						formBox1.setAttribute("style","width:100%");
						productNameBox.appendChild(formBox1);
						
						var lotVal = document.createElement("input");
						lotVal.setAttribute("readonly","true");
						lotVal.classList.add("form-control-plaintext");
						lotVal.id = "floatingPlaintextInput";
						lotVal.value = "해당 제품의 정보, 총 재고량을 보시려면 더 정확한 키워드로 검색하십시오.";
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
				
					}		
			}
		}
		
		xhr.open("get" , "./productSearcher?product_name=" + searchValue);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function warehouseSearcher(){
		
		var searchValue = document.getElementById("searchElement").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var searchList = document.getElementById("stockList");
				searchList.innerHTML = "";
				
				var thead = document.createElement("thead");
				searchList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)				
				
				var headTh3 = document.createElement("th");
				headTh3.innerText = "창고 이름";
				headTr.appendChild(headTh3);
				
				var headTh2 = document.createElement("th");
				headTh2.innerText = "제품 이름";
				headTr.appendChild(headTh2);
				
				var headTh4 = document.createElement("th");
				headTh4.innerText = "창고 코드";
				headTr.appendChild(headTh4);
				
				var headTh5 = document.createElement("th");
				headTh5.innerText = "구역 코드";
				headTr.appendChild(headTh5);
				
				var headTh6 = document.createElement("th");
				headTh6.innerText = "랙 코드";
				headTr.appendChild(headTh6);
				
				var headTh7 = document.createElement("th");
				headTh7.innerText = "셀 코드";
				headTr.appendChild(headTh7);
				
				var headTh8 = document.createElement("th");
				headTh8.innerText = "재고량";
				headTr.appendChild(headTh8);
			
				var headTh9 = document.createElement("th");
				headTh9.innerText = "재고 등록일";
				headTr.appendChild(headTh9);
				
				for(searchedList of jsonObj.searchWarehouse){								
					
					var tBody = document.createElement("tbody");
					searchList.appendChild(tBody)
					
					var searchTr = document.createElement("tr");
					tBody.appendChild(searchTr);
													
					var pdCodeTd = document.createElement("td");
					pdCodeTd.innerText = searchedList.warehouse_name;
					searchTr.appendChild(pdCodeTd);
					
					var pdnameTd = document.createElement("td");
					pdnameTd.innerText = searchedList.product_name;
					searchTr.appendChild(pdnameTd);
					
					var whCodeTd = document.createElement("td");
					whCodeTd.innerText = searchedList.warehouse_code;
					searchTr.appendChild(whCodeTd);
					
					var arCodeTd = document.createElement("td");
					arCodeTd.innerText = searchedList.warehouse_area_code;
					searchTr.appendChild(arCodeTd);
					
					var rkCodeTd = document.createElement("td");
					rkCodeTd.innerText = searchedList.warehouse_rack_code;
					searchTr.appendChild(rkCodeTd);
					
					var clCodeTd = document.createElement("td");
					clCodeTd.innerText = searchedList.warehouse_cell_code;
					searchTr.appendChild(clCodeTd);
					
					var stockAmountTd = document.createElement("td");
					stockAmountTd.innerText = searchedList.stock_amount;
					searchTr.appendChild(stockAmountTd);
				
					var stockDateTd = document.createElement("td");
					stockDateTd.innerText = moment(searchedList.stock_resiter_date).format('YYYY.MM.DD');
					searchTr.appendChild(stockDateTd);					
							
				}
				
				if (jsonObj.warehouseTotal != null){
					
					var infoBox = document.getElementById("infoElement");
					infoBox.innerHTML = "";	
					
					var productNameBox = document.createElement("div");
					productNameBox.classList.add("input-group");
					infoBox.appendChild(productNameBox);
					
					var formBox1 = document.createElement("div");
					formBox1.classList.add("form-floating");
					formBox1.setAttribute("style","width:34%");
					formBox1.classList.add("topInfo");
					productNameBox.appendChild(formBox1);
					
					var lotVal = document.createElement("input");
					lotVal.setAttribute("readonly","true");
					lotVal.classList.add("form-control-plaintext");
					lotVal.id = "floatingPlaintextInput";
					lotVal.value = jsonObj.warehouseTotal.warehouse_name;
					lotVal.classList.add("text-center");
					formBox1.appendChild(lotVal);
					
					var nameLabel = document.createElement("label");
					nameLabel.setAttribute("for","floatingPlaintextInput");
					nameLabel.innerText = "창고명";
					nameLabel.classList.add("textColor");
					nameLabel.classList.add("text-center");
					formBox1.appendChild(nameLabel);
					
					var formBox2 = document.createElement("div");
					formBox2.classList.add("form-floating");
					formBox2.setAttribute("style","width:33%");	
					formBox2.classList.add("topInfo");
					productNameBox.appendChild(formBox2);
									
					var codeVal = document.createElement("input");
					codeVal.setAttribute("readonly","true");
					codeVal.classList.add("form-control-plaintext");
					codeVal.classList.add("text-center");
					codeVal.id = "floatingPlaintextInput";
					codeVal.value = jsonObj.warehouseTotal.lotCount;		
					formBox2.appendChild(codeVal);						
					
					var codeLabel = document.createElement("label");
					codeLabel.setAttribute("for","floatingPlaintextInput");
					codeLabel.classList.add("text-center");
					codeLabel.classList.add("textColor");
					codeLabel.innerText = "로트 종류 개수";					
					formBox2.appendChild(codeLabel);
					
					var formBox3 = document.createElement("div");
					formBox3.classList.add("form-floating");
					formBox3.setAttribute("style","width:33%");
					formBox3.classList.add("topInfo");
					productNameBox.appendChild(formBox3);
									
					var sumVal = document.createElement("input");
					sumVal.setAttribute("readonly","true");
					sumVal.classList.add("form-control-plaintext");
					sumVal.classList.add("text-center");
					sumVal.id = "floatingPlaintextInput";
					sumVal.value = jsonObj.warehouseTotal.amountSum;		
					formBox3.appendChild(sumVal);						
					
					var sumLabel = document.createElement("label");
					sumLabel.setAttribute("for","floatingPlaintextInput");
					sumLabel.classList.add("text-center");
					sumLabel.classList.add("textColor");
					sumLabel.innerText = "창고 물품의 총량";
					formBox3.appendChild(sumLabel);
					
					var helpBox = document.getElementById("infoHelpElement");
					helpBox.innerHTML = "";
					
					var helpTable = document.createElement("table");
					helpTable.classList.add("table");
					helpTable.classList.add("table-bordered");
					helpTable.classList.add("text-center");
					helpTable.id = "helperTabel";
					helpBox.appendChild(helpTable);
					
					var helpThead = document.createElement("thead");
					helpTable.appendChild(helpThead);
					
					var helpTr = document.createElement("tr");
					helpThead.appendChild(helpTr)				
					
					var helpTh1 = document.createElement("th");
					helpTh1.innerText = "제품명";
					helpTr.appendChild(helpTh1);
					
					var helpTh2 = document.createElement("th");
					helpTh2.innerText = "로트 번호";
					helpTr.appendChild(helpTh2);
					
					var helpTh3 = document.createElement("th");
					helpTh3.innerText = "창고 총량";
					helpTr.appendChild(helpTh3);
			
					for(helpList of jsonObj.searchWarehouseHelper){						
						
						var helpBody = document.createElement("tbody");
						helpTable.appendChild(helpBody);
						
						var helpBodyTr = document.createElement("tr");
						helpBody.appendChild(helpBodyTr);
														
						var hpNameTd = document.createElement("td");
						hpNameTd.innerText = helpList.product_name;
						helpBodyTr.appendChild(hpNameTd);
						
						var hpCodeTd = document.createElement("td");
						hpCodeTd.innerText = helpList.lot_code;
						helpBodyTr.appendChild(hpCodeTd);
						
						var sumTd = document.createElement("td");
						sumTd.innerText = helpList.whAmountSum;
						helpBodyTr.appendChild(sumTd);
							
					}
				
				}else{
					
					var infoBox = document.getElementById("infoElement");
					infoBox.innerHTML = "";
					
					var productNameBox = document.createElement("div");
					productNameBox.classList.add("input-group");
					infoBox.appendChild(productNameBox);
					
					var formBox1 = document.createElement("div");
					formBox1.classList.add("form-floating");
					formBox1.setAttribute("style","width:100%");
					productNameBox.appendChild(formBox1);
					
					var lotVal = document.createElement("input");
					lotVal.setAttribute("readonly","true");
					lotVal.classList.add("form-control-plaintext");
					lotVal.id = "floatingPlaintextInput";
					lotVal.value = "해당 제품의 정보, 총 재고량을 보시려면 더 정확한 키워드로 검색하십시오.";
					lotVal.classList.add("text-center");
					formBox1.appendChild(lotVal);
				}
		
			}
		}
		
		xhr.open("get" , "./warehouseSearcher?warehouse_name=" + searchValue);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function areaSearcher(){
		
		var searchValue = document.getElementById("searchElement").value;
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){				
					var jsonObj = JSON.parse(xhr.responseText);					
			
					var searchList = document.getElementById("stockList");
					searchList.innerHTML = "";
					
					var thead = document.createElement("thead");
					searchList.appendChild(thead);
					
					var headTr = document.createElement("tr");
					thead.appendChild(headTr)				
					
					var headTh3 = document.createElement("th");
					headTh3.innerText = "구역 이름";
					headTr.appendChild(headTh3);
					
					var headTh2 = document.createElement("th");
					headTh2.innerText = "제품 이름";
					headTr.appendChild(headTh2);
					
					var headTh5 = document.createElement("th");
					headTh5.innerText = "구역 코드";
					headTr.appendChild(headTh5);
					
					var headTh6 = document.createElement("th");
					headTh6.innerText = "랙 코드";
					headTr.appendChild(headTh6);
					
					var headTh7 = document.createElement("th");
					headTh7.innerText = "셀 코드";
					headTr.appendChild(headTh7);
					
					var headTh8 = document.createElement("th");
					headTh8.innerText = "재고량";
					headTr.appendChild(headTh8);
				
					var headTh9 = document.createElement("th");
					headTh9.innerText = "재고 등록일";
					headTr.appendChild(headTh9);
					
					for(searchedList of jsonObj.searchArea){								
						
						var tBody = document.createElement("tbody");
						searchList.appendChild(tBody)
						
						var searchTr = document.createElement("tr");
						tBody.appendChild(searchTr);
														
						var pdCodeTd = document.createElement("td");
						pdCodeTd.innerText = searchedList.warehouse_area_name;
						searchTr.appendChild(pdCodeTd);
						
						var pdnameTd = document.createElement("td");
						pdnameTd.innerText = searchedList.product_name;
						searchTr.appendChild(pdnameTd);
						
						var arCodeTd = document.createElement("td");
						arCodeTd.innerText = searchedList.warehouse_area_code;
						searchTr.appendChild(arCodeTd);
						
						var rkCodeTd = document.createElement("td");
						rkCodeTd.innerText = searchedList.warehouse_rack_code;
						searchTr.appendChild(rkCodeTd);
						
						var clCodeTd = document.createElement("td");
						clCodeTd.innerText = searchedList.warehouse_cell_code;
						searchTr.appendChild(clCodeTd);
						
						var stockAmountTd = document.createElement("td");
						stockAmountTd.innerText = searchedList.stock_amount;
						searchTr.appendChild(stockAmountTd);
					
						var stockDateTd = document.createElement("td");
						stockDateTd.innerText = moment(searchedList.stock_resiter_date).format('YYYY.MM.DD');
						searchTr.appendChild(stockDateTd);					
								
					}
					
					if (jsonObj.areaTotal != null){
						
						var infoBox = document.getElementById("infoElement");
						infoBox.innerHTML = "";	
						
						var productNameBox = document.createElement("div");
						productNameBox.classList.add("input-group");
						infoBox.appendChild(productNameBox);
						
						var formBox1 = document.createElement("div");
						formBox1.classList.add("form-floating");
						formBox1.setAttribute("style","width:34%");
						formBox1.classList.add("topInfo");
						productNameBox.appendChild(formBox1);
						
						var lotVal = document.createElement("input");
						lotVal.setAttribute("readonly","true");
						lotVal.classList.add("form-control-plaintext");
						lotVal.id = "floatingPlaintextInput";
						lotVal.value = jsonObj.areaTotal.warehouse_area_name;
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
						
						var nameLabel = document.createElement("label");
						nameLabel.setAttribute("for","floatingPlaintextInput");
						nameLabel.innerText = "구역명";
						nameLabel.classList.add("textColor");
						nameLabel.classList.add("text-center");
						formBox1.appendChild(nameLabel);
						
						var formBox2 = document.createElement("div");
						formBox2.classList.add("form-floating");
						formBox2.setAttribute("style","width:33%");	
						formBox2.classList.add("topInfo");
						productNameBox.appendChild(formBox2);
										
						var codeVal = document.createElement("input");
						codeVal.setAttribute("readonly","true");
						codeVal.classList.add("form-control-plaintext");
						codeVal.classList.add("text-center");
						codeVal.id = "floatingPlaintextInput";
						codeVal.value = jsonObj.areaTotal.lotCount;		
						formBox2.appendChild(codeVal);						
						
						var codeLabel = document.createElement("label");
						codeLabel.setAttribute("for","floatingPlaintextInput");
						codeLabel.classList.add("text-center");
						codeLabel.classList.add("textColor");
						codeLabel.innerText = "로트 종류 개수";					
						formBox2.appendChild(codeLabel);
						
						var formBox3 = document.createElement("div");
						formBox3.classList.add("form-floating");
						formBox3.setAttribute("style","width:33%");
						formBox3.classList.add("topInfo");
						productNameBox.appendChild(formBox3);
										
						var sumVal = document.createElement("input");
						sumVal.setAttribute("readonly","true");
						sumVal.classList.add("form-control-plaintext");
						sumVal.classList.add("text-center");
						sumVal.id = "floatingPlaintextInput";
						sumVal.value = jsonObj.areaTotal.amountSum;		
						formBox3.appendChild(sumVal);						
						
						var sumLabel = document.createElement("label");
						sumLabel.setAttribute("for","floatingPlaintextInput");
						sumLabel.classList.add("text-center");
						sumLabel.classList.add("textColor");
						sumLabel.innerText = "창고 물품의 총량";
						formBox3.appendChild(sumLabel);
						
						var helpBox = document.getElementById("infoHelpElement");
						helpBox.innerHTML = "";
						
						var helpTable = document.createElement("table");
						helpTable.classList.add("table");
						helpTable.classList.add("table-bordered");
						helpTable.classList.add("text-center");
						helpTable.id = "helperTabel";
						helpBox.appendChild(helpTable);
						
						var helpThead = document.createElement("thead");
						helpTable.appendChild(helpThead);
						
						var helpTr = document.createElement("tr");
						helpThead.appendChild(helpTr)				
						
						var helpTh1 = document.createElement("th");
						helpTh1.innerText = "제품명";
						helpTr.appendChild(helpTh1);
						
						var helpTh2 = document.createElement("th");
						helpTh2.innerText = "로트 번호";
						helpTr.appendChild(helpTh2);
						
						var helpTh3 = document.createElement("th");
						helpTh3.innerText = "구역 총량";
						helpTr.appendChild(helpTh3);
				
						for(helpList of jsonObj.searchAreaHelper){						
							
							var helpBody = document.createElement("tbody");
							helpTable.appendChild(helpBody);
							
							var helpBodyTr = document.createElement("tr");
							helpBody.appendChild(helpBodyTr);
															
							var hpNameTd = document.createElement("td");
							hpNameTd.innerText = helpList.product_name;
							helpBodyTr.appendChild(hpNameTd);
							
							var hpCodeTd = document.createElement("td");
							hpCodeTd.innerText = helpList.lot_code;
							helpBodyTr.appendChild(hpCodeTd);
							
							var sumTd = document.createElement("td");
							sumTd.innerText = helpList.arAmountSum;
							helpBodyTr.appendChild(sumTd);
								
						}
					
					}else{
						
						var infoBox = document.getElementById("infoElement");
						infoBox.innerHTML = "";
						
						var productNameBox = document.createElement("div");
						productNameBox.classList.add("input-group");
						infoBox.appendChild(productNameBox);
						
						var formBox1 = document.createElement("div");
						formBox1.classList.add("form-floating");
						formBox1.setAttribute("style","width:100%");
						productNameBox.appendChild(formBox1);
						
						var lotVal = document.createElement("input");
						lotVal.setAttribute("readonly","true");
						lotVal.classList.add("form-control-plaintext");
						lotVal.id = "floatingPlaintextInput";
						lotVal.value = "해당 제품의 정보, 총 재고량을 보시려면 더 정확한 키워드로 검색하십시오.";
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
					}
			
				}
			}
			
			xhr.open("get" , "./areaSearcher?warehouse_area_name=" + searchValue);
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
			
		}
		
	function rackSearcher(){
		
		var searchValue = document.getElementById("searchElement").value;
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){				
					var jsonObj = JSON.parse(xhr.responseText);					
			
					var searchList = document.getElementById("stockList");
					searchList.innerHTML = "";
					
					var thead = document.createElement("thead");
					searchList.appendChild(thead);
					
					var headTr = document.createElement("tr");
					thead.appendChild(headTr)				
					
					var headTh3 = document.createElement("th");
					headTh3.innerText = "랙 이름";
					headTr.appendChild(headTh3);
					
					var headTh2 = document.createElement("th");
					headTh2.innerText = "제품 이름";
					headTr.appendChild(headTh2);
					
					var headTh6 = document.createElement("th");
					headTh6.innerText = "랙 코드";
					headTr.appendChild(headTh6);
					
					var headTh7 = document.createElement("th");
					headTh7.innerText = "셀 코드";
					headTr.appendChild(headTh7);
					
					var headTh8 = document.createElement("th");
					headTh8.innerText = "재고량";
					headTr.appendChild(headTh8);
				
					var headTh9 = document.createElement("th");
					headTh9.innerText = "재고 등록일";
					headTr.appendChild(headTh9);
					
					for(searchedList of jsonObj.searchRack){								
						
						var tBody = document.createElement("tbody");
						searchList.appendChild(tBody)
						
						var searchTr = document.createElement("tr");
						tBody.appendChild(searchTr);
														
						var pdCodeTd = document.createElement("td");
						pdCodeTd.innerText = searchedList.warehouse_rack_name;
						searchTr.appendChild(pdCodeTd);
						
						var pdnameTd = document.createElement("td");
						pdnameTd.innerText = searchedList.product_name;
						searchTr.appendChild(pdnameTd);
						
						var rkCodeTd = document.createElement("td");
						rkCodeTd.innerText = searchedList.warehouse_rack_code;
						searchTr.appendChild(rkCodeTd);
						
						var clCodeTd = document.createElement("td");
						clCodeTd.innerText = searchedList.warehouse_cell_code;
						searchTr.appendChild(clCodeTd);
						
						var stockAmountTd = document.createElement("td");
						stockAmountTd.innerText = searchedList.stock_amount;
						searchTr.appendChild(stockAmountTd);
					
						var stockDateTd = document.createElement("td");
						stockDateTd.innerText = moment(searchedList.stock_resiter_date).format('YYYY.MM.DD');
						searchTr.appendChild(stockDateTd);					
								
					}
					
					if (jsonObj.rackTotal != null){
						
						var infoBox = document.getElementById("infoElement");
						infoBox.innerHTML = "";	
						
						var productNameBox = document.createElement("div");
						productNameBox.classList.add("input-group");
						infoBox.appendChild(productNameBox);
						
						var formBox1 = document.createElement("div");
						formBox1.classList.add("form-floating");
						formBox1.setAttribute("style","width:34%");
						formBox1.classList.add("topInfo");
						productNameBox.appendChild(formBox1);
						
						var lotVal = document.createElement("input");
						lotVal.setAttribute("readonly","true");
						lotVal.classList.add("form-control-plaintext");
						lotVal.id = "floatingPlaintextInput";
						lotVal.value = jsonObj.rackTotal.warehouse_rack_name;
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
						
						var nameLabel = document.createElement("label");
						nameLabel.setAttribute("for","floatingPlaintextInput");
						nameLabel.innerText = "랙 명칭";
						nameLabel.classList.add("textColor");
						nameLabel.classList.add("text-center");
						formBox1.appendChild(nameLabel);
						
						var formBox2 = document.createElement("div");
						formBox2.classList.add("form-floating");
						formBox2.setAttribute("style","width:33%");	
						formBox2.classList.add("topInfo");
						productNameBox.appendChild(formBox2);
										
						var codeVal = document.createElement("input");
						codeVal.setAttribute("readonly","true");
						codeVal.classList.add("form-control-plaintext");
						codeVal.classList.add("text-center");
						codeVal.id = "floatingPlaintextInput";
						codeVal.value = jsonObj.rackTotal.lotCount;		
						formBox2.appendChild(codeVal);						
						
						var codeLabel = document.createElement("label");
						codeLabel.setAttribute("for","floatingPlaintextInput");
						codeLabel.classList.add("text-center");
						codeLabel.classList.add("textColor");
						codeLabel.innerText = "로트 종류 개수";					
						formBox2.appendChild(codeLabel);
						
						var formBox3 = document.createElement("div");
						formBox3.classList.add("form-floating");
						formBox3.setAttribute("style","width:33%");
						formBox3.classList.add("topInfo");
						productNameBox.appendChild(formBox3);
										
						var sumVal = document.createElement("input");
						sumVal.setAttribute("readonly","true");
						sumVal.classList.add("form-control-plaintext");
						sumVal.classList.add("text-center");
						sumVal.id = "floatingPlaintextInput";
						sumVal.value = jsonObj.rackTotal.amountSum;		
						formBox3.appendChild(sumVal);						
						
						var sumLabel = document.createElement("label");
						sumLabel.setAttribute("for","floatingPlaintextInput");
						sumLabel.classList.add("text-center");
						sumLabel.classList.add("textColor");
						sumLabel.innerText = "랙 물품의 총량";
						formBox3.appendChild(sumLabel);
						
						var helpBox = document.getElementById("infoHelpElement");
						helpBox.innerHTML = "";
						
						var helpTable = document.createElement("table");
						helpTable.classList.add("table");
						helpTable.classList.add("table-bordered");
						helpTable.classList.add("text-center");
						helpTable.id = "helperTabel";
						helpBox.appendChild(helpTable);
						
						var helpThead = document.createElement("thead");
						helpTable.appendChild(helpThead);
						
						var helpTr = document.createElement("tr");
						helpThead.appendChild(helpTr)				
						
						var helpTh1 = document.createElement("th");
						helpTh1.innerText = "제품명";
						helpTr.appendChild(helpTh1);
						
						var helpTh2 = document.createElement("th");
						helpTh2.innerText = "로트 번호";
						helpTr.appendChild(helpTh2);
						
						var helpTh3 = document.createElement("th");
						helpTh3.innerText = "구역 총량";
						helpTr.appendChild(helpTh3);
				
						for(helpList of jsonObj.searchRackHelper){						
							
							var helpBody = document.createElement("tbody");
							helpTable.appendChild(helpBody);
							
							var helpBodyTr = document.createElement("tr");
							helpBody.appendChild(helpBodyTr);
															
							var hpNameTd = document.createElement("td");
							hpNameTd.innerText = helpList.product_name;
							helpBodyTr.appendChild(hpNameTd);
							
							var hpCodeTd = document.createElement("td");
							hpCodeTd.innerText = helpList.lot_code;
							helpBodyTr.appendChild(hpCodeTd);
							
							var sumTd = document.createElement("td");
							sumTd.innerText = helpList.rkAmountSum;
							helpBodyTr.appendChild(sumTd);
								
						}
					
					}else{
						
						var infoBox = document.getElementById("infoElement");
						infoBox.innerHTML = "";
						
						var productNameBox = document.createElement("div");
						productNameBox.classList.add("input-group");
						infoBox.appendChild(productNameBox);
						
						var formBox1 = document.createElement("div");
						formBox1.classList.add("form-floating");
						formBox1.setAttribute("style","width:100%");
						productNameBox.appendChild(formBox1);
						
						var lotVal = document.createElement("input");
						lotVal.setAttribute("readonly","true");
						lotVal.classList.add("form-control-plaintext");
						lotVal.id = "floatingPlaintextInput";
						lotVal.value = "해당 제품의 정보, 총 재고량을 보시려면 더 정확한 키워드로 검색하십시오.";
						lotVal.classList.add("text-center");
						formBox1.appendChild(lotVal);
					}
			
				}
			}
			
			xhr.open("get" , "./rackSearcher?warehouse_rack_name=" + searchValue);
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
			
		}
	

	window.addEventListener("DOMContentLoaded" , function (){			
		
		vanillaStockList()
		
		});
	
</script>

</head>
<body>

	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">	 
		<div class="row">
 			<!-- 재고 리스트 -->		
			<div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">재고 목록</span>
                    </div>
                    <div class="col-4">
						<div class="input-group mb-3">
								<select id="selectSearch" style="width: 10px;" class="form-select" aria-label="Default select example" onchange="searchOptionSelector()">
									<option selected>선택</option>
									<option value="1">로트 코드</option>
									<option value="2">제품 이름</option>
									<option value="3">창고 이름</option>
									<option value="4">구역 이름</option>	
									<option value="5">랙 이름</option>							  
								</select>								
								<input id="searchElement" type="text" class="form-control" aria-label="Text input with dropdown button" onkeyup="cannotSearch()">
								<button class="input-group-text bi bi-search"></button>
						</div>
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 ">
						<div class="scrollTable">
							<table class="table table-bordered text-center" id="stockList">
								<thead>
									<tr>
									<th>재고 코드</th>
									<th>로트 코드</th>
									<th>물품 코드</th>
									<th>창고 코드</th>
									<th>구역 코드</th>
									<th>랙 코드</th>
									<th>셀 코드</th>
									<th>재고량</th>
									<th>출고 등록일</th>
									<th>재고 등록일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									</tr>
								</tbody>
							</table>
							<div id="infoElement" class="mb-3"></div>
							<div id="infoHelpElement" class="mb-3"></div>
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