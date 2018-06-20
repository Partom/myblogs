 <cfinclude template="header.cfm">

<cfif (structKeyExists(url, "page"))>
    <cfset page = url.page />
<cfelse>   
    <cfset page = 0 >  
</cfif> 
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
                <cfset posts = entityLoad( "posts",{deleted=0},"dateposted Desc",{offset= page*3, maxResults=3})>

                <cfoutput>
                    <cfloop array="#posts#" index="post">
                        <div class="blogboxexcerpt">
                            <a href="blog.cfm?id=#post.id#">
                                <h2 class="post-title">
                                    #post.title#
                                </h2>
                                <h4 class="post-subtitle">
                                     #post.summary#
                                </h4>
                            </a>
                            <cfset user = post.getUser()>
                            <p class="post-meta">Posted by <a href="user.cfm?id=#user.id#">#user.name#</a> on #post.dateposted#</p>
                        </div>
                        <hr>
                    </cfloop>
                
                <!-- Pager -->
                <ul class="pager">
                    
                    <li class="next" >
                        <a href="blogs.cfm?page=#page+1#">Older Posts &rarr;</a>
                    </li>
                    <cfif (page gt 0)>
                        <li class="back" style="float: left;">
                            <a href="blogs.cfm?page=#page-1#">Newer Posts &larr;</a>
                        </li>
                    </cfif> 

                </ul>
                </cfoutput>
            </div>
        </div>
    </div>
<cfinclude template="footer.cfm">
    