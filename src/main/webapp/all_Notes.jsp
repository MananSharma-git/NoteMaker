<%@page import="jakarta.persistence.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.Factory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes: Note Maker</title>
<%@include file="all_js_css.jsp" %> 
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp" %>
		<br>
		<h1 class="test-uppercase">All Notes:</h1>
		
		<div class="row">
			
			<div class="col-12">
				
				<%
		
					Session s=Factory.getFactory().openSession();
					Query q=s.createQuery("from Note");
					List<Note> list=q.getResultList();
					for(Note note:list){
						//out.println(note.getId() + " : " + note.getTitle() + "<br>");
				%>
					
					<div class="card mt-3" >
					  <img class="card-img-top m-1 mx-auto" src="img/notes.png" style="max-width:50px" alt="Card image cap">
					  <div class="card-body">
					    <h5 class="card-title"><%= note.getTitle() %></h5>
					    <p class="card-text">
					    	<%= note.getContent() %>
					    </p>
					    <p class="text-primary"><b> <%=note.getAddedDate() %> </b></p>
					    <div class="container text-center mt-2">
					    	<a href="Delete?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
					    	<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
					    </div>
					  </div>
					</div>
					
				<%	
					}
				
					s.close();
				%>
			
			</div>
		
		</div>
		
	</div>

</body>
</html>