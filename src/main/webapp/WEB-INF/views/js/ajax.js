
    function limpiar(){
                document.getElementById("user-name").value = "";
                var cbo = document.getElementById("genero");
                cbo.selected = "Seleccione";
                document.getElementById("user-email").value = "";
                document.getElementById("fecha").value = "";
                document.getElementById("user-pass").value = "";
                document.getElementById("user-repeatpass").value = "";
            } 
    
    function validarContrasena(pass) {
            var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
            return regex.test(pass);
          }
    
     function fnregistrar() {
                      var ename = $('#user-name').val();
                      var egenero = $('#genero').val();
                      var ecorreo = $('#user-email').val();
                      var efecha = $('#fecha').val();
                      var epass = $('#user-pass').val();
                      var datos = "?nombres="+ename+"&genero="+egenero+"&correo="+ecorreo+"&fecha="+efecha+"&pass="+epass;
                      console.log(datos);
                      $.ajax({
                          url: "http://localhost:8080/Parcial/rest/use/addUserDB"+datos,
                          method: "POST",
                      success: function (response) {
                          alert(response);
                      },
                      error: function (xhr, status, error) {
                          $("#mensajeRespuesta").text("Error en la solicitud: " + xhr.status + " - " + error);
                      }
                      });
                      }
         
         function fnlogin() {
            var enuser = $('#inputEmail').val();
            var epass = $('#inputPassword').val();
            var datos = "?correo="+enuser+"&pass="+epass;
            console.log(datos);
            $.ajax({
                url: "http://localhost:8080/Parcial/rest/use/validarUserDB"+datos,
                method: "POST",
            success: function (response) {
                if(response === "ok"){
                    alert("Bienvenido");
                    window.location.href = "dashboard.jsp";
                }else{
                    alert("El usuario y/o la contraseña son erróneos, por favor verificar los datos ingresados");
                }

            },
            error: function (xhr, status, error) {
                $("#mensajeRespuesta").text("Error en la solicitud: " + xhr.status + " - " + error);
            }
            });
            }
         
        $(document).ready(function () {
              
             $("#login").click( function(){
                var nusuario = $("#inputEmail").val();
                var pass = $("#inputPassword").val();
                if(nusuario === ""|| pass === "" ){
                        alert("Debe ingresar los datos solicitados");     
                    }else{
                        fnlogin();
                    }     
             }); 
              
             $("#registrar").click( function(){
                var nombres = $("#user-name").val();
                var cbo = document.getElementById("genero");
                var correo = $("#user-email").val();
                var fecha = $('#fecha').val();
                var epass = $('#user-pass').val();
                var epass2 = $('#user-repeatpass').val();
                if(nombres === ""|| cbo === "Seleccione"|| correo === "" || fecha === "" || epass === "" || epass2 === ""){
                        alert("Por favor verifique la información ingresada, debe llenar correctamente todos los campos");     
                    }else{
                        if (validarContrasena(epass)){
                            if (epass === epass2){
                                fnregistrar();
                                limpiar();
                                $('.form-signin').submit();
                                $('#logreg-forms .form-signin').toggle();
                            }else{
                                alert("Las contraseñas deben coincidir.");
                            return false;
                            }
                        }else {
                        alert("La contraseña debe cumplir con los siguientes requisitos: \n\ - 8 digitos como minimo \n\ - 1 Mayuscula \n\ - 1 Minuscula \n\ - 1 Número");
                        }
                    }     
             });
              
         });