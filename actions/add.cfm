<cfif (cgi.request_method IS "post") AND (structKeyExists(form, "addformSubmit"))> 
	<cfif (structKeyExists(form, "name")) AND (structKeyExists(form, "email") AND structKeyExists(form, "password"))>
		<cfset addUser(name=form.name, email=form.email,password=form.password) />
		<CFLOCATION url="#redirectURL#">
	<cfelse>
		<h1>please Enter all Details</h1>
	</cfif>
<cfelseif (cgi.request_method IS "post") AND (structKeyExists(form, "updateformSubmit"))>
	<cfif (structKeyExists(form, "name")) AND (structKeyExists(form, "email") AND structKeyExists(form, "password"))>
		
		<cfquery name="updateuser" datasource="mysqlsource" result="myResult">
			update users set name = '#form.name#',email= '#form.email#', password='#form.password#' where id = #form.id#
		</cfquery>
		<cfset redirectURL="../profile.cfm">
		<CFLOCATION url="#redirectURL#">
	<cfelse>
		<h1>please Enter all Details</h1>
	</cfif>
<cfelseif (cgi.request_method IS "post") AND (structKeyExists(form, "addPostSubmit"))>
<cfif (structKeyExists(form, "title")) AND (structKeyExists(form, "summary") AND structKeyExists(form, "body"))>
	<cfquery name="addblog" datasource="mysqlsource" result="myResult">
		INSERT INTO posts(title,summary,body,datePosted,createdDateTime,modifiedDateTime,deleted,user_id) VALUES ('#form.title#','#form.summary#','#form.body#',#now()#,#now()#,#now()#,0,#session.user.accountid#)
	</cfquery>	
	<cfset redirectURL="../blogs.cfm?reload=1">
	<CFLOCATION url="#redirectURL#">
<cfelse>
	<h1>please Enter all Details of blog post</h1>
</cfif>
<cfelseif (cgi.request_method IS "post") AND (structKeyExists(form, "loginformSubmit"))>
	<cfif  (structKeyExists(form, "email") AND structKeyExists(form, "password"))>
		<cfquery name="login" datasource="mysqlsource" result="myResult">
			Select * from users where email = '#form.email#' and password = '#form.password#'
		</cfquery>
		<cfif myResult.RECORDCOUNT EQ 1>
			<cfoutput>Logined</cfoutput>
			<cfset session.user = {
        			authorized = true
        			, admin = false
        			, name = '#login.name#'
        			, username = '#login.email#'
        			, accountid = '#login.id#'
    				} />
    		<cfset redirectURL="../blogs.cfm">
			<CFLOCATION url="#redirectURL#">
		<cfelse>
			<cfoutput>not Logined</cfoutput>
		</cfif>

		
	<cfelse>
		<h1>please Enter all Details</h1>
	</cfif>
<cfelseif structKeyExists(url, "deleteid")>
	<cfquery name="deleteuser" datasource="mysqlsource">
		delete from users where id = #url.deleteid#
	</cfquery>
	<cfset redirectURL="../blogs.cfm">
	<CFLOCATION url="#redirectURL#">
<cfelseif (cgi.request_method IS "post") AND (structKeyExists(form, "logoutbtn"))>
	<cfset structdelete(session, "user") />
	<cfset redirectURL="../login.cfm">
	<CFLOCATION url="#redirectURL#">
</cfif>
<cfscript>
	function addUser(name,email,password){
		// WriteOutput(name);
		// WriteOutput(email);
		// WriteOutput(password);
		
		query="INSERT INTO users(name,email,password)VALUES(:name,:email,:password)";
		myQry = new Query();
		myQry.setDatasource("mysqlsource");
		myQry.setSQL(query);
		//adding parameter
		myQry.addParam(name: "name", value: "#name#", cfsqltype: "CF_SQL_VARCHAR");
		myQry.addParam(name: "email", value: "#email#", cfsqltype: "CF_SQL_VARCHAR");
		myQry.addParam(name: "password", value: "#password#", cfsqltype: "CF_SQL_VARCHAR");
		user = myQry.execute(); 
		redirectURL ="../login.cfm";
	}
</cfscript>