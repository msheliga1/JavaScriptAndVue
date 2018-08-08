<!DOCTYPE html>
<html>
	
<script type="text/javascript" src="createUserFileJS.js"> </script>	
<!--   MJS 7.18.18 
This page demonstrates basic jsp and display values from a form.
-->

<body>
<p> Front End Examples of JavaScript and Vue 
<br> Author: Mike Sheliga August, 2018 </p>

<p>This project includes examples of JavaScript and Vue.js pages, including Vue components, 
hooks and emitted values. </p> 

<p><h1> JavaScript </h1>
Two versions of a JavaScript example are included.  These perform error checking on a simple input form. 
The versions act the same but one uses a single file while the other separates JavaScript from the jsp.
These examples were mainly included as a point of comparison for the later Vue examples.
<p> The javascript forms include four representative methods for updating the webpage DOM.</p>
<ol> 
	<li> <ul> Inserting New DOM Elements as a First Child - Hardest and Inflexible 
		<li> document.getElementById("name")</li>
		<li> label = document.createElement('label')</li>
		<li> document.getElementById("ageBreak").appendChild(label); </li>
		<li> Must Remove Node As Well </li>
		<li> if (nextNode.textContent === BLANK_FIRSTNAME) {nextNode.parentNode.removeChild(nextNode);} </li>
	</ul> </li>
	<br>
	<li> <ul> Inserting New DOM Elements into a Named Location - Still Cumbersome but Slightly More Flexible 
		<li> firstName = document.getElementById("firstName")</li>
		<li> label = document.createElement('label')</li>
		<li> firstname.insertAdjacentElement("afterEnd", label) </li>
		<li> Must Remove Node As Well </li>
		<li> if (nextNode.textContent === BLANK_FIRSTNAME) {nextNode.parentNode.removeChild(nextNode);} </li>
	</ul></li>
	<br>
	<li> <ul> Changing Visibility - Easier by Far
		<li> document.getElementById("name").style.visibility = "visible" </li>
		<li> Easy to remove, set visibility to "hidden" </li>
		<li> Element Still Takes Up Space on the Page </li>
	</ul></li>
	<br>
	<li> <ul> Changing CSS Display - Often the Best Option 
		<li> document.getElementById("name").style.display = "none" </li>
		<li> Easy to remove, set display to "block", "", etc. </li>
		<li> Undisplayed Elements Do Not Take Up Space on the Page </li>
	</ul></li>		
</ol>

<p><h1> Vue </h1>
Vue is a "reactive" front-end framework that requires less work than JavaScript. It is similar to React and Angular, and can be 
looked at as a cross between the two of them. In short these frameworks allow a webpage DOM to be updated automatically 
without having to retrieve elements, create new elements or insert elements. <p>
 
<p> There are five Vue projects. The most complex uses Vue concepts such as components, props and slots to implement a 
modifiable tax calculator.</p>
<p> Vue is a whole other way of thinking but it does lessen the coding length. 
The Vue projects (from most complex to simplest) include: </p>
<ol> 
	<li> <ul> Tax Calcuator Using Components 
		<li> Each Tax is a component with rate, default, label and negation values.</li>
		<li> The rate is emitted from the component to the vue so that the total can be calculated. </li>
		<li> Calculated and created hook are used. 
		<li> Administration Mode </li>
		<li> New Taxes (Component) Can Be Added, Modified and Deleted</li>
		<li> Tax Name, Default Value and Normally Negative Values Can Be Changed</li>
		<li> Degugging Mode </li>
		<li> Much More Verbose Output is Shown </li>
		<li> User Mode </li>
		<li> Type in the Tax Rates and Auto-Calculate Totals</li>
		<li> Reset Rates to Default Values </li>
		<li> Error Checking - Empty Values Highlighted
	</ul> </li>
	<br>
	<li> <ul> Coal Town List
		<li> Edit Mode </li>
		<li> Values inserted, edited and deleted. </li>
		<li> Delete Mode </li>
		<li> Values can be deleted </li>
	</ul></li>
	<br>
	<li> <ul> Vue Directive and Method Tutorial
		<li> Samples of Vue Directives ({{text}}, v-bind, v-on, v-if, v-else, v-for, etc.) </li>
		<li> Samples of Input Methods (Text, TextArea, Buttons, RadioButtons, List, etc.) </li>
		<li> Simple Vue Method Invocation </li>
	</ul></li>
	<br>
		<li> <ul> Limited Size Text Fields
		<li> Four Examples </li>
		<li> @keyup vs @input </li>
		<li> Pass by Value vs. Pass by Reference </li>
		<li> Inline Object vs. Data Objects </li>
	</ul></li>
	<br>
	<li> <ul> HelloWorld 
		<li> Simple Vue App to Get Started </li>
	</ul></li>		
</ol>


</body>
</html>
