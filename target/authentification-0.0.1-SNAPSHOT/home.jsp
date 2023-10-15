<%@page import="tn.iit.glid2.model.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:useBean id="currentUser"  --%>
<%-- class="tn.iit.glid2.model.Utilisateur"  --%>
<%-- scope="session"></jsp:useBean> --%>
Bienvenu Mr/Mme ${sessionScope.currentUser.nom } ${currentUser.prenom }
<%-- <jsp:getProperty property="nom" name="currentUser"/>  --%>
<%-- <jsp:getProperty property="prenom" name="currentUser"/>  --%>
<br>Vos paramètres sont : <br>Login : ${currentUser.login }
<%-- <jsp:getProperty property="login" name="currentUser"/>  --%>
<br>Mot de passe : ${currentUser.pwd }
<%-- <jsp:getProperty property="pwd" name="currentUser"/>  --%>
<table border="1">
<tr><th>Nom</th><th>Prénom</th><th>Login</th><th>Mot de Passe</th><th>Action</th></tr>
<core:forEach items="${listU }" var="user" varStatus="theCount">
<tr><td>${user.nom }</td><td>${user.prenom }</td><td>${user.login }</td><td>${user.pwd }</td><td><a href="UpdateServlet?id=${theCount.index}">Modifer</a>/<a href="RemoveServlet?id=${theCount.index}">Supprimer</a></td></tr>
</core:forEach>
</table>
<br><br><a href=DisconnectController>Déconnexion</a> <br>
</body>
</html>