<%@page import="entity.Subject"%>
<%@page import="entity.Teacher"%>
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
<title>Insert title here</title>
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
<a href="addTeacher.html">Add Teacher</a><br>
<a href="assignTeacherToSubject.jsp">Assign Teacher to Subject</a><br>

<h1>The Following Teachers are listed</h1>
<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Teacher> teachers = hibernateSession.createQuery("from Teacher").list();
%>
<table>
<tr>
<th>First Name </th>
<th>Last Name </th>
<th>Assigned Class</th>
</tr>
	<%		
		for(Teacher teacher : teachers){
			out.print("<tr>");	
			out.print("<td>" + teacher.getName() + "</td>");
			out.print("<td>" + teacher.getLname() + "</td>");
			
			StringBuffer buf = new StringBuffer();
			boolean first = true;
			for (Subject subject : teacher.getSubjects()){
				if(first== true){
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
					first = false;
				}else{
					buf.append("<tr><td></td><td></td>");
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
				}
				
			}
			out.print(buf.toString());
		}
	%>
</table>

</body>
</html>