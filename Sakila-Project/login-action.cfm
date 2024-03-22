<!--- <cfoutput>
    #form.email# <br />
    #form.pass# <br />
</cfoutput> --->

<cfquery name = "variables.qCheckAuthentication" datasource = "sakila" >
    SELECT *
    FROM users
    WHERE email = <cfqueryparam value = "#form.email#" cfsqltype = "cf_sql_varchar" />
    AND  password = <cfqueryparam value = "#form.pass#" cfsqltype = "cf_sql_varchar" />
</cfquery>


<cfif variables.qCheckAuthentication.recordCount EQ 0>
    
    <cflocation url = "index.cfm?message=enter_valid_email_or_password" addtoken = "false" />
<cfelse>
    <cfset session.name = #variables.qCheckAuthentication.name# />
    <cflocation url = "dashbord.cfm" addtoken="false" />
</cfif>


