package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ejbs.AuthentificationEJB;

@WebServlet("/AuthentificationServlet")
public class AuthentificationServlet extends HttpServlet {
	
	@EJB
	private AuthentificationEJB auth;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String todo=request.getParameter("todo");

		//On verifie si c'est le bon login et mdp
		String currentLogin= (String) request.getSession().getAttribute("login");
		if(currentLogin == null) {
			if(todo != null) {
				
				switch (todo) {
					case "connect" :
						//test de connexion
						String login = request.getParameter("login");
						String password = request.getParameter("password");
						if(auth.utilisateurValide(login, password)) {
							request.getSession().setAttribute("login", login);
							//Renvoi vers la page d'accueil 
							request.getRequestDispatcher("/WEB-INF/index.html").forward(request, response);
							return;
							
					}
					case "proposer" :
						
						request.getRequestDispatcher("/WEB-INF/OffreTrajet").forward(request, response);
						return;
						
					default :
					
						request.getRequestDispatcher("/WEB-INF/authentification.jsp").forward(request, response);
						return;
				}
			}
			request.getRequestDispatcher("/WEB-INF/index.html").forward(request, response);
			return;
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
