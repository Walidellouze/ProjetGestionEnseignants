package tn.iit.glid2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.glid2.DAO.EnseignantDAO;
import tn.iit.glid2.DAO.UserDAO;
import tn.iit.glid2.model.Enseignant;
import tn.iit.glid2.model.Utilisateur;

/**
 * Servlet implementation class MajEnseignantController
 */
@WebServlet("/MajEnseignantController")
public class MajEnseignantController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MajEnseignantController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application = getServletContext();
		List<Enseignant> listEnseignant = (List<Enseignant>) application.getAttribute("listEnseignant");
		HttpSession session = request.getSession();
		 Enseignant enseignant = new Enseignant(request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("telephone"), request.getParameter("Email"));
 		if (listEnseignant == null)
 			listEnseignant = new ArrayList<>();
 		listEnseignant.add(enseignant);
		application.setAttribute("listEnseignant", listEnseignant);
		
		
		 
		EnseignantDAO enseignantDAO = new EnseignantDAO();
		enseignantDAO.Save(enseignant);
		
		
		
		response.sendRedirect("bienvenue.jsp");
	}

}
