package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ejbs.Facade;
import ejbs.TPropositionEJB;
import ejbs.TReservationEJB;
import entities.Offre;
import entities.Utilisateur;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	
	@EJB
	private Facade facade;
	@EJB
	private TPropositionEJB propositionTrajet;
	@EJB
	private TReservationEJB reservationTrajet;
	
	/* 
	 * Fonction qui permet d'ajouter un nouveau utilisateur dans la base 
	 */
	private void signUpUtilisateur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password = (String) request.getParameter("password");
		String confirm_password = (String) request.getParameter("confirmPassword");
		if (password.equals(confirm_password)) {
			String login = (String) request.getParameter("login");
			String nom = (String) request.getParameter("nom");
			String prenom = (String) request.getParameter("prenom");
			String mail = (String) request.getParameter("password");
			String telephone = (String) request.getParameter("prenom");
			String sexe = (String) request.getParameter("password");
			facade.ajouterUtilisateur(login, nom, prenom, password, mail, telephone, sexe);
			request.getRequestDispatcher("WEB-INF/authentification.jsp").forward(request, response);
		}
		else {
			System.out.println("Les mots de passe entrés ne sont pas les mêmes !!");
			request.getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
		}	
    }
	
	/* 
	 * Fonction qui permet de rechercher un trajet dans la base 
	 */
	private void rechercherTrajet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String villeDeDepart = (String) request.getParameter("villeDepart");
		String villeArrivee = (String) request.getParameter("villeDestination");
		String date = (String) request.getParameter("date");
		String nbrePlaces = (String) request.getParameter("nbrePlaces");
		
		if (villeDeDepart != null && villeArrivee != null && date != null && nbrePlaces != null) {
			request.setAttribute("listeDesTrajet", facade.rechercherTrajet(villeDeDepart, villeArrivee, date, nbrePlaces));
			request.getRequestDispatcher("WEB-INF/offres.jsp").forward(request, response);
		}
		else {
			System.out.println("Tous les champs de recherche doivent être renseignés !!");
			request.getRequestDispatcher("/WEB-INF/rides.jsp").forward(request, response);
		}	
    }
	
	/* 
	 * Fonction qui permet d'ajouter un trajet à la base 
	 */
	private void ajouterOffre(HttpServletRequest request, HttpServletResponse response, String login) throws ServletException, IOException {
		Utilisateur cond; 
		String ref = (String) request.getParameter("ref");
		String depart = (String) request.getParameter("depart");
		String arrivee = (String) request.getParameter("arrivee");
		String date = (String) request.getParameter("date");
		String heure = (String) request.getParameter("heure");
		String nbrPlace = (String) request.getParameter("nbr");
		String vehicule = (String) request.getParameter("vehicule");
		String message = (String) request.getParameter("message");
		cond = propositionTrajet.recupererUtilisateur(login);
		propositionTrajet.ajouterPropositionTrajet(ref, cond,depart, arrivee, date, heure, vehicule, nbrPlace, message);			
		request.getRequestDispatcher("WEB-INF/accueil.jsp").forward(request, response);	
    }
	
	private void afficherCompte(HttpServletRequest request, HttpServletResponse response, String login) throws ServletException, IOException {
		request.setAttribute("usr" , facade.findUtilisateur(login));
		request.setAttribute("listereservation", reservationTrajet.rechercheReservation(login));
		request.setAttribute("listeOffre", propositionTrajet.rechercherOffresProposees(login));
		request.getRequestDispatcher("WEB-INF/compte.jsp").forward(request, response);
	}
	
	/*
	 * Fonction qui permet la déconnexion d'un utilisateur 
	 */
	private void deconexion(HttpServletRequest request, HttpServletResponse response, String login) throws ServletException, IOException {
		login = null;
		request.getRequestDispatcher("WEB-INF/portail.jsp").forward(request, response);
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String todo = request.getParameter("todo");
		
		// Pour récupérer le login et les informations de l'utilisateur courant 
		String currentLogin = (String) request.getSession().getAttribute("login");
				
		// Si l'utilisateur n'est pas encore connecté 
		if(currentLogin == null) {
			// Si l'utilisateur essaie de se connecter
			if((todo != null)&&(todo.equals("connect"))) {
				String login = request.getParameter("login");
				String password = request.getParameter("password");
				if(facade.utilisateurValide(login, password)) {
					request.getSession().setAttribute("login", login);
					request.getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);    
				}else {
					request.getRequestDispatcher("/WEB-INF/authentification.jsp").forward(request, response);
				}
			}
			// Si l'utilisateur essaie de s'inscrire 
			else if ((todo != null)&&(todo.equals("signUp"))) {
				this.signUpUtilisateur(request, response);
			}
			// Si l'utilisateur essaie de chercher un trajet 
			else if ((todo != null)&&(todo.equals("submitRecherche"))) {
				this.rechercherTrajet(request, response);
			}
			// Quand l'utilisateur arrive sur la page d'accueil du site 
			else {
				request.getRequestDispatcher("/WEB-INF/portail.jsp").forward(request, response);	
			}
		}
		
		// Quand l'utilisateur est déjà authentifié 
		else {
			if(todo != null) {
				switch(todo) {
					case "ajoutOffre" :
						Utilisateur cond = propositionTrajet.recupererUtilisateur(currentLogin);
						request.getRequestDispatcher("/WEB-INF/propositionTrajet.jsp").forward(request, response);
						break;
					case "submitAjout" :
						this.ajouterOffre(request, response, currentLogin);
						break;	
					case "rechercher" :
						request.getRequestDispatcher("/WEB-INF/rides.jsp").forward(request, response);
						break;
					case "submitRecherche" :
						this.rechercherTrajet(request, response);
						break;
						
					/*case "reserver" :
						this.rrequest, response);
						break;*/
						
					case "compte" : 
						this.afficherCompte(request,response, currentLogin); 
						break;
					case "deconnecter" : 
						this.deconexion(request, response, currentLogin);
						break;
					default:
						request.getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
						break;	
				}
			}
			else {
				request.getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
			}
		}
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
