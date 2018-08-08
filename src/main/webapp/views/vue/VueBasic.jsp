<!DOCTYPE html>
<html>
	
<!-- For simplicity, just keep vue.js file in same directory  -->
<script type="text/javascript" src="vue.js"></script>
<!--   MJS 7.28.18 
This page demonstrates basic Vue.
1. Text data is displayed using double-mustache and v-text.
2. v-if, v-else and v-show are used to show/hide a data value. Note that there is no v-hide. 
3. v-model and v-model.lazy are used inside input boxes.
4. v-bind and ":" for attributes
4. Various types of inputs (radio button, select, auto-select) are shown
   A. v-button
   B. v-radio
   C. v-checkbox
   D. v-select
5. v-for is used to show a list.
6. v-on:click and @click are used to call methods.
7. Input buttons are combined with methods to update the list.
-->
<head>
<!-- For simplicity we use an internal style in the header instead of an external style file. -->
<style>
.highlight {background:yellow}
</style>
<title>Mike's Basic Vue Examples</title>
</head> 
<!-- MJS 7.28.18 - Cant add vue id to body -->
<body><div id="vue-app">
<br> <h1> Mike's Examples of Common Vue Directives and Methods.</h1> 
<hr>
<div>
	<br> 1. Displaying Text: "{ {" "} }" and v-text <br> 
	<br> Text data variable using double-mustache "{ {" "} }" notation: {{coalCompany}}
	<br> <div>The same variable using v-text (not v-bind!) <span v-text="coalCompany"></span></div>
	<hr>
	<br> 2. Conditionals: v-if, v-else and v-show <br>
	<br> Span element with v-if="true" : <span v-if="true"> Text for v-if="true"</span>
	<br> Span element with v-if="false": <span v-if="false">Text for v-if="false" </span>
	<p> Span element with v-if="false": 
	<br>...........Followed by v-else : <span v-if="false">Text for v-if="false" </span>
							            <span v-else>      Text for v-else       </span> </p> 
	<br> v-show="true" in span element : <span v-show="true"> Text for v-show="true"</span>
	<br> v-show="false" in span element: <span v-show="false">Text for v-show="false" </span>
	<br> v-show is preferred over v-if for elements that are not permanently deleted. Note that there is not v-hide in Vue. 
	<hr> 	
	<br> 3. Text and v-model. <br>
	<br> v-model in an input box <input v-model="modelVar"> Value of model variable: {{modelVar}}
	<br> Note that v-model must normally be in an input box, and that data changes immediately.
	<br> v-model.lazy in an input box <input v-model.lazy="lazyVar"> Value of model variable: {{lazyVar}}
	<br> Note that the data changes only on lose focus.
	<br> v-model in a textarea box (multiline text) <textarea v-model="textAreaVar"></textarea> Value of model variable: {{textAreaVar}}
	<hr>
	<br> 4. v-bind and ":" for attributes such as class, style and value. <br>
	<br>  Model variable: <span>{{modelVar}} </span>
	<br> Model variable with bind:class="bindVar"" to highlight (yellow): <span v-bind:class="bindVar">  {{modelVar}} </span>
	<br> Model variable with :class="bindVar"" to highlight (yellow): <span :class="bindVar"> {{modelVar}} </span>
	<hr>
	<br> 5. Various Inputs. <br>
	<br> A. Button - button tag, not input tag 
	<br> <button> Clicking on this Button Does Nothing </button>
	<br> Other Most buttons would be connected to a v-on:click method that would do something.
	<hr> 
	<br> B. Radio - 'input type="radio" value="Text" v-model="radioVariable"' 
	<br> <input type="radio" value="Peach" v-model="radioVar">Choose Peach 
	<br> <input type="radio" value="Apple" v-model="radioVar">Choose Apple
	<br> <input type="radio" value="Pumpkin" v-model="radioVar">Choose Pumpkin
	<br> Value of model variable: {{radioVar}}
	<hr>
	<br> C. Checkbox - 'input type="checkbox" optionalId="uniqueText" "value="Text" v-model="radioVariable"' 
	<br> <input type="checkbox" value="Peach" v-model="checkVar">Choose Peach
	<br> <input type="checkbox" value="Apple" v-model="checkVar">Choose Apple 
	<br> <input type="checkbox" value="Pumpkin" v-model="checkVar">Choose Pumpkin
	<br> Value of model variable: {{checkVar}}
	<hr>
	<br> D. Select Options - 'select v-model="selectVariable" followed by "option tag" OptionText "/option tag" '
	<br> <select v-model="selectVar">
	<br> <option disabled value="">Please select a Fruit</option>
	<br> <option>Peach</option> 
	<br> <option>Apple</option> 
	<br> <option>Pumpkin</option>
		 </select>
	<br> Value of model variable: {{selectVar}}
	<hr>
	<br> E. Number, Date and Input Types - 'input type="number", etc.
	<br> <input type="number" v-model="numberVar"> Input any number
	<br> Value of model variable: {{numberVar}}
	<br> <input type="date" v-model="dateVar"> Input any date
	<br> Value of model variable: {{dateVar}}
	<br> Note that there are many other input types including email, month, color, dateTime, image, file and range
	<hr>
	<br> 6. v-for <br>
	<br> A. With an ordered list
	<ol>
		<li v-for="town in townList"> {{town}} </li>
	</ol>
	<br> B. With a dynamic (data driven) select and v-bind
	<br> <select v-model="dynamicSelectVar">
			<option v-for="item in townList2" v-bind:value="item.value"> {{item.name}} </option>
	     </select>
	<br> Select Result: {{dynamicSelectVar}}
	<hr>
	<hr>
	<p> 7. Basic Methods (using v-on and @)</p>
	<button v-on:click="incrementCount">Increment the Count</button> {{count}}
	<br> <button v-on:click="toggleHigh">Toggle High True-False Value </button> {{high}}
	<br> <button @click="addWherum">Add "Wherum" to List</button>
	<hr> 	
	<p> Use v-model (and display it) along with a button and function. </p>
	<br> <button @click="addTown">Add a New Town</button> <input v-model="newTown"> {{newTown}}
	<hr> 	
	<br> For more details see <a v-bind:href="vueURL"> the official Vue tutorial</a> 
