<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<h1 align="center">NUEVO USUARIO</h1>
	<form method="POST" action='UserAddController' name="frmAddUser"
		onSubmit="return validateForm()">
		<div class="row">
			<div class="small-6 columns">
				<label>RUT <input type="text" name="rut"
					value="<c:out value="${user.rut}" />" />
				</label> <label>PRIMER NOMBRE : <input type="text" name="firstName"
					value="<c:out value="${user.firstName}" />" />
				</label> <label> APELLIDO PATERNO: <input type="text"
					name="lastName" value="<c:out value="${user.lastName}" />" />
				</label>
			</div>
			<div class="small-6 columns">
				<label>PROFESION : <select id="idoccupation"
					name="idoccupation">
						<c:forEach items="${occupations}" var="occupation">
							<option value="<c:out value="${occupation.id}" />"><c:out
									value="${occupation.name}" /></option>
						</c:forEach>
				</select>
				</label> <label> SEGUNDO NOMBRE : <input type="text"
					name="secondName" value="<c:out value="${user.secondName}" />" />
				</label> <label> APELLIDO MATERNO : <input type="text"
					name="surName" value="<c:out value="${user.surName}" />" />
				</label>
			</div>
			<div class="small-12 columns">
				<label> DIRECCION : <input type="text" name="address"
					value="<c:out value="${user.address}" />" />
				</label>
			</div>
			<div class="small-4 columns">
				<label> PESO : <input type="number" name="weight"
					value="<c:out value="${user.weight}" />" />
				</label>
			</div>
			<div class="small-4 columns">
				<label> ALTURA : <input type="number" name="height"
					value="<c:out value="${user.height}" />" />
				</label>
			</div>
			<div class="small-4 columns">
				<label> EDAD : <input type="number" name="age"
					value="<c:out value="${user.age}" />" />
				</label>
			</div>
		</div>
		<div class="row">
			<div class="small-12 columns" align="center">
				<button type="submit" class="success button">Agregar
					Usuario</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="js/validarut.js"></script>
	<script>
		function validateForm() {
			if (document.frmAddUser.firstName.value == "") {
				alert("Ingrese su primer nombre");
				document.frmAddUser.firstName.focus();
				return false;
			} else if (document.frmAddUser.secondName.value == "") {
				alert("Ingrese su segundo nombre");
				document.frmAddUser.secondName.focus();
				return false;
			} else if (document.frmAddUser.lastName.value == "") {
				alert("Ingrese su apellido paterno");
				document.frmAddUser.lastName.focus();
				return false;
			} else if (document.frmAddUser.surName.value == "") {
				alert("Ingrese su apellido materno");
				document.frmAddUser.surName.focus();
				return false;
			} else if (document.frmAddUser.address.value == "") {
				alert("Ingrese su direccion");
				document.frmAddUser.address.focus();
				return false;
			} else if (document.frmAddUser.weight.value == "") {
				alert("Ingrese su peso");
				document.frmAddUser.weight.focus();
				return false;
			} else if (document.frmAddUser.weight.value < 0) {
				alert("Ingrese su peso correctamente");
				document.frmAddUser.weight.focus();
				return false;
			} else if (document.frmAddUser.height.value == "") {
				alert("Ingrese su altura");
				document.frmAddUser.height.focus();
				return false;
			} else if (document.frmAddUser.height.value < 0) {
				alert("Ingrese su altura correctamente");
				document.frmAddUser.height.focus();
				return false;
			} else if (document.frmAddUser.age.value == "") {
				alert("Ingrese su edad");
				document.frmAddUser.age.focus();
				return false;
			} else if (document.frmAddUser.age.value < 0) {
				alert("Ingrese su edad correctamente");
				document.frmAddUser.age.focus();
				return false;
			}
			return Rut(document.frmAddUser.rut.value);
		}
	</script>
</body>
</html>