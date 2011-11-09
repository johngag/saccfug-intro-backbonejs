$(function(){
	window.AppView = Backbone.View.extend({
	
		el: $("#appview"),
		
		events: {
			
		},
		initialize: function(){
			_.bindAll(this); 
			window.AppRouter = new MainRouter;
			AppRouter.bind('renderPage', this.renderStaticPage);
			AppRouter.bind('renderProduct', this.renderProduct);
			Backbone.history.start();
			
		},
		render: function()
		{	
		
		},
		renderStaticPage: function(page){
			this.clearPage();
			this.$('.nav li').removeClass('active');
			if(page==='home'){
				this.$('.nav li:nth(0)').addClass('active');
				var homepage = _.template($('#home-template').html());
				this.renderTemplate(homepage);
			}else if(page==='about'){
				this.$('.nav li:nth(1)').addClass('active');
				var aboutpage = _.template($('#about-template').html());
				this.renderTemplate(aboutpage);
			}else if(page==='contact'){
				this.$('.nav li:nth(2)').addClass('active');
				var contactpage = _.template($('#contact-template').html());
				this.renderTemplate(contactpage);
			}else{
				var errorpage = _.template($('#error-template').html());
				this.renderTemplate(errorpage);
			}
		},
		renderProduct: function(product){
			this.clearPage();
			var product = new Product({id: product});
			product.fetch({
				success: this.renderProductDetails
			});

		},
		renderProductDetails: function(model, response){
			if (response.length > 0) {
				var data = new Product(response[0]);
				var productpage = _.template($('#product-template').html());
				this.renderTemplate(productpage(data.toJSON()));
			}else{
				var errorpage = _.template($('#error-template').html());
				this.renderTemplate(errorpage());
			}
		},
		clearPage: function(){
			this.$("#main-container").children('div:not(#footer)').remove();
		},
		renderTemplate: function(template){
			this.$("#main-container").prepend(template);
		}
		
	});
	
	window.App = new AppView;
});
