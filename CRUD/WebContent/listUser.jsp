<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<title>Show All Users</title>
<link rel="stylesheet" href="css/foundation.css">
<link rel="stylesheet" href="css/app.css">
</head>
<body>
	<h1>MANTENEDOR DE USUARIOS</h1>
	<c:if test="${errorcode == 1}">
		<div class="alert callout">
			<p>${error}</p>
		</div>
	</c:if>
	<table border=1 class="stack">
		<thead>
			<tr>
				<th>RUT</th>
				<th>PRIMER NOMBRE</th>
				<th>SEGUNDO NOMBRE</th>
				<th>APELLIDO PATERNO</th>
				<th>APELLIDO MATERNO</th>
				<th>DIRECCION</th>
				<th>PESO</th>
				<th>ALTURA</th>
				<th>EDAD</th>
				<th>PROFESION</th>
				<th colspan=2>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td><c:out value="${user.rut}" /></td>
					<td><c:out value="${user.firstName}" /></td>
					<td><c:out value="${user.secondName}" /></td>
					<td><c:out value="${user.lastName}" /></td>
					<td><c:out value="${user.surName}" /></td>
					<td><c:out value="${user.address}" /></td>
					<td><c:out value="${user.weight}" /></td>
					<td><c:out value="${user.height}" /></td>
					<td><c:out value="${user.age}" /></td>
					<td><c:out value="${user.occupation.name}" /></td>


					<td><a
						href="UserController?action=edit&rut=<c:out value="${user.rut}"/>">Update</a></td>
					<td><a
						href="UserController?action=delete&rut=<c:out value="${user.rut}"/>">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="UserController?action=insert">Add User</a>
	</p>
</body>
</html>