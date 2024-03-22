<cfparam name = "url.page" default = "1" />
<cfparam name = "url.maxValue" default = "2" />

<cfset variables.currentBlock = (#url.page# - 1) * #url.maxValue# />


<cfquery name = "variables.qPrintData" datasource = "inquiry">
    SELECT * 
    FROM inquiries 
    LIMIT #variables.currentBlock#, #url.maxValue#; 
</cfquery>

<cfoutput>
    <input type = "text" name = "page" value = "#url.page#" />
</cfoutput>

<script>
    function  fun_next_page() {
        let page = document.querySelector("input[name=page]").value;
    
        document.querySelector("input[name=page]").value = page++; 
        window.location.href = `${location.origin}/${location.pathname}?page=${page}`;
    }
    function  fun_privious_page() {
        let page = document.querySelector("input[name=page]").value;
        
        document.querySelector("input[name=page]").value = page--; 
        window.location.href = `${location.origin}/${location.pathname}?page=${page}`;
        
    }
</script>

<!DOCUMENT html >
<html>
    <head>
        <title>Listed Data</title>
        <style>
            table{
                width : 100%;
                border : 1px solid black;
                text-align : center;
            }
            td,tr,th{
                border : 1px solid black
            }
            .btn{
                margin : 50px;
                padding : 10px;
                background-color : lightblue;
                text-align : center;
                text-decoration : none;
                color : black;
                font-size : 1.2rem;
                font-weight : 600;
            }
        </style>
    </head>
    <cfoutput>
        <body style = "display:flex; flex-direction : column">
            <table cellspacing = 0 cellpadding = 8>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Contact Method</th>
                    <th>Contact Other</th>
                    <th>Find Us</th>
                    <th>Find Us Other</th>
                    <th>Passport</th>
                    <th>Prefered Location</th>
                    <th>Date</th>
                    <th>Edit your inquiry</th>
                </tr>
                <cfloop query = qPrintData >
                    <tr>
                        <td>#variables.qPrintData.id#</td>
                        <td>#variables.qPrintData.name#</td>
                        <td>#variables.qPrintData.email#</td>
                        <td>#variables.qPrintData.phoneNum#</td>
                        <td>#variables.qPrintData.contactMethod#</td>
                        <td>#variables.qPrintData.contactOther#</td>
                        <td>#variables.qPrintData.findUs#</td>
                        <td>#variables.qPrintData.findUsOther#</td>
                        <td>
                            <cfif #variables.qPrintData.passport# eq "1" >
                                Yes
                            <cfelseif #variables.qPrintData.passport# eq "0" >
                                No 
                            </cfif>
                        </td>
                        <td>#variables.qPrintData.location#</td>
                        <td>#dateFormat(variables.qPrintData.date, 'dd/mm/yyyy')#</td>
                        <td><a href = "traveller-inquiry-add-edit.cfm?id=#variables.qPrintData.id#" title = "Edit for id=#variables.qPrintData.id#">Edit</a></td>
                    </tr>
                </cfloop>
            </table>

            <div class="">
                <input type = "button" name = "page" class = "btn" value = "Privious" onclick="fun_privious_page()" />
                <input type = "button" name = "page" class = "btn" value = "next" onclick="fun_next_page()" />
                <a href = "traveller-inquiry-add-edit.cfm" class = "btn" >Add Data</a>
            </div>

        </body>
    </cfoutput>
</html>