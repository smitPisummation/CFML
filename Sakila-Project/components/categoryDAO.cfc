<cfcomponent displayname="categoryDAO" >

    <cfset variables.dataSource = "sakila" />

    <cffunction name="read" access="public" returntype="category" output="true" >
        <cfargument name="category_id" type="numeric" required="true" />
        
        <cfset var qCategory = "" />
        <cfquery name="qCategory" datasource = "#variables.dataSource#" >
            SELECT * 
            FROM category
            where category_id = <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfif qCategory.recordCount>
            <cfreturn new category().init(argumentCollection = qCategory.getRow(1)) />
        <cfelse>
            <cfreturn new category().init() />
        </cfif>
        
    </cffunction> 

    <cffunction name="insert" access="public" output=false returntype="category" >
        <cfargument name="category" type="category" required="true" />

        <cfset var qCategory = "" />
        <cfquery name="qCategory" datasource="#variables.dataSource#" >
            INSERT INTO category(name) 
            VALUES 
            (
                <cfqueryparam value="#arguments.category.getCategory_name()#" cfsqltype="cf_sql_varchar" />
            );

            SELECT LAST_INSERT_ID() category_id;
        </cfquery>
        <cfset arguments.category.setCategory_id(qCategory.category_id) />

        <cfreturn arguments.category />

    </cffunction>

    <cffunction name="update" access="public" output="false" returntype="category" >
        <cfargument name="category" type="category" required="true" />

        <cfset qCategory = "" />
        <cfquery name="qCategory" datasource="#variables.dataSource#" >
            UPDATE category
            SET 
                name = <cfqueryparam value="#arguments.category.getCategory_name()#" cfsqltype="cf_sql_varchar"/>
            WHERE category_id = <cfqueryparam value="#arguments.category.getCategory_id()#" cfsqltype="cf_sql_integer"/>
        </cfquery>

        <cfreturn arguments.category />
    </cffunction>
  

</cfcomponent>