<!--- <cfdump var="#form.fName#" />
<cfdump var="#form.lName#" />
<cfdump var="#form.id#"/> --->

<cfset variables.actorGateway = new components.actorGateway() />
<cfset variables.actor = variables.actorGateway.get(actor_id = val(form.id)) />
<cfset variables.actor.setFirst_name(form.fName) />
<cfset variables.actor.setLast_name(form.lName) />

<cfset variables.actor = variables.actorGateway.save(variables.actor) />

<cfoutput>
    <cfif form.id eq 0 >
            <cfset variables.message="Data_Inserted_Successfully" />
        <cfelse>                 
            <cfset variables.message="Data_Updated_Successfully" />
    </cfif>
</cfoutput>

<cflocation url="/actor?message=#variables.message#" addtoken="false" />