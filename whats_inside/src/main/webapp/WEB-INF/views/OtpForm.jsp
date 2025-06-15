<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Enter OTP & Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

<div class="card p-4 shadow" style="max-width: 400px; width: 100%;">
    <h4 class="text-center mb-3">Enter OTP & Reset Password</h4>

    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null && !msg.isEmpty()) {
    %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <%= msg %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <%
        }
    %>
    
  	<%
    	String error = (String) request.getAttribute("error");
    	if (error != null && !error.isEmpty()) {
	%>
    	<div class="alert alert-danger alert-dismissible fade show" role="alert">
        	<%= error %>
        	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    	</div>
	<%
    	}
	%>


    <form action="verifyOtp" method="post">
        <input type="hidden" name="email" value="${email}">

        <div class="mb-3">
            <label for="otp" class="form-label">OTP Code</label>
            <input type="text" class="form-control" id="otp" name="otp" value="${otp != null ? otp : ''}" placeholder="Enter your OTP" />
        </div>

        <div class="mb-3">
            <label for="newPassword" class="form-label">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" value="${newPassword != null ? newPassword : ''}" placeholder="Enter new password" />
        </div>

        <div class="d-flex justify-content-between">
            <a href="forgotpassword" class="btn btn-outline-secondary">← Back</a>
            <button type="submit" class="btn btn-primary">Verify OTP & Reset</button>
        </div>
    </form>

    <form action="resendOtp" method="post" class="mt-3 text-center">
        <input type="hidden" name="email" value="${email}" />
        <button type="submit" class="btn btn-link p-0">Resend OTP</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
