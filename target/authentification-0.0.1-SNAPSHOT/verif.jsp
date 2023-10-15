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