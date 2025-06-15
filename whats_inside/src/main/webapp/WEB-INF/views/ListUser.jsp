<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bean.UserBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">User List</h2>

    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Gender</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
            if (userList != null && !userList.isEmpty()) {
                for (UserBean user : userList) {
        %>
            <tr>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getGender() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="4" class="text-center text-muted">No users found.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
