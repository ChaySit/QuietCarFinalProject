<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html class="not-ie no-js" lang="en"> 
    <head>
        <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Liste des offres pour votre recherche</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Styles -->

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Forms -->
        <link href="css/jquery.idealforms.css" rel="stylesheet">
        <!-- Select  -->
        <link href="css/jquery.idealselect.css" rel="stylesheet">
        <!-- Slicknav  -->
        <link href="css/slicknav.css" rel="stylesheet">
        <!-- Main style -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Modernizr -->
        <script src="js/modernizr.js"></script>

        <!-- Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <header class="header">
			<%@include file="top_menu.jsp" %>

            <div class="main-baner">

                <div class="background parallax clearfix" style="background-image:url('img/road-trip.jpg');" data-img-width="1600" data-img-height="764">

                    <div class="main-parallax-content">

                        <div class="second-parallax-content">

                            <section class="container">

                                <div class="row">

                                    <div class="main-header-container clearfix">

                                        <div class="col-md-4 col-sm-12 col-xs-12">

                                            <div class="logo">
                                                <h1>QuietCar</h1>
                                            </div><!-- end .logo -->

                                        </div><!-- end .col-sm-4 -->

                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <nav id="nav" class="main-navigation">
                                                <ul class="navigation">
                                                    <li>
                                                        <a href="http://localhost:8080/MyCar/MainServlet">Accueil</a>
                                                    </li>
                                                    <li>
                                                        <a href="http://localhost:8080/MyCar/MainServlet?todo=rechercher" >Rechercher un trajet</a>
                                                    </li>
                                                    <li>
                                                        <a href="http://localhost:8080/MyCar/MainServlet?todo=ajoutOffre">Ajouter un trajet</a>
                                                    </li>
                                                    <li>
                                                        <a href="http://localhost:8080/MyCar/MainServlet?todo=compte">Compte</a>
                                                    </li>
                                                </ul>
                                            </nav><!-- end .main-navigation -->
                                        </div><!-- end .col-md-8 -->
                                    </div><!-- end .main-header-container -->

                                </div><!-- end .row -->

                            </section><!-- end .container -->

                        </div><!-- end .second-parallax-content -->

                    </div><!-- end .main-parallax-content -->

                </div><!-- end .background .parallax -->

            </div><!-- end .main-baner -->

        </header><!-- end .header -->

        <section class="main-content">

            <div class="container">
                <div class="row">

                   <div class="col-md-8 col-sm-8 col-xs-12">

                     <div class="page-content">
                      <c:if test= "${listeDesTrajet.size() != 0}"> 
						<c:forEach items="${listeDesTrajet}" var="off">
                            <article class="single-article">

                                <header class="single-article-title">
                                    <h2>Ce trajet est prposé par ${off.conducteur.prenom} ${off.conducteur.nom}</h2>
                                    <span><a href="#">(${off.depart} - ${off.arrivee})</a></span>
                                </header>

                                <ul class="article-meta">
                                    <li class="article-date">
                                        <a href="#" class="tooltip-link" data-original-title="Date" data-toggle="tooltip">
                                            <i class="fa fa-calendar"></i>
                                            Le ${off.date}
                                        </a>
                                    </li><!-- end .article-date -->
                                    <li class="article-people">
                                        <a href="#" class="tooltip-link" data-original-title="Number of seats" data-toggle="tooltip">
                                            <i class="fa fa-user"></i>
                                            ${off.nombrePlace}
                                        </a>
                                    </li><!-- end .article-people -->
                                    <li>
                                        <a href="#" class="tooltip-link" data-original-title="Car" data-toggle="tooltip">
                                            <i class="fa fa-car"></i>
                                            ${off.vehicule}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="tooltip-link" data-original-title="Number" data-toggle="tooltip">
                                            <i class="fa fa-mobile"></i>
                                            ${off.conducteur.telephone}
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <i class="fa fa-envelope"></i>
                                            ${off.conducteur.mail}
                                        </a>
                                    </li>
                                </ul><!-- end .article-meta -->

                                 <div class="article-content">
                                     Ici on peut ajouter un message posté par le conducteur pour expliquer ce qu'il veut ...
                                     ${off.message}
                                 </div>
                                 <BR>
                                 <div class="field buttons">
                                	<button type="submit" class="submit btn green-color" name="todo" value="reserver">Reserver</button>
                            	 </div>
                            	<BR>
                            </article>
                            </c:forEach>
                          </c:if>
                          <p > Aucun trajet ne correspont à votre recherche :( </p>
                        </div><!-- end .page-content -->

                    </div><!-- end .col-md-12 col-sm-12 col-xs-12 -->
                    

                </div><!-- end .row -->
            </div><!-- end .container -->

        </section><!-- end .main-content -->

        <!-- Javascript -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- Main jQuery -->
        <script type="text/javascript" src="js/jquery.main.js"></script>
        <!-- Form -->
        <script type="text/javascript" src="js/jquery.idealforms.min.js"></script>
        <script type="text/javascript" src="js/jquery.idealselect.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
        <!-- Menu -->
        <script type="text/javascript" src="js/hoverIntent.js"></script>
        <script type="text/javascript" src="js/superfish.js"></script>
        <!-- Counter-Up  -->
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <script type="text/javascript" src="js/jquery.counterup.min.js"></script>
        <!-- Rating  -->
        <script type="text/javascript" src="js/bootstrap-rating-input.min.js"></script>
        <!-- Slicknav  -->
        <script type="text/javascript" src="js/jquery.slicknav.min.js"></script>

    </body>
</html>
