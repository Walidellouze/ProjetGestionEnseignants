<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="UpdateServlet" method="post">
		<table><tr><td>Nom :</td>
				<td><input name="nom" value="${currentUpdate.nom }"></td>
			</tr>
			<tr>
				<td>Prénom :</td>
				<td><input type="text" name="prenom" value="${currentUpdate.prenom }"></td>
			</tr>
			<tr><td>Login :</td>
				<td><input name="login" value="${currentUpdate.login }"></td>
			</tr>
			<tr>
				<td>Mot de passe :</td>
				<td><input type="password" name="pwd" value="${currentUpdate.pwd }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Valider"></td>
			</tr>
		</table>
	</form>
</body>
</html>