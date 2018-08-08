var model = {coalCompany : 'R&P',
		count : 1, 
		editMode : true,
		addTownClass : "",  // set to highlight on error
		newTown : "",
		townList : ["Iselin", "Whiskey Run","Hart Town"]  // must be an array for v-for
	};
	
	var vm = new Vue({
		el: "#vue-app", 
		data: model,  // separate model out of view-model
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
				this.count = this.count + 1
			},
			toggleEditMode : function() {
				this.editMode = !this.editMode
			}
		}
	});
