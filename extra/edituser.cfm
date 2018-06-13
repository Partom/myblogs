<cfinclude template="header.cfm">
<cfset editid = url.id />
<cfquery name="user" datasource="mysqlsource"> 
    SELECT * FROM users WHERE id = #editid#
</cfquery>

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
	          <button type="submit" name="updateformSubmit" class="btn btn-inverse btnsquare">Update User</button>
	        </form>
	    </div>
	</div>
</div>

<cfinclude template="footer.cfm">