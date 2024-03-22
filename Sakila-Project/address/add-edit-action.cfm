<cfset variables.addressGateway = new components.addressGateway() />
<cfset variables.address = variables.addressGateway.get(address_id = val(form.address_id)) />
<cfset variables.address.setAddress(form.address) />
<cfset variables.address.setAddress2(form.address2) />
<cfset variables.address.setDistrict(form.district) />
<cfset variables.address.setCity(form.cities) />
<cfset variables.address.setPostalCode(form.postalCode) />
<cfset variables.address.setPhone(form.phone) />

<cfset variables.address = variables.addressGateway.save((variables.address)) />

<cfoutput>
    <cfif form.address_id eq 0 >
            <cfset variables.message="Data_Inserted_Successfully" />
        <cfelse>                 
            <cfset variables.message="Data_Updated_Successfully" />
    </cfif>
</cfoutput>

<cflocation url="/address?message=#variables.message#" addtoken="false" />