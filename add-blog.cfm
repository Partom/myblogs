<cfinclude template="header.cfm">
<cfif structkeyexists(session, "user")>
	<div class="container">
      <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	        <div class="page-header">
	          <h2>Add Blog Post</h2>
	        </div>
	        <form action="actions/add.cfm" method="post">
	          <div class="form-group">
	            <label for="Title">Title</label>
	            <input type="text"	 class="form-control" name="title" placeholder="name">
	          </div>
	          <div class="form-group">
	            <label for="Summary">Summary</label>
	            <textarea class="form-control" name="summary" placeholder="Summary"></textarea>
	          </div>
	          <div class="form-group">
	            <label for="content">Content</label>
	            <textarea class="form-control" style="height: 250px" name="body" placeholder="Post Content"></textarea>
	          </div>
	          <button type="submit" name="addPostSubmit" class="btn btn-inverse btnsquare">Add Blog Post</button>
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
	          <h2>Add Blog Post</h2>
	        </div>
	        <div>
	        	  <p>You are not Authurized <a href="login.cfm">Login</a></p>
	        </div>
	  	</div>
	</div>
</div>
</cfif>


<cfinclude template="footer.cfm">