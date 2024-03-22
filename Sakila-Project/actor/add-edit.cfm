<cfparam name="url.id" default="0" />
<cfparam name="form.fName" default="" />
<cfparam name="form.lName" default="" />
<cfparam name="form.message" default="Insert data" />


<cfif val(url.id)>
    <cfquery name="variables.qDetails" datasource="sakila" >

        SELECT *
        FROM actor
        WHERE actor_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />

    </cfquery>

    <cfset form.message = "Edit data" />
    <cfset form.fName = variables.qDetails.first_name />
    <cfset form.lName = variables.qDetails.last_name />
</cfif> 

<!DOCTYPE html>
<html>
    <head>
        <title>Add-Edit</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body class=" vw-100 d-flex flex-column justify-content-between gap-5 align-items-center bg-primary">
        <cfinclude template="/includes/navbar.cfm" />
        <cfoutput>
            <form action="add-edit-action.cfm" name="addEdit" method="POST" class="container w-50 h-50 border bg-primary-subtle p-5 ">

                <h2 class="mb-4">#form.message#</h2>
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" name="fName" placeholder="First name" value="#form.fName#">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" name="lName" placeholder="Last name" aria-label="Last name" value="#form.lName#">
                    </div>
                </div>
                <input type="hidden" name="updatedDate" value="#Now()#" />
                <div class="d-grid mt-5">
                    <button class="btn btn-primary" type="button" onclick="checkAndSubmit()">Submit</button>
                </div>

                
                <!--- Hidden data --->
                <input type="hidden" name="id" value="#url.id#" />
                
            </form>


            <script>
                function checkAndSubmit() {
                                const form = document.addEdit;
                                const {
                                    fName,
                                    lName
                                    
                                } = form;
                
                                if(!isBlank(fName, 'Please enter your first name!')) {
                                    return false;
                                }
                                if(!isBlank(lName, 'Please enter your last name!')) {
                                    return false;
                                }
                                
                                form.submit();
                            }
                </script>

        <script src="/assets/helper.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" ></script>

        </cfoutput>
    </body>
</html>