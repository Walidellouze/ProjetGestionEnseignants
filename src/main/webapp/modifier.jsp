<%@page import="tn.iit.glid2.DAO.EnseignantDAO"%>
<%@ page import="tn.iit.glid2.model.Enseignant" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <style>   
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        th {
            background-color: #FF5722;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .container-fluid {
            background-color: #009688;
            color: white;
        }

        .container {
            background-color: #fafafa;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #FF5722;
            border-color: #FF5722;
        }

        .btn-primary:hover, .btn-primary:focus, .btn-primary:active {
            background-color: #f4511e;
            border-color: #f4511e;
        }
    </style>   
    <%@ include file="navbar.jsp" %>
    <meta charset="UTF-8">
    <title>Modifier Enseignant</title>
</head>
<body>
    <div class="container-fluid bg-primary text-white text-center py-2">
        <h2>Modifier Enseignant</h2>
    </div>

    <div class="container mt-5">
        <form action="UpdateServlet" method="post" class="mt-3 border p-3">
            <% 
            EnseignantDAO enseignantDao = new EnseignantDAO();
            List<Enseignant> listEnseignant = enseignantDao.getAll();
            request.setAttribute("listEnseignant", listEnseignant);

            // Récupérer l'enseignant sélectionné par son ID
            int selectedEnseignantId = Integer.parseInt(request.getParameter("id"));
            Enseignant selectedEnseignant = null;        
            // Rechercher l'enseignant sélectionné dans la liste des enseignants
            for(Enseignant u : listEnseignant) {
                if (u.getId() == selectedEnseignantId) {
                    selectedEnseignant = u;
                    break;
                }
            }
            %>

            <input type="hidden" name="id" value="<%= selectedEnseignantId %>">
            
            <div class="form-group">
                <label for="nom" class="mr-2">Nom:</label>
                <input type="text" class="form-control" id="nom" name="nom" value="<%= (selectedEnseignant != null) ? selectedEnseignant.getNom() : "" %>">
            </div>
            
            <div class="form-group">
                <label for="prenom" class="mr-2"><i class="fas fa-user"></i> Prénom:</label>
                <input type="text" class="form-control" id="prenom" name="prenom" value="<%= (selectedEnseignant != null) ? selectedEnseignant.getPrenom() : "" %>">
            </div>
            
            <div class="form-group">
                <label for="telephone" class="mr-2"><i class="fas fa-phone"></i> Téléphone:</label>
                <input type="number" class="form-control" id="telephone" name="telephone" value="<%= (selectedEnseignant != null) ? selectedEnseignant.getTelephone() : "" %>">
            </div>
            
            <div class="form-group">
                <label for="email" class="mr-2"><i class="fas fa-envelope"></i> Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= (selectedEnseignant != null) ? selectedEnseignant.getEmail() : "" %>">
            </div>
            
            <button type="submit" class="btn btn-primary mt-3">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </form>
    </div>
</body>
</html>
