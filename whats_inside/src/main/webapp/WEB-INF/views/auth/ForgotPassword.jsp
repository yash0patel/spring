<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
        }
        .card {
            border-radius: 1rem;
        }
        .form-label {
            font-weight: 500;
        }
        .btn {
            min-width: 100px;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center vh-100">

<div class="container">
    <div class="card shadow p-4 mx-auto" style="max-width: 420px;">
        <h4 class="text-center mb-3">🔒 Forgot Password</h4>
        <p class="text-muted text-center mb-4">Enter your registered email to reset your password</p>

        <% String errorMsg = (String) request.getAttribute("error"); %>
        <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= errorMsg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <form action="forgotpassword" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <a href="login" class="btn btn-outline-secondary">← Back</a>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
