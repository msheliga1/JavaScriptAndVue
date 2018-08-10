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

<br> This Vue.js app uses, adds and displays components. It also simulates a SPA by showing different segments of HTML.
<hr>

<div>
  <p> <button @click="toggleDebugMode">Turn Debug On/Off</button> <span v-show="debugMode">Debug Mode: {{debugMode}}</span> 
  <button v-show="!adminMode" @click="toggleAdminMode">Change to Administrator Mode</button>
  <button v-show="adminMode"  @click="toggleAdminMode">Change to User Mode</button>
  <span v-show="debugMode"> AdminMode: {{adminMode}} </span>  
  </p>
    
  <div v-show="adminMode">
	<p> Edit, Add and Delete Tax Categories. </p>
	<p><button v-show="!editMode" @click="toggleEditMode">Change to Edit Mode </button></p> 
	<p><button v-show="editMode"  @click="toggleEditMode">Change to Delete Mode </button></p>	
	<ol>
		<!-- Unlike AngularJS there is no $index value, must use (xx, index) -->
		<li v-show="!editMode" v-for="(item, index) in taxList"> {{item.label}} <button @click="deleteTax(index)">Delete</button></li>
		<!-- Per err msg, cant update a for variable -->
		<li v-show="editMode"  v-for="(item, index) in taxList" > 
			Name:            <input v-model="item.label"> </input> 
			Default:         <input v-model.number="item.def" type="number"> </input> 
			<span v-show="debugMode"> Rate: 			 {{item.rate}} </span>
			Negative Amount? <input v-model="item.negate" type="checkbox"> </input> 			
		</li>
	</ol>
	<hr> 
	<p> <button @click="addTax"> Add (Yet Another) Tax: </button> 
	</p>
	     Name: <input v-model="newTax.label" @input="addTaxClearHighlight"  :class="addTaxClass"> </input>
	     Default Rate: <input v-model.number="newTax.def" type="number"> </input>
	     Negative: <input v-model="newTax.negate" type="checkbox"> </input>
  </div>  <!-- end div for adminMode -->
  
  <div v-show="!adminMode">
	<p>	Total tax calculator. </p>
	<ol> 
			<li v-for="(item, index) in taxList">
				<number-input v-on:relay='item.rate=arguments[0]' 
					v-bind:label="item.label" v-bind:default-prop="item.def" v-bind:default-val="item.def"
					v-bind:amount="item.rate" v-bind:negate="item.negate" :debug-mode="debugMode"></number-input>
				<span v-show="debugMode"> Index: {{index}} Label: {{item.label}} </span>
			</li>
		</ol> 
	<br> <span v-show="debugMode"> {{totalString}} = </span> Total Taxes: {{totalComputed}}
  </div>
</div>

<br> <a href="<%=request.getContextPath()%>/index.jsp"> Back to Main Index </a>
<!-- Reference to JS file must not be before head. But can be after body or even after closing html tag. 
This is true even if javascript code is included in this file, per VueHelloWorld testing. MJS 7.29.18 
Nonfatal error thrown if below line put before end of <div> tag. -->

</div> <!-- with id="vue app" -->

<template id='temp'>
<div class='comp-root'>  <!-- need this line for global components -->
	<!-- Even with type=number, html normally returns a string, so use v-model.number. 
		This changes the typeof amount to a number. --> 
	<span v-if="negate">(</span>{{label}}<span v-if="negate">)</span>
	<!-- Could try v-bind=amount and v-on:input=event.target.value below -->
	<input type="number" v-model.number="amount" v-on:input=emitNumber>
	<button @click="resetToDefault"> Reset to Default </button> 
	<!-- kebab case wont work here -->
	<div v-show="debugMode">
		<br> defaultProp (Prop) is: {{defaultProp}} defaultVal (data) is: {{defaultVal}} 
		<br> {{msg}} Amount (data): {{amount}} Counter: {{count}} negate (Prop) is: {{negate}} 
	</div> 
</div>
</template>

<script>
Vue.component('number-input', {
	template: '#temp',
	data: function() {
		return {count: 0, 
				msg: "Component Msg",
				// amount: this.defaultProp, // amount and defaultVal should both be numbers - MJS 8.5.18
				// this does NOT change when item.def changes, even if bound to it. Use a prop instead.
				defaultVal: this.defaultProp,  
		}
	}, // end data
	created() {  // set amount to default, and emit it so parent has updated amount
		this.amount = this.defaultProp
		this.$emit('relay', this.amount)
		this.debugMode = true
	},
	<!-- MJS 7.31.18 propVal here MUST be prop-val in web page body (but not in template!) -->
	props: {
		label: String,
		defaultProp: {
			type: Number,
			validator: function(value) {return value>=0}
		},
		amount: Number, // Moved from data so it auto-updates on delete. 8.10.18 MJS
		negate: Boolean,
		debugMode: Boolean,
	},
	methods: {
		incCount: function() {this.count++},
		emitNumber: function() {
			// alert("Component's amount is typeof " + (typeof this.amount) + " while initVal is " + (typeof this.initVal))
			this.$emit('relay', this.amount)
		},
		resetToDefault: function() {
			this.amount = this.defaultProp;
			this.$emit('relay', this.amount)
		},
	}
})
</script>
<script type="text/javascript" src="VueAddComponents.js"></script>

</body>

</html>

