<cfset structClear(session) />
<cflocation url="index.cfm?message=session_expired" addtoken="false" />