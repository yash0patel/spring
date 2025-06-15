<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Simple Calculator</title>
  <!-- Bootstrap CSS -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
  >
</head>
<body class="bg-light">

  <div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="col-md-4 bg-white p-4 rounded shadow">
      <h2 class="text-center mb-4">Calculator</h2>
      <form action="calculate" method="post">
        <div class="mb-3">
          <label for="num1" class="form-label">Number 1</label>
          <input type="number" class="form-control" id="num1" name="n1" required>
        </div>
        <div class="mb-3">
          <label for="num2" class="form-label">Number 2</label>
          <input type="number" class="form-control" id="num2" name="n2" required>
        </div>
        <button type="submit" class="btn btn-success w-100">Calculate Sum</button>
      </form>
    </div>
  </div>

  <!-- Bootstrap JS Bundle (Optional) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
