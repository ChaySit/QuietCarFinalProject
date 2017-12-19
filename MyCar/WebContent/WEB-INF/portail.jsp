<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="not-ie no-js" lang="en">  
    <head>

        <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>QuietCar - Portail</title>
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
            <div class="top-menu">
                <section class="container">
                    <div class="row">
                            <div class="user-log">
                                <a data-toggle="modal" data-target="#loginModal">
                                    Connexion
                                </a> /
                                <a data-toggle="modal" data-target="#regModal">
                                    Inscription
                                </a>
                            </div><!-- end .user-log -->
                    </div><!-- end .row -->
                 </section><!-- end .container -->
            </div><!-- end .top-menu -->

            <div class="main-baner">

                <div class="background parallax clearfix" style="background-image:url('img/road-trip.jpg');" data-img-width="1600" data-img-height="1064">

                    <div class="main-parallax-content">

                        <div class="second-parallax-content">

                            <div class="col-md-12 col-sm-12 col-xs-12">

                                <div class="search-content">

                                    <form action="" novalidate autocomplete="off" class="idealforms searchtours">

                                        <div class="row">

                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                <div class="field">
                                                    <select id="destination" name="villeDepart">
                                                        <option value="default">De</option>
                                                        <option>Bourges</option>
                                                        <option>Paris</option>
                                                        <option>Lyon</option>
                                                        <option>Rennes</option>
                                                        <option>Nantes</option>
                                                        <option>Blois</option>
                                                        <option>Toulouse</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-3 col-xs-12">

                                                <div class="field">
                                                    <select id="destination" name="villeDestination">
                                                        <option value="default">A</option>
                                                        <option>Bourges</option>
                                                        <option>Paris</option>
                                                        <option>Lyon</option>
                                                        <option>Rennes</option>
                                                        <option>Nantes</option>
                                                        <option>Blois</option>
                                                        <option>Toulouse</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                <div class="field">
                                                    <input name="date" type="text" placeholder="Date" class="datepicker">
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                <div class="field">
                                                    <select id="destination" name="nbrePlaces">
                                                        <option value="default">Nbre de places</option>
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                <div class="field buttons">
                                                    <button type="submit" class="btn btn-lg green-color" name="todo" value="submitRecherche">Chercher</button>
                                                </div>
                                            </div>

                                        </div>


                                    </form>
                                </div><!-- end .search-content -->

                            </div><!-- end .col-sm-12 -->

                        </div><!-- end .second-parallax-content -->

                    </div><!-- end .main-parallax-content -->

                </div><!-- end .background .parallax -->

            </div><!-- end .main-baner -->

        </header><!-- end .header -->

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <%@include file="authentification.jsp" %>
        </div><!-- end .modal -->

        <div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <%@include file="inscription.jsp" %>
        </div><!-- end .modal -->

        <!-- Javascript -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- Main jQuery -->
        <script type="text/javascript" src="js/jquery.main.js"></script>
        <!-- Form -->
        <script type="text/javascript" src="js/jquery.idealforms.min.js"></script>
        <script type="text/javascript" src="js/jquery.idealselect.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
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
