<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String RegistrationDate = request.getParameter("regDate");
String description  = request.getParameter("description");
int priority    = Integer.parseInt(request.getParameter("priority"));
String  VSDate = request.getParameter("vsd");
String VEDate = request.getParameter("ved");
String assigned = request.getParameter("assigned");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into applicants(regdate,description,priority,valstadate,valenddate,assignedto)values('"+RegistrationDate+"','"+description+"','"+priority+"','"+VSDate+"','"+VEDate+"','"+assigned+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>