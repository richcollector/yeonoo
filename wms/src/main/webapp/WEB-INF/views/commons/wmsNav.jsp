<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
    
    <style>
    
	   	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
	   	
	   	body { 
		font-family : pretendard; 
		color: #404040; 
		} 
		
	    *{
	         margin: 0px;
	         padding: 0px;
	    }

        #wrapper{
            width: 1200px;
        }

        .navbar{
            background-color: rgb(0, 143, 255)
        }

        .textWhite{
            color: white;
            font-weight: bold;
        }

        .usermenu-btn {
            border: none;
            background-color: inherit;        
            display: inline-block;
            cursor: pointer;
        }

	      .active,
	      .usermenu:hover {
            display: block;
        }

        .usermenu{
	        z-index : 2;
	        width: 100%;
	        position: relative;
	        display: inline-block;
        }
		
		#searchmenu{
	        z-index : 2;
	        width: 100%;
	        position: relative;
	        display: inline-block;
        }
		
        .usermenu-content{
         	overflow: hidden;
            max-height: 0;
         	transition: max-height 0.2s ease-out;
            position: absolute;
            background-color: white;
            border : 1;
            margin-top: 16px;
            width:auto;
            -webkit-box-shadow: 0 4px 4px 0 rgb(0 0 0 / 12%);
            padding: 0 14px 0 14px;
            left: -13px;
        }

        .btnnn {
            border: none;
            background-color: inherit;        
            display: inline-block;
            cursor: pointer;
        }
        
         a{
         text-decoration-line: none;
         color: #404040;
         }
		
		#searchmenu-content{
			
			z-index : 2;
            position: absolute;
            background-color: white;
      		border: 1px;
      		
            -webkit-box-shadow: 0 4px 4px 0 rgb(0 0 0 / 12%);
		}
				
    </style>
    
    <script type="text/javascript">
    
      function collapse(element) {
         var before = document.getElementsByClassName("active")[0]               // ????????? ???????????? ??????
         if (before && document.getElementsByClassName("active")[0] != element) {  // ?????? ????????? ?????? ???????????? ????????? ?????????
            before.nextElementSibling.style.maxHeight = null;   // ????????? ????????? ?????? ??????
            before.classList.remove("active");                  // ?????? ????????????
         }
         element.classList.toggle("active");         // ????????? ?????? toggle
   
         var content = element.nextElementSibling;
         if (content.style.maxHeight != 0) {         // ?????? ?????? ????????? ????????? ?????????
            content.style.maxHeight = null;         // ??????
         } else {
            content.style.maxHeight = content.scrollHeight + "px";  // ???????????? ?????? ?????????
         }
      }
    
      function navShotcut(){
  		
  		var keyword = document.getElementById("searchText").value;
  		
  		var xhr = new XMLHttpRequest();
  		xhr.onreadystatechange = function () {
  			if(xhr.readyState == 4 && xhr.status == 200){				
  				var jsonObj = JSON.parse(xhr.responseText);					
  				
				var upAddUi = document.getElementById("searchmenu-content"); 				
				upAddUi.innerHTML = "";
				
					if(keyword == ""){							
						
						var resultLi = document.createElement("li");
						resultLi.classList.add("list-group-item");
						resultLi.innerText = "???????????? ???????????????.";
						upAddUi.appendChild(resultLi);
		
			  		}else{
		
						for(findShotcut of jsonObj.shotcutList){
							
							var resultLi = document.createElement("li");
							resultLi.classList.add("list-group-item");
							resultLi.innerText = findShotcut.shotcut_name;
							resultLi.setAttribute("onclick", "location.href='../'+ findShotcut.shotcut_value");
							upAddUi.appendChild(resultLi);			  					  						
	  						
						
				  		}
			  		}		
				
					
  			}		
  		}
  					
  		xhr.open("get" , "../main/navShotcut?shotcut_name=" + keyword );
  		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  		xhr.send();
  		
  	}
      
    </script>

</head>
<body>   
    <div class="container-fluid" id="wrapper">
        <div class="row navbar">
            <div class="col-1">
                <a href="../main/mainPage"><span class="textWhite mx-4">WMS</span></a>            
            </div>
            <div class="col textWhite">
                <span>${employeeInfo.employee_name } ${adminInfo.company_code } <a href="../main/logOutProcess"><i class="bi bi-power text-white"></i></a><!--logout button--> </span>                           
            </div>
            <div class="col">
                <div class="usermenu">
                    <button class="btnnn textWhite " type="button" onclick="collapse(this);">
                        ????????? ??????
                    </button>
                    <div class="usermenu-content">
                      <c:if test="${employeeInfo != null && adminInfo == null}">
                        <a href="../main/userInfoUpdatePage">??????????????????</a><br>
                      </c:if>
                      <c:if test="${adminInfo != null && employeeInfo == null}">
                        <a href="../company/employeeRankInfoPage">????????????</a><br>           
                        <a href="../company/departmentInfoPage">????????????</a><br>     
                        <a href="../main/employeeInfoManagePage">????????????</a><br>
                      </c:if> 
                    </div>
                </div>              
            </div>
            <div class="col">
                <div class="usermenu">
                <button class="btnnn textWhite " type="button" onclick="collapse(this);">
                    ????????????
                </button>
                <div class="usermenu-content">
                        <a href="../company/companyInfoPage">????????????</a><br>
                        <a href="../account/accountInfoPage">???????????????</a><br>
                        <a href="../employee/productInfoPage">????????????</a><br>
                        <a href="../warehouse/warehouseList">????????????</a><br>
                        <a href="../lot/lotManage">????????????</a>            
                </div>          
                </div>    
            </div>
            <div class="col">
                <div class="usermenu">
                <button class="btnnn textWhite " type="button" onclick="collapse(this);">
                    ????????????
                </button>
                <div class="usermenu-content">
                    <a href="../employee/obtainOrderInfoPage">????????????</a><br>
                    <a href="../employee/manufactureInfoPage">????????????</a><br>
                    <a href="../employee/outboundInfoPage">????????????</a><br>            
                    <a href="../employee/productPriceInfoPage">????????????</a><br>
                </div>          
                </div>            
            </div>
            <div class="col">
                <div class="usermenu">
                <button class="btnnn textWhite " type="button" onclick="collapse(this);">
                    ????????????
                </button>
                <div class="usermenu-content">
                    <a href="../employee/purchaseInfoPage">????????????</a>             
                </div>          
                </div>               
            </div>
            <div class="col">
                <div class="usermenu">
                <button class="btnnn textWhite " type="button" onclick="collapse(this);">
                    ????????????
                </button>
                <div class="usermenu-content">
                    <a href="../inbound/inboundManage">????????????</a><br>
                    <a href="../outstock/outstockManage">????????????</a><br>
                    <a href="../stock/stockManage">????????????</a>       
                </div>          
                </div>              
            </div>
            <div class="col-2">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="??????" onkeyup="navShotcut()" id="searchText">
                    <span class="input-group-text bi bi-search"></span>               
                </div> 
                <ul class="list-group" id="searchmenu-content">
				</ul>
            </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

</body>
</html>