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
<link href="css/bootstrap-editable.css" rel="stylesheet">
<link href="css/datatables.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">

<!-- Add custom CSS here -->
<style>
body {
	margin-top: 20px;
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
  <div id ="wrap">
	<div class="container">
	
	
		
	<div class="row">

            <div class="col-lg-12">
                <h1 class="page-header"> Users in Queue
                    <small>To be verified</small>
                </h1>
            </div>

    </div>
			
		<div class = "col-sm-12">	
			<!-- Insert Code here 
		<button id="delete" type="button" class="btn btn-info">Delete Selected Data</button>
		<hr>		-->	
		<table id="example" class="table">
	<thead>
		<tr>
			<th>S.No</th>
			<th>Excel Title</th>
			<th>Date & Time</th>
			<th>Excel Description</th>
			<th>Contains Headers</th>
		</tr>
	</thead>
	<tbody>
		<tr class="odd gradeX">
			<td>Trident</td>
			<td>Internet
				 Explorer 4.0</td>
			<td>Win 95+</td>
			<td class="center"> 4</td>
			<td class="center">X21123123123123 e2112123</td>
		</tr>
		<tr class="even gradeC">
			<td>Trident</td>
			<td>Internet
				 Explorer 5.0</td>
			<td>Win 95+</td>
			<td class="center">5</td>
			<td class="center">C</td>
		</tr>
		<tr class="gradeC">
			<td>Misc</td>
			<td>PSP browser</td>
			<td>PSP</td>
			<td class="center">-</td>
			<td class="center">C</td>
		</tr>
		<tr class="gradeU">
			<td>Other browsers</td>
			<td>All others</td>
			<td>-</td>
			<td class="center">-</td>
			<td class="center">U</td>
		</tr>
	</tbody>
	</table>
	
	
		
			<!-- End Code here -->
			</div>
				
	<div class="row">

            <div class="col-lg-12">
                <h1 class="page-header"> Approve User
                    <small>Admin Page</small>
                </h1>
            </div>

    </div>
	
	<div class="col-md-5">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Approve</div>
			</div>
			<div class="panel-body">
				<form id="approveForm" class="form-horizontal" role="form">

					<div class="form-group">
						<label for="keyword" class="col-md-3 control-label">Keyword</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="smsText" placeholder="Verified" id="approvedKeyword">
						</div>
					</div>


					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<button id="submitApproval" type="button" class="btn btn-info">
								<i class="icon-hand-right"></i> Approve
							</button>
						</div>
					</div>

				</form>
	  
			</div>
			</div>
			
			
		</div>
		
	<div class="col-md-5 col-md-offset-1">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<div class="panel-title">Discard</div>
			</div>
			<div class="panel-body">
				<form id="discardForm" class="form-horizontal" role="form">

					<div class="form-group">
						<label for="keyword" class="col-md-3 control-label">Keyword</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="smsText" placeholder="Verified" id="discardKeyword">
						</div>
					</div>


					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<button id="submitDiscard" type="button" class="btn btn-danger">
								<i class="icon-hand-right"></i> Discard
							</button>
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
                    <p class="muted credit">Copyright &copy; Criticalys 2014</p>
                </div>
          
   </div>
	
	
	


	<!-- JavaScript -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.js"></script>
	 <script src="js/bootstrap-editable.min.js"></script>
	 <script src="js/jquery.dataTables.js"></script>
	<script src="js/datatables.js"></script>
	 
	 <!-- for tables-->
   
	<script type="text/javascript">
		var oTable;
	$(document).ready(function() {
	
	
    //make username editable
    $('#orgName').editable();
	$('#orgKeyword').editable();
	$('#orgEmail').editable();
	$('#orgPhonenumber').editable();
	$('#orgDescription').editable();
	$('#orgAddress').editable();
	

 

    /* Add a click handler to the rows - this could be used as a callback */
    $("#example tbody tr").click( function( e ) {
        if ( $(this).hasClass('row_selected') ) {
            $(this).removeClass('row_selected');
        }
        else {
            oTable.$('tr.row_selected').removeClass('row_selected');
            $(this).addClass('row_selected');
        }
    });
     
    /* Add a click handler for the delete row 
    $('#delete').click( function() {
        var anSelected = fnGetSelected( oTable );
        if ( anSelected.length !== 0 ) {
            oTable.fnDeleteRow( anSelected[0] );
        }
    } ); */
     
    /* Init the table */
    oTable = $('#example').dataTable( );

 
 
/* Get the rows which are currently selected */
function fnGetSelected( oTableLocal )
{
    return oTableLocal.$('tr.row_selected');
}

	
	
    
    //make status editable
   /*  $('#status').editable({
        type: 'select',
        title: 'Select status',
        placement: 'right',
        value: 2,
        source: [
            {value: 1, text: 'status 1'},
            {value: 2, text: 'status 2'},
            {value: 3, text: 'status 3'}
        ]
        /*
        uncomment these lines to send data on server
        ,pk: 1
        ,url: '/post'
     
    }); */
});
</script>
    </body>

</html>
