<cfcomponent displayname="category" >
    <cfproperty name="category_id" type="numeric" default="0" />
    <cfproperty name="category_name" type="string" default="" />

    <cfset variables.instance = {} />

    <cffunction name="setCategory_id" access="public" returntype="void" output="false" >
        <cfargument name="category_id" type="numeric" required="true" />

        <cfset variables.instance.category_id = arguments.category_id />
    </cffunction> 
    <cffunction name="getCategory_id" access="public" output="false" >
        <cfreturn variables.instance.category_id />
    </cffunction>

    <cffunction name="setCategory_name" access="public" returntype="void" output="true" >
        <cfargument name="category_name" required="true" />
        <cfset variables.instance.category_name = arguments.category_name />
    </cffunction> 
    <cffunction name="getCategory_name" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.category_name />
    </cffunction>
    
    <cffunction name="init" access="public" returntype="category" output="true">
        <cfargument name="category_id" default="0" />
        <cfargument name="category_name" default="" />
        
        <cfset this.setCategory_id(arguments.category_id) />
        <cfset this.setCategory_name(arguments.category_name) />
        
        <cfreturn this />
        
    </cffunction>
    
</cfcomponent>