<!DOCTYPE html>
<html>
	
<script>
/* MJS 7.18.18 
This page demonstrates basic javascript error checking for a form.
A javascript function is called, values are retrieved using getElementById
and printed using alerts.
Notes: The onSubmit method must return false to prevent the page from re-loading.
	Instead of enforcing non-blank fields in the form we do it here for demo purposes.
*/

"use strict";
// Checks for errors returning false if one or more errors are found.
// MJS 7.19.18
// A summary alert with one line per error is displayed. 
// Any fields with an error are highlighted using the user input color, 
// and an error message is inserted (or made visible) immediately after the error.
function userErrorCheck() {
	const BLANK_FIRSTNAME = "The first name cannot be blank!";
	const BLANK_LASTNAME = "The last name cannot be blank!";
	const BLANK_AGE = "The age can't be blank!";
	const NEGATIVE_AGE = "The age can't be negative!";
	const NEW_LINE = "\n"
	var okay = true;  // main result returned by this method
	var firstName;
	var lastName;
	var age; 
	var highlight = document.getElementById("highlight");
	var nextNode;
	var appendText;
	var errorCount = 0;
	var errorMsg = "";
	var defaultBackground = 'white';
	
	// displayElementsAndNames();
	// Handle the firstName input field
	// Delete the old firstName err msg if it exists - using nextSibling and removeChild
	firstName = document.getElementById("firstName"); // firstName paragraph
	nextNode = firstName.nextSibling;
	if (nextNode !== null && nextNode.textContent === BLANK_FIRSTNAME) {
		nextNode.parentNode.removeChild(nextNode);
	}
	// Check new firstName, display alert and insert msg on web page.
	if (firstName.value.length == 0) {
		errorMsg += ++errorCount + ". " + BLANK_FIRSTNAME + NEW_LINE;
		firstName.style.backgroundColor = highlight.value;
		var label = document.createElement('label');
		label.textContent = BLANK_FIRSTNAME;
		label.style.backgroundColor = 'red';
		firstName.insertAdjacentElement("afterEnd", label);
		okay = false;
	} else {
		firstName.style.backgroundColor = defaultBackground;
	}
	
	// Handle the lastName input field  
	// Note how making the error msg invisible requires less code.
	lastName = document.getElementById("lastName");
	if (lastName.value.length == 0) {
		errorMsg += ++errorCount + ". " + BLANK_LASTNAME + NEW_LINE;
		lastName.style.backgroundColor = highlight.value;
		document.getElementById("lastNameErrorMsg").style.visibility = "visible";
		okay = false;
	} else {
		lastName.style.backgroundColor = defaultBackground;
		// Hide the err msg. (msg will still take up space on page)
		document.getElementById("lastNameErrorMsg").style.visibility = "hidden";
	}
	
	// Handle the age field.  
	// First delete the old age err msg, if it exists, by looping through 
	// all child nodes.  This code is the longest.
	var ageCNs = document.getElementById("ageBreak").childNodes;
	for (var i=0; i < ageCNs.length; i++) {
		var curNode = ageCNs[i];
		if (curNode.nodeType === Node.TEXT_NODE || 
			curNode.nodeType === Node.ELEMENT_NODE) {
			if (curNode.textContent === BLANK_AGE ||
				curNode.textContent === NEGATIVE_AGE) {
				curNode.parentNode.removeChild(curNode);
			}		
		}
	}
	// Now check the age field, display alert and insert err text on web page.
	age = document.getElementById("age");
	if (age.value.length == 0) {
		// cant easily change pass-by-value parameters in routine so change errorMsg here
		errorMsg += ++errorCount + ". " + BLANK_AGE + NEW_LINE;
		addAgeErrorInfo(age, BLANK_AGE);
		okay = false;
	} else if (age.value < 0) {
		errorMsg += ++errorCount + ". " + NEGATIVE_AGE + NEW_LINE;
		addAgeErrorInfo(age, NEGATIVE_AGE);
		okay = false;
	} else {
		age.style.backgroundColor = defaultBackground;
	}
	if (errorCount > 0) {
		var msg = "The data contains " + errorCount + " error";
		if (errorCount > 1) msg += "s";
		msg += " that must be corrected. " + NEW_LINE + NEW_LINE;
		alert(msg + errorMsg);		
	}

	return okay;
} // end function userErrorCheck

// MJS 7.19.18 - Add error highlight and label for age field
// errorCount must be incremented before this routine
function addAgeErrorInfo(age, newMsg) {
	var highlight = document.getElementById("highlight");
	 
	// insert age err text on web page.
	age.style.backgroundColor = highlight.value;
	var label = document.createElement('label');
	label.textContent = newMsg;
	label.style.backgroundColor = 'red';
	document.getElementById("ageBreak").appendChild(label); 

} // end function addErrorInfo

// MJS 7.19.18 - Display all elements and then all nodes within the "names" element.
function displayElementsAndNames() {
	
	// elements are NOT text nodes. There are 12 types of nodes, elements have <>'s normally
	var els = document.getElementById("createUserJSForm").elements;
	for (var i=0; i < els.length; i++) {
		alert("Elements " + i + " is " + els[i].value);
		var curNode = els[i];
	}
	var cns = document.getElementById("names").childNodes;
	for (var i=0; i < cns.length; i++) {
		var curNode = cns[i];
		if (curNode.nodeType === Node.TEXT_NODE) {
			alert("ChildNode " + i + " is a text node: " + curNode.textContent);
		} else {
			alert("ChildNode " + i + " is " + curNode.value);			
		}
	}
} // end function displayElementsAndNames

</script>

<body>
<h2>Mike's createUserErrorJS.jsp</h2>
<br> A form with full JavaScript error checking, including highlighting in the chosen color, and inserted and hidden DOM elements.
<p>  
<!--  forms have inputs and fieldsets, but not tableRows -->
<form id="createUserJSForm" onsubmit="return userErrorCheck();" action="userCreated.jsp" method="post">
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

	<br> Error Field Color 
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
