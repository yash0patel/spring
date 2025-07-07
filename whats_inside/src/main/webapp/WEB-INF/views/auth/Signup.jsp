<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Signup - What's Inside</title>
<jsp:include page="../includes/HeaderLink.jsp"></jsp:include>
<style>
.tagline {
	font-size: 1.2rem;
	color: #666;
	margin-top: 10px;
	transition: opacity 0.5s ease;
}

.content-body {
	margin-left: 0 !important;
}

.nav-header {
	background-color: #2e3154; /* example */
}

.footerp{
margin-left: 0 !important;
}
</style>
</head>
<body>

	<jsp:include page="../includes/Preloader.jsp"></jsp:include>

	<div id="main-wrapper">

		<div class="nav-header">
			<a href="index.html" class="brand-logo"> <img class="logo-abbr"
				src="./images/logo.png" alt=""> <img class="logo-compact"
				src="./images/logo-text.png" alt=""> <img class="brand-title"
				src="./images/logo-text.png" alt="">
			</a>
		</div>

		<jsp:include page="../layouts/AdminHeader.jsp"></jsp:include>


		<div class="content-body">
			<div class="container-fluid">
				<div class="row page-titles mx-0">
					<div class="col-sm-12 p-md-0">
						<div class="welcome-text text-center">
							<h2 class="text-primary">Welcome to What's Inside</h2>
							<p class="mb-0 tagline" id="tagline">Discover and manage
								ingredients the smart way.</p>
						</div>
						
						<div class="row no-gutters mt-5">
									<div class="col-xl-12 px-5">
										<div class="auth-form" style="border: 1px solid #dee2e6; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); background-color: #fff;">
											<div class="px-3">
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
												<div class="form-group">
												    <label><strong>Phone Number (Optional)</strong></label>
												    <input type="text" class="form-control" placeholder="Enter phone number" name="mobileNo">
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
						<!-- Spacer -->
						<div style="height: 80px;"></div>




					</div>
				</div>
			</div>
		</div>

	</div>
		
	<jsp:include page="../includes/Footer.jsp"></jsp:include>
	<jsp:include page="../includes/Scripts.jsp"></jsp:include>

	<!-- Rotating Tagline Script -->
	<script>
	    const taglines = [
	        "Less hassle, more discovery.",
	        "Smarter for discovering ingredients.",
	        "All your ingredient details, just a click away.",
	        "Explore your ingredients with ease and efficiency.",
	        "Organize and track your ingredients effortlessly.",
	        "Your ingredient vault, simplified.",
	        "Fast. Accurate. Ingredient management made easy.",
	        "Helping you find what's inside — instantly."
	    ];

	    let current = 0;
	    const taglineEl = document.getElementById('tagline');

	    setInterval(() => {
	        current = (current + 1) % taglines.length;
	        taglineEl.style.opacity = 0;
	        setTimeout(() => {
	            taglineEl.textContent = taglines[current];
	            taglineEl.style.opacity = 1;
	        }, 300);
	    }, 3500); 
	</script>
	

</body>

</html>