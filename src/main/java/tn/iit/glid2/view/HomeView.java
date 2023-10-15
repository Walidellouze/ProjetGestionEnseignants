package tn.iit.glid2.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.glid2.model.Utilisateur;


/**
 * Servlet implementation class HomeView
 */
@WebServlet("/HomeView")
public class HomeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session1 = request.getSession(); // 2 sessions houni w authController (personnel)
		if (session1.getAttribute("currentUser") == null) {
			response.sendRedirect("AuthView");

		} else {
			Utilisateur user = (Utilisateur) session1.getAttribute("currentUser");
			PrintWriter out = response.getWriter();
			out.println("<p align=\"right\"><a href=\"DisconnectController\">Déconnexion</a></p>");
			out.append("bienvenu");

			ServletContext application = getServletContext();
			List<Utilisateur> lu = (List<Utilisateur>) application.getAttribute("tUser");
			if (lu == null) {
				out.append("<br>Aucun utilisateur n'est inscrit !!!");
			}
			int pos = 0;
			out.append("<TABLE BORDER=1 ALIGN=CENTER>\n" + "<TH>nom<TH>prenom<TH>login<TH>action");
			for (Utilisateur u : lu) {
				out.println("<TR><TD>" + u.getNom());
				out.println("<TD>" + u.getPrenom());
				out.println("<TD>" + u.getLogin());
				out.println("<TD> <button onclick='window.location.href=\"Update?pos=" + pos
						+ "\"'>modifier</button>" + "<button onclick='window.location.href=\"Delete?pos="
						+ pos + "\"'>supprimer</button>");
				pos++;
			}
			out.println("</TABLE>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
