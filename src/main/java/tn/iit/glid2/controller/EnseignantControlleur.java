package tn.iit.glid2.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.glid2.DAO.EnseignantDAO;
import tn.iit.glid2.model.Enseignant;

/**
 * Servlet implementation class EnseignantControlleur
 */
@WebServlet("/EnseignantControlleur")
public class EnseignantControlleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnseignantControlleur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application = getServletContext();
		List<Enseignant> listEnseignant = (List<Enseignant>) application.getAttribute("listEnseignant");
		HttpSession session = request.getSession();
		EnseignantDAO enseignantDao = new EnseignantDAO();
		listEnseignant = enseignantDao.getAll();
	 
		String search = request.getParameter("search"); 
		if (search != null && !search.isEmpty()) {
			listEnseignant = listEnseignant.stream()
			      .filter(e -> e.getNom().contains(search) || e.getPrenom().contains(search))
			      .collect(Collectors.toList());
		}
		
		application.setAttribute("listEnseignant", listEnseignant);
		response.sendRedirect("bienvenue.jsp");
	}
}
