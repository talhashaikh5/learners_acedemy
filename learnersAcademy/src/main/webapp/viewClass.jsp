<%@page import="entity.Subject"%>
<%@page import="org.hibernate.Session"%>
<%@page import="entity.Classes"%>
<%@page import="java.util.List"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Classes</title>
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
<a href="index.html">Back to Main Menu</a>
<a href="addClasses.html">Add Class</a>
<a href="assignSubjectToClass.jsp">Assign Subject to Class</a>

<h1>The Following Classes are listed</h1>
<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<table>
  <thead>
    <tr>
      <th>Class Name</th>
      <th>Subject Name</th>
    </tr>
  </thead>
  <tbody>	
	<%		
		for(Classes clas : classes){
			out.print("<tr>");	
			out.print("<td>" + clas.getName() + "</td>");
						
			StringBuffer buf = new StringBuffer();
			boolean first = true;
			for (Subject subject : clas.getSubjects()){
				if(first== true){
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
					first = false;
				}else{
					buf.append("<tr><td></td>");
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
				}
				
			}
			out.print(buf.toString());
		}
	%>
  </tbody>
</table>
</body>
</html>
