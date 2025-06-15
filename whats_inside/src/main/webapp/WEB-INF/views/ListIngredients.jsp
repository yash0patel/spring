<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.IngredientBean" %>
<%
    List<IngredientBean> ingredients = (List<IngredientBean>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Ingredients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .btn-add {
            background-color: #198754;
            color: #f0f0f0;
            font-weight: 500;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-add:hover {
            background-color: #146c43; /* darker green */
            color: #ffffff;            /* lighter white for contrast */
        }

        .btn-view {
            color: #0d6efd;
            border: 1px solid #0d6efd;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s ease;
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

<div class="container mt-5">

    <!-- Header Section -->
    <div class="d-flex justify-content-between align-items-center mb-4 table-wrapper">
        <div class="page-title">Ingredient List</div>
        <a href="newingredient" class="btn btn-add rounded">
            Add Ingredient
        </a>
    </div>

    <!-- Table Section -->
    <div class="table-responsive table-wrapper">
        <table class="table table-hover table-bordered bg-white shadow rounded">
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
                    <td><%= ing.getIngredientId() %></td>
                    <td><%= ing.getName() %></td>
                    <td><%= ing.getScientificName() %></td>
                    <td>
                        <a href="viewingredient?id=<%= ing.getIngredientId() %>" class="btn btn-sm btn-view">
                            View
                        </a>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
