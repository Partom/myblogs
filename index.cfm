<cfinclude template="header.cfm">
<div class="carousel fade-carousel slide sliderstyle" data-ride="carousel" data-interval="4000" id="bs-carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
    <li data-target="#bs-carousel" data-slide-to="1"></li>
    <li data-target="#bs-carousel" data-slide-to="2"></li>
  </ol>
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item slides active withbg">
      <div class="slide-1" style="background-image:url(img/slider1.jpg);"></div>
      <div class="hero text-center">
        <hgroup>
            <h1>Words Matter</h1>
            <h3>Write Your Next Awesome Post</h3>
        </hgroup>
        <a class="btn btn-white btn-lg btnghost btnround" role="button" href="blogs.cfm">See all Blogs</a>
      </div>
    </div>
    <div class="item slides withbg">
      <div class="slide-2" style="background-image:url(https://images.unsplash.com/photo-1472461936147-645e2f311a2b?dpr=1&auto=compress,format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=);"></div>
      <div class="hero text-center">
        <hgroup>
            <h1>Share Words</h1>
            <h3>Get Start With Your Next Awesome Writing Experience</h3>
        </hgroup>
    <a class="btn btn-danger btn-lg btnround" role="button" href="blogs.cfm">See all Blogs</a>
      </div>
    </div>
    <div class="item slides withbg">
      <div class="slide-3" style="background-image:url(https://images.unsplash.com/photo-1472461936147-645e2f311a2b?dpr=1&auto=compress,format&fit=crop&w=1199&h=799&q=80&cs=tinysrgb&crop=);"></div>
      <div class="hero text-center">
        <hgroup>
            <h1>Discover Honesty</h1>
            <h3>Explore New Awesome Blog Post</h3>
        </hgroup>
          <a class="btn btn-success btn-lg btnround" role="button" href="login.cfm">Login now</a>
      </div>
    </div>
  </div>
</div>


<div class="title-header gray">
  <div class="container">
  <h1>Our Featured Blog Post</h1>
  <p class="lead">Read and Explore words.</p>
</div>
</div>
<div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <cfset posts = entityLoad( "posts")>

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
                </cfoutput>
                <!-- Pager -->
                <ul class="pager">
                    <li class="next">
                        <a href="blogs.cfm">All Posts &rarr;</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

<cfinclude template="footer.cfm">
<script>
	 $(document).ready(function(){
	 	$.get('components/User.cfc?method=getFullName&firstName=Aashir&lastName=Ch',function(data, status){
        	$('#author span').html("<strong>"+data+"</strong>")
    	});
	 });
	
</script>