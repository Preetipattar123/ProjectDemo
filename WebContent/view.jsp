<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1><b>Retriving Data From Database</b></h1>
<table border="1" align="center">
<tr>
<td><b>ApplicantId</b></td>
<td><b>RegistrationDate</b></td>
<td><b>Description</b></td>
<td><b>priority</b></td>
<td><b>ValidityStartDate</b></td>
<td><b>ValidityEndDate</b></td>
<td><b>AssignedTo</b> </td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from applicants";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("applicantid") %></td>
<td><%=resultSet.getDate("regDate") %></td>
<td><%=resultSet.getString("Description") %></td>
<td><%=resultSet.getInt("priority") %></td>
<td><%=resultSet.getDate("valstadate") %></td>
<td><%=resultSet.getDate("valenddate") %></td>
<td><%=resultSet.getString("assignedto") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<style>
h1{
margin:10px 10px 10px 10px;
text-align:center;
color:blue;
padding:10px;
background-color:#d0dff7;
}
th, td {
  padding: 15px;
  text-align: left;
  color:blue;
  background-color:white;
}
body{
background-color:#E5E7E9;
}
</style>
</body>
</html>