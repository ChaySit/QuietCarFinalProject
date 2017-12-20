<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
		<div class="top-menu">
             <section class="container">
                 <div class="row">
      
                    <div class="col-md-10 col-sm-10 col-xs-12">
	                    <div class="user-log">
	                         Bonjour ${login} 
	                    </div><!-- end .user-log -->
                    </div>
                    
                    <div class="col-md-2 col-sm-2 col-xs-12">
	                    <div action="" class="field buttons">
	                         <button type="submit" class="submit btn green-color" name="todo" value="deconnecter">Déconnexion</button>
	                    </div>
                    </div>
                    
                 </div><!-- end .row -->
              </section><!-- end .container -->
         </div><!-- end .top-menu -->
</body>
</html>