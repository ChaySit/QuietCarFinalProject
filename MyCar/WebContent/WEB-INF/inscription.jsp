<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>Quiet car</title>
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

<div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>

                    <div class="modal-body">
                        <form action="" novalidate autocomplete="off" class="idealforms reg">

                            <div class="log-header">
                                <span class="log-in">Inscription</span>
                            </div>

                            <div class="field">
                                <input name="login" type="text" placeholder="Login">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input type="password" name="password" placeholder="Mot de passe">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input name="confirmPassword" type="password"  placeholder="Confirmer votre mot de passe">
                                <span class="error"></span>
                            </div>

                            <div class="field buttons">
                                <button type="submit" class="submit btn green-color" name="todo" value="signUp">Inscription</button>
                            </div>

                            <div class="clearfix"></div>

                        </form><!-- end .reg -->
                    </div><!-- end .modal-body -->

                </div><!-- end .modal-content -->
            </div><!-- end .modal-dialog -->

</body>
</html>