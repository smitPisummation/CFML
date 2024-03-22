<cfcomponent displayname="addressGateway" output="true" >

    <cffunction name="addressList" access="public" returntype="query" >
        <cfargument name="page" default="1" />
        <cfargument name="maxRow" default="10" />

        <cfset local.currentBlock = (arguments.page - 1) * arguments.maxRow />
        
        <cfset var qAddress = "" />
        <cfquery name="qAddress" datasource="sakila" >
            SELECT *
            FROM address
            ORDER BY address_id DESC 
            LIMIT #local.currentBlock#, #arguments.maxRow#
        </cfquery>

        <cfreturn qAddress />
    </cffunction>

    <cffunction name="get" access="public" returntype="address" output="false" >
        <cfargument name="address_id" required="true" type="numeric" />

        <cfset var address = new addressDAO().read(address_id = arguments.address_id) />

        <cfreturn address />
    </cffunction>

    <cffunction name="save" access="public" returntype="address" output="false" >
        <cfargument name="address" type="address" required="true"/>

        <cfif arguments.address.getAddress_id() EQ 0 >
            <cfreturn new addressDAO().insert(arguments.address) />
        <cfelse>
            <cfreturn new addressDAO().update(arguments.address) />
        </cfif>

        <cfreturn address />
    </cffunction>

</cfcomponent>