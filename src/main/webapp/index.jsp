<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Smart Messaging Framework</title>

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
			<div id="loginbox" style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign In</div>
						<div
							style="float: right; font-size: 80%; position: relative; top: -10px">
							<a href="#">Forgot password?</a>
						</div>
					</div>

					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<form id="loginform" class="form-horizontal" role="form"
							method="post">

							<div class="form-group">
								<label for="keyword" class="col-md-4 control-label">Keyword</label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="keyword"
										placeholder="">
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="col-md-4 control-label">Password</label>
								<div class="col-md-7">
									<input type="password" class="form-control" name="password"
										placeholder="">
								</div>
							</div>


							<div class="form-group">
								<!-- Button -->
								<div class="col-md-offset-4 col-md-11">
									<button id="btn-signin" type="submit" class="btn btn-info">
										<i class="icon-hand-right"></i> &nbsp Sign In
									</button>
								</div>
							</div>


							<div class="form-group">
								<div class="col-md-12 control">
									<div
										style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
										Don't have an account! <a href="#"
											onClick="$('#loginbox').hide(); $('#signupbox').show()">
											Sign Up Here </a>
									</div>
								</div>
							</div>
						</form>



					</div>
				</div>
			</div>
			<div id="signupbox" style="display: none; margin-top: 50px"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign Up</div>
						<div
							style="float: right; font-size: 85%; position: relative; top: -10px">
							<a id="signinlink" href="#"
								onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign
								In</a>
						</div>
					</div>
					<div class="panel-body">
						<form id="signupform" class="form-horizontal" method="post"
							role="form">

							<div id="signupalert" style="display: none"
								class="alert alert-danger">
								<p>Error:</p>
								<span></span>
							</div>


							<div class="form-group">
								<label for="orgname" class="col-md-4 control-label">Organization
									Name</label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="orgname"
										placeholder="Full Name">
								</div>
							</div>

							<div class="form-group">
								<label for="keyword" class="col-md-4 control-label">Keyword</label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="keyword" id="keyword"
										placeholder="Short code identifier">
										<p></p>
									 <button id="btn-keywordCheck"class="btn btn-info">Check Availability</button>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="col-md-4 control-label">Email</label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="email"
										placeholder="Email Address">
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="col-md-4 control-label">Set
									Password</label>
								<div class="col-md-7">
									<input type="password" class="form-control" name="password"
										placeholder="Password">
								</div>
							</div>

							<div class="form-group">
								<label for="confirmPassword" class="col-md-4 control-label">Confirm
									Password</label>
								<div class="col-md-7">
									<input type="password" class="form-control"
										name="confirmPassword" placeholder="Retype Password">
								</div>
							</div>

							<div class="form-group">
								<label for="phone" class="col-md-4 control-label">Phone
									Number</label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="phone"
										placeholder="Numbers only">
								</div>
							</div>

							<div class="form-group">
							<label for="address" class="col-md-4 control-label">Address</label>
								<div class="col-md-7">
									<textarea class="form-control" name="address" rows="3"
										placeholder="Optional" id="address"></textarea>
								</div>
							</div>


							<div class="form-group">
								<!-- Button -->
								<div class="col-md-offset-4 col-md-11">
									<button id="btn-signup" type="button" class="btn btn-info">
										<i class="icon-hand-right"></i> &nbsp Sign Up
									</button>
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>


		</div>

		<!-- Login and signout -->
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
	<script src="js/bootstrapValidator.js"></script>
	<script>

$(document).ready(function(){
    $('#btn-signin').click(function(){
        $.ajax({
            type: "POST",
            url: "user-services/signin",
            data: $("#loginform").serialize(),
            dataType: "json",
            contentType : "application/x-www-form-urlencoded",
            success: function(output){
            alert(output.success);              
            },
            error: function(){
           alert("Yakki");
          }
    });
});


    $('#btn-keywordCheck').click(function(){
        $.ajax({
            url: "user-services/reservedKeyCheck",
			type : 'GET',
			data : "keyword="+$("#keyword").val(),
			async : false,
			cache : false,
			contentType : "application/x-www-form-urlencoded",
			processData : false,
            success: function(output){
            alert(output.success);              
            },
            error: function(){
           alert("Yakki");
          }
    });
    });

    $('#btn-signup').click(function(){
        $.ajax({
            type: "POST",
            url: "user-services/signup",
            data: $("#signupform").serialize(),
            dataType: "json",
            contentType : "application/x-www-form-urlencoded",
                success: function(output){
                alert(output.success);              
                },
                error: function(){
               alert("Yakki");
              }
    });
});

$('#loginform').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: 'The keyword is not valid',
                validators: {
                    notEmpty: {
                        message: 'The keyword is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The keyword must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The keyword can only consist of alphabetical, number, dot and underscore'
                    }
//                     remote: {
//                         url: 'user-services/reservedKeyCheck',
//                         data: function(validator) {
//                             // validator is the plugin instance

//                             // Returns an object which is used to send to remote URL
//                             // For example, the sample code below posts the username to remote URL:
//                             return {
//                                  username: validator.getFieldElements('username').val()
//                              };
//                         }
                }
                          
            },
            passWrd: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    }
                }
            }
        }
    });

    $('#signupform').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
		 orgName: {
                validators: {
                    notEmpty: {
                        message: 'The firstname is required and can\'t be empty'
                    }
                }
            },
		
            Keyword: {
                message: 'The keyword is not valid',
                validators: {
                    notEmpty: {
                        message: 'The keyword is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 3,
                        max: 10,
                        message: 'The keyword must be more than 3 and less than 10 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The keyword can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
           
           phoneNumber: {
                validators: {
                    digits: {
                        message: 'The value can contain only digits'
                    }
                }
            }
            
        }
    });
	
});


    </script>


</body>

</html>
