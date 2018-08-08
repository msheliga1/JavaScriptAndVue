<!DOCTYPE html>
<html>
	
<script type="text/javascript" src="createUserFileJS.js"> </script>	
<!--   MJS 7.18.18 
This page demonstrates basic javascript error checking for a form.
A javascript function is called, values are retrieved using getElementById
and printed using alerts.
Notes: The onSubmit method must return false to prevent the page from re-loading.
	Instead of enforcing non-blank fields in the form we do it here for demo purposes.
-->

<body>
<h2>This is Mike's admin/createUserFileJS.jsp</h2>
<br> A form with full javaScript error checking, including highlighting in the chosen color, and inserted and unhidden DOM elements.
<br> The java script is in a file of the same name.
<p>  
<!--  forms have inputs and fieldsets, but not tableRows -->
<form id="createUserJSForm" onsubmit="return createUserErrorCheck();" action="userCreated.jsp" method="post">
	<fieldset id="names"> 
		<legend>Name Info</legend>
		<br id="firstBreak"> First Name
		<input type="text" name="firstName" id="firstName" value="John"> 
		<br> Last Name 
		<input type="text" name="lastName" id="lastName" value="Doe"> 
		<!--  Can set color="red" but not bgColor,backgroundColor 7.19.18 -->
		<!--  bgcolor works in <td> but not in label or font tags. color works in font but not label. -->
		<label id="lastNameErrorMsg" style="background-color:red; visibility:hidden">The last name cannot be blank!</label>
	</fieldset>

	<br> Error Highlight Color 
	<!-- Must type value into Eclipse browser, No IE Support, ff00ff is pink -->
  	<input type="color" name="favcolor" id="highlight" value="#ff00ff">
	<p id="ageBreak"> Age  
	<!-- Wont enforce number type in eclipse either, must use para to add text in js -->
	<input type="number" name="age" id="age">
	</p>
	<br>
	<input type="submit" value="Click Here to Submit">
</form>
</body>
</html>
