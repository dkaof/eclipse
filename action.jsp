<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");//한글지원 인코딩
 String mode = request.getParameter("mode");//외부에서 불러올 삽입, 수정, 삭제를 받는 것
 
 String id = request.getParameter("id");//외부에서 불러오기
 String name = request.getParameter("name");
 String credit = request.getParameter("credit");
 String lecturer = request.getParameter("lecturer");
 String week = request.getParameter("week");
 String start_hour = request.getParameter("start_hour");
 String end_hour = request.getParameter("end_hour");
 
 try{
	 Connection conn = Util.getConnection();
	 String sql = ""; //삽입, 수정, 삭제 중 어떤 값이 들어 얼지 모르므로 ""로 합니다.
	 PreparedStatement pstmt = null;//어떤 값이 들어 올지 모르므로 null로 초기화 해준다
	 
	 switch(mode){
	 case "insert" : //삽입
		 sql = "INSERT INTO course_tbl VALUES(?,?,?,?,?,?,?)";//무엇을 입력하지 몰라서 ?
		 pstmt = conn.prepareStatement(sql);//sql문을 실행해서 전달하는 역힐
		 pstmt.setString(1,id);//위에서 ? 로 한 곳에서 받아올 데이터를 모두 여기서 받는다
		 pstmt.setString(2,name);
		 pstmt.setString(3,credit);
		 pstmt.setString(4,lecturer);
		 pstmt.setString(5,week);
		 pstmt.setString(6,start_hour);
		 pstmt.setString(7,end_hour);
		 
		 pstmt.executeUpdate();//데이터베이스에 Update
%>
<jsp:forward page="insert.jsp"></jsp:forward>//insert.jsp 페이지로 돌아갑니다.
<%	 
		 break;
	 case "modify" : //수정
	 	sql = "UPDATE course_tbl SET name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? WHERE id=?";
	 	pstmt = conn.prepareStatement(sql);
	 	pstmt.setString(1, name);//위의 ? 순으로 기술해야 한다.
	 	pstmt.setString(2, credit);
	 	pstmt.setString(3, lecturer);
	 	pstmt.setString(4, week);
	 	pstmt.setString(5, start_hour);
	 	pstmt.setString(6, end_hour);
	 	pstmt.setString(7, id);//7번쩨 ?에 해당한다
	 	
	 	pstmt.executeUpdate();//데이터베이스에 Update
%>
<jsp:forward page="modify.jsp"></jsp:forward>//modify.jsp 페이지로 돌아갑니다.
<%	 	
	 	break;
	 case "delete" :
		 sql = "DELETE FROM course_tbl WHERE id=?";//삭제를 위해 선택된 것이 여기와 연결된다
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, id);//?표가 한개 이므로 한번만 한다
		 	
		 pstmt.executeUpdate();//데이터베이스에 Update
%>
<jsp:forward page="list.jsp"></jsp:forward>//list.jsp 페이지로 돌아갑니다.
<%		 
		 break;
	 }
	 
 }
 catch(Exception e){//예외 처리
	 e.printStackTrace();
 }
%>