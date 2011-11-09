<cfcomponent output="false">
	<cffunction name="create" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.todo = new Todos()>
		<cfset l.todo.init(argumentCollection=deserializejson(arguments.model))>
		<cfset l.dao =  createObject("component","todos.models.todos.TodosDAO")>
		<cfset r = l.dao.save(l.todo)>
		<cfreturn r>
	</cffunction>
	
	<cffunction name="read" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.dao =  createObject("component","todos.models.todos.TodosDAO")>
		<cfset r = l.dao.get()>
		<cfreturn r>
	</cffunction>
	
	<cffunction name="update" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.todo = new Todos()>
		<cfset l.todo.init(argumentCollection=deserializejson(arguments.model))>
		<cfset l.dao =  createObject("component","todos.models.todos.TodosDAO")>
		<cfset r = l.dao.save(l.todo)>
		<cfreturn r>
	</cffunction>
	
	<cffunction name="delete" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.dao =  createObject("component","todos.models.todos.TodosDAO")>
		<cfset r = l.dao.delete(arguments.id)>
		<cfreturn r>
	</cffunction>

</cfcomponent>