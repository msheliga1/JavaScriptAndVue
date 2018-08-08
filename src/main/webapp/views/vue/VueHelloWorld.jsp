<html>
<script src="vue.js"></script>
<!--  MJS 7.29.18 Example confirms that new Vue MUST be after html that uses it, 
whether included directly in this file or in a separate javascript file -->
<div id="app">
  <p>Vue Hello World Message: {{ message }}</p>
</div>

<script>
new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue.js!'
  }
});
</script>

<!-- Whether the javascript is in a separate file or included in this file, new Vue must 
 after the code using it. 3 uncaught in promise errs solved by disabling Selenium extension.
<script src="VueHelloWorld.js"></script>  -->
</html>
