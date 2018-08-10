<!DOCTYPE html>
<html>
	
<script type="text/javascript" src="createUserFileJS.js"> </script>	
<!--   MJS 7.18.18 
This page demonstrates basic jsp and display values from a form.
-->

<body>
<p> Congratulations, a new user was successfully created. </p> 
First Name: <%= request.getParameter("firstName") %>
<br> Last NAME:  <%  out.write(request.getParameter("lastName")); %>
<br> Age:        <%= request.getParameter("age") %>
<br>
<br> <a href="<%=request.getContextPath()%>/index.jsp"> Back to main index </a>
</body>
</html>
