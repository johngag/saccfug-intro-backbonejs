$(function(){
	window.Todo = Backbone.Model.extend({
		url: 'models/todos/TodoService.cfc?method=',
		defaults: function() {
			return {
				done:  false,
				ordernum: Todos.nextOrder()
			};
		},
		toggle: function() {
			this.save({done: !this.get("done")});
		}
	
	});
	window.TodoList = Backbone.Collection.extend({
		model: Todo,
		url: 'models/todos/TodoService.cfc?method=',
		done: function() {
			return this.filter(function(todo){ return todo.get('done'); });
		},
		remaining: function() {
			return this.without.apply(this, this.done());
		},
		nextOrder: function() {
			if (!this.length) return 1;
			return this.last().get('ordernum') + 1;
		},	
		comparator: function(todo) {
		return todo.get('ordernum');
		}
	
	});
	
	window.Todos = new TodoList;
});