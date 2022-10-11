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
	  <div class="col-2 border fs-1 fw-bold" style="color:#008FFF; text-align: center;">
	  공지사항
	  </div>
		<div class="col border">
		  <div class="row mb-5 fw-bold mt-3 fs-2">
  		    <div class="col-10">${data.notice_title }</div>
  		    <div class="col" style="float: right; font-size:0.8rem; text-align: end; align-self: flex-end;"><fmt:formatDate value="${data.notice_write_date }"/></div>
		  </div>
		  <div class="row my-5 mb-5">
				<div class="col">
					${data.notice_content }
				</div>
		  </div>
		  <div class="row pt-5 mb-3">
		    <div class="col">
		      <button type="button" onclick="location.href='./mainPage'" class="btn btn-primary ms-2" style="float: right;">메인페이지로</button>
		      <c:if test="${adminInfo != null}">
		      <button type="button" onclick="location.href='./noticeDeleteProcess?notice_code=${data.notice_code}'" class="btn btn-outline-danger" style="float: right;">삭제</button>
		      </c:if>
		    </div>
		  </div>
		</div>
	  <div class="col-2 border"></div>
	  </div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>