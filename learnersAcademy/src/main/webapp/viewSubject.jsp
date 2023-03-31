<%@page import="entity.Subject"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Subjects</title>
<style>
  body {
    font-family: Arial, sans-serif;
  }
  h1 {
    text-align: center;
  }
  table {
    margin: 0 auto;
    border-collapse: collapse;
    width: 80%;
  }
  th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
  }
  th {
    background-color: #f2f2f2;
  }
  a {
    display: inline-block;
    margin: 10px;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    border-radius: 4px;
  }
  a:hover {
    background-color: #3e8e41;
  }
</style>
</head>
<body>
<a href="index.html">Back to Main Menu</a><br>
<a href="addSubject.html">Add Subject</a><br>

<h1>Here's a comprehensive list of the subjects available:</h1>
<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Subject> subjects = hibernateSession.createQuery("from Subject").list();
%>
<table>
<tr>
<th>Subject Name </th>
</tr>
	<%		
		for(Subject subject : subjects){
			out.print("<tr>");	
			out.print("<td>" + subject.getName() + "</td>");
			out.print("</tr>");	
		}
	%>
</table>



</body>
</html>