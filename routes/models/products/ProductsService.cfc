<cfcomponent output="false">
	<cffunction name="create" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.product = new Products()>
		<cfset l.product.init(argumentCollection=deserializejson(arguments.model))>
		<cfset l.dao =  createObject("component","routes.models.products.ProductsDAO")>
		<cfset r = l.dao.save(l.todo)>
		<cfreturn r>
	</cffunction>
	
	<cffunction name="read" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.dao =  createObject("component","routes.models.products.ProductsDAO")>
		<cfset r = l.dao.get(id=deserializejson(arguments.id))>
		<cfreturn r>
	</cffunction>
	
	<cffunction name="update" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.todo = new Products()>
		<cfset l.todo.init(argumentCollection=deserializejson(arguments.model))>
		<cfset l.dao =  createObject("component","routes.models.products.ProductsDAO")>
		<cfset r = l.dao.save(l.todo)>
		<cfreturn r>
	</cffunction>
	
	<cffunction name="delete" returnformat="JSON" access="remote" output="false">
		<cfset var r = ''>
		<cfset var l = {}>
		<cfset l.dao =  createObject("component","routes.models.products.ProductsDAO")>
		<cfset r = l.dao.delete(arguments.id)>
		<cfreturn r>
	</cffunction>

</cfcomponent>