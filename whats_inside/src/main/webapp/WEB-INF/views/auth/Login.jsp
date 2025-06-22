
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Login - what's inside</title>
<jsp:include page="../includes/HeaderLink.jsp"></jsp:include>

</head>

<body class="h-100">
	<div id="main-wrapper">
		<!--**********************************
            Nav header start
        ***********************************-->
		<jsp:include page="../layouts/AdminNavbar.jsp"></jsp:include>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<jsp:include page="../layouts/AdminHeader.jsp"></jsp:include>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<jsp:include page="../layouts/AdminSidebar.jsp"></jsp:include>
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
											<h4 class="text-center mb-4">Sign in your account</h4>
											<samp class="text-danger">${error}</samp>
											<form action="login" method="post">
												<div class="form-group">
													<label><strong>Email</strong></label> <input type="email"
														class="form-control" placeholder="hello@example.com"
														name="email">
												</div>
												<div class="form-group">
													<label><strong>Password</strong></label> <input
														type="password" class="form-control"
														placeholder="Password" name="password">
												</div>
												<div
													class="form-row d-flex justify-content-between mt-4 mb-2">
													<div class="form-group">
														<div class="form-check ml-2">
															<input class="form-check-input" type="checkbox"
																id="basic_checkbox_1"> <label
																class="form-check-label" for="basic_checkbox_1">Remember
																me</label>
														</div>
													</div>
													<div class="form-group">
														<a
															href="${pageContext.request.contextPath}/forgotpassword">Forgot
															Password?</a>
													</div>
												</div>
												<div class="text-center">
													<button type="submit" class="btn btn-primary btn-block">Sign
														me in</button>
												</div>
											</form>
											<div class="new-account mt-3">
												<p>
													Don't have an account? <a class="text-primary"
														href="${pageContext.request.contextPath}/signup">Sign
														up</a>
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
		<jsp:include page="../includes/Footer.jsp"></jsp:include>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>

	<!--**********************************
        Scripts
    ***********************************-->
	<jsp:include page="../includes/Scripts.jsp"></jsp:include>

</body>

</html>