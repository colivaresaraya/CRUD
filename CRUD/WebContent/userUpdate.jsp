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
	<h1 align="center">ACTUALIZAR USUARIO</h1>

	<form method="POST" action='UserEditController' name="frmEditUser" onSubmit="return validateForm()">
		<div class="row">
			<div class="small-6 columns">
				<label>RUT <input readonly="readonly" type="text" name="rut"
					value="<c:out value="${user.rut}" />" /> 
				</label>
				<label>PRIMER NOMBRE : <input 
					type="text" name="firstName"
					value="<c:out value="${user.firstName}" />" /> 
				</label>
				<label>
			 	APELLIDO PATERNO: <input type="text" name="lastName"
					value="<c:out value="${user.lastName}" />" />  
				</label>
				</div>
				<div class="small-6 columns">
				<label>PROFESION :  
					<select id="idoccupation" name="idoccupation"  >
					<c:forEach items="${occupations}" var="occupation">
						<c:if test="${user.occupation.id == occupation.id}">
				    		<option selected="selected"  value="<c:out value="${occupation.id}" />"><c:out value="${occupation.name}" /></option>
						</c:if>
						<c:if test="${user.occupation.id != occupation.id}">
				    		<option  value="<c:out value="${occupation.id}" />"><c:out value="${occupation.name}" /></option>
						</c:if>
						
					</c:forEach>
				 </select>
				</label>
				
				<label>
				SEGUNDO	NOMBRE : <input type="text" name="secondName"
					value="<c:out value="${user.secondName}" />" /> 
				</label>
				<label>
				APELLIDO MATERNO : <input type="text" name="surName"
					value="<c:out value="${user.surName}" />" />  
				</label>
				</div>
				<div class="small-12 columns">
				<label>
				DIRECCION : <input
					type="text" name="address"
					value="<c:out value="${user.address}" />" />  
				</label>
				</div>
				<div class="small-4 columns">
				<label>
				PESO : <input
					type="text" name="weight" value="<c:out value="${user.weight}" />" />  
				</label>
				</div>
				<div class="small-4 columns">
				<label>
				ALTURA : <input type="text" name="height"
					value="<c:out value="${user.height}" />" />
				</label>
				</div>
				<div class="small-4 columns">
				<label>
				EDAD : <input
					type="text" name="age" value="<c:out value="${user.age}" />" />
				</label>
			</div>
		</div>
		<div class="row">
			<div class="small-12 columns" align="center">
				<button type="submit" class="success button">Editar
					Usuario</button>
			</div>
		</div>
	</form>
	<script>
		function validateForm() {
			if (document.frmEditUser.firstName.value == "") {
				alert("Ingrese su primer nombre");
				document.frmEditUser.firstName.focus();
				return false;
			} else if (document.frmEditUser.secondName.value == "") {
				alert("Ingrese su segundo nombre");
				document.frmEditUser.secondName.focus();
				return false;
			} else if (document.frmEditUser.lastName.value == "") {
				alert("Ingrese su apellido paterno");
				document.frmEditUser.lastName.focus();
				return false;
			} else if (document.frmEditUser.surName.value == "") {
				alert("Ingrese su apellido materno");
				document.frmEditUser.surName.focus();
				return false;
			} else if (document.frmEditUser.address.value == "") {
				alert("Ingrese su direccion");
				document.frmEditUser.address.focus();
				return false;
			} else if (document.frmEditUser.weight.value == "") {
				alert("Ingrese su peso");
				document.frmEditUser.weight.focus();
				return false;
			} else if (document.frmEditUser.weight.value < 0) {
				alert("Ingrese su peso correctamente");
				document.frmEditUser.weight.focus();
				return false;
			} else if (document.frmEditUser.height.value == "") {
				alert("Ingrese su altura");
				document.frmEditUser.height.focus();
				return false;
			} else if (document.frmEditUser.height.value < 0) {
				alert("Ingrese su altura correctamente");
				document.frmEditUser.height.focus();
				return false;
			} else if (document.frmEditUser.age.value == "") {
				alert("Ingrese su edad");
				document.frmEditUser.age.focus();
				return false;
			} else if (document.frmEditUser.age.value < 0) {
				alert("Ingrese su edad correctamente");
				document.frmEditUser.age.focus();
				return false;
			}
		}
	</script>
</body>
</html>