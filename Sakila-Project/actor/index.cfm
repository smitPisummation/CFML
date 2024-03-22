<cfparam name="url.page" default="1"/>
<cfparam name="url.maxRow" default="5" />

    <cfset variables.actorGateway = new components.actorGateway().list(
        page = #url.page#,
        maxRows = #url.maxRow#
    ) />

<!DOCTYPE html>
<html>
    <head>
        <title>Actors</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            *{
                /* padding : 0; */
                margin : 0;
                box-sizing : border-box;
            }
            </style>
    </head>
    <cfoutput>
        <body class="vh-100">
            
            <cfinclude template = "/includes/navbar.cfm" />
            <nav style="--bs-breadcrumb-divider: aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="./dashbord.cfm">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page"><a href="/actor">Actor</a></li>
                </ol>
              </nav>
            <div class="container">
                <h1 class="text-center pt-5 fw-bold">Actors</h1>
                <a href="/actor/add-edit.cfm" class="btn bg-dark text-white float-end m-2">Insert Data</a>
                
                <table  cellpadding='10' width=100% class="text-center border-top border-bottom border-2 border-black">
                    <tr class="border border-1">
                        <th>Actor ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Last Updated</th>
                        <th>Actions</th>
                    </tr>
                    <cfloop query = "variables.actorGateway">
                        <tr class="border border-1">
                            <td>#variables.actorGateway.actor_id#</td>
                            <td>#variables.actorGateway.first_name#</td>
                            <td>#variables.actorGateway.last_name#</td>
                            <td>#dateFormat(variables.actorGateway.last_update,'dd/mm/yyyy')#</td>
                            <td><a href = "/actor/add-edit.cfm?id=#variables.actorGateway.actor_id#" class="text-dark" >Edit</a></td>
                        </tr>
                    </cfloop>
                </table>
                
                <div class = "w-100  d-flex justify-content-between px-5 my-5">
                    <button type="button" class="btn bg-dark text-white" onclick = "fun_previous_page()">Previous Page</button>
                    <button type="button" class="btn bg-dark text-white" onclick = "fun_next_page()" >Next Page</button>
                    <input type = "hidden" name = "page" value = "#url.page#" />
                </div>
            </div>
            
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" ></script>
            <script src="/assets/helper.js"></script>
        </body>
    </cfoutput>
</html>