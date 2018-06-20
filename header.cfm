<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ColdFusion Site</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
   

    <!-- Theme CSS -->
    <link href="wowbootstrap.css" rel="stylesheet">
    <!--fa icons css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link href="css/custom.css" rel="stylesheet"> 
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
      <div class="container">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header page-scroll">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  Menu <i class="fa fa-bars"></i>
              </button>
              <a class="navbar-brand nopadding" href="index.cfm"><h4>ColdFusion Site</h4></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
                  <li>
                      <a href="index.cfm">Home</a>
                  </li>
                  <li>
                      <a href="blogs.cfm">Blogs</a>
                  </li>
                  <li>
                      <a href="about.cfm" >About</a>
                  </li>
                  <li>
                      <a href="contact.cfm">Contact</a>
                  </li>
                  <cfif structkeyexists(session, "user")>
                    
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <cfoutput> #session.user.name# </cfoutput><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                    <li>
                      <a href="profile.cfm">Profile</a>
                    </li>
                    <li>
                      <a href="add-blog.cfm">Add a new Blog</a>
                    </li>
                    <li>
                      <form action="actions/add.cfm" method="post">
                        <input type="submit" class="btn btn-link" name="logoutbtn" value="Logout">
                      </form>
                    </li>
                    </ul>
                  </li>
                 
                  <cfelse>
                    <li>
                      <a href="login.cfm">Login</a>
                    </li>
                    <li>
                      <a href="register.cfm">Register</a>
                     </li>
                  </cfif>
              </ul>
          </div>
          <!-- /.navbar-collapse -->
      </div>
      <!-- /.container -->
  </nav>