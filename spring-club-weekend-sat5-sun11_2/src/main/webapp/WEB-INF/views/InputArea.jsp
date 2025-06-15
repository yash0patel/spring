<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="validatearea" method="post">
		AreaName: <input type="text" name="areaName" /><br> <span
			style="color: red">${areaNameError}</span><br>
		<br> ZipCode: <input type="number" name="zipcode" /><br> <span
			style="color: red">${zipCodeError}</span><br>
		<br> <input type="submit" value="Check" />
	</form>
</body>
</html>