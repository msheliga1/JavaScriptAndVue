var model = {coalCompany : 'R&P',
	countModeChanges : 777, 
	editMode : true,
	rentValue : 7,  // not sure how to init to save value as component Number value
	foodValue : 8,
	kickbackValue : 5,  // to be subtracted
	addTownClass : "",  // set to highlight on error
	newTown : "",
	townList : ["Iselin", "Whiskey Run","Hart Town"],  // must be an array for v-for
	taxList : [{label: "sales", rate: 6}, {label: "income", rate: 25}]  // must be an array for v-for
};


	var vm = new Vue({
		el: "#vue-app", 
		data: model,  // separate model out of view-model
		// These must be called, and can accept params - just like normal functions.
		methods: {
			addTown : function() {
				if (this.newTown.trim().length == 0) {
					alert("You must input a name to add a town.")
					this.addTownClass = "highlight"
				}
				else {
					this.townList.push(this.newTown)
					this.newTown = ""
					this.addTownClass = ""
				}
			},
			addTownClearHighlight : function() {
				this.addTownClass = ""  // not highlighted any longer
			},
			deleteItem : function(index) {
				this.townList.splice(index, 1)	
			},
			incrementCount : function() {
				this.countModeChanges++
			},
			toggleEditMode : function() {
				this.editMode = !this.editMode
				this.countModeChanges++
			},
		}, // end methods
		// computed properties - never called, accept no params, auto-updated
		computed: {
			totalComputed : function() {  // this does not work as a method
				// be sure input form use v-model.number so that these are numbers, not strings
				return this.foodValue + this.rentValue - this.kickbackValue  
			},
		} // end computed
	});
