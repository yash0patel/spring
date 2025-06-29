<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.IngredientBean"%>
<%
List<IngredientBean> ingredients = (List<IngredientBean>) request.getAttribute("list");
String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<title>Search Ingredients</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Custom Header Links -->
<jsp:include page="./includes/HeaderLink.jsp"></jsp:include>

<style>
.btn-add {
	background-color: #198754;
	color: #f0f0f0;
	font-weight: 500;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.btn-add:hover {
	background-color: #146c43;
	color: #ffffff;
}

.btn-outline-primary:hover {
	background-color: #0d6efd;
	color: white;
}

.btn-outline-success:hover {
	background-color: #198754;
	color: white;
}

.btn-outline-danger:hover {
	background-color: #dc3545;
	color: white;
}

.table-wrapper {
	max-width: 950px;
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

		<!-- Navbar -->
		<jsp:include page="./layouts/AdminNavbar.jsp"></jsp:include>

		<!-- Header -->
		<jsp:include page="./layouts/AdminHeader.jsp"></jsp:include>

		<!-- Sidebar -->
		<jsp:include page="./layouts/AdminSidebar.jsp"></jsp:include>

		<div class="content-body">
			<div class="container mt-5">

				<!-- Header Section -->
				<div
					class="d-flex justify-content-between align-items-center mb-3 table-wrapper">
					<div class="page-title">Search Ingredients</div>
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
											href="viewingredient?id=<%=ing.getIngredientId()%>&search_term=<%=request.getParameter("name")%>"
											class="btn btn-sm btn-outline-primary d-flex align-items-center gap-1">
											<i class="fas fa-eye"></i> View
										</a><a href="updateingredient?id=<%=ing.getIngredientId()%>&search_term=<%=request.getParameter("name")%>"
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
								<td colspan="4" class="text-muted">No ingredients found.</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<jsp:include page="./includes/Footer.jsp"></jsp:include>
	</div>

	<!-- Bootstrap Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Scripts Include -->
	<jsp:include page="./includes/Scripts.jsp"></jsp:include>

</body>
</html>
