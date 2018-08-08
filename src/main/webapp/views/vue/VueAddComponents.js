var model = {coalCompany : 'R&P',
	adminMode: false,      // admin (edit/add/delete) or user modes
	countModeChanges : 0,  // edit vs delete and admin vs user mode
	debugMode: true,   	  	// when on, display much more info
	editMode : true,       // edit vs delete modes within user mode
	rentValue : 7,  // not sure how to init to save value as component Number value
	foodValue : 8,
	kickbackValue : 5,  // to be subtracted
	addTaxClass : "",  // set to highlight on error
	newTax : {label: "YetAnotherTax", rate: 100, negate: false, def: 99},
	townList : ["Iselin", "Whiskey Run","Hart Town"],  // must be an array for v-for
	// rate used to store user values, orig rate only a placeholder, will be replaced by def upon created
	taxList : [{label: "Sales", rate: 5, negate: false, def: 6},   
			{label: "Income", rate: 25, negate: false, def: 2}, 
			{label: "Rebate", rate: 1, negate: true, def: 3}, 			
			]  // must be an array for v-for
};

	var vm = new Vue({
		el: "#vue-app", 
		data: model,  // separate model out of view-model. These values only assigned once, on startup
		// created() {  // set orig rate to default inside the component
		//	this.taxList[0].rate = this.taxList[0].def
		// },
		// These must be called, and can accept params - just like normal functions.
		methods: {
			addTax : function() {
				if (this.newTax.label.trim().length == 0) {
					alert("You must input a name to add a tax.")
					this.addTaxClass = "highlight"
				} else {
					alert("Adding a tax.")
					var pushTax = {label: "", rate: 0, negate: false, def: 0}
					pushTax.label = this.newTax.label
					pushTax.negate = this.newTax.negate
					pushTax.rate = this.newTax.def  // make orig rate = default rate
					pushTax.def = this.newTax.def
					this.taxList.push(pushTax)
					// this.newTax.label = ""
					// this.addTaxClass = ""
				}				
			},	
			addTaxClearHighlight : function() {
				this.addTaxClass = ""  // not highlighted any longer
			},
			deleteTax : function(index) {
				this.taxList.splice(index, 1)	
			},
			incrementCount : function() {
				this.countModeChanges++
			},
			toggleAdminMode : function() {
				this.adminMode = !this.adminMode
				this.countModeChanges++
			},
			toggleDebugMode : function() {
				this.debugMode = !this.debugMode
				this.countModeChanges++
			},
			toggleEditMode : function() {
				this.editMode = !this.editMode
				this.countModeChanges++
			},
		}, // end methods
		// computed properties - never called, accept no params, auto-updated
		computed: {
			totalComputedHard : function() {  // this does not work as a method
				// be sure input form use v-model.number so that these are numbers, not strings
				return this.foodValue + this.rentValue - this.kickbackValue  
			},
			totalComputed : function() {  // this does not work as a method
				// be sure input form use v-model.number so that these are numbers, not strings
				var sum = 0
				var i
				for (i=0; i<this.taxList.length; i++) {
					if (this.taxList[i].negate) {sum -= this.taxList[i].rate}
					else {sum += this.taxList[i].rate}
					} // end for
				return sum  
			}, // end totalComputedFunction
			totalString : function() {  // this does not work as a method
				// be sure input form use v-model.number so that these are numbers, not strings
				var str = ""
				var i
				for (i=0; i<this.taxList.length; i++) {	
					if (i==0) {
						if (this.taxList[i].negate) {str += "-"}
					} else {
						if (this.taxList[i].negate) {str += " - "}
						else {str += " + "}
					} // end if-else
					str += this.taxList[i].rate					
				} // end for
				return str  
			},
		} // end computed
	}); // end new Vue
