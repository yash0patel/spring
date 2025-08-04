
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Login - what's inside</title>
<jsp:include page="../includes/HeaderLink.jsp"></jsp:include>
<style type="text/css">
.btn-gradient-primary {
	background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
	color: #ffffff;
	border: none;
	border-radius: 6px;
	padding: 0.6em 1.4em;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.btn-gradient-primary:hover {;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
	transform: scale(1.03);
}

.btn-gradient-primary:focus {
	outline: 3px solid rgba(101, 175, 255, 0.6);
	outline-offset: 2px;
}

	
</style>
</head>

<body class="h-100">
	<div id="main-wrapper">
		<!--**********************************
            Nav header start
        ***********************************-->
		<jsp:include page="../layouts/Navbar.jsp"></jsp:include>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<jsp:include page="../layouts/Header.jsp"></jsp:include>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<jsp:include page="../layouts/Sidebar.jsp"></jsp:include>
		<!--**********************************
            Sidebar end
        ***********************************-->

<div class="content-body">
	<div class="authincation h-100">
		<div class="container h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-xl-6 col-lg-7 col-md-8">
					<div class="card shadow-lg border-0 rounded-4">
						<div class="card-header bg-white border-0 text-center pt-4">
							<h4 class="card-title mb-1 fw-bold">Secure Payment</h4>
							<p class="text-muted small mb-0">Enter your card details below</p>
						</div>
						<div class="card-body px-4 py-3">
							<form action="processPayment" method="post">
								<input type="hidden" name="amount" value="500" />
								<input type="hidden" name="email" value="${email}" />
								<div class="form-group mb-3">
									<label for="cardNumber" class="fw-semibold">Card Number</label>
									<input type="text" maxlength="16" class="form-control" id="cardNumber" name="cardNumber" placeholder="Enter 16-digit card number" required>
								</div>

								<div class="form-group mb-3">
									<label for="cvv" class="fw-semibold">CVV</label>
									<input type="password" maxlength="3" class="form-control" id="cvv" name="cvv" placeholder="Enter 3-digit CVV" required>
								</div>

								<div class="form-group mb-3">
									<label for="expDate" class="fw-semibold">Expiry Date</label>
									<input type="month" class="form-control" id="expDate" name="expDate" required>
								</div>

								<div class="form-group mb-4">
									<label class="fw-semibold">Amount</label>
									<input type="text" class="form-control" value="500" disabled>
								</div>

								<button type="submit" class="btn btn-gradient-primary w-100 rounded-pill py-2 fs-5">
									Pay 500
								</button>
							</form>
						</div>
						<div class="card-footer text-center border-0 pt-2 pb-4">
							<small class="text-muted">Your payment is encrypted and secure</small>
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