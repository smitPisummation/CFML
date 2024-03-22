<cfcomponent displayname="utility" >

    <cffunction name="PrintTable" access="public" output="true" >
        <cfargument name="columns" type="array" required="true" />
        <cfargument name="qData" type="query"  />

        <table  cellpadding='10' width=100% class="text-center border-top border-bottom border-2 border-black">
            <thead>
                <tr class="border border-1">
                    <cfloop array="#arguments.columns#" item="local.column" index="local.index" >
                        <th class="text-center">#local.column.label#</th>
                    </cfloop>
                </tr>
            </thead>
            <tbody>
                <cfloop query="qData" >
                    <tr class="border border-1">
                        <cfloop array="#arguments.columns#" item="local.column" index="local.index">
                                <td>#renderCell(
                                    column = #local.column#,
                                    data = queryGetRow(qData, qData.currentRow)
                                )#</td>
                        </cfloop>
                    </tr>
                </cfloop>
            </tbody>
        </table>


    </cffunction>

    <cffunction name="renderCell" access="public" returntype="any" output="false">
        <cfargument name="column" type="struct" required="true">
        <cfargument name="data" type="struct" required="true">
   
        <cfif arguments.column.keyExists('content')>
            <cfreturn arguments.column.content( arguments.data ) />
        </cfif>
        <cfreturn arguments.data[arguments.column.fieldName] />
    </cffunction>

</cfcomponent>