<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SacCFUG Backbone Demo: Routes</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
  </head>

  <body id="appview">

    <div class="topbar">
      <div class="fill">
        <div class="container">
          <a class="brand" href="#!/home">SacCFUG</a>
          <ul class="nav">
            <li><a href="#!/home">Home</a></li>
            <li><a href="#!/about">About</a></li>
            <li><a href="#!/contact">Contact</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div id="main-container" class="container">
      <footer id="footer">
        <p>&copy; SacCFUG 2011</p>
      </footer>
    </div> <!-- /container -->
  </body>
	<cfinclude template="templates/static.cfm">
	<cfinclude template="templates/product.cfm">
	<script src="js/libs/json2.js"></script>
	<script src="js/libs/jquery-1.6.4.min.js"></script>
	<script src="js/libs/underscore-min.js"></script>
	<script src="js/libs/backbone.js"></script>
	
	<script src="js/backbone-settings.js"></script>
	
	<script src="js/routes/main.js"></script>
	
	<script src="js/models/product.js"></script>
	
	<script src="js/views/product-view.js"></script>
	<script src="js/views/app-view.js"></script>
</html>
