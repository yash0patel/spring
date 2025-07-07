<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bean.UserBean" %>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>What's Inside - Admin Dashboard</title>
<jsp:include page="../includes/HeaderLink.jsp"></jsp:include>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<jsp:include page="../includes/Preloader.jsp"></jsp:include>
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
									<div class="stat-digit">0${profit}</div>
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
									<div class="stat-text">Users</div>
									<div class="stat-digit">${userCount}</div>
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
									<div class="stat-text">Ingredients</div>
									<div class="stat-digit">${ingredientCount}</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="stat-widget-one card-body">
								<div class="stat-icon d-inline-block">
									<i class="ti-search text-danger border-danger"></i>
								</div>
								<div class="stat-content d-inline-block">
									<div class="stat-text">Search Logs</div>
									<div class="stat-digit">${searchLogCount}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">User List</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table student-data-table m-t-20">
										<thead class="table-dark">
								            <tr>
								            	<th>User Id</th>
								                <th>First Name</th>
								                <th>Last Name</th>
								                <th>Email</th>
								                <th>Gender</th>
								            </tr>
								        </thead>
								        <tbody>
									        <%
									            List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
									            if (userList != null && !userList.isEmpty()) {
									                for (UserBean user : userList) {
									        %>
									            <tr>
									            	<td><%= user.getUserID() %></td>
									                <td><%= user.getFirstName() %></td>
									                <td><%= user.getLastName() %></td>
									                <td><%= user.getEmail() %></td>
									                <td><%= user.getGender() %></td>
									            </tr>
									        <%
									                }
									            } else {
									        %>
									            <tr>
									                <td colspan="4" class="text-center text-muted">No users found.</td>
									            </tr>
									        <%
									            }
									        %>
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
		<jsp:include page="../includes/Footer.jsp"></jsp:include>
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
	<jsp:include page="../includes/Scripts.jsp"></jsp:include>

</body>

</html>