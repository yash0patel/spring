<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Create Schedule</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h4>Create Schedule</h4>
        </div>
        <div class="card-body">
            <form action="saveSchedule" method="post">
                
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Schedule Date</label>
                    <input type="date" name="scheduleDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Start Time</label>
                    <input type="time" name="startTime" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">End Time</label>
                    <input type="time" name="endTime" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Notes</label>
                    <textarea name="notes" class="form-control" rows="3"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Status</label>
                    <select name="status" class="form-select" required>
                        <option value="">-- Select --</option>
                        <option value="true">Active</option>
                        <option value="false">Inactive</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success">Save Schedule</button>
                <a href="listSchedules" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

</body>
</html>
