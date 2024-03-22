<cfcomponent displayname="address" >
    <cfproperty name="address_id" type="string" default="0" />
    <cfproperty name="address" type="string" default="" />
    <cfproperty name="address2" type="string" default="" />
    <cfproperty name="district" type="string" default="" />
    <cfproperty name="city" type="string" default="0" />
    <cfproperty name="postalCode" type="any" default="" />
    <cfproperty name="phone" type="string" default="" />

    <cfset variables.instance = {} />

    <!--- setter/getter --->
    <cffunction name="setAddress_id" access="public" returntype="void" output="false" >
        <cfargument name="address_id" required="true" />
        <cfset variables.instance.address_id = arguments.address_id />
    </cffunction>
    <cffunction name="getAddress_id" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.address_id />
    </cffunction>
    
    <cffunction name="setAddress" access="public" returntype="void" output="false" >
        <cfargument name="address" required="true" />
        <cfset variables.instance.address = arguments.address />
    </cffunction>
    <cffunction name="getAddress" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.address />
    </cffunction>
    
    <cffunction name="setAddress2" access="public" returntype="void" output="false" >
        <cfargument name="address2" required="true" />
        <cfset variables.instance.address2 = arguments.address2 />
    </cffunction>
    <cffunction name="getAddress2" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.address2 />
    </cffunction>
    
    <cffunction name="setDistrict" access="public" returntype="void" output="false" >
        <cfargument name="district" required="true" />
        <cfset variables.instance.district = arguments.district />
    </cffunction>
    <cffunction name="getDistrict" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.district />
    </cffunction>
    
    <cffunction name="setCity" access="public" returntype="void" output="false" >
        <cfargument name="city" required="true" />
        <cfset variables.instance.city = arguments.city />
    </cffunction>
    <cffunction name="getCity" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.city />
    </cffunction>

    <cffunction name="setPostalCode" access="public" returntype="void" output="false" >
        <cfargument name="postalCode" required="true" />
        <cfset variables.instance.postalCode = arguments.postalCode />
    </cffunction>
    <cffunction name="getPostalCode" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.postalCode />
    </cffunction>
    
    <cffunction name="setPhone" access="public" returntype="void" output="false" >
        <cfargument name="phone" required="true" />
        <cfset variables.instance.phone = arguments.phone />
    </cffunction>
    <cffunction name="getPhone" access="public" returntype="string" output="false" >
        <cfreturn variables.instance.phone />
    </cffunction>


    <!--- init function --->
    <cffunction name="init" access="public" returntype="address" output="false" >
        <cfargument name="address_id" type="string" default="0" />
        <cfargument name="address" type="string" default="" />
        <cfargument name="address2" type="string" default="" />
        <cfargument name="district" type="string" default="" />
        <cfargument name="city" type="string" default="0" />
        <cfargument name="postalCode" type="any" default="" />
        <cfargument name="phone" type="string" default="" />
    
        <cfset this.setAddress_id(arguments.address_id) /> 
        <cfset this.setAddress(arguments.address) /> 
        <cfset this.setAddress2(arguments.address2) /> 
        <cfset this.setDistrict(arguments.district) /> 
        <cfset this.setCity(arguments.city) /> 
        <cfset this.setPostalCode(arguments.postalCode) /> 
        <cfset this.setPhone(arguments.phone) /> 
    
        <cfreturn this />
    </cffunction>


</cfcomponent>