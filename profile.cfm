<cfinclude template="header.cfm">
<cfif structkeyexists(session, "user")>
<!--- 
<cfquery name="user" datasource="mysqlsource"> 
    SELECT * FROM users WHERE id = #session.user.accountid#
</cfquery> --->
<cfset user = entityLoad( "users",session.user.accountid,true)>
 <cfoutput>
    <header class="jumbotron mediumpadding dark withbg text-center" style="background-image: url('img/pic1.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                      <h1>#user.name#</h1>
                      <h4>#user.email#</h4>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <a class="btn btn-primary btn-sm" href="settings.cfm" style="float: right;"><i class="fa fa-plus"></i> Update Profile</a>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">

            <div class="page-header">
	          <h2 style="text-align: center">My Blog Posts</h2>

	        </div>
               
                <cfif user.hasPost()>
                		<cfloop array="#user.getPosts()#" index="post">
                        <cfif (post.deleted eq 1)>
                            <a href="actions/add.cfm?action=undeletepost&postid=#post.id#&accessid=#user.id#" class="btn btn-success btn-circle"><i class="fa fa-check" data-toggle="tooltip" data-placement="top" title="UnDelete Post!"></i></a>
                        <cfelse>
                            <a href="actions/add.cfm?action=deletepost&postid=#post.id#&accessid=#user.id#" class="btn btn-danger btn-circle" data-toggle="tooltip" data-placement="top" title="Delete Post!"><i class="fa fa-close"></i></a>
                        </cfif>
                          
                        <div class="blogboxexcerpt">
                            <a href="blog.cfm?id=#post.id#">
                                <h2 class="post-title">
                                    #post.title#
                                </h2>
                                <h4 class="post-subtitle">
                                     #post.summary#
                                </h4>
                            </a>
                        
                    <p class="post-meta">Posted by <a href="profile.cfm">#user.name#</a> on #post.dateposted#</p>
                        </div>
                        <hr>
                    </cfloop>
                <cfelse>
                	<p>No blog posts yet</p>
                	<hr>
                </cfif>
            </div>
        </div>
    </div>
</cfoutput>
<cfelse>
<div class="container">
    <div class="row demo-row">
      	<div class="col-md-2"></div>
	  	<div class="col-md-8">
	  		<div class="page-header">
	          <h2>Profile</h2>
	        </div>
	        <div>
	        	  <p>You are not Authurized <a href="login.cfm">Login</a></p>
	        </div>
	  	</div>
	</div>
</div>
</cfif>


<cfinclude template="footer.cfm">

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>