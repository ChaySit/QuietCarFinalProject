package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ejbs.Facade;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	
	@EJB
	private Facade facade;
	
	private void signUpUtilisateur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = (String) request.getParameter("password");
		String confirm_password = (String) request.getParameter("confirmPassword");
		if (password.equals(confirm_password)) {
			String login = (String) request.getParameter("login");
			facade.ajouterUtilisateur(login, password);
			request.getRequestDispatcher("WEB-INF/test.jsp").forward(request, response);
		}
		else {
			System.out.println("Les mots de passe entrés ne sont pas les mêmes !!");
			request.getRequestDispatcher("WEB-INF/index.html").forward(request, response);
		}	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String todo=request.getParameter("todo");

		//On verifie si c'est le bon login et mdp
		String currentLogin= (String) request.getSession().getAttribute("login");
		if(currentLogin == null) {
			if(todo != null) {
				switch(todo) {
				case "connect" :
					//test de connexion
					String login = request.getParameter("login");
					String password = request.getParameter("password");
					if(facade.utilisateurValide(login, password)) {
						request.getSession().setAttribute("login", login);
						//Renvoi vers la page d'accueil 
						request.getRequestDispatcher("/WEB-INF/index.html").forward(request, response);
					}
					break;
				case "signUp" :
					this.signUpUtilisateur(request, response);
					break;
				default:
					request.getRequestDispatcher("/WEB-INF/index.html").forward(request, response);
					break;	
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
