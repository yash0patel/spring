<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>What's Inside - Admin Dashboard</title>
<jsp:include page="HeaderLink.jsp"></jsp:include>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
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

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							<h4>Hi, welcome back!</h4>
							<p class="mb-0">Your business dashboard template</p>
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">Layout</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">Blank</a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="stat-widget-one card-body">
								<div class="stat-icon d-inline-block">
									<i class="ti-money text-success border-success"></i>
								</div>
								<div class="stat-content d-inline-block">
									<div class="stat-text">Profit</div>
									<div class="stat-digit">1,012</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="stat-widget-one card-body">
								<div class="stat-icon d-inline-block">
									<i class="ti-user text-primary border-primary"></i>
								</div>
								<div class="stat-content d-inline-block">
									<div class="stat-text">Customer</div>
									<div class="stat-digit">961</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="stat-widget-one card-body">
								<div class="stat-icon d-inline-block">
									<i class="ti-layout-grid2 text-pink border-pink"></i>
								</div>
								<div class="stat-content d-inline-block">
									<div class="stat-text">Projects</div>
									<div class="stat-digit">770</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="stat-widget-one card-body">
								<div class="stat-icon d-inline-block">
									<i class="ti-link text-danger border-danger"></i>
								</div>
								<div class="stat-content d-inline-block">
									<div class="stat-text">Referral</div>
									<div class="stat-digit">2,781</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">All Exam Result</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table student-data-table m-t-20">
										<thead>
											<tr>
												<th>Subject</th>
												<th>Grade Point</th>
												<th>Percent Form</th>
												<th>Percent Upto</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Class Test</td>
												<td>Mathmatics</td>
												<td>4.00</td>
												<td>95.00</td>
												<td>100</td>
												<td>20/04/2017</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<jsp:include page="Footer.jsp"></jsp:include>
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<jsp:include page="Scripts.jsp"></jsp:include>

</body>

</html>