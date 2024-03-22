<cfcomponent displayname="actorGateway" output="false">
    
    <cfset variables.dataSource = "sakila" />

    <cffunction name="list" access="public" returntype="any" output="false" >
        <cfargument name="page" type="numeric" required="true" />
        <cfargument name="maxRows" type="numeric" required="true" />

        <cfset var currentBlock  = (#arguments.page# -1) * #arguments.maxRows# />
        <cfset var qActors = "" />
        <cfquery name="qActors" datasource = "#variables.dataSource#" >
            SELECT * 
            FROM actor
            ORDER BY actor_id desc
            LIMIT #currentBlock#,#arguments.maxRows#
        </cfquery>

        <cfreturn qActors />
    </cffunction>

    <cffunction name="get" access="public" returntype="actor" output="false" >
        <cfargument name="actor_id" type="numeric" required="true" />

        <cfset var actor = new actorDAO().read(actor_id = arguments.actor_id) />
       
        <cfreturn actor />
    </cffunction>

    <cffunction name="save" access="public" returntype="actor" output="false" >
        <cfargument name="actor" type="actor" required="true" />

        <!--- <cfset var qActor = get(arguments.actor.getActor_id()) /> --->

        <!--- <cfdump var="#qActor.recordCount#" abort="true"/> --->
        <cfif arguments.actor.getActor_id() eq 0>
            <cfreturn new actorDAO().insert(arguments.actor) />
        <cfelse>
            <cfreturn new actorDAO().update(arguments.actor) />
        </cfif>

        <cfreturn actor />
    </cffunction>

</cfcomponent>