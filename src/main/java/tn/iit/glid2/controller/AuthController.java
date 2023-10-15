package tn.iit.glid2.controller;

import java.awt.desktop.SystemEventListener;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.glid2.model.Utilisateur;
 
import tn.iit.glid2.DAO.UserDAO;
import tn.iit.glid2.model.Error;
/**
 * Servlet implementation class AuthController
 */
@WebServlet("/AuthController")
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String log = request.getParameter("login");
		String mp = request.getParameter("pwd");
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		Utilisateur currentUser = null;
		RequestDispatcher rd = null;
//		if("admin".equals(log)&&"123".equals(mp)) {
//			if(session.getAttribute("erreur")!=null) {
//				session.removeAttribute("erreur");
//			}
//
//			
//			getServletContext()
//			.getRequestDispatcher("/HomeView")
//			.forward(request, response);
//		}
//		else
//		{
////			session.setAttribute("erreur", "");
//			request.setAttribute("erreur", "");
//			getServletContext()
//			.getRequestDispatcher("/AuthView")
//			.forward(request, response);
//			//response.sendRedirect("AuthView");
//		}
		Error errorMessage = new Error(); 
	 	//List<Utilisateur> listUser = (List<Utilisateur>) application.getAttribute("listU");
	 	UserDAO userDao = new UserDAO();
	 	List<Utilisateur> listUser=userDao.getAll(); 
	 	request.setAttribute("errorMessage","");
	  
		if (listUser == null) {
		 	 
			errorMessage.setMessage("Aucun utilisateur n'est inscrit !!");
			request.setAttribute("errorMessage",errorMessage.getMessage() );
			rd = application.getRequestDispatcher("/auth.jsp");
		} else {
			for (Utilisateur utilisateur : listUser) {
				if (log.equals(utilisateur.getLogin()) && mp.equals(utilisateur.getPwd())) {
					currentUser = utilisateur;
					session.setAttribute("currentUser", currentUser);
					//rd = application.getRequestDispatcher("/bienvenue.jsp");/
					
					rd=application.getRequestDispatcher("/EnseignantControlleur");
					break;
				}
			}
			if (currentUser == null) {
				
				errorMessage.setMessage("Veuillez vérifier vos paramètres!!");
				request.setAttribute("errorMessage",errorMessage.getMessage() );
				rd = application.getRequestDispatcher("/auth.jsp");
			}
		}
		rd.forward(request, response);
	}

}
