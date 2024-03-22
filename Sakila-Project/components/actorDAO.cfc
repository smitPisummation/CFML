<cfcomponent displayname="actorDAO" >

    <cfset variables.dataSource = "sakila" />

    <cffunction name="read" access="public" returntype="actor" output="true" >
        <cfargument name="actor_id" type="numeric" required="true" />
        
        <cfset var qActor = "" />
        <cfquery name="qActor" datasource = "#variables.dataSource#" >
            SELECT * 
            FROM actor
            where actor_id = <cfqueryparam value="#arguments.actor_id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfif qActor.recordCount>
            <cfreturn new actor().init(argumentCollection = qActor.getRow(1)) />
        <cfelse>
            <cfreturn new actor().init() />
        </cfif>
        
    </cffunction> 

    <cffunction name="insert" access="public" returntype="actor" output="false" >
        <cfargument name="actor" type="actor" required="true" />

        <cfset var qActor = "" />
        <cfquery name="qActor" datasource="#variables.dataSource#" >
            INSERT INTO actor(first_name, last_name)
            VALUES
            (
                <cfqueryparam value="#arguments.actor.getFirst_name()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.actor.getLast_name()#" cfsqltype="cf_sql_varchar" />
            );

            SELECT LAST_INSERT_ID() actor_id;
        </cfquery>

        <cfset arguments.actor.setActor_id(qActor.actor_id) />
        
        <cfreturn arguments.actor />
    </cffunction>

    <cffunction name="update" access="public" returntype="actor" output="false" >
        <cfargument name="actor" type="actor" required="true" />

        <cfset var qActor = "" />
        <cfquery name="qActor" datasource="#variables.dataSource#" >
            UPDATE actor 
            SET 
                first_name = <cfqueryparam value="#arguments.actor.getFirst_name()#" cfsqltype="cf_sql_varchar" />,
                last_name = <cfqueryparam value="#arguments.actor.getLast_name()#" cfsqltype="cf_sql_varchar" />

            WHERE actor_id = <cfqueryparam value="#arguments.actor.getActor_id()#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfreturn arguments.actor />
    </cffunction>

</cfcomponent>


