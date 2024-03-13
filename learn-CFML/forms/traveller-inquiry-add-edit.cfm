<cfparam name = "url.id" default="0"/>
<cfparam name = "form.fullName" default = "" />
<cfparam name = "form.email" default = "" />
<cfparam name = "form.phone" default = "" />
<cfparam name = "form.contact" default = "" />
<cfparam name = "form.otherContact" default = "" />
<cfparam name = "form.contactOther" default = "" />
<cfparam name = "form.findUs" default = "" />
<cfparam name = "form.findUsOther" default = "" />
<cfparam name = "form.passportValue" default = "" />
<cfparam name = "form.preferedLocation" default = "" />
<cfparam name = "form.date" default = "" />



<cfif val(url.id)>
    <cfquery name="variables.qInqList" datasource="inquiry">
        SELECT *
        FROM inquiries
        WHERE id = <cfqueryparam value = "#url.id#" cfsqltype = "cf_sql_integer" />;
    </cfquery>

    <cfset form.fullName = variables.qInqList.name />
    <cfset form.email = variables.qInqList.email />
    <cfset form.phone = variables.qInqList.phoneNum />
    <cfset form.contact = variables.qInqList.contactMethod />
    <cfset form.otherContact = variables.qInqList.contactOther />
    <cfset form.findUs = variables.qInqList.findUs />
    <cfset form.findUsOther = variables.qInqList.findUsOther />
    <cfset form.passportValue = variables.qInqList.passport />
    <cfset form.preferedLocation = variables.qInqList.location />
    <cfset form.date = variables.qInqList.date />

</cfif>


