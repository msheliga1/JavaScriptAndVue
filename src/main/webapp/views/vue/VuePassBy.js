/*  MJS 7.29.18 Javascript Vue code for app to test changing primitive values within a method, 
pass by value, inline methods, and limiting the number of characters 
accepted by a text box. */

var vm = new Vue({
	el: "#text-limit-app",
	data: {
		limit: 8,
		msg:"Hola",  
		msg3: "msg3val",  // cant change this by passing (func{value: msg3}) into method.
		msg4: "msg4val",  
		msgObj2: {value: "12", clazz:""},
		msgObj3: {value: "123"},
		msgClass: "",
		msgClass3: "", 
		msgClass4: ""
	},
	// This original method is hardwired and only works for one msg and msgClass.
	methods: {
		textLimit: function() {
			if (this.msg.length > this.limit) {
				// alert("Only " + this.limit + " characters allowed in text box.")
				this.msg = this.msg.substring(0, this.limit)  // [start,end)
				this.msgClass = "redBorder"
			} else if (this.msg.length == this.limit) {
				this.msgClass = "orangeBorder"
			} else {
				this.msgClass = ""	
			} // end if-else
		}, // textLimit
		// Here pass by reference works using textLimit2(msgObject)...as long as the primitives are extracted 
		// by the caller using msgObject.value and msgObject.class
		textLimit2: function(msgObj) {
			var msg = msgObj.value
			if (msg.length > this.limit) {
				msgObj.value = msg.substring(0, this.limit)  // [start,end)
				msgObj.clazz = "redBorder"
				alert("Orig value " + msg + " updated value. " + msgObj.value)
			} else if (msg.length == this.limit) {
				msgObj.clazz = "orangeBorder"
			} else {
				msgObj.clazz = ""	
			} // end if-else
		},  // textLimit2
		// Here pass by reference can work, but will not work using: textLimit3({value: primitiveVar})... 
		// cant get changed value to return and change the primitive. 
		textLimit3: function(msgObjx) {
			var msg = msgObjx.value
			if (msgObjx.value.length > this.limit) {
				msgObjx.value = msgObjx.value.substring(0, this.limit)  // [start,end)
				this.msgClass3 = "redBorder"
				alert("Orig value " + msg + " updated value. " + msgObjx.value)
			} else if (msgObjx.value.length == this.limit) {
				this.msgClass3 = "orangeBorder"
			} else {
				this.msgClass3 = ""	
			} // end if-else
		} // textLimit3
	} // methods
})

