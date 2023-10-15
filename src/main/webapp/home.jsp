<%@page import="tn.iit.glid2.model.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page d'accueil</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
	.container {
		margin-top: 50px;
	}

	.list-group-item {
		background-color: #c0d6e4;
		
	}
	.card-header{
		background-color: #6897bb;
	}

	.table {
		margin-top: 10px;
		border: 1px solid #ccc;
		border-collapse: collapse;
	}
	
	.table th,
	.table td {
		border: 2px solid #ccc;
		padding: 8px;
	}
	
    .custom-thead{
    	background-color: #c0d6e4;
    }
    
	.btn-action {
		margin-right: 5px;
	}
	.card {
  border: 1px solid #ccc;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<c:if test="${currentUser == null}">
	<c:redirect url="auth.jsp"/>
</c:if>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="#">Mon application</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="DisconnectController">Déconnexion</a>
			</li>
		</ul>
	</div>
</nav>

<div class="container mt-5">
	<div class="row">
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<h4>Bienvenue ${currentUser.nom} ${currentUser.prenom}</h4>
				</div>
				<div class="card-body">
					<p>Vos paramètres sont :</p>
					<ul class="list-group">
						<li class="list-group-item
"><strong>Login :</strong> ${currentUser.login}</li>
						<li class="list-group-item"><strong>Mot de passe :</strong> ${currentUser.pwd}</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-6">
	<div class="card">
		<div class="card-header">
			<h4>Liste des utilisateurs</h4>
		</div>
		<div class="card-body">
			<table class="table table-striped">
				<thead class="custom-thead">
					<tr>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Login</th>
						<th>Pwd</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listU}" var="user">

						<tr>
							<td>${user.getNom()}</td>
							<td>${user.prenom}</td>
							<td>${user.login}</td>
							<td>${user.pwd}</td>
							<td>
								<a href="RemoveServlet?id=${theCount.index}" class="btn btn-danger btn-sm my-btn">
									<span class="far fa-trash-alt"></span> 
								</a>
								<a href="UpdateServlet?id=${theCount.index}" class="btn btn-primary btn-sm my-btn">
									<span class="far fa-edit"></span> 
								</a>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

	</div>
</div>
									
