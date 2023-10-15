package tn.iit.glid2.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.glid2.DAO.AutorisationDAO;
import tn.iit.glid2.DAO.EnseignantDAO;
import tn.iit.glid2.model.Autorisation;
import tn.iit.glid2.model.Enseignant;

@WebServlet("/AutorisationServlet")
public class AutorisationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AutorisationServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de l'enseignant depuis les paramètres de la requête
        String idParam = request.getParameter("id");
        int id = 0; // Valeur par défaut ou une valeur appropriée en cas de chaîne vide

        if (idParam != null && !idParam.isEmpty()) {
            id = Integer.parseInt(idParam);
        }

        ServletContext application = getServletContext();
        EnseignantDAO enseignantDao = new EnseignantDAO();

        // Récupérer l'enseignant correspondant à l'ID et le stocker dans le contexte de l'application
        Enseignant enseignant = enseignantDao.findByID(id);
        application.setAttribute("currentEnseignant", enseignant);

        AutorisationDAO autorisationDAO = new AutorisationDAO();

        // Récupérer la liste des autorisations de l'enseignant et la stocker dans le contexte de l'application
        List<Autorisation> listAutorisation = autorisationDAO.getAllByEnseignant(id);
        application.setAttribute("listAutorisation", listAutorisation);

        int sum = 0;

        // Calculer la somme des heures d'autorisation pour l'enseignant
        for (Autorisation autorisation : listAutorisation) {
            sum += autorisation.getNb_heure();
        }

        // Stocker la somme dans le contexte de l'application
        application.setAttribute("sum", sum);

        int anneeActuelle = LocalDate.now().getYear();

        // Stocker l'année actuelle dans le contexte de l'application
        application.setAttribute("anneeActuelle", anneeActuelle);

        // Calculer le nombre d'heures restantes pour l'enseignant
        int nbHeureRealiser = autorisationDAO.getNbHeureRestante(id, anneeActuelle);
        int nbHeureRestante = (52 * 4) - nbHeureRealiser;

        // Stocker le nombre d'heures restantes dans le contexte de l'application
        application.setAttribute("nbHeureRestante", nbHeureRestante);

        // Rediriger vers la page autorisation.jsp
        response.sendRedirect("autorisation.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = getServletContext();
        AutorisationDAO autorisationDao = new AutorisationDAO();

        // Récupérer l'ID de l'enseignant depuis les paramètres de la requête
        String idParam = request.getParameter("id");
        int id = 0; // Valeur par défaut ou une valeur appropriée en cas de chaîne vide

        if (idParam != null && !idParam.isEmpty()) {
            id = Integer.parseInt(idParam);
        }

        // Récupérer la date d'autorisation depuis le formulaire
        LocalDate dateAutorisation = LocalDate.parse(request.getParameter("date"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        // Récupérer le numéro de semaine de la date d'autorisation
        int numeroSemaine = dateAutorisation.get(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear());

        application.setAttribute("message", "");

        // Récupérer le nombre d'heures depuis le formulaire
        String nbHeureParam = request.getParameter("nb_heure");
        int nbHeure = 0; // Valeur par défaut ou une valeur appropriée en cas de chaîne vide

        if (nbHeureParam != null && !nbHeureParam.isEmpty()) {
            nbHeure = Integer.parseInt(nbHeureParam);
        }

        // Récupérer la description depuis le formulaire
        String description = request.getParameter("description");

        // Créer un nouvel objet Autorisation avec les données récupérées
        Autorisation autorisation = new Autorisation(id, dateAutorisation, nbHeure, description);

        // Récupérer le nombre d'heures réalisées par l'enseignant dans la semaine
        int nbHeureRealiser = autorisationDao.getNbHeure(id, numeroSemaine);

        if (nbHeureRealiser + nbHeure > 4) {
            // Si le nombre d'heures réalisées dépasse 4, afficher un message d'avertissement
            String message = "Attention, le nombre d'heures réalisées dans cette semaine dépasse 4 heures.";
            application.setAttribute("message", message);
            response.sendRedirect("autorisation.jsp");
        } else {
            // Sinon, sauvegarder l'autorisation dans la base de données
            autorisationDao.Save(autorisation);
            response.sendRedirect("bienvenue.jsp");
        }
    }
}
