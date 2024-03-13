<cfparam name = "url.fullName" default = "" />        
<cfparam name = "url.email" default = "" />
<cfparam name = "url.phone" default = "" />
<cfparam name = "url.contact" default = "" />
<!--- <cfparam name = "url.findUs" default = "" /> --->


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
                    <form action="insert.cfm" method="get"  name="inquiryForm" enctype="multipart/form-data">
                        <fieldset>
                            <legend>Travller Name</legend>
                            <input type="text" name="fullName" id="name" placeholder="Eg : Xyz Opq" class="inpField" value="#url.fullName#">
                        </fieldset>

                        <fieldset>
                            <legend>Travller Email</legend>
                            <input type="email" name="email" id="email" placeholder="Eg : xyzop@gmail.com"  class="inpField" value="#url.email#">
                        </fieldset>
                        <fieldset>
                            <legend>Travller Phone</legend>
                            <input type="tel" name="phone" id="phone" placeholder="Eg : 9988775566"   class="inpField" value="#url.phone#">
                        </fieldset>

                        <div class="contact-method">
                            <span>Prefer a method to Contact you :</span>
                            <div style="display: flex; align-items: center; gap: 4px;">
                                <input type="checkbox" name="contact" id="contactByPhone" value="phone"  >
                                <label for="contactByPhone">Phone</label>
                            </div>
                            <div style="display: flex; align-items: center; gap: 4px;">
                                <input type="checkbox" name="contact" id="contactByEmail" value="email"  >
                                <label for="contactByEmail">Email</label>
                            </div>
                            <div style="display: flex; align-items: center; gap: 4px;">
                                <input type="checkbox" name="contact" id="contactByWp" value="wp"   >
                                <label for="contactByWp">WhatsApp</label>
                            </div>
                            <div style="display: flex; align-items: center; gap:4px;">
                                <input type="checkbox" name="contact" id="contactByOther" value="contactByOther" onclick="addOtherField(this)" /> 
                                <label for="contactByOther">Other</label>     
                            </div>  
                            <input type="text" name="otherContact" id="otherContact" placeholder="Enter other method" style="display:none"/>
                        </div>

                        <span style="margin: 3px 0 -5px 5px;">How did you find us ?</span>
                        <select name="findUs" id="findUs" onchange="checkOther(this)">
                            <option value="">Select Value</option>
                            <option value="1">Google</option>
                            <option value="2">Facebook</option>
                            <option value="3">Friend</option>
                            <option value="4">Other</option> 
                        </select> 
                        <input type="text" id="otherOpt" name="findUsOther" placeholder="Enter Other Option" style="display: none"/>

                        <span style="margin: 3px 0 -5px 5px;">Do you have Passport ?</span>
                        <div style="margin: 3px 0 -5px 5px;">
                            <input type="radio" name="passportValue" id="passport-yes" value="1">
                            <label for="passport-yes">Yes</label> <br />
                            <input type="radio" name="passportValue" id="passport-no" value="0">
                            <label for="passport-no">No</label>
                        </div>

                        <span style="margin: 3px 0 -5px 5px;">Prefered Locations :</span>
                        <select name="preferedLocation" id="prefered-location" multiple>
                            <option value="">Select Locations</option>
                            <option value="1" >Goa</option>
                            <option value="2">Lonavala</option>
                            <option value="3">Udaipur</option>
                            <option value="4">lakshadweep</option>
                        </select>

                        <div id="date" style="display:flex; gap:3px; flex-wrap:wrap;">
                            <span style="margin: 3px 0 -5px 5px;"> Select Date :</span>
                            <input type="text" name="date" id="date1" class="dates" value="">
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
                            console.log(date1);
                            date1.setAttribute('value', submitDate);
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










