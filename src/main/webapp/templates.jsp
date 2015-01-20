<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Templates Criticalys</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS for the 'Thumbnail Gallery' Template -->
    <link href="css/custom.css" rel="stylesheet">
</head>

<body>

   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Smart Messaging Framework</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="home.jsp">Home</a>
                    </li>
                    <li><a href="templates.jsp">Templates</a>
                    </li>
					<li><a href="home.jsp">FAQ</a>
                    </li>
                    <li><a href="#">Starter Guide</a>
                    </li>
					
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	
 <div id="wrap">
    <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Data Templates
                    <small>Configurable</small>
                </h1>
            </div>

        </div>

         <div class="row">

             <div class="row">
			<div class="col-sm-4">
				<div class="tile orange" onclick="location.href='templateDetail.jsp';" style="cursor: pointer;">
					<h3 class="title">Results Management System</h3>
					<p>Colleges/schools can publish the exam results</p>
				</div>
			</div>
			
	<div class="col-sm-4">
      <div class="tile gold" onclick="location.href='templateDetail.jsp';" style="cursor: pointer;">
        <h3 class="title">SMS Site</h3>
        <p>Build a concise site on SMS and grow your brand</p>
      </div>
    </div> 
	
	<div class="col-sm-4">
      <div class="tile green" onclick="location.href='templateDetail.jsp';" style="cursor: pointer;">
        <h3 class="title">Notice Board</h3>
        <p>Let the users pull the notices of your organization</p>
      </div>
    </div>
	
    
    
  </div> 


        </div>

        <hr>

        <div class="row text-center">

            <div class="col-lg-12">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a>
                    </li>
                    <li class="active"><a href="#">1</a>
                    </li>
                    <li><a href="#">2</a>
                    </li>
                    <li><a href="#">3</a>
                    </li>
                    <li><a href="#">4</a>
                    </li>
                    <li><a href="#">5</a>
                    </li>
                    <li><a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>

        </div>


    </div>
	
	<div id="push"></div>
    
	</div>
	
	<div id="footer">
          
                <div class="container">
				<p></p>
                    <p class="muted credit">Copyright &copy; Criticalys 2014</p>
                </div>
          
        </div>
	
    <!-- /.container -->
	


    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

</html>
