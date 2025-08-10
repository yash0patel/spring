<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Schedule List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">Schedule List</h4>
            <a href="createSchedule" class="btn btn-light btn-sm">+ Add New</a>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Notes</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="schedule" items="${schedules}">
                        <tr>
                            <td>${schedule.scheduleId}</td>
                            <td>${schedule.title}</td>
                            <td>${schedule.scheduleDate}</td>
                            <td>${schedule.startTime}</td>
                            <td>${schedule.endTime}</td>
                            <td>${schedule.notes}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${schedule.status}">
                                        <span class="badge bg-success">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Inactive</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="editSchedule?id=${schedule.scheduleId}" class="btn btn-warning btn-sm">Edit</a>
                                <a href="deleteSchedule?id=${schedule.scheduleId}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this schedule?');">
                                   Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <c:if test="${empty schedules}">
                <div class="alert alert-info text-center">No schedules found.</div>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>
