<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.bean.IngredientBean"%>
<%
IngredientBean ingredient = (IngredientBean) request.getAttribute("ingredient");
%>
<!DOCTYPE html>
<html>
<head>
<title>Ingredient Detail</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #212529;
}

.container-detail {
	max-width: 650px;
	margin: 60px auto;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
	padding: 32px 40px;
	user-select: none;
}

h2.title {
	font-weight: 700;
	color: #222;
	margin-bottom: 30px;
	border-bottom: 3px solid #0d6efd;
	padding-bottom: 10px;
	letter-spacing: 0.03em;
	font-size: 1.8rem;
	user-select: text;
}

.detail-row {
	padding: 12px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #e9ecef;
	transition: background-color 0.2s ease, border-left 0.2s ease;
	cursor: default;
	border-left: 4px solid transparent; /* default no line */
}

/* alternate row background */
.detail-row:nth-child(odd) {
	background-color: #fafbfc;
}

.detail-row:hover {
	background-color: #e9f0ff;
	border-left: 4px solid #0d6efd; /* blue vertical line on left */
}

.detail-label {
	font-weight: 600;
	color: #495057;
	font-size: 1.05rem;
	flex-basis: 40%;
	user-select: text;
}

.detail-value {
	color: #212529;
	font-size: 1.1rem;
	flex-basis: 58%;
	text-align: right;
	word-break: break-word;
	user-select: text;
}

.btn-back {
	display: inline-block;
	margin-top: 48px;
	padding: 10px 24px;
	background-color: #f1f3f5;
	color: #495057;
	border-radius: 6px;
	font-weight: 600;
	font-size: 1.05rem;
	text-decoration: none;
	border: 1px solid #ced4da;
	transition: background-color 0.25s ease, color 0.25s ease;
	user-select: none;
}

.btn-back:hover {
	background-color: #d9e2ff;
	color: #0d6efd;
	text-decoration: none;
	border-color: #0d6efd;
}

@media ( max-width : 600px) {
	.detail-row {
		flex-direction: column;
		align-items: flex-start;
		padding: 12px 0;
	}
	.detail-label, .detail-value {
		flex-basis: 100%;
		text-align: left;
	}
	.detail-value {
		margin-top: 6px;
	}
}
</style>
</head>
<body>

	<div class="container-detail">
		<h2 class="title">Ingredient Detail</h2>

		<div class="detail-row">
			<div class="detail-label">Ingredient ID</div>
			<div class="detail-value"><%=ingredient.getIngredientId()%></div>
		</div>

		<div class="detail-row">
			<div class="detail-label">Name</div>
			<div class="detail-value"><%=ingredient.getName()%></div>
		</div>

		<div class="detail-row">
			<div class="detail-label">Scientific Name</div>
			<div class="detail-value"><%=ingredient.getScientificName()%></div>
		</div>

		<div class="detail-row">
			<div class="detail-label">Common Usage</div>
			<div class="detail-value"><%=ingredient.getCommonUsage()%></div>
		</div>

		<div class="detail-row">
			<div class="detail-label">Avoid By</div>
			<div class="detail-value"><%=ingredient.getAvoidBy()%></div>
		</div>

		<div class="detail-row">
			<div class="detail-label">FDA Status</div>
			<div class="detail-value"><%=(ingredient.getFda() != null && !ingredient.getFda().isEmpty()) ? ingredient.getFda() : "N/A"%></div>
		</div>

		<div class="detail-row">
			<div class="detail-label">FSSAI Status</div>
			<div class="detail-value"><%=(ingredient.getFssai() != null && !ingredient.getFssai().isEmpty()) ? ingredient.getFssai() : "N/A"%></div>
		</div>

		<div class="detail-row">
			<div class="detail-label">EFSA Status</div>
			<div class="detail-value"><%=(ingredient.getEfsa() != null && !ingredient.getEfsa().isEmpty()) ? ingredient.getEfsa() : "N/A"%></div>
		</div>

		<a href="listingredients" class="btn-back">Back to List</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
