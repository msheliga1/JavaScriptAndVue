<!DOCTYPE html>
<html>
<script type="text/javascript" src="vue.js"></script>	
<!--   MJS 7.28.18 
This page demonstrates basic Vue by implementing a simple coal mine list.
Mining towns can be added, deleted and edited.
-->
<head>
<link rel="stylesheet" href="scorpStyles.css"></link>
<title>Mike's vueList.jsp</title>
</head> 
<!-- MJS 7.28.18 - Cant add vue id to body -->
<body><div id="vue-app">

<br> Use this Vue.js app to add, delete and edit coal towns from a list. 
<hr>

<div>
	<p> List of coal companies </p>
	<p><button v-show="!editMode" @click="toggleEditMode">Change to Edit Mode </button></p> 
	<p><button v-show="editMode"  @click="toggleEditMode">Change to Delete Mode </button></p>	
	<ol>
		<!-- Unlike AngularJS there is no $index value, must use (xx, index) -->
		<li v-show="!editMode" v-for="(town, index) in townList"> {{town}} <button @click="deleteItem(index)">Delete</button></li>
		<!-- Per err msg, cant update a for variable -->
		<li v-show="editMode"  v-for="(town, index) in townList" > <input v-model="townList[index]"> </input> </li>
	</ol>
	<hr> 	
	<p> Add new coal towns.</p> 
	<br> <button @click="addTown"><span>Add a New Town</span></button> 
		<input v-model="newTown" v-bind:class="addTownClass" @keypress="addTownClearHighlight">
</div>
 
</div>

<br> <a href="<%=request.getContextPath()%>/index.jsp"> Back to Main Index </a>
<!-- Reference to JS file must not be before head. But can be after body or even after closing html tag. 
This is true even if javascript code is included in this file, per VueHelloWorld testing. MJS 7.29.18 
Nonfatal error thrown if below line put before end of <div> tag. -->
<script type="text/javascript" src="VueList.js"></script>
</body>

</html>

