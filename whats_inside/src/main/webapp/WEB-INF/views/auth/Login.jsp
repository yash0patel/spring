
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Login - what's inside</title>
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

.footerp {
	margin-left: 0 !important;
}
</style>
</head>

<body>

	<jsp:include page="../includes/Preloader.jsp"></jsp:include>

	<div id="main-wrapper">

		<div class="nav-header">
			<a href="userdashboard" class="brand-logo"
				style="display: flex; justify-content: space-between;"> <img
				class="logo-abbr" src="${pageContext.request.contextPath}/images/logo.png" alt=""
				style="border-radius: 50%; box-shadow: 0 1px 4px #16e67566; object-fit: contain; max-width: 50px; max-height: 50px; margin: auto;">
				<img class="brand-title" src="${pageContext.request.contextPath}/images/logo-text.png" alt=""
				style="max-width: 180px; max-height: 200px; overflow: hidden; margin: 0 auto;">
			</a>
		</div>
		

		<jsp:include page="../layouts/Header.jsp"></jsp:include>


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
								<div class="auth-form"
									style="border: 1px solid #dee2e6; border-radius: 8px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05); background-color: #fff;">
									<div class="px-3">
										<h4 class="text-center mb-4">Sign in your account</h4>
										<div class="text-center mb-4">
											<samp class="text-danger">${error}</samp>
										</div>
										<form action="login" method="post">
											<div class="form-group">
												<label><strong>Email</strong></label> <input type="email"
													class="form-control" placeholder="hello@example.com"
													name="email">
											</div>
											<div class="form-group">
												<label><strong>Password</strong></label> <input
													type="password" class="form-control" placeholder="Password"
													name="password">
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
													<a href="${pageContext.request.contextPath}/forgotpassword">Forgot
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