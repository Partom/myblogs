<cfinclude template="header.cfm">
<cfif structkeyexists(session, "user")>
<cfset editid = session.user.accountId />
<cfset user = entityLoad( "users",session.user.accountid,true)>
<div class="container">

      <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	        <div class="page-header">
	          <h2>User Update</h2>
	        </div>
	        <form  action="actions/add.cfm" method="post">
	        <cfoutput>
	          <div class="form-group">
	            <label for="ID">ID</label>
	            <input type="text" class="form-control" name="id" placeholder="ID" value="#user.id#" readonly>
	          </div>
	          <div class="form-group">
	            <label for="Name">Name</label>
	            <input type="text" class="form-control" name="name" placeholder="name" value="#user.name#">
	          </div>
	          <div class="form-group">
	            <label for="Email">Email address</label>
	            <input type="email" class="form-control" name="email" placeholder="Email" value="#user.email#">
	          </div>
	          <div class="form-group">
	            <label for="Password">Password</label>
	            <input type="password" class="form-control" name="Password" placeholder="Password" value="#user.password#">
	          </div>
	      </cfoutput>
	          <button type="submit" name="updateformSubmit" class="btn btn-inverse btnsquare">Update Profile</button>
	        </form>
	    </div>
	</div>
</div>
<cfelse>
<div class="container">
    <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	  		<div class="page-header">
	          <h2>Profile</h2>
	        </div>
	        <div>
	        	  <p>You are not Authorized. Please <a href="login.cfm">Login</a>!</p>
	        </div>
	  	</div>
	</div>
</div>
</cfif>
<cfinclude template="footer.cfm">