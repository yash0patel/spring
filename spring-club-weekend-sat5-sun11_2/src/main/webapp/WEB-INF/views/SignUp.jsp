<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  <!-- Bootstrap CSS -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
  >
</head>
<body class="bg-light">

  <div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="col-md-6 col-lg-4 bg-white p-4 rounded shadow">
      <h1 class="text-center mb-4">Sign Up</h1>
      <form action="saveuser" method="post">
        <div class="mb-3">
          <label for="firstName" class="form-label">First Name</label>
          <input type="text" class="form-control" id="firstName" name="firstName">
        </div>
        <div class="mb-3">
          <label for="lastName" class="form-label">Last Name</label>
          <input type="text" class="form-control" id="lastName" name="lastName">
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" id="email" name="email">
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="mb-3">
          <label class="form-label">Gender</label>
          <div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="male" value="male">
              <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="female" value="female">
              <label class="form-check-label" for="female">Female</label>
            </div>
          </div>
        </div>
        <button type="submit" class="btn btn-primary w-100">Sign Up</button>
      </form>
      <div class="text-center mt-3">
        <a href="http://localhost:3025/login">Go to Login Page</a>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS Bundle (Optional for interactive components) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
