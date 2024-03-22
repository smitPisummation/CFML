<cfcomponent displayname="cityGateway" >

    <cffunction name="GetCity" access="public" returntype="query" output="false" >
        
        <cfset var qGetCity = "" />
        <cfquery name="qGetCity" datasource="sakila" >
        
            SELECT c1.city_id, c1.city, c2.country
            FROM city as c1 INNER JOIN country as c2
            ON c1.country_id = c2.country_id
            ORDER BY c2.country, c1.city;  

        </cfquery>

        <cfreturn qGetCity />
    </cffunction>


</cfcomponent>