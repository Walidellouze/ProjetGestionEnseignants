package tn.iit.glid2.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AuthView
 */
@WebServlet("/InscriptionView")
public class InscriptionView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Insert title here</title>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n");

		out.println("	<form action=\"InscriptionController\" method=\"post\">\r\n" + "		<table><tr><td>Nom :</td>\r\n"
				+ "				<td><input name=\"nom\"></td>\r\n" + "			</tr>\r\n" + "			<tr>\r\n"
				+ "				<td>Prénom :</td>\r\n"
				+ "				<td><input type=\"text\" name=\"prenom\"></td>\r\n" + "			</tr>\r\n"
				+ "<tr><td>Login :</td>\r\n"
				+ "				<td><input name=\"login\"></td>\r\n" + "			</tr>\r\n" + "			<tr>\r\n"
				+ "				<td>Mot de passe :</td>\r\n"
				+ "				<td><input type=\"password\" name=\"pwd\"></td>\r\n" + "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td colspan=\"2\"><input type=\"submit\" value=\"Valider\"></td>\r\n"
				+ "			</tr>\r\n" + "		</table>\r\n" + "	</form>\r\n" + "</body>\r\n" + "</html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}
