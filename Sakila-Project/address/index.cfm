<cfparam name="url.page" default="1"/>
<cfparam name="url.maxRow" default="7" />

<cfset variables.qAddress = new components.addressGateway().addressList(
    page = url.page,
    maxRow = url.maxRow
) />

<!DOCTYPE html>
<html>
    <head>
        <title>Address</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <cfoutput>
            <cfinclude template="/includes/navbar.cfm" />
            <h1 class="text-center fw-bold mt-5">Address</h1>
            <a href="/address/add-edit.cfm" class="btn bg-dark text-white float-end m-2">Insert Data</a>

            <cfset variables.columns = [
                {
                    "label" : "id",
                    "fieldName" : "address_id"
                },
                {
                    "label" : "Address 1",
                    "fieldName" : "address"
                },
                {
                    "label" : "Address 2",
                    "fieldName" : "address2"
                },
                {
                    "label" : "District",
                    "fieldName" : "district"
                },
                {
                    "label" : "Postal Code",
                    "fieldName" : "postal_code"
                },
                {
                    "label" : "Phone No.",
                    "fieldName" : "phone"
                },
                {
                    "label" : "Action",
                    "content" : (address) => {
                        var edit = "<a href='/address/add-edit.cfm?id=#address.address_id#' class='text-black'> EDIT </a>"
                        return edit;
                    }
                }
            ] />
            
            <table class="container">
               <cfset variables.PrintTable = new components.utility().PrintTable(
                    columns = #variables.columns#,
                    qData = #variables.qAddress#
                ) />
             
            </table>

            <div class = "w-100  d-flex justify-content-between px-5 my-5">
                <button type="button" class="btn bg-dark text-white" onclick = "fun_previous_page()">Previous Page</button>
                <button type="button" class="btn bg-dark text-white" onclick = "fun_next_page()" >Next Page</button>
                <input type="hidden" name="page" value="#url.page#" />
            </div>

        </cfoutput>

        <script src="/assets/helper.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" ></script>
    </body>
</html>