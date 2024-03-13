<cfparam name = "url.fName" default = "" />
<cfparam name = "url.lName" default = "" />
<cfset url.fName = "Smit" />
<cfset url.lName = "Patel" />
<cfset url.fullName = "#fName# #lName#" />
<!--- <cfset url.fullName = fName&" "& lName /> --->



<DOCTYPE html>
<html>
    <head> 
        <title> FORM </title>
    </head>
    <cfoutput>
        <body>
            <h1> Profile Form </h1>
            <form action = "./profile.cfm" method = "get" autocomplete="on" >
                <fieldset>
                    <legend> Form </legend> 
                    <label for = "fName"> First Name : </label>
                    <input type = "text"  name = "fName" id = "fName" value = "#url.fName#" />  <br /><br />
                    
                    <label for = "lName"> Last Name : </label>
                    <input type = "text"  name = "lName" id = "lName" value = "#url.lName#" /> <br /><br />
                    
                    <label for = "fullName"> Full Name : </label>
                    <input type = "text"  name = "fullName" id = "fullName" value = "#url.fullName#" />
                    <br /><br />
                    <button type = "submit"> Submit </button>
                
                </fieldset>
            </form>
        </body>
    </cfoutput>
</html>