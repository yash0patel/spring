<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.UserBean" %>
<%
    UserBean user = (UserBean) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <jsp:include page="../includes/HeaderLink.jsp" />

    <!-- Bootstrap Icons (optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        .profile-card {
            max-width: 700px;
            margin: 30px auto;
            border-radius: 10px;
            overflow: hidden;
        }

        .profile-header {
            background: linear-gradient(135deg, #4B5FFF, #67bfff);  
            color: white;
            padding: 30px;
            text-align: center;
        }

        .profile-header i {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .profile-content {
            padding: 30px;
        }

        .profile-label {
            font-weight: 600;
            padding: 10px 14px;
            color: #495057;
        }

        .profile-value {
            background-color: #E3F2FD;
            border: 1px solid #CED6E0;
            border-radius: 6px;
            padding: 10px 14px;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #212529;
            margin-bottom: 25px;
        }
    </style>
</head>
<body class="bg-light">

<div id="main-wrapper">
    <jsp:include page="../layouts/AdminNavbar.jsp" />
    <jsp:include page="../layouts/AdminHeader.jsp" />
    <jsp:include page="../layouts/AdminSidebar.jsp" />

    <div class="content-body">
        <div class="container">
            <div class="card shadow profile-card">
                <div class="profile-header">
                    <i class="bi bi-person-circle"></i>
                    <h2><%= user.getFirstName() + " " + user.getLastName() %></h2>
                    <small class="text-white-50 text-capitalize"><%= user.getRole() %></small>
                </div>
                <div class="profile-content">
                    <h5 class="section-title">Account Information</h5>

                    <div class="row mb-3">
                        <div class="col-sm-4 profile-label">First Name:</div>
                        <div class="col-sm-8 profile-value"><%= user.getFirstName() %></div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-sm-4 profile-label">Last Name:</div>
                        <div class="col-sm-8 profile-value"><%= user.getLastName() %></div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-sm-4 profile-label">Email:</div>
                        <div class="col-sm-8 profile-value"><%= user.getEmail() %></div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-sm-4 profile-label">Gender:</div>
                        <div class="col-sm-8 profile-value text-capitalize"><%= user.getGender() %></div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-sm-4 profile-label">Role:</div>
                        <div class="col-sm-8 profile-value text-capitalize"><%= user.getRole() %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../includes/Footer.jsp" />
</div>

<jsp:include page="../includes/Scripts.jsp" />
</body>
</html>
