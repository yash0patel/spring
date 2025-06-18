<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Ingredient Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="HeaderLink.jsp"></jsp:include>
</head>
<body class="bg-light">

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

		<div class="content-body">
			<div class="container mt-5">
				<h2 class="mb-4">Add Ingredient Details</h2>
				<form action="saveingredient" method="post" class="row g-3">

					<div class="col-md-6">
						<label for="name" class="form-label">Name (e.g., INS 211)</label>
						<input type="text" class="form-control" name="name" id="name"
							required>
					</div>

					<div class="col-md-6">
						<label for="scientificName" class="form-label">Scientific
							Name</label> <input type="text" class="form-control"
							name="scientificName" id="scientificName">
					</div>

					<div class="col-md-12">
						<label for="usage" class="form-label">Common Usage</label>
						<textarea class="form-control" name="usage" id="usage" rows="2"></textarea>
					</div>

					<div class="col-md-12">
						<label class="form-label">Avoid By (select all that apply)</label>

						<!-- 1 to 15 Avoid By Options -->
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Adults" id="adult"><label
								class="form-check-label" for="adult">Adults</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Children" id="child"><label
								class="form-check-label" for="child">Children</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Pregnant Women" id="pregnant"><label
								class="form-check-label" for="pregnant">Pregnant Women</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Breastfeeding Women" id="breastfeeding"><label
								class="form-check-label" for="breastfeeding">Breastfeeding
								Women</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Diabetic Patients" id="diabetic"><label
								class="form-check-label" for="diabetic">Diabetic
								Patients</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Hypertensive Patients" id="hypertensive"><label
								class="form-check-label" for="hypertensive">Hypertensive
								Patients</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="People with Kidney Issues" id="kidney"><label
								class="form-check-label" for="kidney">People with Kidney
								Issues</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="People with Liver Issues" id="liver"><label
								class="form-check-label" for="liver">People with Liver
								Issues</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="People with Allergies" id="allergies"><label
								class="form-check-label" for="allergies">People with
								Allergies</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="People with Heart Conditions" id="heart"><label
								class="form-check-label" for="heart">People with Heart
								Conditions</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Asthmatic Patients" id="asthma"><label
								class="form-check-label" for="asthma">Asthmatic Patients</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="Cancer Patients" id="cancer"><label
								class="form-check-label" for="cancer">Cancer Patients</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="People on Blood Thinners" id="bloodthinners"><label
								class="form-check-label" for="bloodthinners">People on
								Blood Thinners</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="avoidBy"
								value="People with Immune Disorders" id="immune"><label
								class="form-check-label" for="immune">People with Immune
								Disorders</label>
						</div>

						<!-- Custom text -->
						<div class="form-check mt-2">
							<input type="text" class="form-control" name="avoidBy"
								placeholder="Others (type manually)">
						</div>
					</div>

					<div class="col-md-4">
						<label for="fda" class="form-label">FDA Status</label> <input
							type="text" class="form-control" name="fda" id="fda">
					</div>

					<div class="col-md-4">
						<label for="fssai" class="form-label">FSSAI Status</label> <input
							type="text" class="form-control" name="fssai" id="fssai">
					</div>

					<div class="col-md-4">
						<label for="efsa" class="form-label">EFSA Status</label> <input
							type="text" class="form-control" name="efsa" id="efsa">
					</div>

					<div class="col-12">
						<button type="submit" class="btn btn-primary">Save
							Ingredient</button>
					</div>
				</form>
			</div>
		</div>
		<!--**********************************
            Footer start
        ***********************************-->
		<jsp:include page="Footer.jsp"></jsp:include>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<jsp:include page="Scripts.jsp"></jsp:include>
</body>
</html>
