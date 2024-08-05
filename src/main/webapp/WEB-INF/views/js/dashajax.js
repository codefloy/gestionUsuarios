
//      
// function fnEditarUsuario(idUsuario) {
//                        Swal.fire({
//                  title: 'Edición de Usuario',
//                  html: '<table border="0"><tr><td>Nombre:</td><td><input id="newNombre" class="swal2-input"></td></tr>' +
//                        '<tr><td>Genero:</td><td><select id="newGenero" class="select-box-confirm"><option value="1">Femenino</option><option value="2">Masculino</option></select></td></tr>'+
//                        '<tr><td>Correo electronico:</td><td><input id="newCorreo" class="swal2-input"></td></tr>'+
//                            '<tr><td>Fecha Nacimiento:</td><td><input id="newFecha" class="swal2-input"></td></tr>'+
//                            '<tr><td>Nueva Password:</td><td><input id="newFecha" class="swal2-input"></td></tr></table>',
//                  inputAttributes: {
//                  autocapitalize: 'off'
//                  },
//                  showCancelButton: true,
//                  confirmButtonText: 'Registrar',
//                  showLoaderOnConfirm: true,
//                  preConfirm: (metodo) => {
//                    return fetch(`//<ruta_controller>${metodo}`)
//                      .then(response => {
//                        if (!response.ok) {
//                          throw new Error(response.statusText)
//                        }
//                        return response.json()
//                      })
//                      .catch(error => {
//                        Swal.showValidationMessage(
//                          `Request failed: ${error}`
//                        )
//                      })
//                  },
//                  allowOutsideClick: () => !Swal.isLoading()
//                }).then((result) => {
//                  if (result.isConfirmed) {
//                    Swal.fire('Proceso exitoso', '', 'success')
//                  } else if (result.isDenied) {
//                    Swal.fire('Hubo errores', '', 'info')
//                  }
//                });
//                $('#newFecha').datepicker();
//            }

//        $(document).ready(function () {
//
//                $("#buscar").click(function () {
//                $.ajax({
//                    url: "http://localhost:8080/Parcial/rest/use/getUserDB",
//                    method: "GET",
//                    contentType: 'application/json',
//                    dataType: "json",
//                    success: function (data) {
//                        alert("Hola");
//                        
//                        
//                    },
//                    error: function (xhr, status, error) {
//                        $("#mensajeRespuesta").text("Error en la solicitud: " + xhr.status + " - " + error);
//                    }
//                    });
//                    });
//
//              });