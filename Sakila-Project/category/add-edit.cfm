<cfparam name="url.id" default="0" />
<cfparam name="form.category" default="" />

<cfif val(url.id) >
  <cfset variables.categoryGateway = new components.categoryGateway().get(category_id = url.id) />
  <cfset form.category = variables.categoryGateway.getCategory_name() />  
  <!--- <cfdump var="#form.category #" abort="true" > --->
</cfif>

<!DOCTYPE html>
<html>
    <head>
        <title>add-edit</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        
    </head>
    <body class="d-flex justify-content-center flex-column gap-5 align-items-center bg-primary" >
      <cfinclude template="/includes/navbar.cfm"/>
      <cfoutput>
        <form action="add-edit-action.cfm" method="POST" name="categoryForm" class="container w-25  bg-primary-subtle p-5 rounded d-flex flex-column gap-3" >
            <h1>Category</h1>
            <div class="form-group">
              <label for="category">Category Name</label>
              <input type="text" class="form-control" name="category" id="category" placeholder="Enter category name here" value="#form.category#">
            </div>
            
            <input type="hidden" name="category_id" value="#url.id#" />

            <button type="button" onclick="checkAndSubmit()" class="btn btn-primary ">Submit</button>
          </form>
        </cfoutput>
        
        <script>
          function checkAndSubmit() {
                          const form = document.categoryForm;
                          const {
                            category                              
                          } = form;
          
                          if(!isBlank(category, 'Please enter catergory!')) {
                              return false;
                          }

                          form.submit();
                      }
        </script>

        <script src="/assets/helper.js"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" ></script>
    </body>
</html>