<cfoutput>
    <cfset variables.sum = 5 /> 
    <cfif sum EQ 5 >
        "It's Five" <br />
    </cfif>
</cfoutput>
<hr />


<cfscript>
    // Student Pass/Fail
    writeOutput("<h3> Student Pass/Fail </h3>");
    
    variables.result = true;
    // variables.result = false;
    // variables.result = 'pass';
    if(result EQ true) {
        writeOutput("Student Pass"); 
        writeOutput("<br />"); 
    } else if(result EQ false){
        writeOutput("Student Failed");
        writeOutput("<br />"); 
    } else {
        writeOutput("Enter Valid Value");
        writeOutput("<br />"); 
    }
    writeOutput("<hr />");
    
    
    // Spend Enalysis
    writeOutput("<h3> Spend Enalysis </h3>");
    
    variables.item1 = 20;
    variables.item2 = 30;
    variables.item3 = 30;
    variables.sumOfItems = item1 + item2 + item3 ;
    if (sumOfItems GTE 60 ) {
        writeOutput("You spend more than 60");
        writeOutput("<br />"); 
        writeOutput("Your Total Spend = #sumOfItems#");
        writeOutput("<br />");  
    }
    writeOutput("<hr />");
    
    // Student Grade
    writeOutput("<h3> Student Grade </h3>");
    variables.sub1 = 90;
    variables.sub2 = 90;
    variables.sub3 = 40;
    variables.sub4 = 66;
    variables.totalMarks = sub1+sub2+sub3+sub4;
    variables.percentage = totalMarks / 4 ;
    
    if (percentage GT 100) {
        writeOutput("<b><i> Enter Valid Marks </i></b>")
    }else if (percentage GTE 90) {
        writeOutput("Congratulations you Got 'A' Grade"); 
        writeOutput("<br />");
        writeOutput("Your Percentage =  #percentage#%");
        writeOutput("<br />");
        writeOutput("You got #totalMarks# marks from 400 marks");
    }else if (percentage GTE 75) {
        writeOutput("Congratulations you Got 'B' Grade"); 
        writeOutput("<br />");
        writeOutput("Your Percentage =  #percentage#%");
        writeOutput("<br />");
        writeOutput("You got #totalMarks# marks from 400 marks");
    }else if (percentage GTE 65) {
        writeOutput("Congratulations you Got 'C' Grade"); 
        writeOutput("<br />");
        writeOutput("Your Percentage =  #percentage#%");
        writeOutput("<br />");
        writeOutput("You got #totalMarks# marks from 400 marks");
    }else if (percentage LT 33) {
        writeOutput("You are fail"); 
        writeOutput("<br />");
        writeOutput("Your Percentage =  #percentage#%");
        writeOutput("<br />");
        writeOutput("You got #totalMarks# marks from 400 marks");
    }else if (percentage LT 65 ) {
        writeOutput("You Got 'E' Grade"); 
        writeOutput("<br />");
        writeOutput("Your Percentage =  #percentage#%");
        writeOutput("<br />");
        writeOutput("You got #totalMarks# marks from 400 marks");
    }
    else {
        writeOutput("Your Percentage =  #percentage#%");
        writeOutput("<br />");
        writeOutput("You got #totalMarks# marks from 400 marks");
    }
    writeOutput("<hr />");
    
</cfscript>


<cfset num = [1,2,3,4] />
<cfdump var= #arraySum(num)# />
<cfdump var= #num.sum()# />