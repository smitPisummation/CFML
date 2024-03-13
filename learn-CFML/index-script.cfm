
<cfscript>
    //cfset
    writeOutput("<h2>cfset</h2>")
    variables.name = " Smit"

    // cfoutput
    writeOutput("<h2>cfoutput</h2>")
    writeOutput("#name#")
    
    // array 
    variables.Array1 = ArrayNew();
    arrayAppend(Array1, 1); 
    arrayAppend(Array1, [2,3,4,5], true ); 
    arrayAppend(Array1, [6,7,8,9] ); 
    writeDump(Array1);
    writeOutput("<br />");
    
    variables.Array2 = [1,2,3,[7,8,9],4,5,"Six" <!--- , flatten="true"  ---> ] ;
    writeDump(Array2);
    
</cfscript>
