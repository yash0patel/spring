<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Signup - What's Inside</title>
<jsp:include page="HeaderLink.jsp"></jsp:include>
</head>
<body class="h-100">
	<div id="main-wrapper">
		<!--**********************************
            Nav header start
        ***********************************-->
		<jsp:include page="AdminNavbar.jsp"></jsp:include>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<jsp:include page="AdminHeader.jsp"></jsp:include>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<jsp:include page="AdminSidebar.jsp"></jsp:include>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<div class="content-body">


			<div class="authincation h-100">
				<div class="container-fluid h-100">
					<div class="row justify-content-center h-100 align-items-center">
						<div class="col-md-6">
							<div class="authincation-content">
								<div class="row no-gutters">
									<div class="col-xl-12">
										<div class="auth-form">
											<h4 class="text-center mb-4">Sign up your account</h4>
											<form action="saveuser" method="post" novalidate>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6">
															<label><strong>First Name</strong></label> <input
																type="text" class="form-control"
																placeholder="First name" name="firstName"> <span
																class="text-danger">${result.getFieldError("firstName").getDefaultMessage()}</span>
														</div>
														<div class="col-sm-6 mt-2 mt-sm-0">
															<label><strong>Last Name</strong></label> <input
																type="text" class="form-control" placeholder="Last name"
																name="lastName"> <span class="text-danger">${result.getFieldError("lastName").getDefaultMessage()}</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label><strong>Gender</strong></label>
													<div class="form-group">
														<label class="radio-inline mr-3"> <input
															type="radio" name="gender" value="male"> Male
														</label> <label class="radio-inline"> <input type="radio"
															name="gender" value="female"> Female
														</label>
													</div>
													<span class="text-danger">${result.getFieldError("gender").getDefaultMessage()}</span>
												</div>

												<div class="form-group">
													<label><strong>Email</strong></label> <input type="email"
														class="form-control" placeholder="hello@example.com"
														name="email"> <span class="text-danger">${result.getFieldError("email").getDefaultMessage()}</span>
												</div>
												<div class="form-group">
													<label><strong>Password</strong></label> <input
														type="password" class="form-control"
														placeholder="Password" name="password"> <span
														class="text-danger">${result.getFieldError("password").getDefaultMessage()}</span>
												</div>
												<div class="text-center mt-4">
													<button type="submit" class="btn btn-primary btn-block">Sign
														me up</button>
												</div>
											</form>
											<div class="new-account mt-3">
												<p>
													Already have an account? <a class="text-primary"
														href="${pageContext.request.contextPath}/login">Sign
														in</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************
            Footer start
        ***********************************-->
		<jsp:include page="Footer.jsp"></jsp:include>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<!--**********************************
        Scripts
    ***********************************-->
	<jsp:include page="Scripts.jsp"></jsp:include>
</body>

</html>