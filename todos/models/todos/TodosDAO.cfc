<cfcomponent output="false">
	
	<cffunction name="create" access="public" output="false" returntype="Numeric">
		<cfargument name="model" type="todos" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="todos" result="myPK">
				INSERT INTO todos
					(
					done,
					ordernum,
					text
					)
				VALUES
					(
					<cfqueryparam value="#arguments.model.getdone()#" CFSQLType="cf_sql_bit" null="#not len(arguments.model.getdone())#" />,
					<cfqueryparam value="#arguments.model.getordernum()#" CFSQLType="cf_sql_integer" null="#not len(arguments.model.getordernum())#" />,
					<cfqueryparam value="#arguments.model.gettext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.model.gettext())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn 0 />
			</cfcatch>
		</cftry>
		<cfreturn myPK.GENERATED_KEY />
	</cffunction>
	
	<cffunction name="update" access="public" output="false" returntype="Numeric">
		<cfargument name="model" type="todos" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="todos" result="myPK">
				UPDATE	todos
				SET
					done = <cfqueryparam value="#arguments.model.getdone()#" CFSQLType="cf_sql_bit" null="#not len(arguments.model.getdone())#" />,
					ordernum = <cfqueryparam value="#arguments.model.getordernum()#" CFSQLType="cf_sql_integer" null="#not len(arguments.model.getordernum())#" />,
					text = <cfqueryparam value="#arguments.model.gettext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.model.gettext())#" />
				WHERE	id = <cfqueryparam value="#arguments.model.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn -9999 />
			</cfcatch>
		</cftry>
		<cfreturn 0 />
	</cffunction>

	<cffunction name="read" access="public" returntype="any" output="false">
		<cfargument name="model" type="models.todos.todos" required="true" />
		<cfset var strReturn = structNew() />
		<cfset var rets = get(id=arguments.model.getid()) />

		<cfif arrayLen(rets) GT 0>
			<cfset strReturn = rets[1] />
		</cfif>
		
		<cfreturn strReturn />
		
	</cffunction>
	
	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="model" type="Todos" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="todos" maxrows="1">
			SELECT count(1) as idexists
			FROM	todos
			WHERE	id = <cfqueryparam value="#arguments.model.getid()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="Todos">
		<cfargument name="model" type="Todos" required="true" />
		
		<cfset var returnedPK = 0 />
		<cfif exists(arguments.model)>
			<cfset returnedPK = update(arguments.model) />
		<cfelse>
			<cfset returnedPK = create(arguments.model) />
			<cfset arguments.model.setid(returnedPK)>
		</cfif>
		
		<cfreturn  arguments.model />
	</cffunction>
	
	
	<cffunction name="delete" access="public" returntype="boolean" output="false">
		<cfargument name="id" type="numeric" required="true" />
		<cfset var qDelete = ''>
			
		<cfquery name="qDelete" datasource="todos">
			DELETE FROM	todos
			WHERE	id = <cfqueryparam value="#arguments.id#" CFSQLType="cf_sql_bigint" />
		</cfquery>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="get" access="public" returntype="array" output="false">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="done" type="boolean" required="false" />
		<cfargument name="ordernum" type="numeric" required="false" />
		<cfargument name="text" type="string" required="false" />
		<cfset var qList = ''>
			
		<cfquery name="qList" datasource="todos">
			SELECT 	t.id,
					t.done,
					t.ordernum,
					t.text
			FROM todos t
			WHERE 0=0
			<cfif structKeyExists(arguments, 'id') and len(arugments.id)>
			AND	t.id = <cfqueryparam value="#arguments.id#" CFSQLType="cf_sql_bigint" />
			</cfif>
			<cfif structKeyExists(arguments, 'done') and len(arugments.done)>
			AND	t.done = <cfqueryparam value="#arguments.done#" CFSQLType="cf_sql_bit" />
			</cfif>
			<cfif structKeyExists(arguments, 'ordernum') and len(arugments.ordernum)>
			AND	t.ordernum = <cfqueryparam value="#arguments.ordernum#" CFSQLType="cf_sql_bigint" />
			</cfif>
			<cfif structKeyExists(arguments, 'id') and len(arugments.id)>
			AND	t.text = <cfqueryparam value="#arguments.text#" CFSQLType="cf_sql_varchar" />
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