<!--- <cfdump var = "#url.fName#" />
<cfdump var = "#url.lName#" />
<cfdump var = "#url.fullName#" /> --->

<doctype html />
<html>
    <head>
        <title>Form Profile</title>
    </head>
    <style>
        table{
            margin:20px;

        }
        th,td{
            border:1px solid black;
            padding:10px;
            text-align:center;
        }
    </style>
    <cfoutput>
        <body>
            <h1>Profile Information</h1>
            <table cellspacing = "0">
                    <tr>
                        <th>First Name :</th>
                        <td> #url.fName# </td>
                    </tr>
                    <tr>
                        <th>Last Name :</th>
                        <td>#url.lName#</td>
                    </tr>
                    <tr>
                        <th>Full Name :</th>
                        <td>#url.fullName#</td>
                    </tr>
            </table>
        </body>
    </cfoutput>
</html>