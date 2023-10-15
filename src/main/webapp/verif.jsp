<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
<style type="text/css">
/* Modifier le style des éléments ici */
body {
  background-color: #f2f2f2;
}

h1 {
  color: red;
}

a {
  text-decoration: none;
  color: blue;
}
</style>

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="currentInscription" 
class="tn.iit.glid2.model.Utilisateur"
scope="session"
></jsp:useBean>
<jsp:setProperty property="*" name="currentInscription"/>
Vous avez saisi : <br>
Nom : ${currentInscription.nom }<br>
Prénom : ${currentInscription.prenom }<br>
Login : ${currentInscription.login }<br>
Mot de passe : ${currentInscription.pwd }<br>
<br><a href="inscription.jsp">Corriger</a>
<br><a href="InscriptionController">Valider</a>
</body>
</html>