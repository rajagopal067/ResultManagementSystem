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

<!-- Add custom CSS here -->
<link href="css/custom.css" rel="stylesheet">
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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Smart Messaging
					Framework</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="home.jsp">Home</a></li>
					<li><a href="templates.jsp">Templates</a></li>
					<li><a href="home.jsp">FAQ</a></li>
					<li><a href="#">Starter Guide</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
     <div id="wrap">
	<div class="container">
    <div class="row">
				<h3>You can choose excel templates from <a href = "templates.jsp" target ="_blank"> our repository</a> for best results </h3>
				</div>
				<hr>
		<div class="row">
		
        <div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Upload</div>
				</div>
				<div class="panel-body">
					<form method="post" enctype="multipart/form-data" id="uploadform"
						class="form-horizontal" role="form"
						action="services/excelWithHeader">

						<div class="form-group">
							<label for="excelTitle" class="col-md-3 control-label">Excel
								Title</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="excelTitle"
									placeholder="No Special Characters">
							</div>
						</div>
						<div class="form-group">
							<label for="excelDescription" class="col-md-3 control-label">Excel
								Description</label>
							<div class="col-md-9">
								<textarea class="form-control" name="excelDescription" rows="3"
									placeholder="Optional"></textarea>
							</div>
						</div>


						<div class="form-group">
							<div class="col-md-offset-3 col-md-9">
								<div class="checkbox">
									<label> <input type="checkbox" id="sendHeaders">
										Send Headers
									</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="exampleInputFile" class="col-md-3 control-label">Upload
								Excel Sheet Here</label>
							<div class="col-md-9">
								<input type="file" id="exampleInputFile" name="file">
								<p class="help-block">Upload in .xls or .xlsx format only</p>
							</div>
						</div>



						<div class="form-group">
							<!-- Button -->
							<div class="col-md-offset-3 col-md-9">
								<button id="submitExcel" type="submit" class="btn btn-info"
									name="submit">
									<i class="icon-hand-right"></i> &nbsp Submit
								</button>
							</div>
						</div>


					</form>
				</div>
			</div>
		</div>
		<div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Test</div>
			</div>
			<div class="panel-body">
				<form id="testForm" class="form-horizontal" role="form">

                <p> You can send a sample SMS after you have uploaded an excel sheet and see how it works. </p>
                 <p> </p>
					<div class="form-group">
						<label for="smsText" class="col-md-3 control-label">SMS
							Text</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="smsText"
								placeholder="No Special Characters" id="query">
						</div>
					</div>


					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<button id="submitSms" type="button" class="btn btn-info">
								<i class="icon-hand-right"></i> &nbsp Send SMS
							</button>
						</div>
					</div>


					<div class="form-group">
						<label for="excelDescription" class="col-md-3 control-label">Test Result</label>
						<div class="col-md-9">
							<textarea class="form-control" name="excelDescription" rows="3"
								placeholder="The result will be displayed here" id="result"></textarea>
						</div>
					</div>


				</form>
	  
    </div>
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
	<script type="text/javascript">
		$("form#uploadform").submit(function(event) {

			//disable the default form submission
			event.preventDefault();

			//grab all form data  
			var formData = new FormData($(this)[0]);

			$.ajax({
				url : 'services/excel-upload',
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					alert(returndata.success);
				}
			});

			return false;
		});
		
		
		$("#submitSms").click(function(event) {

			//disable the default form submission
			event.preventDefault();

			$.ajax({
				url : 'services/results',
				type : 'GET',
				data : "query="+$("#query").val(),
				async : false,
				cache : false,
				contentType : "application/x-www-form-urlencoded",
				processData : false,
				success : function(returndata) {
					$("#result").val(returndata.success);
				}
			});

			return false;
		});
	</script>

</body>

</html>
