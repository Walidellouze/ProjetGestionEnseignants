<%@page import="tn.iit.glid2.model.Enseignant"%>
<%@ page import="tn.iit.glid2.DAO.EnseignantDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        .table {
            margin-top: 20px;
        }

        .table thead {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }

        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            font-weight: bold;
            font-size: 18px;
        }

        .table td {
            width: 10%;
        }

        .table-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-actions .btn {
            margin-right: 10px;
        }

        .btn-group-vertical {
            display: flex;
            flex-direction: column;
        }

        .btn-group-vertical .btn {
            margin-bottom: 10px;
        }

        .form-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .form-container .btn {
            margin-top: 2px;
        }

        .form-container .row {
            align-items: center;
        }

        .form-container .col-sm-8 {
            display: flex;
            align-items: center;
        }

        .input-group {
            width: 100%;
        }

        .input-group-prepend {
            width: 50px;
        }

        .input-group-text {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        h2 {
            margin-bottom: 20px;
        }
    </style>
    <%@include file="navbar.jsp"%>
    <meta charset="ISO-8859-1">
    <title>Liste des enseignants</title>
</head>
<body>

    <div class="container">
        <h2>Liste des enseignants</h2>

        <div class="form-container">
            <form action="EnseignantControlleur" method="post">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="search-addon"><i class="fas fa-search"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Recherche" aria-label="Recherche" aria-describedby="search-addon"  id="search" name="search" >
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="table-actions text-right">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Rechercher</button>
                            <button type="submit" class="btn btn-secondary"><i class="fas fa-sync-alt"></i> Réinitialiser</button>
                            <button type="button" class="btn btn-success" onclick="window.location.href = 'enseignant.jsp';"><i class="fas fa-user-plus"></i> Ajouter enseignant</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-sm">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Nom</th>
                        <th scope="col">Prénom</th>
                        <th scope="col">Téléphone</th>
                        <th scope="col">Email</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listEnseignant}" var="enseignant" varStatus="theCount">
                        <tr>
                            <td style="font-weight: bold; font-size: 18px;">${enseignant.nom}</td>
                            <td style="font-weight: bold; font-size: 18px;">${enseignant.prenom}</td>
                            <td style="font-weight: bold; font-size: 18px;">${enseignant.telephone}</td>
                            <td style="font-weight: bold; font-size: 18px;">${enseignant.email}</td>
                            <td>
                                <div class="btn-group-vertical">
                                    <a href="AutorisationServlet?id=${enseignant.id}" class="btn btn-success btn-sm">
                                        <i class="fas fa-plus-circle"></i> Autorisation
                                    </a>
                                    <a href="modifier.jsp?id=${enseignant.id}" class="btn btn-primary btn-sm">
                                        <i class="fas fa-edit"></i> Modifier
                                    </a>
                                    <a href="RemoveServlet?id=${enseignant.id}" class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash"></i> Supprimer
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
