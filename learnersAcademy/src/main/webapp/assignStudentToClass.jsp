<%@page import="entity.Classes"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
}

a {
  color: blue;
  text-decoration: none;
}

h1 {
  color: #333;
  text-align: center;
  margin-top: 30px;
}

table {
  border-collapse: collapse;
  width: 80%;
  margin: 0 auto;
}

th {
  background-color: #ccc;
  padding: 10px;
  text-align: left;
}

td {
  padding: 10px;
  border: 1px solid #ccc;
}

select {
  padding: 5px;
  border-radius: 5px;
  border: 1px solid #ccc;
}
</style>

</head>
<body>
<a href="index.html">Back to Main Menu</a><br>

<h1>Assign a Student to a Class</h1>
<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Student> students = hibernateSession.createQuery("from Student").list();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<form action="assignStudent" method="post">
<table>
<tr>
<th>Student Name </th>
<th>Class Name </th>
</tr>
<tr>
<td>
<select name="name">
<%
	for (Student student : students){
	out.print("<option>" + student.getName() + " " + student.getFname());
	out.print("</option>");
	}
%>
</select>
</td>

<td>
<select name="class">
<%
	for (Classes clas : classes){
	out.print("<option>" + clas.getName());
	out.print("</option>");
	}
%>
</select>
</td>
</tr>
</table>
<input type="submit" value="Submit">
</form>

</body>
</html>
