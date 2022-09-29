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

<script>
	
	function stockSearch(){
			
		var searchTypeVal = document.getElementById("searchType").value;
		var searchWordVal = document.getElementById("searchWord").value;		
		
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
				
				var headTh10 = document.createElement("th");
				headTh10.innerText = "선택";
				headTr.appendChild(headTh10);
				
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
					
					var stockSelect = document.createElement("td");
					searchTr.appendChild(stockSelect);
					
					var osRegiBtn = document.createElement("span")
					osRegiBtn.classList.add("badge");
					osRegiBtn.classList.add("text-bg-light");
					osRegiBtn.innerText = "출고등록";
					osRegiBtn.value = searchedStock.stock_code;
					osRegiBtn.setAttribute("onclick","stockSelector(this)");
					stockSelect.appendChild(osRegiBtn);				
					
				}	
				
			}		
		}
					
			xhr.open("get" , "./stockSearch?searchType=" + searchTypeVal + "&searchWord=" + searchWordVal );
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send();
			
		}

	function stockSelector(selectOne){
		
		var stockCodeVal = selectOne.value;		
				
		//내부 select
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);		
				
				var selectorUi = document.getElementById("selectorElement");
				selectorUi.innerHTML = "";
				
				var selectedStockUi = document.createElement("div");
				selectedStockUi.classList.add("row");
				selectorUi.appendChild(selectedStockUi);
				
				var osAmountUi = document.createElement("div");
				osAmountUi.classList.add("row");
				selectorUi.appendChild(osAmountUi);
				
				var selectorInputGroup = document.createElement("div");
				selectorInputGroup.classList.add("input-group");
				selectorInputGroup.classList.add("mb-2")
				osAmountUi.appendChild(selectorInputGroup);
				
				var memoInput = document.createElement("span")
				memoInput.classList.add("input-group-text");
				memoInput.innerText = "비고";
				selectorInputGroup.appendChild(memoInput);
				
				var memoInputValue = document.createElement("input")
				memoInputValue.classList.add("form-control");
				memoInputValue.setAttribute("type","text");
				memoInputValue.id = "thisMemoValue";
				selectorInputGroup.appendChild(memoInputValue);				
				
				var amountInput = document.createElement("span")
				amountInput.classList.add("input-group-text");
				amountInput.innerText = "출고 수량 입력";
				selectorInputGroup.appendChild(amountInput);
				
				var amountInputValue = document.createElement("input")
				amountInputValue.classList.add("form-control");				
				amountInputValue.setAttribute("type","text");
				amountInputValue.id = "thisAmountInputValue"
				amountInputValue.setAttribute("onkeyup","doNotOver()");
				selectorInputGroup.appendChild(amountInputValue);
				
				var amountLimiter = document.createElement("div")
				amountLimiter.classList.add("input-group-text");
				amountLimiter.innerText = " / " + jsonObj.stock.stock_amount;
				amountLimiter.id = "outstockAmountLimiter";
				amountLimiter.value = jsonObj.stock.stock_amount;
				selectorInputGroup.appendChild(amountLimiter);
				
				/* var selectorInputGroup2 = document.createElement("div");
				selectorInputGroup2.classList.add("input-group");
				selectorInputGroup2.classList.add("mb-2")
				osAmountUi.appendChild(selectorInputGroup2); */				
				
				var cancelBtn = document.createElement("button");
				cancelBtn.classList.add("btn")
				cancelBtn.classList.add("btn-outline-secondary");
				cancelBtn.setAttribute("type","button");
				cancelBtn.setAttribute("onclick","closeUi()");
				cancelBtn.innerText = "취소";
				selectorInputGroup.appendChild(cancelBtn);
				
				var submitBtn = document.createElement("button");
				submitBtn.classList.add("btn")
				submitBtn.classList.add("btn-outline-primary");
				submitBtn.setAttribute("type","button");
				submitBtn.setAttribute("onclick","outstockInsert()")
				submitBtn.innerText = "출고 등록";
				selectorInputGroup.appendChild(submitBtn);
					
				//등록을 위한 값 뿌리기						
	
				var stockInput = document.getElementById("stockCode");
				stockInput.innerHTML = "";
				
				var stockInputValue = document.createElement("input");
				stockInputValue.setAttribute("type","hidden");
				stockInputValue.value = jsonObj.stock.stock_code;
				stockInput.appendChild(stockInputValue);
				
				var lotInput = document.getElementById("lotCode");
				lotInput.innerHTML = "";
				
				var lotInputValue = document.createElement("input");
				lotInputValue.setAttribute("type","hidden");
				lotInputValue.value = jsonObj.stock.lot_code;
				lotInput.appendChild(lotInputValue);
				
				var productInput = document.getElementById("productCode");
				productInput.innerHTML = "";
				
				var productInputValue = document.createElement("input");
				productInputValue.setAttribute("type","hidden");
				productInputValue.value = jsonObj.stock.product_code;
				productInput.appendChild(productInputValue);
				
				var whInput = document.getElementById("whCode");
				whInput.innerHTML = "";
				
				var whInputValue = document.createElement("input");
				whInputValue.setAttribute("type","hidden");
				whInputValue.value = jsonObj.stock.warehouse_code;
				whInput.appendChild(whInputValue);
				
				var arInput = document.getElementById("arCode");
				arInput.innerHTML = "";
				
				var arInputValue = document.createElement("input");
				arInputValue.setAttribute("type","hidden");
				arInputValue.value = jsonObj.stock.warehouse_area_code;
				arInput.appendChild(arInputValue);
				
				var rkInput = document.getElementById("rkCode");
				rkInput.innerHTML = "";
				
				var rkInputValue = document.createElement("input");
				rkInputValue.setAttribute("type","hidden");
				rkInputValue.value = jsonObj.stock.warehouse_rack_code;
				rkInput.appendChild(rkInputValue);
				
				var clInput = document.getElementById("clCode");
				clInput.innerHTML = "";
				
				var clInputValue = document.createElement("input");
				clInputValue.setAttribute("type","hidden");
				clInputValue.value = jsonObj.stock.warehouse_cell_code;
				clInput.appendChild(clInputValue);							
				
				var stockAmountInput = document.getElementById("amountCode")
				stockAmountInput.innerHTML = "";
				
				var stockAmountInputValue = document.createElement("input");
				stockAmountInputValue.setAttribute("type","hidden");
				stockAmountInputValue.value = amountInputValue.value;
				stockAmountInput.appendChild(stockAmountInputValue);
				
				var stockMemoInput = document.getElementById("memoCode")
				stockMemoInput.innerHTML = "";
				
				var stockMemoInputValue = document.createElement("input");
				stockMemoInputValue.setAttribute("type","hidden");
				stockMemoInputValue.value = memoInputValue.value;
				stockMemoInput.appendChild(stockMemoInputValue);			
				
			}		
		}
					
		xhr.open("get" , "./stockSelected?stockCode=" + stockCodeVal);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
				
			
	}
	
	 function closeUi(){
		
		var cleanUp = document.getElementById("selectorElement");
		cleanUp.innerHTML = "";	
		
	} 
	
	function outstockInsert(){
		
		var stockVal = document.getElementById("stockCode").firstChild.value;
		var lotVal = document.getElementById("lotCode").firstChild.value;
		var productVal = document.getElementById("productCode").firstChild.value;
		var whVal = document.getElementById("whCode").firstChild.value;
		var arVal = document.getElementById("arCode").firstChild.value;
		var rkVal = document.getElementById("rkCode").firstChild.value;
		var clVal = document.getElementById("clCode").firstChild.value;
		//이 값 다시 뿌리기
		var amountVal = document.getElementById("thisAmountInputValue").value;
		var memoVal = document.getElementById("thisMemoValue").value;
		
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				document.getElementById("stockCode").firstChild.value = "";
				document.getElementById("lotCode").firstChild.value = "";
				document.getElementById("productCode").firstChild.value = "";
				document.getElementById("whCode").firstChild.value = "";
				document.getElementById("arCode").firstChild.value = "";
				document.getElementById("rkCode").firstChild.value = "";
				document.getElementById("clCode").firstChild.value = "";
				document.getElementById("thisAmountInputValue").value = "";
				document.getElementById("thisMemoValue").value = "";		
				
				outstockList()
				
			}
		}
		
		xhr.open("post" , "./outstockInsert");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("stock_code=" + stockVal + "&lot_code=" + lotVal + "&product_code=" + productVal + "&warehouse_code=" + whVal + 
				"&warehouse_area_code="+ arVal + "&warehouse_rack_code=" + rkVal + "&warehouse_cell_code=" + clVal + 
				"&outstock_amount=" + amountVal + "&outstock_memo=" + memoVal);	
		
	}
	
	function doNotOver(){
		
		var inputValue = document.getElementById("thisAmountInputValue").value;
		var limit = document.getElementById("outstockAmountLimiter").value;
		
		if(inputValue>limit){
			
			alert("출고량은 재고량 이하로 입력해주십시오.");
			document.getElementById("thisAmountInputValue").value = limit;
		}
	
		else if (isNaN(inputValue) == true){
			
			alert("숫자만 입력 가능합니다");
			document.getElementById("thisAmountInputValue").value = "";
		}
		
	}
	
	function outstockList(){
		
		var searchOsTypeVal = document.getElementById("searchOsType").value;
		var searchOsWordVal = document.getElementById("searchOsWord").value;		
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);
				
				var searchOsList = document.getElementById("outstockList");
				searchOsList.innerHTML = "";				
				
				var thead = document.createElement("thead");
				searchOsList.appendChild(thead);
				
				var headTr = document.createElement("tr");
				thead.appendChild(headTr)	
						
				var headTh1 = document.createElement("th");
				headTh1.innerText = "출고 코드";
				headTr.appendChild(headTh1);
				
				var headTh11 = document.createElement("th");
				headTh11.innerText = "재고 코드";
				headTr.appendChild(headTh11);
				
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
				headT8.innerText = "출고량";
				headTr.appendChild(headT8);
			
				var headT9 = document.createElement("th");
				headT9.innerText = "출고 담당자";
				headTr.appendChild(headT9);
	
				var headT10 = document.createElement("th");
				headT10.innerText = "출고 등록일";
				headTr.appendChild(headT10);
				
				for(osList of jsonObj.outstockList){
					
					var tBody = document.createElement("tbody");
					searchOsList.appendChild(tBody);
					
					var searchTr = document.createElement("tr");
					tBody.appendChild(searchTr);
									
					var outStockCodeTh = document.createElement("th");
					outStockCodeTh.innerText = osList.outstock_code;
					searchTr.appendChild(outStockCodeTh);
					
					var stockCodeTh = document.createElement("th");
					stockCodeTh.innerText = osList.stock_code;
					searchTr.appendChild(stockCodeTh);
					
					var lotCodeTd = document.createElement("td");
					lotCodeTd.innerText = osList.lot_code;
					searchTr.appendChild(lotCodeTd);
					
					var pdCodeTd = document.createElement("td");
					pdCodeTd.innerText = osList.product_code;
					searchTr.appendChild(pdCodeTd);
					
					var whCodeTd = document.createElement("td");
					whCodeTd.innerText = osList.warehouse_code;
					searchTr.appendChild(whCodeTd);
					
					var arCodeTd = document.createElement("td");
					arCodeTd.innerText = osList.warehouse_area_code;
					searchTr.appendChild(arCodeTd);
					
					var rkCodeTd = document.createElement("td");
					rkCodeTd.innerText = osList.warehouse_rack_code;
					searchTr.appendChild(rkCodeTd);
					
					var clCodeTd = document.createElement("td");
					clCodeTd.innerText = osList.warehouse_cell_code;
					searchTr.appendChild(clCodeTd);
					
					var stockAmountTd = document.createElement("td");
					stockAmountTd.innerText = osList.outstock_amount;
					searchTr.appendChild(stockAmountTd);
					
					var stockManager = document.createElement("td");
					stockManager.innerText = osList.outstock_register_employee;
					searchTr.appendChild(stockManager);
					
					var stockDateTd = document.createElement("td");
					stockDateTd.innerText = moment(osList.outstock_resiter_date).format('YYYY.MM.DD');
					searchTr.appendChild(stockDateTd);
					
					
				}	
	
			}
			
		}
		
		xhr.open("get" , "./outstockList?searchOsType=" + searchOsTypeVal + "&searchOsWord=" +searchOsWordVal);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
					
	}
	
	window.addEventListener("DOMContentLoaded" , function (){			
		
		outstockList()
		
		});
	
	
	
