<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
        *{
             margin: 0px;
             padding: 0px;
            
        }
	
	#body{
		width: 1200px;
	}
	
</style>
<script type="text/javascript">

		function noticeOpen(notice_code){
			var noticeCode = notice_code;
			var noticeContentBox = document.createElement("div");
			alert(noticeCode);
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					noticeContentBox.innerHTML = "";
					var noticeTitle = document.getElementById("notice_title" + noticeCode);
					
					noticeContentBox.innerText = result.data.notice_content;
					noticeTitle.appendChild(noticeContentBox);
				}
			}
			xhr.open("get" , "./getNoticeContentProcess?notice_code=" + noticeCode); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
			
			
			
		/* 		var noticeTitle = document.getElementById("notice_title" + noticeCode);
			var noticeContentBox = document.createElement("div");
			noticeContentBox.innerHTML = "";
			noticeContentBox.innerText = noticeContent;
			noticeTitle.appendChild(noticeContentBox); */
		}
		
		function test(notice_code){
			var noticeCode = notice_code;
			alert(noticeCode);
		}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid p-0" id="body">
	<jsp:include page="../commons/wmsNav.jsp"></jsp:include>
	  <div class="row p-0 m-0">
		<div class="col-6 border">
		  <div class="row" style="text-align: center;">
		    <div class="col fs-1 fw-bold p-3" style="color:#008FFF;">WMS</div>
		  </div>
		  <div class="row"><img src="../resources/img/1.png">
		  </div>
		  <div class="row" style="text-align: center;">
		    <div class="col fs-1 fw-bold p-3" style="color:#008FFF;">쉽고 간편한 창고 관리 솔루션</div>
		  </div>
		</div>
		<div class="col-6 border">
		  <div class="row">
		    <div class="col" style="background-color:#a9a9a9;">
		      <i class="bi bi-exclamation-triangle-fill"></i>공지사항
		      <c:if test="${adminInfo != null && adminInfo.authority_code == 0}">
		      <i class="bi bi-gear-fill" style="float: right" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom"></i>
		      </c:if>
		    </div>
		  </div>
		  <div class="row">
		    <div class="col">
		      <table class="table">
		        <thead>
		          <tr>
		            <th class="col-10" scope="col">제목</th>
		            <th class="col" scope="col">작성일</th>
		          </tr>
		        </thead>
		        <tbody>
		        <c:forEach items="${noticeDataList}" var="data" begin="0" end="15">
		        <c:if test="${(adminInfo.admin_code == data.noticeVo.admin_code) || (employeeInfo.company_code == data.noticeVo.company_code)}">
		          <tr id="notice_title${data.noticeVo.notice_code }"> 
		            <td><a onclick="location.href='noticedetailPage?notice_code=${data.noticeVo.notice_code}'">${data.noticeVo.notice_title }</a></td>
		            <td><fmt:formatDate value="${data.noticeVo.notice_write_date }" dateStyle="short"/></td>
		          </tr>
		          </c:if>
		          </c:forEach>
		        </tbody>
		      </table>
		    </div>
		  </div>
		</div>
	  </div>
	</div>
	
	<!-- offcanvas 공지사항 작성 -->
	<div class="offcanvas offcanvas-bottom" style="height: 45%;" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
	  <div class="offcanvas-header">
	    <h5 class="offcanvas-title fw-bold" style="color:#008FFF;" id="offcanvasBottomLabel">공지사항 등록</h5>
	    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	  </div>
	  <div class="offcanvas-body small">
	  <form action="noticeRegister" method="post">
	    <div class="row">
	      <div class="col">
	        <input type="hidden" name="admin_code" value="${adminInfo.admin_code }">
	        <input type="hidden" name="company_code" value="${adminInfo.company_code }">	        
	        <input type="text" class="form-control" name="notice_title" placeholder="제목을 입력해주세요">
	      </div>
	    </div>
	    <div class="row mt-3">
	      <div class="col">
	 	    <textarea name="notice_content" class="form-control" rows="5" cols="5" placeholder="내용을 입력해주세요"></textarea>
	      </div>
	    </div>
	    <div class="row mt-3">
	      <div class="col">
	        <button type="submit" class="btn btn-primary" style="background-color:#008FFF; border-color:#008FFF;">작성완료</button>	      
	      </div>
	    </div>
	  </form>
	  </div>
	</div>
	
	<!-- Modal 공지사항 내용보기 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">공지사항</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>