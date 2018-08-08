<!DOCTYPE html>
<html>
<script type="text/javascript" src="vue.js"></script>	
<!--   MJS 7.28.18 
This page demonstrates basic Vue by implementing a simple coal mine list.
Mining towns can be added, deleted and edited.
-->
<head>
<link rel="stylesheet" href="scorpStyles.css"></link>
<title>Mike's webapp/VueAddComponents.jsp</title>
</head> 
<!-- MJS 7.28.18 - Cant add vue id to body -->
<body><div id="vue-app">

<br> Use this Vue.js app to input and add 3 fields. 
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
	<hr> 	<br> Edit Mode: {{editMode}} CountModeChanges: {{countModeChanges}} 
	<br> <number-input v-on:relay='rentValue=arguments[0]' label='Rent' v-bind:number-val='this.countModeChanges'> This wont display (without a slot) </number-input> 
	<br> <number-input v-on:relay='foodValue=arguments[0]' label='Food' v-bind:number-val='-1'> This wont display (without a slot) </number-input> 
	<br> <number-input v-on:relay='kickbackValue=arguments[0]' label='Kickback' v-bind:number-val='0'> </number-input> 
	<br> {{rentValue}} + {{foodValue}} - {{kickbackValue}} = Total Computed: {{totalComputed}}
</div>

<br> <a href="index.jsp"> Back to Main Index </a>
<!-- Reference to JS file must not be before head. But can be after body or even after closing html tag. 
This is true even if javascript code is included in this file, per VueHelloWorld testing. MJS 7.29.18 
Nonfatal error thrown if below line put before end of <div> tag. -->

</div> <!-- with id="vue app" -->

<template id='temp'>
<div class='comp-root'>  <!-- need this line for global components -->
	<button @click="incCount"> Number-Input Template </button> 
	<span> {{msg}} Counter {{count}} </span>
	<!-- Even with type=number, html normally returns a string, so use v-model.number. 
		This changes the typeof numberValue to a number. --> 
	<br> {{label}} {{numberValue}} <input type="number" v-model.number="numberValue" v-on:input=emitNumber>
	<br> numberVal (Prop) is: {{numberVal}}  <!-- kebab case wont work here -->
</div>
</template>

<script>
Vue.component('number-input', {
	template: '#temp',
	data: function() {
		return {count: 8, 
				msg: "Component Msg",
				numberValue: this.numberVal, // numberValue is a String but numberVal is a number - MJS 7.31.18
		}
	},
	<!-- MJS 7.31.18 propVal here MUST be prop-val in web page body (but not in template!) -->
	props: {
		label: String,
		numberVal: {
			type: Number,
			validator: function(value) {return value>=0}
		}
	},
	methods: {
		incCount: function() {this.count++},
		emitNumber: function() {
			alert("Component's number value is typeof " + (typeof this.numberValue) + " while numberVal is " + (typeof this.numberVal))
			this.$emit('relay', this.numberValue)
		}
	}
})
</script>
<script type="text/javascript" src="VueAddComponents.js"></script>

</body>

</html>

