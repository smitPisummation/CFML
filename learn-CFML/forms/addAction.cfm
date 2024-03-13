<!--- <cfparam name = "url" /> --->
<cfparam name = "url.contact" default = "" />
<cfparam name = "url.passportValue" default = "" />
<cfparam name = "url.preferedLocation" default = "" />

<cfquery datasource="inquiry">
    insert into inquiries(name, email, phoneNum, contactMethod, contactOther, findUs, findUsOther, passport, location, date, submitDate )
    values 
    (
        <cfqueryparam value = "#url.fullName#" cfsqltype = "cf_sql_varchar"/>,
        <cfqueryparam value = "#url.email#" cfsqltype = "cf_sql_varchar" />,
        <cfqueryparam value = "#url.phone#" cfsqltype = "cf_sql_varchar" />,
        <cfqueryparam value = "#url.contact#" cfsqltype = "cf_sql_varchar" />,
        <cfqueryparam value = "#url.otherContact#" cfsqltype = "cf_sql_varchar" />,
        <cfqueryparam value = "#url.findUs#" cfsqltype = "cf_sql_tinyint" />,
        <cfqueryparam value = "#url.findUsOther#" cfsqltype = "cf_sql_varchar" />,
        <cfqueryparam value = "#url.passportValue#" cfsqltype = "cf_sql_bit" />,
        <cfqueryparam value = "#url.preferedLocation#" cfsqltype = "cf_sql_varchar" />,
        <cfqueryparam value = "#url.date#" cfsqltype = "cf_sql_date" />,
        <cfqueryparam value = "#url.submitDate#" cfsqltype = "cf_sql_datetime" />
    )
</cfquery>  

<!DOCUMENT html> 
<html>
    <head>
        <title>Submitted</title>
        <style>
            *{
                margin : 0;
                padding : 0;
                box-sizing : border-box;
            }
            div{
                height : 200px;
                width : 100vw;
                background-color : rgb(130, 251, 255); 
                text-align : center;
                color : gray;
                display : flex;
                flex-direction : column;
                gap : 20px;  
                justify-content : center;
            }
            a{
                font-size : 1.5rem;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Thank you (:</h1>
            <h2>Your inquiry is Submitted</h2>
            <a href = "travellerInquiryEdit.cfm">Edit Your Inquiry</a>
        </div>
    </body>
</html>

