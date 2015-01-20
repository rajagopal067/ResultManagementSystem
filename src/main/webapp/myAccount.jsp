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
                <h1 class="page-header">Account Details
                    <small></small>
                </h1>
            </div>

        </div>
				
			<div class = "col-sm-6 mycontent-left">	
				<div class = "col-lg-12">
				<div class = "col-lg-4">
				<span><strong>Organization Name:</strong></span>
				</div>
				<div class = "col-lg-8">
				<a href="#" id="orgName" data-type="text" data-placement="right" data-title="Edit name of the organization">Chaithanya Bharathi Institute of Technology</a>
				</div>
				</div>
		
               
				<div class = "col-lg-12">
				<div class = "col-lg-4">
				<span><strong>Keyword:</strong></span>
				</div>
				<div class = "col-lg-8">
				<a href="#" id="orgKeyword" data-type="text" data-placement="right" data-title="Edit keyword">CBIT</a>
				</div>
				</div>
		
				
				<div class = "col-lg-12">
				<div class = "col-lg-4">
				<span><strong>Email:</strong></span>
				</div>
				<div class = "col-lg-8">
				<a href="#" id="orgEmail" data-type="text" data-placement="right" data-title="Edit email">principal@cbit.com</a>
				</div>
				</div>
		
				
				<div class = "col-lg-12">
				<div class = "col-lg-4">
				<span><strong>Phone Number:</strong></span>
				</div>
				<div class = "col-lg-8">
				<a href="#" id="orgPhonenumber" data-type="text" data-placement="right" data-title="Change mobile number">9445656147</a>
				</div>
				</div>
		
				<div class = "col-lg-12">
				<div class = "col-lg-4">
				<span><strong>Address:</strong></span>
				</div>
				<div class = "col-lg-8">
				<a href="#" id="orgAddress" data-type="textarea" data-placement="right" data-title="Edit Address">Add Address</a>
				</div>
				</div>
		
				<div class = "col-lg-12">
				<div class = "col-lg-4">
				<span><strong>Description:</strong></span>
				</div>
				<div class = "col-lg-8">
				<a href="#" id="orgDescription" data-type="textarea" data-placement="right" data-title="Edit description here">Add Description</a>
				</div>

				</div>
				
				</div>
				
			<div class = "col-sm-6">	
			
				<div class = "col-lg-12">
				<div class = "col-lg-8">
				<span><strong>Plan:</strong></span>
				</div>
				<div class = "col-lg-4">
				<span id = "basicPlan"><strong>Basic</strong></span>
				</div>
				</div>
		
				
				<div class = "col-lg-12">
				<div class = "col-lg-8">
				<span><strong>Date of subscription:</strong></span>
				</div>
				<div class = "col-lg-4">
				<span id = "dateSubscribed"><strong>4th May 2014</strong></span>
				</div>
				</div>
		
               
				<div class = "col-lg-12">
				<div class = "col-lg-8">
				<span><strong>SMS Credits Remaining:</strong></span>
				</div>
				<div class = "col-lg-4">
				<span id = "smsCreditsNumber"><strong>942</strong></span>
				</div>
				</div>
		
				
				<div class = "col-lg-12">
				<div class = "col-lg-8">
				<span><strong>SMS pulled so far:</strong></span>
				</div>
				<div class = "col-lg-4">
				<span id = "smsPulledNumber"><strong>58</strong></span>
				</div>
				</div>
		
				
				<div class = "col-lg-12">
				<div class = "col-lg-8">
				<span><strong>Number of entries</strong></span>
				</div>
				<div class = "col-lg-4">
				<span id = "entriesNumber"><strong>86</strong></span>
				</div>
				</div>
		
				</div>
				
	
	<div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Uploaded Data
                    <small> - Excel Sheets and Tables</small>
                </h1>
            </div>

        </div>
				
		<div class = "col-sm-12">	
			<!-- Insert Code here -->
		<button id="delete" type="button" class="btn btn-info">Delete Selected Data</button>
		<hr>			
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
     
    /* Add a click handler for the delete row */
    $('#delete').click( function() {
        var anSelected = fnGetSelected( oTable );
        if ( anSelected.length !== 0 ) {
            oTable.fnDeleteRow( anSelected[0] );
        }
    } );
     
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
