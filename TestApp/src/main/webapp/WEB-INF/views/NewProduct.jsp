<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Create Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0 rounded-4">
        <div class="card-header bg-gradient bg-primary text-white">
            <h4 class="mb-0">Add New Product</h4>
        </div>
        <div class="card-body p-4">
            
            <form action="saveproduct" method="post">
                
                <!-- Product Name -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Product Name</label>
                    <input type="text" name="name" class="form-control form-control-lg" placeholder="Enter product name" required>
                </div>

                <!-- Category -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Category</label>
                    <input type="text" name="category" class="form-control form-control-lg" placeholder="Enter category" required>
                </div>

                <!-- Price -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Price (₹)</label>
                    <input type="number" name="price" step="0.01" class="form-control form-control-lg" placeholder="0.00" required>
                </div>

                <!-- Quantity -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Quantity</label>
                    <input type="number" name="Qty" min="0" class="form-control form-control-lg" placeholder="Enter stock quantity" required>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-success btn-lg px-4 shadow-sm">
                        <i class="bi bi-save"></i> Save Product
                    </button>
                    <a href="listproducts" class="btn btn-outline-secondary btn-lg px-4 shadow-sm">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

</body>
</html>
