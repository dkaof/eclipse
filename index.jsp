<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; 
  background-color: lightblue">
  <h2 style="text-align:center"><b>수강신청 관리 프로그램</b></h2>
  <p style="padding-left: 20px">
1. 총 10개의 교과목이 있습니다.</br><br>
2. 교과목 목록을 확인하려면 교과목목록 조회/수정 메뉴를 클릭하세요.<br><br>
3. 교과목을 추가하려면 교과목 추가 메뉴를 클릭하세요.<br><br>
4. 교과목을 수정하려면 교과목 목록 메뉴에서 과목코드를 클릭하세요.<br>
</p>
  </section>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>