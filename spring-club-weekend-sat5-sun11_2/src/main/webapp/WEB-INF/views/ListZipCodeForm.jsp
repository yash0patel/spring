<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="listzipcode" method="post">
    AreaName: <input type="text" name="areaName" 
        value="${not empty areaName ? areaName : ''}" /><br><br>
         <span style="color: red">${status}</span><br>
    <input type="submit" value="List Zipcode" />
</form>
</body>
</html>