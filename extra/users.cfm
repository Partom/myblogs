<cfinclude template="header.cfm">
<cfif structkeyexists(session, "user")>
<cfquery name="users" datasource="mysqlsource"> 
    SELECT * FROM users
</cfquery>

<div class="container">

      <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	        <div class="page-header">
	          <h2>Users</h2>
	        </div>
	        <table class="table">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Name</th>
			      <th scope="col">Email</th>
			      <th scope="col">Password</th>
			      <th scope="col">Operations</th>

			    </tr>
			  </thead>
			  <tbody>
			  	<cfloop query="users">
			  	<cfoutput>
    				<tr>
				      <th scope="row">#users.id#</th>
				      <td>#users.name#</td>
				      <td>#users.email#</td>
				      <td>#users.password#</td>
				      <td>
				      	<a href="edituser.cfm?id=#users.id#" class="btn btn-success btnsquare">Edit</a>
				      	<a onclick="deleteUser(#users.id#)" class="btn btn-danger btnsquare">Delete</a>
				      </td>
				    </tr>
				</cfoutput>
				</cfloop>
			  </tbody>
			</table>
	    </div>
	</div>
</div>

<script>
	function deleteUser(id){
		if(confirm("are you sure you want to Delete user?")){
			console.log("yes");
			window.location = "actions/add.cfm?deleteid="+id;
		}
	}
	</script>
<cfelse>
	  <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	        <div class="page-header">
	          <h2>Users</h2>
	        </div>
	        <p>You are not Authurized <a href="login.cfm">Login</a></p>
	    </div>
	</div>
</cfif>
<cfinclude template="footer.cfm">