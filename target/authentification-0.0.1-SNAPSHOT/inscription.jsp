<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="currentInscription" 
class="tn.iit.glid2.model.Utilisateur"
scope="session"
></jsp:useBean>
	<form action="verif.jsp" method="post">
		<table><tr><td>Nom :</td>
				<td><input name="nom" value="${currentInscription.nom }"></td>
			</tr>
			<tr>
				<td>Pr�nom :</td>
				<td><input type="text" name="prenom" value="${currentInscription.prenom }"></td>
			</tr>
			<tr><td>Login :</td>
				<td><input name="login" value="${currentInscription.login }"></td>
			</tr>
			<tr>
				<td>Mot de passe :</td>
				<td><input type="password" name="pwd" value="${currentInscription.pwd }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Valider"></td>
			</tr>
		</table>
	</form>
</body>
</html>