<cfset variables.categoryGateway = new components.categoryGateway() />
<cfset variables.category = variables.categoryGateway.get(category_id = val(form.category_id)) />
<cfset variables.category.setCategory_name(form.category) />

<cfset variables.category = variables.categoryGateway.save(variables.category) />

<cfoutput>
    <cfif form.category_id eq 0 >
            <cfset variables.message="Data_Inserted_Successfully" />
        <cfelse>                 
            <cfset variables.message="Data_Updated_Successfully" />
    </cfif>
</cfoutput>

<cflocation url="/category?message=#variables.message#" addtoken="false" />

