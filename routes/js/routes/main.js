$(function(){
	window.MainRouter = Backbone.Router.extend({
		
		routes: {
			"": "home",
			"!/product/:productid": "product",
			"!/:page": "defaultRoute",
			"(*?)" : "notfound"
		},
		home: function(){
			this.trigger("renderPage", 'home');
		},
		product: function(productid) {
			this.trigger("renderProduct", productid);
		},
		defaultRoute: function(page){
			this.trigger("renderPage", page);
		},
		notfound: function(){
			alert('not found')
		}
	
	});
});
