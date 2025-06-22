<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<div class="card shadow p-4" style="max-width: 600px; width: 100%;">
			<h2 class="text-center mb-4">Create Account</h2>

			<form method="post" action="saveuser" novalidate>
				<div class="row mb-3">
					<div class="col">
						<label for="firstName" class="form-label">First Name</label> <input
							type="text" class="form-control" id="firstName" name="firstName"> 
							<span class="text-danger">${result.getFieldError("firstName").getDefaultMessage()}</span>
					</div>
					<div class="col">
						<label for="lastName" class="form-label">Last Name</label> <input
							type="text" class="form-control" id="lastName" name="lastName">
							<span class="text-danger">${result.getFieldError("lastName").getDefaultMessage()}</span>
					</div>
				</div>

				<div class="mb-3">
					<label class="form-label">Gender</label>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="male" value="Male"> <label
								class="form-check-label" for="male">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="female" value="Female"> <label
								class="form-check-label" for="female">Female</label>
						</div>
					</div>
					<span class="text-danger">${result.getFieldError("gender").getDefaultMessage()}</span>
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" id="email" name="email">
					<span class="text-danger">${result.getFieldError("email").getDefaultMessage()}</span>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" class="form-control" id="password" name="password"> 
						<span class="text-danger">${result.getFieldError("password").getDefaultMessage()}</span>
				</div>

				<div class="mb-3">
					<label for="confirmPassword" class="form-label">Confirm
						Password</label> <input type="password" class="form-control"
						id="confirmPassword" name="confirmPassword" required>
				</div>

				<div class="d-grid mb-3">
					<button type="submit" class="btn btn-primary">Sign Up</button>
				</div>

				<div class="text-center">
					Already have an account? <a
						href="${pageContext.request.contextPath}/login"
						class="text-decoration-none">Login here</a>
				</div>
			</form>
		</div>
	</div>

	<!-- Bootstrap JS Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
