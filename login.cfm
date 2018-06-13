<cfinclude template="header.cfm">
<cfif structkeyexists(session, "user")>
	<cfset redirectURL="users.cfm">
	<CFLOCATION url="#redirectURL#">
<cfelse>
<div class="container">

      <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	        <div class="page-header">
	          <h2>User Login</h2>
	        </div>
	        <form  action="actions/add.cfm" method="post">
	          <div class="form-group">
	            <label for="Email">Email address</label>
	            <input type="email" class="form-control" name="email" placeholder="Email">
	          </div>
	          <div class="form-group">
	            <label for="Password">Password</label>
	            <input type="password" class="form-control" name="Password" placeholder="Password">
	          </div>
	          <button type="submit" name="loginformSubmit" class="btn btn-inverse btnsquare">Login</button>
	        </form>
	    </div>
	</div>
</div>
</cfif>

<cfinclude template="footer.cfm">