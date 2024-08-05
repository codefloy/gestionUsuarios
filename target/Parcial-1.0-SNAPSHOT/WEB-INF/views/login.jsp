<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        
        <link href= "<c:url value="/views//css/style.css" />" rel="stylesheet">
        <script src="<c:url value="/views/js/toggles.js" />"></script>
        <script src="<c:url value="/views/js/ajax.js" />"></script>
        
        <title>Ingreso al sistema</title>
        
        <script>
                $(function(){
                  $('#datepicker').datepicker();
                });
        </script>
    
    </head>
    <body>
        <div id="logreg-forms">
            <form class="form-signin">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> INGRESAR</h1>
                    <input  id="inputEmail" type="email"  class="form-control" placeholder="Correo electrónico" required="" autofocus="">
                    <input id="inputPassword" type="password"  class="form-control" placeholder="Password" required="">
                        <button id="login" class="btn btn-success btn-block" type="button"><i class="fas fa-sign-in-alt"></i> Ingresar</button>
                        <hr>
                        <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Crearse una nueva cuenta</button>
            </form>

            <form action="#" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> REGISTRAR NUEVA CUENTA</h1>
                    <input id="user-name" type="text"  class="form-control" placeholder="Nombre completo" required="" autofocus="">
                    <select id="genero" class="form-control" required="" autofocus="">
                        <option id="0">Seleccione</option>
                        <option id="1">Femenino</option>
                        <option id="2">Masculino</option>
                    </select>
                    <input id="user-email" type="email"  class="form-control" placeholder="Correo electronico" required="" autofocus="">
                    <input id="fecha" type="date"  class="form-control" placeholder="Fecha de nacimiento" required="" />
                    <input id="user-pass" type="password"  class="form-control" placeholder="Password" required="" autofocus="">
                    <input id="user-repeatpass" type="password"  class="form-control" placeholder="Repetir Password" required="" autofocus="">
                        <button id="registrar" class="btn btn-primary btn-block" type="button" ><i class="fas fa-user-plus"></i> Registrarse</button>
                    <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Volver</a>
                    <div id="mensajeRespuesta"> </div>
            </form>
                <br>
        </div>
        
<!--        <p style="text-align:center">
            <a href="http://bit.ly/2RjWFMfunction" toggleResetPswd(e){
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() // display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

                function toggleSignUp(e){
                    e.preventDefault();
                    $('#logreg-forms .form-signin').toggle(); // display:block or none
                    $('#logreg-forms .form-signup').toggle(); // display:block or none
                }
        </p>-->
    </body> 
</html>