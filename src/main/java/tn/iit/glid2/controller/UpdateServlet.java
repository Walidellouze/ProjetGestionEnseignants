package tn.iit.glid2.controller;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.glid2.DAO.EnseignantDAO;
import tn.iit.glid2.model.Enseignant;

import java.io.IOException;
import java.util.List;


/**
 * Servlet implementation class MajEnseignantController
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String id = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        EnseignantDAO enseignantDao = new EnseignantDAO();
		enseignantDao.Update(id,nom, prenom,telephone, email);

		List<Enseignant> listEnseignant = enseignantDao.getAll();
		
		 request.setAttribute("listEnseignant", listEnseignant); // Set the listEnseignant as a request attribute

		    // Redirect to the bienvenue.jsp page
		 request.getRequestDispatcher("bienvenue.jsp").forward(request, response);
    }
}