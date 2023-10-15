<%@ page import="tn.iit.glid2.model.Enseignant" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
 
<html>
<head>
    <meta charset="UTF-8">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.css">

    <style>
        body {
            padding: 20px;
        }

        h1 {
            color: red;
            font-size: 55px;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .table-container {
            margin-top: 20px;
        }

        .table-container h2 {
            margin-bottom: 20px;
        }

        .btn-container {
            margin-top: 20px;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 44px 44px 44px rgba(0.1, 0.1, 0.2, 0.1);
            background-color: #fff;
        }

        .card-title {
            color: red;
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 20px;
            text-align: center;
            text-transform: uppercase;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            background-color: #0069d9;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        #my-table {
            width: 100%;
            border-collapse: collapse;
        }

        #my-table th,
        #my-table td {
            border: 1px solid #ccc;
            padding: 8px;
        }

        #my-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            text-align: center;
        }

        #my-table td {
            text-align: center;
        }

        #my-table tfoot th,
        #my-table tfoot td {
            font-weight: bold;
        }

        .text-center {
            text-align: center;
        }

        .text-danger {
            color: red;
        }

        .text-primary {
            color: blue;
        }

        .text-secondary {
            color: gray;
        }
    </style>
    <%@ include file="navbar.jsp" %>
    <br>
   
    
</head>
<body>
<script>
function exportToPdf(date, description, enseignantNom, enseignantPrenom) {
    var doc = new jsPDF();

    // Titre du document
    doc.setFontSize(20);
    doc.setTextColor("#FF3700");
    doc.setFontStyle("bold");
    doc.text("Autorisation", 105, 20, { align: "center" });

    // Informations de l'autorisation
    doc.setFontSize(14);
    doc.setTextColor("#8B1317");
    doc.setFontStyle("bold");
    doc.text("Description: ", 20, 120);
    doc.setFontSize(12);
    doc.setTextColor("#000000");
    doc.setFontStyle("normal");
    
    doc.text(description, 50, 120 );

    // Informations de l'enseignant
    doc.setFontSize(14);
    doc.setTextColor("#8B1317");
    doc.setFontStyle("bold");
    doc.text("Enseignant:", 20, 70);
    doc.setFontSize(12);
    doc.setTextColor("#000000");
    doc.setFontStyle("normal");
    
    doc.text( enseignantNom, 45, 80);
    doc.text( enseignantPrenom, 70, 80);
    doc.setFontSize(14);
    doc.setTextColor("#8B1317");
    doc.setFontStyle("bold");
    doc.text("Date: ", 20, 40);
    doc.setFontSize(12);
    doc.setTextColor("#000000");
    doc.setFontStyle("normal");
    doc.text(date, 35, 40);

    // Pied de page
    doc.setFontSize(10);
    doc.setTextColor(150);
    doc.text("© 2023 Institut International de Technologie Sfax Tunisie", 105, 280, { align: "center" });

    doc.save("Autorisation.pdf");
}
</script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>

<font size="3" color="red">${message}</font>



<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form action="AutorisationServlet" method="post" class="card">
                <div class="card-body">
                    <h1 class="card-title">Autorisation</h1>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="date">Date :</label>
                            <input type="date" name="date" id="date" required class="form-control">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="nb_heure">Nombre d'Heure :</label>
                            <input type="number" name="nb_heure" id="nb_heure" required class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Description :</label>
                        <textarea name="description" id="description" rows="3" class="form-control"></textarea>
                    </div>

                    <div class="form-group">
                        <input type="hidden" name="id" value="${currentEnseignant.id}">
                        <input type="submit" value="Valider" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <div class="table-container">
                <h2 class="text-center">Liste des autorisations de "${currentEnseignant.prenom} ${currentEnseignant.nom}":</h2>

                <div class="table-responsive">
                    <table class="table table-striped" id="my-table">
                        <thead>
                        <tr>
                            <th class="text-center">Date</th>
                            <th class="text-center">Nombre d'Heure autorisation</th>
                            <th class="text-center">Description</th>
                            <th class="text-center">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listAutorisation}" var="autorisation" varStatus="theCount">
                            <tr>
                                <td>${autorisation.date}</td>
                                <td>${autorisation.nb_heure}</td>
                                <td>${autorisation.description}</td>
                                <td>
                                    <button onclick="exportToPdf('${autorisation.date}', '${autorisation.description}', '${currentEnseignant.nom}', '${currentEnseignant.prenom}')" class="btn btn-success">Imprimer</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="2"><strong>Total des heures réalisées :</strong></td>
                            <td colspan="2"><strong>${sum}</strong></td>
                            
                        </tr>
                        <tr>
                            <td colspan="2"><strong>Nombre d'Heures restantes dans l'année ${anneeActuelle}
                                    :</strong></td>
                            <td colspan="2"><strong>${nbHeureRestante}</strong></td>
                            
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