</script>

</body>

	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	<div class="container-fluid" id="wrapper">	        
		
		<div class="row">
             <div class="ent-list form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">재고 조회</span>
                    </div>
                    <div class="col-4">
						<div class="input-group">
								<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="outstock_code">재고 코드</option>
									<option value="product_code">제품 코드<option>
									<option value="outstock_register_date">재고 등록일</option>
								  </select>
								<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button" onkeyup="stockSearch()">
								<button class="input-group-text bi bi-search"></button>
						</div>
                	</div>
                	</div>
                 <div class="row mt-3">
                     <div class="scroll-container mt-1 ">
						<div class="scrollTable">
							<table class="table table-bordered text-center" id="stockList">
							<thead>
								<tr>
								<th>재고 조회 후 출고 등록이 가능합니다.</th>
							</thead>
							<tbody>
								<tr>
								</tr>
							</tbody>
							</table>
						</div>
					</div>
             	</div>
             	<div id="selectorElement">
             	
             	</div>
             	<div>
				
				</div>
           </div>  
 			<!-- 출고 리스트 -->		
			<div class="form-control mt-3">
                <div class="row">
                    <div class="col">
                    	<i class="bi bi-list fs-5">&nbsp;</i><span class="fs-5" id="infoBox">출고 목록</span>
                    </div>
                    <div class="col-4">
						<div class="input-group mb-3">
								<select id="searchOsType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="outstock_code">출고 코드</option>
									<option value="product_code">물품 코드<option>
									<option value="outstock_register_date">출고 등록일</option>
								  </select>
								<input id="searchOsWord" type="text" class="form-control" aria-label="Text input with dropdown button" onkeyup="outstockList()">
								<button class="input-group-text bi bi-search"></button>
						</div>
                	</div>
               	</div>
               	<div class="row">
					<div class="scroll-container mt-1 ">
						<div class="scrollTable">
							<table class="table table-bordered text-center" id="outstockList">
								<thead>
									<tr>
									<th>출고 코드</th>
									<th>재고 코드</th>
									<th>로트 코드</th>
									<th>창고 코드</th>
									<th>구역 코드</th>
									<th>랙 코드</th>
									<th>셀 코드</th>
									<th>출고량</th>
									<th>출고 담당자</th>
									<th>출고 등록일</th>
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
          <!--  -->
          <div id="valueStorage">
          	<div id="stockCode"></div>
          	<div id="lotCode"></div>
          	<div id="productCode"></div>
          	<div id="whCode"></div>
          	<div id="arCode"></div>
          	<div id="rkCode"></div>
          	<div id="clCode"></div>
          	<div id="amountCode"></div>
          	<div id="memoCode"></div>
          </div>
	</div>	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>    

</html>