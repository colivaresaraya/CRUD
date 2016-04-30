<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<link type="text/css"
	href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<link rel="stylesheet" href="css/foundation.css">
<link rel="stylesheet" href="css/app.css">
<title>Add new user</title>
</head>
<body>
			<h1 align="center">Bienvenido</h1>
			<form method="POST" action='LoginController' name="frmLogin">
				<div class="row" align="center">
					<div class="small-4 columns">
					<br/>
					</div>
					<div class="small-4 columns">
						<input type="text" placeholder="usuario@mail.com" name="user" value="<c:out value="${login.user}" />" /> 
						<input type="password" placeholder="Contraseña" name="pass" value="<c:out value="${login.pass}" />"  /> 
						<button type="submit" class="success button">Ingresar</button>
					</div>
					<div class="small-4 columns">
					<br/>
					</div>
				</div>
			</form>
</body>
</html>