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
 
import tn.iit.glid2.DAO.UserDAO;
import tn.iit.glid2.model.Utilisateur;
 

/**
 * Servlet implementation class InscriptionController
 */
@WebServlet("/InscriptionController")
public class InscriptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Utilisateur user = new Utilisateur(request.getParameter("nom"), request.getParameter("prenom"),
//				request.getParameter("login"), request.getParameter("pwd"));
		ServletContext application = getServletContext();
		List<Utilisateur> listUser = (List<Utilisateur>) application.getAttribute("listU");
		HttpSession session = request.getSession();
		Utilisateur user =  new Utilisateur();
		user.setLogin(request.getParameter("login"));
		user.setPwd(request.getParameter("pwd"));
		user.setNom(request.getParameter("nom"));
		user.setPrenom(request.getParameter("prenom"));
		if (listUser == null)
			listUser = new ArrayList<>();
		listUser.add(user);
		application.setAttribute("listU", listUser);
		
		
		Utilisateur currentUser = (Utilisateur) session.getAttribute("currentInscription");
		UserDAO userDao = new UserDAO();
		userDao.Save(user);	
		
		
		response.sendRedirect("auth.jsp");
	}

}
