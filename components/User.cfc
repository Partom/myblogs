<cfcomponent>
	<cffunction name="getFullName" access="remote" returnType="string" returnformat="JSON">
	    <cfargument name="firstName" type="string" required="false" default="" />
	    <cfargument name="lastName" type="string" required="false" default="" />
	    <cfset var fullName ="#arguments.firstName &' '& arguments.lastname#" />
	    <cfreturn fullName />
	</cffunction>
	<cffunction name="getLocalTime">
		<cfoutput>#TimeFormat(now())#</cfoutput>
	</cffunction> 
</cfcomponent>