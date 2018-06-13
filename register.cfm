<cfinclude template="header.cfm">

<div class="container">

      <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	        <div class="page-header">
	          <h2>User Registeration</h2>
	        </div>
	        <form  action="actions/add.cfm" method="post">
	          <div class="form-group">
	            <label for="Name">Name</label>
	            <input type="text" class="form-control" name="name" placeholder="name">
	          </div>
	          <div class="form-group">
	            <label for="Email">Email address</label>
	            <input type="email" class="form-control" name="email" placeholder="Email">
	          </div>
	          <div class="form-group">
	            <label for="Password">Password</label>
	            <input type="password" class="form-control" name="Password" placeholder="Password">
	          </div>
	          <button type="submit" name="addformSubmit" class="btn btn-inverse btnsquare">Add User</button>
	        </form>
	    </div>
	</div>
</div>

<cfinclude template="footer.cfm">