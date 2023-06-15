<%@page import="com.helper.Factory"%>
<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>

	<div class="container">
    	<%@include file="navbar.jsp" %>
    	
    	<h1>Edit Your Notes.</h1>
    	<br>
    	<%
    		
    		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    		Session s=Factory.getFactory().openSession();
    		Note note=(Note)s.get(Note.class,noteId);
    				
    	%>
    	
		  <form action="Update" method="post">
		  		
		  		<input value="<%= note.getId() %>" name="noteId" type="hidden" />
		  	
			  <div class="form-group">
			    <label for="title">Note Title</label>
			    <input name="title"
			    	required 
			    	type="text" 
			    	class="form-control" 
			    	id="title" 
			    	aria-describedby="emailHelp" 
			    	placeholder="Enter here" 
			    	value="<%= note.getTitle() %>"
			    	/>
			  </div>
			  <div class="form-group">
			    <label for="content">Note Content</label>
			    <textarea name="content"
			    	required 
			    	id="content"
			     	placeholder="Enter your content"
			     	class="form-control"
			     	style="height:300px;"><%= note.getContent() %>
			     </textarea>
			  </div>
			  
			  <div class="container text-center">
			  	<button type="submit" class="btn btn-success">Save</button>
			  </div>
		</form>
    	
    </div>

</body>
</html>