</div>
 
<br> <a href="<%=request.getContextPath()%>/index.jsp"> Back to Main Index </a>

</div></body>

<!-- Keep javascript and css code in same file for simplicity. 
     Normally these would be in different files. -->
<script>
	var vm = new Vue({
		el: "#vue-app", 
		data: {coalCompany : "Sample Text",
			modelVar : "Sample modelVar Text",
			lazyVar  : "Value changes on lose focus.",
			bindVar  : "highlight",
			textAreaVar  : "Multiline text area.",
			radioVar  : "Default Radio Text.", 
			checkVar  : [],  // Note this must be an empty array
			selectVar : "Default Select-Options Text", // not select value - first value cant be selected in IOS
			dynamicSelectVar : "", 
			numberVar : 0, 
			dateVar   : "2018-12-30",  // note yyyy-mm-dd format.  Wont display if not a real date
			newTown : "",
			count : 1, 
			high : true,
			townList : ["Iselin", "Whiskey Run", "Hart Town"], 
			townList2 : [ 
				{name: "Slickville", value: "First"},
				{name: "Russellton", value: "Second"},
				{name: "Forbes Road", value: "Third"} ],
			vueURL : "https://vuejs.org/v2/guide/list.html"
		},
		methods: {  // computed is cached base - saves on re-calculating results
			incrementCount: function() {
				this.count = this.count + 1
			},
			 addTown: function() {
				this.townList.push(this.newTown)
			},
			 addWherum: function() {
				 this.townList.push("Wherum")
			},
			 toggleHigh: function() {
					this.high = !this.high
			}
		}
	});
</script>

</html>
