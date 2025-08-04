<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bean.UserBean"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.IngredientBean"%>
<%
List<IngredientBean> ingredients = (List<IngredientBean>) request.getAttribute("list");
%>

<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>What's Inside - Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container mt-5">

				<!-- Header Section -->
				<div
					class="d-flex justify-content-between align-items-center mb-3 table-wrapper">
					<div class="page-title">Ingredients</div>
				</div>

				<!-- ✅ Functional Search Form -->
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-6">
							<form action="search" method="post" class="mb-4">
								<div class="input-group shadow-sm">
								<%
								    String search_term = (String) request.getAttribute("search_term");
								    String searchValue = (search_term == null || search_term.trim().isEmpty()) ? "" : search_term;
								%>
									<input type="text" name="name" value="<%=searchValue%>" class="form-control"
										placeholder="Search by Name or Scientific Name"
										autocomplete="off">

									<button class="btn btn-primary" type="submit">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Table Section -->
				<div class="table-responsive table-wrapper">
					<table
						class="table table-hover table-bordered bg-white shadow rounded">
						<thead class="table-dark text-center">
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Scientific Name</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
							if (ingredients != null && !ingredients.isEmpty()) {
								for (IngredientBean ing : ingredients) {
							%>
							<tr>
								<td><%=ing.getIngredientId()%></td>
								<td><%=ing.getName()%></td>
								<td><%=ing.getScientificName()%></td>
								<td>
									<div class="d-flex justify-content-center gap-2">
										<a
											href="viewingredient?id=<%=ing.getIngredientId()%>"
											class="btn btn-sm btn-outline-primary d-flex align-items-center gap-1">View
										</a>
									</div>
								</td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="4" class="text-muted">No ingredients available.</td>
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