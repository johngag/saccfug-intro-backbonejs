<cfcomponent output="false">
	
	<cffunction name="get" access="public" returntype="array" output="false">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="price" type="numeric" required="false" />
		<cfset var qList = ''>
			
		<cfquery name="qList" datasource="todos">
			SELECT 	id,
					description,
					price
			FROM products 
			WHERE 0=0
			<cfif structKeyExists(arguments, 'id') and len(arguments.id)>
			AND	id = <cfqueryparam value="#arguments.id#" CFSQLType="cf_sql_bigint" />
			</cfif>
			<cfif structKeyExists(arguments, 'description') and len(arugments.description)>
			AND	description = <cfqueryparam value="#arguments.description#" CFSQLType="cf_sql_varchar" />
			</cfif>
			<cfif structKeyExists(arguments, 'price') and len(arugments.price)>
			AND	price = <cfqueryparam value="#arguments.price#" CFSQLType="cf_sql_numeric" />
			</cfif>
		</cfquery>
		
		
		<cfreturn queryToArray(qList) />
		
	</cffunction>
	
	<cffunction name="queryToArray" access="public" output="false" returntype="array" hint="converts a query into an array of structs">
		<cfargument name="qList" type="query" required="true">
		
		<cfset var tmpstr = structNew() />
		<cfset var i = "" />
		<cfset var arrStructs = arrayNew(1) />
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpstr = queryRowToStruct(arguments.qList,i) />
			<cfset arrayAppend(arrStructs,tmpstr) />
		</cfloop>
		
		<cfreturn arrStructs />
	</cffunction>
	
	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[lcase(cols[ii])] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>
	
</cfcomponent>