<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Books List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">📚 Book Store</a>
    </div>
</nav>

<div class="container mt-5">

    <!-- Header with Add Button -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="text-primary">Available Books</h2>
        <a href="bookForm" class="btn btn-success">
            ➕ Add Book
        </a>
    </div>

    <!-- Book Table -->
    <div class="card shadow">
        <div class="card-body p-0">
            <table class="table table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Book Name</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td>${book.bookId}</td>
                            <td>${book.bookName}</td>
                            <td>${book.authorName}</td>
                            <td>₹ ${book.price}</td>
                            <td>${book.category}</td>
                            <td class="text-center">
                                <a href="editBook?id=${book.bookId}" class="btn btn-sm btn-primary">Edit</a>
                                <a href="deleteBook?id=${book.bookId}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this book?');">Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
