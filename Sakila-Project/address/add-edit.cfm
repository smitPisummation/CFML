<cfparam name="url.id" default="0" />
<cfparam name="form.address" default="" />
<cfparam name="form.address2" default="" />
<cfparam name="form.district" default="" />
<cfparam name="form.postalCode" default="" />
<cfparam name="form.phone" default="" />
<cfparam name="form.cities" default="" />

<cfset variables.qGetCity = new components.cityGateway().GetCity() />

<cfif val(url.id) >
  <cfset variables.addressGateway = new components.addressGateway().get(address_id = url.id) />

  <cfset form.address = variables.addressGateway.getAddress() />
  <cfset form.address2 = variables.addressGateway.getAddress2() />
  <cfset form.district= variables.addressGateway.getDistrict() />
  <cfset form.cities= variables.addressGateway.getCity() />
  <cfset form.postalCode= variables.addressGateway.getPostalCode() />
  <cfset form.phone= variables.addressGateway.getPhone() />
</cfif>



<!DOCTYPE html>
<html>
    <head>
        <title>add-edit</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
          *{
            margin:0;
            padding:0;
          }
        </style>
    </head>
    <body class="d-flex justify-content-center flex-column gap-2 align-items-center bg-primary" >
      <cfinclude template="/includes/navbar.cfm"/>
      <cfoutput>
        <form action="add-edit-action.cfm" method="POST" name="addressForm" class="container w-25  bg-primary-subtle p-5 rounded d-flex flex-column gap-3" >
            <h1>Address</h1>
            <div class="form-group">
              <label for="address">Address</label>
              <input type="text" class="form-control" name="address" id="address" placeholder="Address Line 1" value="#form.address#">
            </div>
            <div class="form-group">
              <label for="address2">Address 2</label>
              <input type="text" class="form-control" name="address2" id="address2" placeholder="Address Line 2" value="#form.address2#">
            </div>
            <div class="form-group">
                <label for="district">District</label>
                <input type="text" class="form-control" name="district" id="district" placeholder="Enter your District" value="#form.district#">
              </div>
            <div class="form-row">
              <div class="form-group w-100 col-md-6">
                <label for="cities" class="form-label">City</label>
                <!--- <input class="form-control" list="city" id="cities" placeholder="Type to search your city..."> --->
                <!--- <datalist id="city">                    
                        <cfloop query="variables.qGetCity" >
                            <option value="#variables.qGetCity.city# [#variables.qGetCity.country#]"></option>
                        </cfloop>
                </datalist> --->
                <select class="form-select" aria-label="Default select example" name="cities" id="cities">
                    <option value="" >Select your city</option>
                    <cfloop query="#variables.qGetCity#" >
                        <option value="#variables.qGetCity.city_id#" <cfif form.cities EQ variables.qGetCity.city_id >selected</cfif> >#variables.qGetCity.city# [#variables.qGetCity.country#]</option>
                    </cfloop>
                </select>
              </div>
              </div>
              <div class="form-group w-100 col-md-2">
                <label for="postalCode">Postal Code</label>
                <input type="text" class="form-control" name="postalCode" id="postalCode" placeholder="Enter your 6 digit postal code" value="#form.postalCode#">
              </div>
              <div class="form-group w-100 col-md-2">
                <label for="phone">Phone No.</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your mobile number" value="#form.phone#">
              </div>
            </div>

            <input type="hidden" name="address_id" value="#url.id#" />

            <button type="button" onclick="checkAndSubmit()" class="btn btn-primary ">Submit</button>
          </form>
        </cfoutput>
        
        <script>
          function checkAndSubmit() {
                          const form = document.addressForm;
                          const {
                              address,
                              address2,
                              district,
                              cities,
                              postalCode,
                              phone
                              
                          } = form;
          
                          if(!isBlank(address, 'Please fill address 1!')) {
                              return false;
                          }
                          if(!isBlank(address2, 'Please fill address 2!')) {
                              return false;
                          }
                          if(!isBlank(district, 'Please enter district!')) {
                              return false;
                          }
                          if(!isBlank(cities, 'Please enter city!')) {
                              return false;
                          }
                          if(!isBlank(postalCode, 'Please enter postalCode!')) {
                              return false;
                          }
                          if(!isPhone(phone, 'Please enter phone!')) {
                              return false;
                          }
                          
                          form.submit();
                      }
          </script>
<script src="/assets/helper.js"></script>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" ></script>
    </body>
</html>