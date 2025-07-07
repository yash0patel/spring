<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.IngredientBean"%>
<%
List<IngredientBean> ingredients = (List<IngredientBean>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>Ingredients</title>
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
					<div class="page-title">Ingredient List</div>
					<a href="newingredient" class="btn btn-add rounded"> Add
						Ingredient </a>
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
										</a> <a href="updateingredient?id=<%=ing.getIngredientId()%>"
											class="btn btn-sm btn-outline-success d-flex align-items-center gap-1">
											<i class="fas fa-pen"></i> Update
										</a> 
										<a href="deleteingredient?id=<%=ing.getIngredientId()%>"
											class="btn btn-sm btn-outline-danger d-flex align-items-center gap-1"
											onclick="return confirm('Are you sure you want to delete this ingredient?');">
											<i class="fas fa-trash-alt"></i> Delete
										</a>
									</div>
								</td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="4" class="text-muted">No ingredients
									available.</td>
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
