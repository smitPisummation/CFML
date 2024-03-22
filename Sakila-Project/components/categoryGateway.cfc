<cfcomponent displayname="categoryGateway" >

    <cffunction name="categoryList" access="public" returntype="query" >
        <cfargument name="page" default="1" />
        <cfargument name="maxRow" default="10" />

        <cfset var currentBlock = (arguments.page - 1) * arguments.maxRow />

        <cfset var qCategory = "" />
        <cfquery name="qCategory" datasource="sakila" >
            SELECT * 
            FROM category 
            ORDER BY category_id DESC
            LIMIT #currentBlock#, #arguments.maxRow# 
        </cfquery>

        <cfreturn qCategory />
    </cffunction>

    <cffunction name="get" access="public" returntype="category" output="true" >
        <cfargument name="category_id" type="numeric" required="true" />
        <cfset var category = new categoryDAO().read(category_id = arguments.category_id) />

        <cfreturn category />
    </cffunction>

    <cffunction name="save" access="public" returntype="category" output="false" >
        <cfargument name="category" type="category" required="true" />

        <cfif arguments.category.getCategory_id() EQ 0 >
            <cfreturn new categoryDAO().insert(arguments.category) />
        <cfelse >
            <cfreturn new categoryDAO().update(arguments.category) />
        </cfif>

        <cfreturn category />
    </cffunction>

</cfcomponent> 
