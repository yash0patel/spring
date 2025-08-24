<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sort Schedules</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function goToLink(select) {
            if (select.value !== "") {
                window.location.href = select.value;
            }
        }
    </script>
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

    <div class="card shadow-lg p-4" style="width: 25rem; border-radius: 1rem;">
        <h4 class="text-center mb-4">Sort Schedules</h4>

        <select class="form-select form-select-lg" onchange="goToLink(this)">
            <option value="">-- Select Sort Option --</option>
            <option value="listSortByName">Sort by Name</option>
            <option value="listSortById">Sort by ID</option>
            <option value="listSchedulesByDate">Sort by Date</option>
            <option value="listSortByLocation">Sort by Location</option>
        </select>
    </div>

    <!-- Bootstrap JS (optional, for dropdowns etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
