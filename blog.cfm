 <cfinclude template="header.cfm">
 <cfif structkeyexists(url, "id")>
    <cfset postid = url.id />
    <cfset post = entityLoad( "posts",postid,true)>
    <cfoutput>
  <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="jumbotron mediumpadding dark withbg text-center" style="background-image: url('img/pic1.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                      <h1>Starter Blog</h1>
                      <h4>A place where words Matter.</h4>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
               <div class="page-header" style="text-align: center">
                    <h2 >#post.title#</h2>
                    <span>#post.summary#</span>
                </div>
                <div class="blogboxexcerpt">
                    <p>#post.body#</p>
                    <cfset user = post.getUser()>                      
                    <p class="post-meta">Posted by <a href="user.cfm?id=#user.id#">#user.name#</a> on #post.dateposted#</p>
                </div>
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
                  <p>Blog post not found <a href="index.cfm">Home</a></p>
            </div>
        </div>
    </div>
</div>
</cfif>
<cfinclude template="footer.cfm">
    