<cfquery datasource="inquiry" >
     
    UPDATE inquiries
    SET 
    name = <cfqueryparam value = "#form.fullName#" cfsqltype = "cf_sql_varchar" />,
    email = <cfqueryparam value = "#form.email#" cfsqltype = "cf_sql_varchar" />,
    phoneNum = <cfqueryparam value = "#form.phone#" cfsqltype = "cf_sql_varchar" />,
    contactMethod = <cfqueryparam value = "#form.contact#" cfsqltype = "cf_sql_varchar" />,
    contactOther = <cfqueryparam value = "#form.otherContact#" cfsqltype = "cf_sql_varchar" />,
    findUs = <cfqueryparam value = "#form.findUs#" cfsqltype = "cf_sql_tinyint" />,
    findUsOther = <cfqueryparam value = "#form.findUsOther#" cfsqltype = "cf_sql_varchar" />,
    passport = <cfqueryparam value = "#form.passportValue#" cfsqltype = "cf_sql_bit" />,
    location = <cfqueryparam value = "#form.preferedLocation#" cfsqltype = "cf_sql_varchar" />,
    date = <cfqueryparam value = "#form.date#" cfsqltype = "cf_sql_date" />
    
    where id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer" />;
 
</cfquery>

<script>
    alert("Updated");
</script>


<!--- <cfqueryparam value = "#form.iqId#" cfsqltype = "cf_sql_integer" /> --->