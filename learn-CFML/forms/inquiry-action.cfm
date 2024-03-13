<cfif form.id eq 0 >
    <cfoutput>
        #addData(
            fullName = form.fullName,
            email = form.email,
            phone = form.phone,
            contact = form.contact,
            otherContact = form.otherContact,
            findUs = form.findUs,
            findUsOther = form.findUsOther,
            passport = form.passportValue,
            location = form.preferedLocation,
            date = form.date,
            submitDate = form.submitDate

        )#
    </cfoutput>

<cfelseif form.id GT 0 >
    <cfoutput>
        #editData(
            id = form.id,
            fullName = form.fullName,
            email = form.email,
            phone = form.phone,
            contact = form.contact,
            otherContact = form.otherContact,
            findUs = form.findUs,
            findUsOther = form.findUsOther,
            passport = form.passportValue,
            location = form.preferedLocation,
            date = form.date,
            submitDate = form.submitDate

        )#
    </cfoutput>
</cfif>

<cflocation url="listData.cfm?id=#form.id#&message=#variables.message#" addtoken="false" />


<cffunction name = "addData" returntype = "any" access = "private" output = "false" hint = "it insert inquiry data into database (inquiries)" >
    <cfargument name = "fullName" required = "true" />
    <cfargument name = "email" required = "false" />
    <cfargument name = "phone" default = "" />
    <cfargument name = "contact" />
    <cfargument name = "otherContact" />
    <cfargument name = "findUs" />
    <cfargument name = "findUsOther" />
    <cfargument name = "passport" />
    <cfargument name = "location" />
    <cfargument name = "date" />
    <cfargument name = "submitDate" />

    <cfquery datasource="inquiry">
        insert into inquiries(name, email, phoneNum, contactMethod, contactOther, findUs, findUsOther, passport, location, date, submitDate )
            values 
            (
                <cfqueryparam value = "#arguments.fullName#" cfsqltype = "cf_sql_varchar" />,
                <cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar" />,
                <cfqueryparam value = "#arguments.phone#" cfsqltype = "cf_sql_varchar" />,
                <cfqueryparam value = "#arguments.contact#" cfsqltype = "cf_sql_varchar" />,
                <cfqueryparam value = "#arguments.otherContact#" cfsqltype = "cf_sql_varchar" />,
                <cfqueryparam value = "#arguments.findUs#" cfsqltype = "cf_sql_tinyint" />,
                <cfqueryparam value = "#arguments.findUsOther#" cfsqltype = "cf_sql_varchar" />,
                <cfqueryparam value = "#arguments.passport#" cfsqltype = "cf_sql_bit" />,
                <cfqueryparam value = "#arguments.location#" cfsqltype = "cf_sql_varchar" />,
                <cfqueryparam value = "#arguments.date#" cfsqltype = "cf_sql_date" />,
                <cfqueryparam value = "#arguments.submitDate#" cfsqltype = "cf_sql_datetime" />
            )
        <cfset variables.message = "your_data_is_inserted_successfully" />
    </cfquery>

</cffunction> 


<cffunction name = "editData" returntype = "any" access = "private" output = "false" hint = "it edit data from database (inquiries)" >
    <cfargument name = "id" required = "true" />
    <cfargument name = "fullName" required = "true" />
    <cfargument name = "email" required = "false" />
    <cfargument name = "phone" default = "" />
    <cfargument name = "contact" />
    <cfargument name = "otherContact" />
    <cfargument name = "findUs" />
    <cfargument name = "findUsOther" />
    <cfargument name = "passport" />
    <cfargument name = "location" />
    <cfargument name = "date" />
    <cfargument name = "submitDate" />

    <cfquery datasource="inquiry" >
         
        UPDATE inquiries
        SET 
        name = <cfqueryparam value = "#arguments.fullName#" cfsqltype = "cf_sql_varchar" />,
        email = <cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar" />,
        phoneNum = <cfqueryparam value = "#arguments.phone#" cfsqltype = "cf_sql_varchar" />,
        contactMethod = <cfqueryparam value = "#arguments.contact#" cfsqltype = "cf_sql_varchar" />,
        contactOther = <cfqueryparam value = "#arguments.otherContact#" cfsqltype = "cf_sql_varchar" />,
        findUs = <cfqueryparam value = "#arguments.findUs#" cfsqltype = "cf_sql_tinyint" />,
        findUsOther = <cfqueryparam value = "#arguments.findUsOther#" cfsqltype = "cf_sql_varchar" />,
        passport = <cfqueryparam value = "#arguments.passport#" cfsqltype = "cf_sql_bit" />,
        location = <cfqueryparam value = "#arguments.location#" cfsqltype = "cf_sql_varchar" />,  
        date = <cfqueryparam value = "#arguments.date#" cfsqltype = "cf_sql_date" />
        
        where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />;
     
        <cfset variables.message = "your_data_is_updated_successfully" />
    </cfquery>

</cffunction>