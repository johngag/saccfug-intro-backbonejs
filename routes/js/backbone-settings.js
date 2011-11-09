$(function(){
 	var originalSync = Backbone.sync;
 	Backbone.emulateHTTP = true;
	Backbone.emulateJSON = true;
	

	Backbone.sync = function(method, model, success, error){
		if (!model.originalURL){
			model.originalURL = model.url;
		}
		model.url = model.originalURL + method;
		if (model.id){
			model.url = model.url + '&id=' + model.id;
		}

	    return originalSync(method, model, success, error);
	};

});