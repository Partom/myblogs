<cfinclude template="header.cfm">
<cfif structkeyexists(url, "id")>
<!--- 
<cfquery name="user" datasource="mysqlsource"> 
    SELECT * FROM users WHERE id = #session.user.accountid#
</cfquery> --->
 <cfset userid = url.id />
<cfset user = entityLoad( "users",userid,true)>
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
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            <div class="page-header">
	          <h2 style="text-align: center">Blogs</h2>
	        </div>
               
                <cfif user.hasPost()>
                		<cfloop array="#user.getPosts()#" index="post">
                        <cfif (post.deleted eq 0)>
                        <div class="blogboxexcerpt">
                            <a href="blog.cfm?id=#post.id#">
                                <h2 class="post-title">
                                    #post.title#
                                </h2>
                                <h4 class="post-subtitle">
                                     #post.summary#
                                </h4>
                            </a>
                        
                        <p class="post-meta">Posted by <a href="user.cfm?id=#user.id#">#user.name#</a> on #post.dateposted#</p>
                        </div>
                        <hr>
                        </cfif>
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
	        	  <p>User not found <a href="index.cfm">Home</a></p>
	        </div>
	  	</div>
	</div>
</div>
</cfif>


<cfinclude template="footer.cfm">