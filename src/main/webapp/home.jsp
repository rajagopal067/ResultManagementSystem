<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/custom.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <style>
    body {
        margin-top: 60px;
    }
    </style>

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
	  <h4>Welcome Gokaraju Rangaraju Institute of Engineering and Technology</h4>
	  <h4> Your Primary Key Word is: "<strong>GRIET</strong>" </h4>
	  <h4> For getting started visit <a href = "guide.jsp" target="_blank"> our starter guide </a> </h4>	  
	</div>
   
	
  <hr>
  <div class="row">
    <div class="col-sm-6">
      <div class="tile orange" onclick="location.href='myAccount.jsp';" style="cursor: pointer;">
        <h3 class="title">My Account</h3>
        <p>Edit your account information and view credits and uploaded data</p>
      </div>
    </div>
	<div class="col-sm-6">
      <div class="tile gold" onclick="location.href='reports.jsp';" style="cursor: pointer;">
        <h3 class="title">Reports</h3>
        <p>View logs and know who pulled your data through SMS</p>
      </div>
    </div> 
	
    
    
  </div> 

  <div class="row">
    <div class="col-sm-6">
      <div class="tile green" onclick="location.href='#';" style="cursor: pointer;">
        <h3 class="title">Add a table</h3>
        <p>Test whether the data you have uploaded can be pulled through SMS accurately</p>
      </div>
    </div>
	<div class="col-sm-6">
      <div class="tile purple"  onclick="location.href='uploadExcel.jsp';" style="cursor: pointer;">
        <h3 class="title">Upload an Excel Sheet</h3>
        <p>Please upload excel sheets in .xls or .xlsx format only</p>
      </div>
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
