<html>
<script src="vue.js"></script>
<!--  MJS 7.29.18 App to test changing primitive values within a method, 
pass by value, inline methods, and limiting the number of characters 
accepted by a text box. -->

<head>
<link rel="stylesheet" href="scorpStyles.css">
<title>Pass by Value Parameters and Size Limited Fields</title>
</head>

<body><div id="text-limit-app">
	<p><b><h1>Examples of size limited text boxes using pass by value primitives and objects.</h1></b><p>

	<p><b>Notes about the examples.</b>
	<br> <br> The first text box uses @keyup and is "choppy". 
	<br> The second thru fourth boxes use @input and are not choppy.
	<br> All box borders will turn orange when filled and red when too many characters are input.</p>
	
	<p> The first text box uses hardwired Vue data values, but is not generic.
	<br> The second uses a method with Vue data objects as parameters.
	<br> The third uses a method with Vue data objects built from primitives. This does not work as the primitive values are not changed.
	<br> The fourth builds an object using Vue primitives, passes the object to the method, and extracts values from the object 
	back into the primitives.</p>
	
	<hr>
	Input your msg here: <input v-model="msg" @keyup="textLimit" :class="msgClass"> 
    	 {{msg.length}} / {{limit}}
	<br><br>
	Input another msg here: <input v-model="msgObj2.value" @input="textLimit2(msgObj2)" :class="msgObj2.clazz"> 
    	 {{msgObj2.value.length}} / {{limit}} 
	<br><br>
	Input another msg here: <input v-model="msg3" @input="textLimit3({value: msg3})" :class="msgClass3"> 
    	 {{msg3.length}} / {{limit}} 
	<br> The above text box will not work properly since even function({name: stringVariable}) is effectively pass by value.
	<br> Although the parameter objects string variable is changed in the function, the original stringVariable does not change.
	<br><br>
	Input another msg here: 
	<input v-model="msg4" 
       @input="msgObj4={value: msg4, clazz: msgClass4}, 
               textLimit2(msgObj4), 
               msg4=msgObj4.value,
               msgClass4=msgObj4.clazz" :class="msgClass4"> 
     	{{msg4.length}} / {{limit}} 
	<br> In this example we build an in-line object and pass it to the method, then extract the results using:
	<br> @input="
	<br><span class="indent"> msgObj4={value: msg4, clazz: msgClass4}, </span>
    <br><span class="indent"> textLimit2(msgObj4), </span> 
    <br><span class="indent"> msg4=msgObj4.value, </span>
    <br><span class="indent"> msgClass4=msgObj4.clazz"</span>
</div>
<!-- Whether the javascript is in a separate file or included in this file, new Vue must be
 after the code using it. 3 uncaught in promise errs solved by disabling Selenium extension. -->
<script src="VuePassBy.js"></script>
</body>

</html>
