<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Zipcodes for Area:<%= request.getAttribute("areaName") %></h2>

	<p><%= request.getAttribute("zipcodes") %></p>
	<a href="inputarea">input area</a>
</body>
</html>