<!DOCTYPE html>
<html>
    <head>
        <title>Document</title>
        <link rel="stylesheet" href="travellerInquiry.css">
    </head>
    <cfoutput>
        <body>
            <main>
                <div class="left-div">
                    <h1>Travller Inquiry Form</h1>
                    <h2>Let's get lost in right direction</h2>
                    <!--- <img src="./imgs/Flying-Airplane-Transparent-PNG.png" alt="plane-img" class="plane-img"> --->
                    <img src="./imgs/bus-png-yellow-bus-png-clipart-best-4181.png" alt="plane-img" class="plane-img">
                </div>
                <div class="inner-div">
                    <form action="inquiry-action.cfm" method="post"  name="inquiryForm" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="#url.id#">

                        <!--- <cfdump var="#form.name#" /> --->
                        <fieldset>
                            <legend>Travller Name</legend>
                            <input type="text" name="fullName" id="name" placeholder="Eg : Xyz Opq" class="inpField" value="#form.fullName#">
                        </fieldset>

                        
                        <fieldset>
                            <legend>Travller Email</legend>
                            <input type="email" name="email" id="email" placeholder="Eg : xyzop@gmail.com"  class="inpField" value="#form.email#">
                        </fieldset>
                        <fieldset>
                            <legend>Travller Phone</legend>
                            <input type="tel" name="phone" id="phone" placeholder="Eg : 9988775566"   class="inpField" value="#form.phone#">
                        </fieldset>
                        <div class="contact-method">
                            <span>Prefer a method to Contact you :</span>
                            <div style="display: flex; align-items: center; gap: 4px;">
                                <input type="checkbox" name="contact" id="contactByPhone" value="phone" <cfif listContainsNoCase(form.contact, "phone") > checked </cfif> />
                                <label for="contactByPhone">Phone</label>
                            </div>
                            <div style="display: flex; align-items: center; gap: 4px;">
                                <input type="checkbox" name="contact" id="contactByEmail" value="email" <cfif listContainsNoCase(form.contact, "email") > checked </cfif> >
                                <label for="contactByEmail">Email</label>
                            </div>
                            <div style="display: flex; align-items: center; gap: 4px;">
                                <input type="checkbox" name="contact" id="contactByWp" value="wp" <cfif listContainsNoCase(form.contact, "wp") > checked </cfif>  >
                                <label for="contactByWp">WhatsApp</label>
                            </div>
                            <div style="display: flex; align-items: center; gap:4px;">
                                <input type="checkbox" name="contact" id="contactByOther" value="contactByOther" onclick="addOtherField(this)" <cfif listContainsNoCase(form.contact, "contactByOther") >checked</cfif> /> 
                                <label for="contactByOther">Other</label>     
                            </div>  
                            <input type="text" name="otherContact" id="otherContact" placeholder="Enter other method" value = "#form.otherContact#" <cfif listContainsNoCase(form.contact, "contactByOther") > style="display:block" </cfif> style="display:none"  />
                        </div>

                        <span style="margin: 3px 0 -5px 5px;">How did you find us ?</span>
                        <select name="findUs" id="findUs" onchange="checkOther(this)">
                            <option value="">Select Value</option>
                            <option value="1" <cfif form.findUs eq "1" >selected</cfif>>Google</option>
                            <option value="2" <cfif form.findUs eq "2" >selected</cfif> >Facebook</option>
                            <option value="3" <cfif form.findUs eq "3" >selected</cfif> >Friend</option>
                            <option value="4" <cfif form.findUs eq "4" >selected</cfif> >Other</option> 
                        </select> 
                        <input type="text" id="otherOpt" name="findUsOther" placeholder="Enter Other Option" value ="#form.findUsOther#" <cfif listContainsNoCase(form.findUs, "4") > style ="display:block" </cfif> style="display: none"/>

                        <span style="margin: 3px 0 -5px 5px;">Do you have Passport ?</span>
                        <div style="margin: 3px 0 -5px 5px;">
                            <input type="radio" name="passportValue" id="passport-yes" value="1" <cfif form.passportValue eq "1" > checked </cfif>>
                            <label for="passport-yes">Yes</label> <br />
                            <input type="radio" name="passportValue" id="passport-no" value="0" <cfif form.passportValue eq "0" > checked </cfif>>
                            <label for="passport-no">No</label>
                        </div>

                        <span style="margin: 3px 0 -5px 5px;">Prefered Locations :</span>
                        <select name="preferedLocation" id="prefered-location" multiple>
                            <option value="">Select Locations</option>
                            <option value="1" <cfif listFindNoCase(form.preferedLocation, "1") > selected </cfif> >Goa</option>
                            <option value="2" <cfif listFindNoCase(form.preferedLocation, "2") > selected </cfif> >Lonavala</option>
                            <option value="3" <cfif listFindNoCase(form.preferedLocation, "3") > selected </cfif> >Udaipur</option>
                            <option value="4" <cfif listFindNoCase(form.preferedLocation, "4") > selected </cfif> >lakshadweep</option>
                        </select>

                        <div id="date" style="display:flex; gap:3px; flex-wrap:wrap;">
                            <span style="margin: 3px 0 -5px 5px;"> Select Date :</span>
                            <input type="text" name="date" id="date1" class="dates" placeholder="31-12-2024" value="#dateFormat(form.date, 'dd/mm/yyyy' )#" >
                        </div>
                        <input type="button"  value="Add Dates" style="padding:3px" onclick="addDates()"/>

                        <span style="margin: 3px 0 -5px 5px;">Upload your Id :</span>
                        <input type="file" name="idOfTraveller" id="idOfTraveller" />


                        <input type = "text" name = "submitDate" hidden id = "submitDate" value = "" />


                        <!--- <button type="button" onclick="checkAndSubmit()" >Submit</button> --->
                        <button type="submit">Submit</button>
                        

                        <script src="../assets/helper.js" ></script>
                        <script>
                            const submitDate = new Date();
                            let date1 = document.getElementById('submitDate');
                            date1.setAttribute('value', submitDate);
                        </script>
                        <script>

                        </script>

                        <!--- <script>

                            function checkAndSubmit() {
                                const form = document.inquiryForm;
                                const {
                                    fullName : name,
                                    email,
                                    phone,
                                    contact,
                                    findUs,
                                    passportValue : radioBtn,
                                    preferedLocation,
                                    date,
                                    
                                } = form;
                
                                if(!isBlank(name, 'Please enter your first name!')) {
                                    return false;
                                }
                                if(!isEmail(email, 'Please enter your Email!')) {
                                    return false;
                                }
                                if(!isPhone(phone, 'Please enter your Phone!')) {
                                    return false;
                                }
                                if(!isChecked(contact, 'Please enter contact!')) {
                                    return false;
                                }
                                if(!isBlank(findUs, 'Please enter your Find US!')) {
                                    return false;
                                }
                                if(!isChecked(radioBtn, 'Please Select Passport Field!')) {
                                    return false;
                                }
                                if(!isBlank(preferedLocation, 'Please Select Location Field!')) {
                                    return false;
                                }
                                if(!checkDates(date, 'Please Date!')) {
                                    return false;
                                }
                                
                                form.submit();
                            }
                        </script> --->
                    </form>
                </div>
            </main>
        </body>
    </cfoutput>
</html>



