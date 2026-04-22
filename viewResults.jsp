<%@ page import="java.sql.*" %>
<%@ page import="com.exam.util.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection con=DBConnection.getConnection();
PreparedStatement ps=con.prepareStatement(
"SELECT * FROM results WHERE user_id=?");

ps.setInt(1,(Integer)session.getAttribute("userid"));
ResultSet rs=ps.executeQuery();
%>

<table border="1">
<tr><th>Subject</th><th>Score</th></tr>

<%
while(rs.next()){
%>
<tr>
<td><%=rs.getString("subject")%></td>
<td><%=rs.getInt("score")%></td>
</tr>
<% } %>
</table>