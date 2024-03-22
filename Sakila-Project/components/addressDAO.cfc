<cfcomponent displayname="addressDAO" output="false" >

    <cfset variables.dataSource = "sakila"/>

    <cffunction name="read" access="public" returntype="address" output="false" >
        <cfargument name="address_id" required="true" type="numeric"/>

        <cfset var qAddress = "" />
        <cfquery name="qAddress" datasource="#variables.dataSource#" >
            SELECT *
            FROM address
            WHERE address_id = <cfqueryparam value="#arguments.address_id#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfif qAddress.recordCount>
            <cfreturn new address().init(argumentCollection = qAddress.getRow(1)) />
        <cfelse>
            <cfreturn new address().init() />
        </cfif>

    </cffunction>

    <cffunction name="insert" access="public" returntype="address" output="false" >
        <cfargument name="address" type="address" required="true" />

        <cfset var qAddress="" />
        <cfquery name="qAddress" datasource="#variables.dataSource#" >
            INSERT INTO address(address, address2, district, city_id, postal_code, phone )
            VALUES
            (
                <cfqueryparam value="#arguments.address.getAddress()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getAddress2()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getDistrict()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getCity()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getPostalCode()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getPhone()#" cfsqltype="cf_sql_varchar" />
            );

            SELECT LAST_INSERT_ID() address_id;
        </cfquery>

        <cfset arguments.address.setAddress_id(qAddress.address_id) />

        <cfreturn arguments.address />
    </cffunction>


    <cffunction name="update" access="public" returntype="address" output="false" >
        <cfargument name="address" type="address" required="true" />

        <cfset var qAddress="" />
        <cfquery name="qAddress" datasource="#variables.dataSource#" >
            UPDATE address
            SET
                address = <cfqueryparam value="#arguments.address.getAddress()#" cfsqltype="cf_sql_varchar" />,
                address2 = <cfqueryparam value="#arguments.address.getAddress2()#" cfsqltype="cf_sql_varchar" />,
                district = <cfqueryparam value="#arguments.address.getDistrict()#" cfsqltype="cf_sql_varchar" />,
                city_id = <cfqueryparam value="#arguments.address.getCity()#" cfsqltype="cf_sql_integer" />,
                postal_code = <cfqueryparam value="#arguments.address.getPostalCode()#" cfsqltype="cf_sql_integer" />,
                phone = <cfqueryparam value="#arguments.address.getPhone()#" cfsqltype="cf_sql_integer" />
            WHERE address_id = <cfqueryparam value="#arguments.address.getAddress_id()#" cfsqltype="cf_sql_integer" />
        </cfquery>

        <cfreturn arguments.address />
    </cffunction>

</cfcomponent>