<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Ingredient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <jsp:include page="../includes/HeaderLink.jsp"/>
</head>
<body class="bg-light">

<div id="main-wrapper">
    <jsp:include page="../layouts/AdminNavbar.jsp"/>
    <jsp:include page="../layouts/AdminHeader.jsp"/>
    <jsp:include page="../layouts/AdminSidebar.jsp"/>

    <div class="content-body">
        <div class="container mt-5">
            <h2 class="mb-4">Update Ingredient Details</h2>
            <form action="updateingredient" method="post" class="row g-3">

                <%
                    com.bean.IngredientBean ingredient = (com.bean.IngredientBean) request.getAttribute("ingredient");
                    String avoidByStr = ingredient.getAvoidBy() != null ? ingredient.getAvoidBy() : "";
                    String[] dbValues = avoidByStr.split(",");
                    String[] avoidOptions = {
                        "Adults", "Children", "Pregnant Women", "Breastfeeding Women",
                        "Diabetic Patients", "Hypertensive Patients", "People with Kidney Issues",
                        "People with Liver Issues", "People with Allergies", "People with Heart Conditions",
                        "Asthmatic Patients", "Cancer Patients", "People on Blood Thinners",
                        "People with Immune Disorders"
                    };

                    java.util.List<String> standardList = java.util.Arrays.asList(avoidOptions);
                    java.util.List<String> othersList = new java.util.ArrayList<>();

                    for (String val : dbValues) {
                        if (!standardList.contains(val.trim())) {
                            othersList.add(val.trim());
                        }
                    }

                    String othersJoined = String.join(", ", othersList);
                %>

                <!-- Hidden ID -->
                <input type="hidden" name="ingredientId" value="<%= ingredient.getIngredientId() %>"/>
                <%
			    String search_term = (String) request.getAttribute("search_term");
			    if (search_term == null) {
			        search_term = "";
			    }
				%>
				<input type="hidden" name="search_term" value="<%= search_term %>">
	                

                <div class="col-md-6">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" name="name" id="name" value="<%= ingredient.getName() %>" required>
                </div>

                <div class="col-md-6">
                    <label for="scientificName" class="form-label">Scientific Name</label>
                    <input type="text" class="form-control" name="scientificName" id="scientificName" value="<%= ingredient.getScientificName() %>">
                </div>

                <div class="col-md-12">
                    <label for="commonUsage" class="form-label">Common Usage</label>
                    <textarea class="form-control" name="commonUsage" id="commonUsage" rows="2"><%= ingredient.getCommonUsage() %></textarea>
                </div>

                <div class="col-md-12">
                    <label class="form-label">Avoid By</label>
                    <% for (String option : avoidOptions) { %>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="avoidBy" value="<%= option %>"
                                   id="<%= option.replaceAll(" ", "") %>"
                                   <%= avoidByStr.contains(option) ? "checked" : "" %>>
                            <label class="form-check-label" for="<%= option.replaceAll(" ", "") %>"><%= option %></label>
                        </div>
                    <% } %>

                    <!-- "Others" input -->
                    <div class="form-check mt-2">
                        <input type="text" class="form-control" name="avoidBy" placeholder="Others (type manually)" value="<%= othersJoined %>">
                    </div>
                </div>

                <div class="col-md-4">
                    <label for="fda" class="form-label">FDA Status</label>
                    <input type="text" class="form-control" name="fda" id="fda" value="<%= ingredient.getFda() %>">
                </div>

                <div class="col-md-4">
                    <label for="fssai" class="form-label">FSSAI Status</label>
                    <input type="text" class="form-control" name="fssai" id="fssai" value="<%= ingredient.getFssai() %>">
                </div>

                <div class="col-md-4">
                    <label for="efsa" class="form-label">EFSA Status</label>
                    <input type="text" class="form-control" name="efsa" id="efsa" value="<%= ingredient.getEfsa() %>">
                </div>

                <div class="col-12">
                    <button type="submit" class="btn btn-success">Update Ingredient</button>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="../includes/Footer.jsp"/>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../includes/Scripts.jsp"/>
</body>
</html>
