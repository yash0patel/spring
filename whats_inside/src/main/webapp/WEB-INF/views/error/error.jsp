<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${errorCode} - Error</title>
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
            max-width: 600px;
        }
        h1 {
            font-size: 6rem;
            font-weight: bold;
            color: #dc3545;
        }
        h2 {
            font-weight: 600;
            margin-bottom: 20px;
        }
        .btn-custom {
            margin-top: 20px;
            padding: 10px 30px;
            border-radius: 50px;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>${errorCode}</h1>
    <h2>${errorTitle}</h2>
    <p class="text-muted mb-4">${errorDescription}</p>
    <p class="text-muted mb-4">Requested URL: <strong>${requestUri}</strong></p>
    <a href="/" class="btn btn-primary btn-custom">Go Home</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
