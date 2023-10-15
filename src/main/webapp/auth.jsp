<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Page de connexion</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .custom-title {
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        .card-body {
            background-color: #fff;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        form {
            border: 1px solid #eaeaea;
            padding: 20px;
        }

        .btn-primary:hover {
            transform: scale(1.1);
        }

        form {
            transition: all 0.3s ease-in-out;
        }

        form:hover {
            transform: translateY(-5px);
        }

        .container-login {
            background-color: #ffffff;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20vh;
        }

        .container-login h1 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #2196F3;
        }

        .container-login label {
            font-weight: bold;
        }

        .container-login input[type="text"],
        .container-login input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .container-login button[type="submit"] {
            background-color: #4CA550;
            color: white;
            padding: 15px;
            border: none;
            width: 100%;
            cursor: pointer;
            border-radius: 4px;
        }

        .container-login button[type="submit"]:hover {
            opacity: 0.8;
        }

        .container-login .cancelbtn,
        .container-login .signupbtn {
            float: left;
            width: 50%;
            padding: 10px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }

        .container-login .cancelbtn:hover,
        .container-login .signupbtn:hover {
            opacity: 0.8;
        }

        .container-login .signupbtn {
            background-color: #2196F3;
            color: white;
        }

        .container-login .cancelbtn {
            background-color: #ccc;
            color: black;
        }

        .container-login .terms {
            margin-top: 16px;
        }

        .container-login .terms input {
            float: left;
            margin-right: 5px;
        }

        .container-login .terms label {
            float: left;
        }
    </style>
</head>
<body>

<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger">${errorMessage}</div>
</c:if>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card custom-card">
                <div class="card-body">
                    <h1 class="card-title text-center custom-title">Connexion</h1>
                    <form method="post" action="AuthController">
                        <div class="form-group">
                            <label for="login">Nom d'utilisateur</label>
                            <input type="text" class="form-control" id="login" name="login"
                                placeholder="Entrez votre nom d'utilisateur">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Mot de passe</label>
                            <input type="password" class="form-control" id="pwd" name="pwd"
                                placeholder="Entrez votre mot de passe">
                        </div>
                        <button type="submit" class="btn btn-primary ">Se connecter</button>
                    </form>
                   
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
    integrity="sha384-lXuucckvep+0f3KAdt0sPDyFJ+RmkxzK2Tz0soDvJZLVz1ksFpHi3gjPWAo0HcJ/"
    crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
