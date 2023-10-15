<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter enseignant</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <style>
        .container {
            margin-top: 40px;
        }

        h1 {
            background-color: #4CAd50;
            color: white;
            padding: 10px;
            border-radius: 5px;
        }

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            border: 1px solid #4CAd50;
        }

        input[type="submit"] {
            background-color: #4CAd50;
            border-color: #4CAd50;
        }

        input[type="submit"]:hover {
            background-color: #388E3C;
            border-color: #388E3C;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container">
        <h1>Ajouter enseignant</h1>
        <div>
            <form action="MajEnseignantController" method="post">
                <div class="form-group">
                    <label for="nom">Nom :</label>
                    <input type="text" class="form-control" name="nom" value="${enseignant.nom}">
                </div>
                <div class="form-group">
                    <label for="prenom">Prénom :</label>
                    <input type="text" class="form-control" name="prenom" value="${enseignant.prenom}">
                </div>
                <div class="form-group">
                    <label for="telephone">Téléphone :</label>
                    <input type="number" class="form-control" name="telephone" value="${enseignant.telephone}">
                </div>
                <div class="form-group">
                    <label for="email">Email :</label>
                    <input type="email" class="form-control" name="Email" value="${enseignant.email}">
                </div>
                <input type="submit" class="btn btn-primary" value="Valider">
            </form>
        </div>
    </div>
</body>
</html>
