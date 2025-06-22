<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.SearchLogBean"%>
<%
List<SearchLogBean> searchLog = (List<SearchLogBean>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>Search Log List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="../includes/HeaderLink.jsp"></jsp:include>
<style>
.btn-add {
	background-color: #198754;
	color: #f0f0f0;
	font-weight: 500;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.btn-add:hover {
	background-color: #146c43; /* darker green */
	color: #ffffff; /* lighter white for contrast */
}

.btn-view {
	color: #343a40;
	border: 1px solid #0d6efd;
	transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s
		ease;
}

.btn-view:hover {
	background-color: #0d6efd;
	color: white;
	transform: scale(1.05);
}

.table-wrapper {
	max-width: 900px;
	margin: auto;
}

.page-title {
	font-size: 1.75rem;
	font-weight: 600;
	color: #343a40;
	border-bottom: 2px solid #dee2e6;
	padding-bottom: 6px;
}
</style>
</head>
<body class="bg-light">

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
			<div class="container mt-5">

				<!-- Header Section -->
				<div
					class="d-flex justify-content-between align-items-center mb-4 table-wrapper">
					<div class="page-title">Search Log List</div>
				</div>

				<!-- Table Section -->
				<div class="table-responsive table-wrapper">
					<table
						class="table table-hover table-bordered bg-white shadow rounded">
						<thead class="table-dark text-center">
							<tr>
								<th>ID</th>
	                            <th>Search Term</th>
	                            <th>Search Time</th>
	                            <th>User Name</th>
	                            <th>User Email</th>
	                            <th>Action</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
							if (searchLog != null && !searchLog.isEmpty()) {
								for (SearchLogBean log : searchLog) {
							%>
							<tr>
								<td><%=log.getId()%></td>
								<td><%=log.getSearch_term()%></td>
								<td><%=log.getSearched_at()%></td>
								<td><%=log.getFirstName()%></td>
								<td><%=log.getEmail()%></td>
								<td><a href="viewingredient?id=<%=log.getSearch_term()%>"
									class="btn btn-sm btn-view"> fetch </a></td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="4" class="text-muted">No search logs available.</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<!--**********************************
        Scripts
    ***********************************-->
	<jsp:include page="../includes/Scripts.jsp"></jsp:include>
</body>

</html>
