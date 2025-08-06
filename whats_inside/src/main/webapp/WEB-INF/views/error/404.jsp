<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>404 - Page Not Found</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .error-container {
            max-width: 500px;
        }
        h1 {
            font-size: 6rem;
            font-weight: 700;
            color: #dc3545;
        }
        .btn-custom {
            margin: 10px;
            padding: 10px 30px;
            border-radius: 50px;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>404</h1>
    <h3 class="mb-3">Page Not Found</h3>
    <p class="text-muted mb-4">The page you are looking for does not exist or has been moved.</p>
    <p class="text-muted mb-4">Requested URL: <strong>${requestUri}</strong></p>
    <a href="/" class="btn btn-primary btn-custom">Go Home</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
