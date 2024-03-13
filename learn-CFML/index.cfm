<h1>Practice </h1>

<cfset variables.firstName = 'Smit' /> 
<cfset variables["lastName"] = "Patel" /> 

<h3>It's Variables</h3>
<cfoutput>
    #firstName# <br />     
    #lastName#  <br /> <br />
</cfoutput>


<!--- Array --->
<h2>Arrays</h2>

<cfset variables.Array1 = ArrayNew() />
<cfset arrayAppend( Array1 ,'Smit' ) />

<cfset variables['Array2'] = ArrayNew(2) />
<cfset arrayAppend( Array2, ['Smit', 'Patel'] ) />

<cfset variables.Array3 = ArrayNew() />
<cfset arrayAppend( Array3, ['Hello', 'World'] ) />
<cfset arrayAppend( Array3, ['Hello', 'World'], true ) />

<cfset variables.Array4 = [ 1, 2, 3, 4, "one" ] />
  <br />



<cfdump var = #Array1# />  <br />
<cfdump var = #Array2# />   <br />
<cfdump var = #Array3# />  <br />
<cfdump var = #Array4# />  <br />

<cfset variables.time = #now()# />

<h3>It's Current Time</h3>
<cfoutput>
    It is dumped
    <cfdump var = #now()# />
    It's in output <br />
    #time#  <br /> <br />
</cfoutput>


<!--- Struct --->
<h2> Structures </h2>

<cfset variables.firstStruct = StructNew('ordered') /> 
<cfset structAppend(variables.firstStruct, {"name" : "Smit"}) />
<cfset structAppend(variables.firstStruct, {email : "Smitp79"}) />
<cfset structAppend(variables.firstStruct, {"phone" : 9099456236}) /> 


<cfset variables.structProfile = [
    "email" : "smitp79",
     num : 5,
    "name" : "Smit",
     phone : 9099456236,
] />

<cfdump var="#variables.firstStruct#" /> <br />
<cfdump var="#variables.structProfile#" /> <br /><br />