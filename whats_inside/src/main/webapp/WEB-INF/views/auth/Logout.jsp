<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Confirm Logout</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="../includes/HeaderLink.jsp"></jsp:include>
<style>
body {
	background-color: #f8f9fa;
}

.logout-card {
	max-width: 500px;
	margin: auto;
	margin-top: 100px;
	border-radius: 15px;
}

.btn {
	min-width: 120px;
}
</style>
</head>
<body>
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
			<div class="container">
				<div class="card shadow logout-card p-4 text-center">
					<h4 class="mb-3">
						Hi, <strong>${userName}</strong>!
					</h4>
					<p class="text-muted mb-4">Are you sure you want to log out
						from your session?</p>

					<form action="${pageContext.request.contextPath}/logout"
						method="post" class="d-flex justify-content-center gap-3">
						<button type="submit" class="btn btn-danger">Yes, Logout</button>
						<a href="${pageContext.request.contextPath}/home"
							class="btn btn-secondary">Cancel</a>
					</form>
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
