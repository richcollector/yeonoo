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
		
				newLotListAll();
				
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
	
	function newLotListAll(){
		
		var searchTypeValue = document.getElementById("searchType").value;
		var searchWordValue = document.getElementById("searchWord").value;
		
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
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
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
				
				for(newLotList of jsonObj.lL){
					
					var tBody = document.createElement("tbody");
					lotList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
									
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.setAttribute("name","selectedLot");
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyCheckBox.value = newLotList.lot_code;
					bodyTd1.appendChild(bodyCheckBox);
						
					var lotCodeTh = document.createElement("th");
					lotCodeTh.innerText = newLotList.lot_code;
					bodyTr.appendChild(lotCodeTh)			
					
					var pdCodeTd = document.createElement("td");
					pdCodeTd.innerText = newLotList.product_code;
					bodyTr.appendChild(pdCodeTd);
					
					var pdName = document.createElement("td");
					pdName.innerText = newLotList.product_name;
					bodyTr.appendChild(pdName);
					
					var regDate = document.createElement("td");
					regDate.innerText = moment(newLotList.lot_date).format('YYYY.MM.DD');
					bodyTr.appendChild(regDate);
					
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
					inA1.setAttribute("href","javascript:newLotListPagenation("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:newLotListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
										
					}else{
											
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newLotListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:newLotListPagenation("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);				
					
				}				
			}		
		}
					
		xhr.open("get" , "./newLotList?searchType=" + searchTypeValue +"&searchWord="+searchWordValue);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	function newLotListPagenation(pageNumVal){
		
		var searchTypeValue = document.getElementById("searchType").value;
		var searchWordValue = document.getElementById("searchWord").value;	
		
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
				headCheckBox.id = "checkAll";
				headCheckBox.setAttribute("onclick","allCheck()")
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
				
				for(newLotList of jsonObj.lL){
					
					var tBody = document.createElement("tbody");
					lotList.appendChild(tBody);
					
					var bodyTr = document.createElement("tr");
					tBody.appendChild(bodyTr);
									
					var bodyTd1 = document.createElement("td1");
					bodyTr.appendChild(bodyTd1);
					
					var bodyCheckBox = document.createElement("input");
					bodyCheckBox.setAttribute("type","checkbox");
					bodyCheckBox.setAttribute("name","selectedLot");
					bodyCheckBox.setAttribute("onclick","isChecked()");
					bodyCheckBox.value = newLotList.lot_code;
					bodyTd1.appendChild(bodyCheckBox);
						
					var lotCodeTh = document.createElement("th");
					lotCodeTh.innerText = newLotList.lot_code;
					bodyTr.appendChild(lotCodeTh)			
					
					var pdCodeTd = document.createElement("td");
					pdCodeTd.innerText = newLotList.product_code;
					bodyTr.appendChild(pdCodeTd);
					
					var pdName = document.createElement("td");
					pdName.innerText = newLotList.product_name;
					bodyTr.appendChild(pdName);
					
					var regDate = document.createElement("td");
					regDate.innerText = moment(newLotList.lot_date).format('YYYY.MM.DD');
					bodyTr.appendChild(regDate);
					
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
					inA1.setAttribute("href","javascript:newLotListPagenation("+(jsonObj.startPage-1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
						inA2.setAttribute("href","javascript:newLotListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
						inA2.innerText = i;
						inLi2.appendChild(inA2);
										
					}else{
											
						var inLi2 = document.createElement("li");
						inLi2.classList.add("page-item");
						pageController.appendChild(inLi2);
						
						var inA2 = document.createElement("a");
						inA2.classList.add("page-link");
						inA2.setAttribute("href","javascript:newLotListPagenation("+i+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
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
					inA3.setAttribute("href","javascript:newLotListPagenation("+(jsonObj.endPage+1)+",'"+jsonObj.additionalParamType+"','"+jsonObj.additionalParamWord+"');");
					inA3.setAttribute("aria-label","Next");
					inLi3.appendChild(inA3);

					var inSpan3 = document.createElement("span");
					inSpan3.setAttribute("aria-hidden","true");
					inSpan3.textContent = ">>";
					inA3.appendChild(inSpan3);				
					
				}				
			}		
		}
					
		xhr.open("get" , "./newLotList?searchType" + searchTypeValue +"&searchWord="+searchWordValue +"&pageNum="+ pageNumVal);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
	
	function allCheck(){

		var allCheckValue = document.querySelector("input[id=checkAll]").checked;

		var checkList = document.getElementsByName("selectedLot");
		
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
		var checkList = document.getElementsByName("selectedLot");
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
	
	function beforeUpdateLot(){
		
		var checkVal = "";		
		var checkedLength = document.getElementsByName("selectedLot").length;		
		var count = 0;
		
		for (var i = 0; i < checkedLength; i++) {

            if (document.getElementsByName("selectedLot")[i].checked == true) {
            	count += 1;
            }
        }
		
		if(count == 0){
        	alert("수정할 로트가 선택되지 않았습니다.");
        	location.reload()
        	return;
        }else if(count > 1){
        	alert("한 개의 로트만 수정할 수 있습니다.");
        	location.reload()
        	return;
        }else if (count==1){
        	
        	 for (var i = 0; i < checkedLength; i++) {						 
        		 
                 if (document.getElementsByName("selectedLot")[i].checked == true) {
                 	checkVal = document.getElementsByName("selectedLot")[i].value;
                 	
                 	var updateHiddenBox = document.getElementById("updateCodeValue");
                	updateHiddenBox.innerHTML = "";
                	
                	updateHiddenValue = document.createElement("input");
                	updateHiddenValue.setAttribute("type","hidden");
                	updateHiddenValue.value = checkVal;
                	updateHiddenBox.appendChild(updateHiddenValue);

                 }
             }
        	
        }		
		
	}
	
	
function findPdToUP(){
		
		var keyword = document.getElementById("upSearchWord").value;
			
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var upAddUi = document.getElementById("upSearchWindowUi");
				upAddUi.innerHTML = "";
				
				upSearchResult = document.createElement("div");
				upSearchResult.classList.add("col");
				upAddUi.appendChild(upSearchResult);
				
				upResultUl = document.createElement("ul");
				upResultUl.classList.add("list-group");
				upSearchResult.appendChild(upResultUl);
									
				for (searchList of jsonObj.product){
					
					resultLi = document.createElement("li");
					resultLi.classList.add("list-group-item");
					resultLi.innerText = searchList.product.product_name;
					resultLi.setAttribute("onclick", "selPdToUp(this)");
					upResultUl.appendChild(resultLi);								
					
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
	
	
	function selPdToUp(upProductInfo){
		
		var productCode = upProductInfo.children[0].value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){				
				var jsonObj = JSON.parse(xhr.responseText);					
		
				var upInfoBox = document.getElementById("upProductInfoUi");
				upInfoBox.innerHTML = "";				
				
				var upProductNameBox = document.createElement("div");
				upProductNameBox.classList.add("input-group");
				upInfoBox.appendChild(upProductNameBox);
				
				var upFormBox1 = document.createElement("div");
				upFormBox1.classList.add("form-floating");
				upFormBox1.setAttribute("style","width:50%");
				upProductNameBox.appendChild(upFormBox1);
				
				var upNameVal = document.createElement("input");
				upNameVal.setAttribute("readonly","true");
				upNameVal.classList.add("form-control-plaintext");
				upNameVal.id = "floatingPlaintextInput";
				upNameVal.value = jsonObj.product.product.product_name;
				upFormBox1.appendChild(upNameVal);
				
				var upNameLabel = document.createElement("label");
				upNameLabel.setAttribute("for","floatingPlaintextInput");
				upNameLabel.innerText = "제품 이름";
				upFormBox1.appendChild(upNameLabel);
				
				var upProductCodeBox = document.createElement("div");
				upProductCodeBox.classList.add("input-group");
				upInfoBox.appendChild(upProductCodeBox);
				
				var upFormBox2 = document.createElement("div");
				upFormBox2.classList.add("form-floating");
				upFormBox2.setAttribute("style","width:50%");
				upProductNameBox.appendChild(upFormBox2);
				
				var upCodeVal = document.createElement("input");
				upCodeVal.setAttribute("readonly","true");
				upCodeVal.classList.add("form-control-plaintext");
				upCodeVal.id = "floatingPlaintextInput";
				upCodeVal.value = jsonObj.product.product.product_code;
				upFormBox2.appendChild(upCodeVal);
				
				var upCodeLabel = document.createElement("label");
				upCodeLabel.setAttribute("for","floatingPlaintextInput");
				upCodeLabel.innerText = "제품 코드";
				upFormBox2.appendChild(upCodeLabel);
				
				var upProductMemoBox = document.createElement("div");
				upProductMemoBox.classList.add("input-group");
				upInfoBox.appendChild(upProductMemoBox);
				
				var upFormBox3 = document.createElement("div");
				upFormBox3.classList.add("form-floating");
				upFormBox3.setAttribute("style","width:100%");
				upProductNameBox.appendChild(upFormBox3);
				
				var upMemoVal = document.createElement("input");
				upMemoVal.setAttribute("readonly","true");
				upMemoVal.classList.add("form-control-plaintext");
				upMemoVal.id = "floatingPlaintextInput";
				upMemoVal.value = jsonObj.product.product.product_memo;
				upFormBox3.appendChild(upMemoVal);
				
				var upMemoLabel = document.createElement("label");
				upMemoLabel.setAttribute("for","floatingPlaintextInput");
				upMemoLabel.innerText = "제품 메모";
				upFormBox3.appendChild(upMemoLabel);		
				
				var upLotProduct = document.getElementById("upLotItem");
				upLotProduct.innerHTML = "";
				
				var upLotPdHiddenCode = document.createElement("input");
				upLotPdHiddenCode.setAttribute("type","hidden");
				upLotPdHiddenCode.value = jsonObj.product.product.product_code;
				upLotProduct.appendChild(upLotPdHiddenCode);
				
				console.log(upLotPdHiddenCode.value);
				
			}		
		}
					
		xhr.open("get" , "./selPdToRegi?productCode=" + productCode);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
		
	function lotItemUpdate(){
		
		var upProductCodeVal = document.getElementById("upLotItem").firstChild.value;
		var upLotCode = document.getElementById("updateCodeValue").firstChild.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
		
				lotListAll();
				
			}
		}
			
		xhr.open("post" , "./lotItemUpdate");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("product_code=" + upProductCodeVal + "&lot_code=" + upLotCode);	
							
	}
	
	function deleteLotLog(){
		
		var checkList = new Array();
		
		var listLength = document.getElementsByName("selectedLot").length;
		
		for (var i = 0; i < listLength; i++) {

            if (document.getElementsByName("selectedLot")[i].checked == true) {
            	
            	checkList[i] = document.getElementsByName("selectedLot")[i].value;
            }
        }
		

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
					
				
			}
		}
		
		xhr.open("post" , "./deleteLotLog" , false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("code=" + checkList);
		
		newLotListAll();
	}
	
	
	
window.addEventListener("DOMContentLoaded" , function (){
		
		newLotListAll();
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
	             <button type="button" class="btn btn-light" data-bs-toggle="modal" onclick="beforeUpdateLot()" data-bs-target="#lotUpdateModal">
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
						<div class="input-group mb-3">
								<select id="searchType" style="width: 10px;" class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="l.lot_code">로트 코드</option>
									<option value="p.product_name">제품 이름</option>
								  </select>
								<input id="searchWord" type="text" class="form-control" aria-label="Text input with dropdown button" onkeyup="deleteLotLog()">
								<button class="input-group-text bi bi-search"></button>
						</div>
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
               	<div class="page mt-3" >
					<nav aria-label="Page navigation example">
						<ul id="pageUi" class="pagination justify-content-center"></ul>
					</nav>
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
  												<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
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
		<div class="modal fade" id="lotUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
				  <div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">LOT 수정</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     </div>
					     <div class="modal-body">
					        <div class="row">
                        		<div class="ent-list form-control mt-3">
                        			<div class="row mt-3">
                        				<span>제품 이름 입력</span>
		                                <div class="col mt-3">
		                                    <div class="input-group">		                                        
		                                        <input type="text" class="form-control" placeholder="검색 후 선택 버튼을 눌러주세요" id="upSearchWord" onkeyup="findPdToUP()">
  												<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
  											</div>
		                                </div>
                            		</div>
  									<div id="updateCodeValue">                           		
                            		</div>
                            		<div class="row mt-1" id="upSearchWindowUi">
                            		</div>
                            		<div class="row mt-3" id="upProductInfoUi">
                            		</div>
                            		<div id="upLotItem">
                            		</div>
                        		</div>
                        	</div>                       	
					     </div>
					     <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="lotItemUpdate()" data-bs-dismiss="modal">수정</button>
					     </div>
				    </div>
			  </div>
		 </div>
		 <!-- 모달 끝 -->
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>