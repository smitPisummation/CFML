<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./travellerInquiryB.css">
</head>

<body class="bg-black vh-100 vw-100 fs-6">
    <main class="d-flex justify-content-center align-items-center gap-5 position-relative h-100 w-100">
        <div >
            <p class="text-color fs-1 m-0 fw-bolder ">Travller Inquiry Form</p>
            <p class="text-color fs-2 m-0 fw-medium">Let's get lost in right direction</p>
            <img src="./imgs/bus-png-yellow-bus-png-clipart-best-4181.png" alt="bus-img" width="500px" height="350px" />
        </div>
        <div class="inner-div position-relative p-4 overflow-y-auto">
            <form action="" method="get" name="inquiryForm" enctype="multipart/form-data" class="text-color d-flex flex-column gap-2" >
                <fieldset class="border border-2 border-warning fs-6 p-n1">
                    <legend class="float-none text-color w-auto mx-2 fs-6 mb-0 ">Travller Name</legend>
                    <input type="text" name="fullName" id="name" placeholder="Eg : Xyz Opq"
                        class="bg-color border-0  px-2 py-1 focus-ring text-color" value="">
                </fieldset>
                <fieldset class="border border-2 border-warning fs-6 p-n1">
                    <legend class="float-none text-color w-auto mx-2 fs-6 mb-0 ">Travller Email</legend>
                    <input type="email" name="email" id="email" placeholder="Eg : xyzop@gmail.com"
                        class="bg-color border-0  px-2 py-1 focus-ring text-color " />
                </fieldset>
                
                <fieldset class="border border-2 border-warning fs-6 p-n1">
                    <legend class="float-none text-color w-auto mx-2 fs-6 mb-0 ">Travller Phone</legend>
                    <input type="tel" name="phone" id="phone" placeholder="Eg : 9988775566"
                    class="bg-color border-0  px-2 py-1 focus-ring text-color " value="">
                </fieldset>

                <div class="">
                    <span>Prefer a method to Contact you :</span>
                    <div class="d-flex align-item-center gap-2">
                        <input type="checkbox" name="contact" id="contactByPhone" value="phone">
                        <label for="contactByPhone">Phone</label>
                    </div>
                    <div class="d-flex align-item-center gap-2">
                        <input type="checkbox" name="contact" id="contactByEmail" value="email">
                        <label for="contactByEmail">Email</label>
                    </div>
                    <div class="d-flex align-item-center gap-2">
                        <input type="checkbox" name="contact" id="contactByWp" value="wp">
                        <label for="contactByWp">WhatsApp</label>
                    </div>
                    <div styl class="d-flex align-item-center gap-2">
                        <input type="checkbox" name="contact" id="contactByOther" value="contactByOther"
                            onclick="addOtherFieldBootStrap(this)" />
                        <label for="contactByOther">Other</label>
                    </div>
                    <input type="text" name="otherContact" id="otherContact" placeholder="Enter other method"
                         class="d-none"/>

                </div>

                <span class="mx-n1">How did you find us ?</span> 
                <select name="findUs" id="findUs" onchange="checkOtherBootStrap(this)" class="text-color rounded-pill p-1 px-2 w-50 border border-2 border-warning">
                    <option value="">Select Value</option>
                    <option value="1">Google</option>
                    <option value="2">Facebook</option>
                    <option value="3">Friend</option>
                    <option value="other">Other</option>
                </select>
                <input type="text" id="otherOpt" name="otherOpt" placeholder="Enter Other Option"
                    class="d-none" />

                <span class="mt-1 mb-0">Do you have Passport ?</span>
                <div >
                    <input type="radio" name="passportValue" id="passport-yes" value="1">
                    <label for="passport-yes">Yes</label> <br />
                    <input type="radio" name="passportValue" id="passport-no" value="0">
                    <label for="passport-no">No</label>
                </div>

                <span>Prefered Locations :</span>
                <select name="preferedLocation" id="prefered-location" multiple class="border-2 border-warning w-50 p-2">
                    <option value="">Select Locations</option>
                    <option value="1">Goa</option>
                    <option value="2">Lonavala</option>
                    <option value="3">Udaipur</option>
                    <option value="4">lakshadweep</option>
                </select>

                <div id="date" class="d-flex gap-1 flex-wrap my-2">
                    <span> Select Date :</span>
                    <input type="text" name="date" id="date1" class="border w-25 border-2 border-warning px-2" placeholder="31-12-2024" value="">
                </div>
                <input type="button" value="Add Dates" class="bg-warning border-0 " onclick="addDates()" />
                
                <div class="d-flex flex-column gap-1 my-1">
                    <span>Upload your Id :</span>
                    <input type="file" name="idOfTraveller" id="idOfTraveller" class=""/>
                </div>

                <button type="button" class="bg-warning border-0 " onclick="checkAndSubmit()">Submit</button>





            </form>
        </div>
    </main>

    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="../assets/helper.js" ></script>
                    <script>

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

                    </script>

</body>

</html>