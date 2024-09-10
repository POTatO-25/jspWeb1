<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeEditProc</h3>
<%
request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("c");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	String sql = "update notices set title = ?, content = ? where seq = ?";
	// DB 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";
	Connection conn = DriverManager.getConnection(url, user, pw);
	
	// 실행
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setInt(3, Integer.parseInt(seq));
	
	pstmt.executeUpdate();
	
	response.sendRedirect("noticeDetail.jsp?c=" + seq);
%>

</body>
</html>