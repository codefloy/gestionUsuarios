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
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">
        <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/extensions/custom-view/bootstrap-table-custom-view.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
<!--        <script src="<c:url value="/views/js/dashajax.js" />"></script>-->
        
        <title>Mantenimiento de usuarios</title>
        <script>
                $(function(){
                  $('#fecNacimiento').datepicker();
                });
        </script>
        
        <script>
            
//            function ver(){
//                    const inputBuscar = document.getElementById('searchNombre');
//                    const celdas = document.getElementsByTagName('td');
//                    
//                    fetch('https://jsonplaceholder.typicode.com/users')
//                        .then( response => response.json() )
//                        .then( json => mostrarDatos(json) )
//                        .catch( e => console.log(e) );
//
//                    const mostrarDatos = (data) => {
//                        console.log(data);
//                        let body='';
//                        var listaUsuarios = $("#datos");
//                        listaUsuarios.html('');
//                        
//                        $.each(data, function (index, empleado){
//                            body += '<tr><td name="elemento">'+empleado.name+'</td></tr>';
//                        });
//                        listaUsuarios.append(body);
//                    }; 
//                    const elementos = document.getElementsByClassName('elemento');
//                    
//                    inputBuscar.addEventListener('keyup', (e)=>{
//                        let tecleo = e.target.value;
//                        console.log(tecleo);
//                        let er = new RegExp(tecleo, "i");
//                        
//                        for(let i=0; i<celdas.length; i++) {
//                            let valor = celdas[i];
//                            console.log(valor);
//                            if(er.test(valor.innerText)){
//                                valor.classList.remove("ocultar");
//                            }else{
//                                valor.classList.add("ocultar");
//                            }
//                        }
//                    });
//                }
            
            function identificarestado(estado){
                      if (estado === "Habilitado") {
                          clase="btn btn-danger btn-sm";
                      }else{
                          clase="btn btn-success btn-sm";
                      }
                      return clase;
                    }
            function identificarestadoicono(estado){
                      if (estado === "Habilitado") {
                          clase="bi bi-trash";
                      }else{
                          clase="bi bi-check";
                      }
                      return clase;
                    }
            
            function buscarNombre(er) {
                          var colu = $("td:nth-child(2)");
                          colu.each(function() {
                            var valorColumna = $(this).text();
                            if (er.test(valorColumna)) {
//                                console.log("texto esta dentro de : "+valorColumna);
                                $(this).closest("tr").show();
                            }else{
                                $(this).closest("tr").hide();
                            }
                    });
                    };    
                    
            function buscarGenero(genero) {
                          var colu = $("td:nth-child(3)");
                          colu.each(function() {
                            var valorColumna = $(this).text();
                            if (valorColumna === genero) {
//                                console.log("texto es igual a genero: "+valorColumna);
                                $(this).closest("tr").show();
                            }else{
                                $(this).closest("tr").hide();
                            }
                    });
                    };        

            function buscarFecha(fecha) {
                          var colu = $("td:nth-child(5)");
                          colu.each(function() {
                            var valorColumna = $(this).text();
                            if (valorColumna === fecha) {
//                                console.log("texto es igual a fecha "+valorColumna);
                                $(this).closest("tr").show();
                            }else{
                                $(this).closest("tr").hide();
                            }
                    });
                    }; 
            
//            function converfechadeañoadia(fecha){
//                var partes = fecha.split("-");
//                var fecho = partes[2] + "/" + partes[1] + "/" + partes[0];
//                return fecho;
//            };
            
            function fnhabilitar(id) {
                var datos = "?id="+id;
                $.ajax({
                url: "http://localhost:8080/Parcial/rest/use/editUserDB"+datos,
                method: "POST",
                contentType: 'application/json',
                dataType: "json",
                    success: function (data) {
                        Swal.fire({
                            title: 'Habilitar / Deshabilitar',
                            html: 
                                  '<table border="0"><tr><td>¿Estas seguro?</td>\n\
                                   <td><input type="hidden" id="newid" class="swal2-input" value="'+data.id+'" ></td>\n\
                                   <td><input type="hidden" id="newEstado" class="swal2-input" value="'+data.estado+'" ></td>\n\
                                   </tr></table>',
                        inputAttributes: {
                            autocapitalize: 'off'
                            },
                            confirmButtonText: 'Sí',
                            cancelButtonText: 'No',
                            showCancelButton: true,
                            showLoaderOnConfirm: true,
                        preConfirm: (updateUsuariosDBestado) => {
                            id=$('#newid').val();
                            estado=$('#newEstado').val();
                            var datos = '?id='+id+'&estado='+estado;
                            return fetch(`http://localhost:8080/Parcial/rest/use/updateUserDBestado`+datos,{updateUsuariosDBestado,method:"POST",contentType: 'application/json',dataType: "json"})
                            .then(response => {
                                if (!response.ok) {
                                   throw new Error(response.statusText); 
                                }
                                    rjson = JSON.stringify(response);
                                    return rjson;
                            })
                            .catch(error => {
                              Swal.showValidationMessage(
                                `Msjerror:` +error
                              );
                            });
                        },
                    allowOutsideClick: () => !Swal.isLoading()
                    }).then((result) => {
                        if (result.isConfirmed) {
                          Swal.fire('Proceso exitoso', '', 'success');
                          listar();
                        } else if (result.isDenied) {
                          Swal.fire('Hubo errores', '', 'info');
                        }
                    });
                 },  
                    error: function (xhr, status, error) {
                        if (xhr.status === 204) {
                        $("#mensajeRespuesta").text("No se ha encontrado información de empleado alguno.");
                        }
                        if (xhr.status === 404) {
                        $("#mensajeRespuesta").text("No se ha encontrado información para el ID " + id + ".");
                        } else {
                        $("#mensajeRespuesta").text("Error en la solicitud: " + status + " - " + error);
                        }
                    }
                    });
            }
            
            
            function fneditar(id) {
                   var datos = "?id="+id;
                $.ajax({
                url: "http://localhost:8080/Parcial/rest/use/editUserDB"+datos,
                method: "POST",
                contentType: 'application/json',
                dataType: "json",
               
                    success: function (data) {
                        var fechaLegible = new Date(data.fecha);
                        var dia = ("0" + fechaLegible.getDate()).slice(-2);
                        var year = fechaLegible.getFullYear();
                        var mes = ("0" + (fechaLegible.getMonth()+1)).slice(-2);
                        var fecho = year+"-"+mes+"-"+dia;
                        Swal.fire({
                            title: 'Edición de Usuarios',
                            html: 
                                  '<table border="0"><tr><td>Nombres :</td><td><input id="newNombre" class="swal2-input" value="'+data.nombres+'" ></td></tr>' +
                                  ' <tr><td></td><td><input type="hidden" id="newid" class="swal2-input" value="'+data.id+'" ></td></tr>' +
                                  ' <tr><td></td><td><input type="hidden" id="newEstado" class="swal2-input" value="'+data.estado+'" ></td></tr>' +
                                  '<tr><td>Genero:</td><td><select id="newGenero" class="select-box-confirm"><option value="1">Femenino</option><option value="2">Masculino</option></select></td></tr>'+
                                  '<tr><td>Correo electronico:</td><td><input id="newCorreo" class="swal2-input" value="'+data.correo+'"></td></tr>'+
                                  '<tr><td>Fecha Nacimiento:</td><td><input type="date" id="newFecha" class="swal2-input" value="'+fecho+'"></td></tr>'+
                                  '<tr><td>Nueva Password:</td><td><input id="newPass" class="swal2-input"></td></tr></table>',
                        inputAttributes: {
                            autocapitalize: 'off'
                            },
                            confirmButtonText: 'Actualizar',
                            showCancelButton: true,
                            showLoaderOnConfirm: true,
                            
                        preConfirm: (updateUsuariosDB) => {
                            id=$('#newid').val();
                            name=$('#newNombre').val();
                            var cbo = document.getElementById("newGenero");
                            var gen = cbo.options[cbo.selectedIndex].text;
                            gene=gen;
                            corre=$('#newCorreo').val();
                            estado=$('#newEstado').val();
                             
                            fecha =$('#newFecha').val();
//                            var dateObject = new Date(fecha);
//                            fechaSQL = dateObject.toLocaleDateString('en-CA');
//                            console.log(fecha,dateObject,fechaSQL);
                            
                            pass=$('#newPass').val();
                            var datos = '?id='+id+'&nombres='+name+'&genero='+gene+'&correo='+corre+'&fecha='+fecha+'&estado='+estado+'&pass='+pass;
                            return fetch(`http://localhost:8080/Parcial/rest/use/updateUserDB`+datos,{updateUsuariosDB,method:"POST",contentType: 'application/json',dataType: "json"})
                            .then(response => {
                                if (!response.ok) {
                                   throw new Error(response.statusText); 
                                }
                                    rjson = JSON.stringify(response);
                                    return rjson;
                                    
                            })
                            .catch(error => {
                              Swal.showValidationMessage(
                                `Msjerror:` +error
                              );
                            });
                        },
                    allowOutsideClick: () => !Swal.isLoading()
                    }).then((result) => {
                        if (result.isConfirmed) {
                          Swal.fire('Proceso exitoso', '', 'success');
                          listar();
                        } else if (result.isDenied) {
                          Swal.fire('Hubo errores', '', 'info');
                        }
                    });
                 },  
                    error: function (xhr, status, error) {
                        if (xhr.status === 204) {
                        $("#mensajeRespuesta").text("No se ha encontrado información de empleado alguno.");
                        }
                        if (xhr.status === 404) {
                        $("#mensajeRespuesta").text("No se ha encontrado información para el ID " + id + ".");
                        } else {
                        $("#mensajeRespuesta").text("Error en la solicitud: " + status + " - " + error);
                        }
                    }
                    });
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
                
//                function identificarbusqueda(){
//                    var bnombres = $("#searchNombre");
//                    var bgenero = $("#searchNombre");
//                    var bfecha = $("#searchNombre");
//                    var dato;
//                    
//                    if (bnombres === null ){
//                        if(bgenero === null){
//                            if(bfecha === null){
//                                alert("Realize al menos un tipo de búsqueda"); 
//                            }else{
//                                dato = busFecha;
//                            }
//                        }else{
//                            if(bfecha === null){
//                                dato = busGenero;
//                            }else{
//                                dato = busGenero+busFecha;
//                            }
//                        }
//                    }else{
//                         if(bgenero === null){
//                            if(bfecha === null){
//                                dato = busNombre; 
//                            }else{
//                                dato = busNombre+busFecha;
//                            }
//                        }else{
//                            if(bfecha === null){
//                                dato = busNombre+busGenero;
//                            }else{
//                                dato = busNombre+busGenero+busFecha;
//                            }
//                        }     
//                    }
//                    return tipo;
//                }
            
            function listar(){
//                var dato = '?porNombre=FloyChavez&porGenero=Mas&porFecha=';
                $.ajax({
                    url: "http://localhost:8080/Parcial/rest/use/getUserDB",
                    method: "GET",
                    contentType: 'application/json',
                    dataType: "json",
                    success: function (data){
                        var listaUsuarios = $("#tablaEmp");
                        listaUsuarios.html('');
                        $.each(data, function (index, empleado) {
                        var fechaLegible = new Date(empleado.fecha);
                        var dia = ("0" + fechaLegible.getDate()).slice(-2);;
                        var year = fechaLegible.getFullYear();
                        var mes = ("0" + (fechaLegible.getMonth()+1)).slice(-2);
                        var fecho = year+"-"+mes+"-"+dia;
                        var clas = identificarestado(empleado.estado);
                        var ico = identificarestadoicono(empleado.estado);
                        listaUsuarios.append("<tr><td>" + empleado.id + "</td><td>" + empleado.nombres + "</td><td>" + empleado.genero + "</td><td>" + empleado.correo + "</td><td>" + fecho + "</td><td>" + empleado.estado + "</td>\n\
                        <td><button type='button' onclick='javascript:fneditar("+empleado.id+")' class='btn btn-warning btn-sm' alt='Editar'><i class='bi bi-pencil'/></i></button>&nbsp;&nbsp;\n\
                        <button type='button' onclick='javascript:fnhabilitar("+empleado.id+")' class='"+clas+"'><i class='"+ico+"'/></i></button></td>\n\
                        <tr>");
                        });
//                        window.onload = function what(){
//                        document.getElementsByClassName("pagination-info")[0].innerHTML=
//                        document.getElementsByClassName("pagination-info")[0].innerText.replaceAll("Showing","Mostrando desde").replaceAll("to","hasta").replaceAll("of","de").replaceAll("rows","filas");
//                        };
                    },
                    error: function (xhr, status, error) {
                        $("#mensajeRespuesta").text("Error en la solicitud: " + xhr.status + " - " + error);
                    }
                    });
                }
            
        $(document).ready(function () {
            
                listar();
                identificarestado();
                
                $("#limpiar").click( function(){
              
                document.getElementById('searchNombre').value="";
                document.getElementById('searchGenero').options.length = 1;;
                document.getElementById("searchFecha").value="";
                listar();
                });
                 
                var inputNombre = document.getElementById('searchNombre');
                var inputGenero = document.getElementById('searchGenero');
                var inputFecha = document.getElementById('searchFecha');
                
                inputNombre.addEventListener('keyup', (e)=>{
                    let tecleo = e.target.value;
                    let er = new RegExp(tecleo, "i");
                    buscarNombre(er);
                });
                
                inputGenero.addEventListener('change', function(){
                    let cbo = document.getElementById("searchGenero");
                    let gen = cbo.options[cbo.selectedIndex].text;
                    buscarGenero(gen);
                });
              
                inputFecha.addEventListener('change', function(){
                    let fecha = inputFecha.value;
                    buscarFecha(fecha);
                });
              });
                
            </script>
        
    </head>
    <body>
        <div class="card">
            <h6 class="card-header text-white bg-secondary text-start py-3"><span class="">MANTENIMIENTO DE USUARIOS</span></h6>
                <form class="card-body shadow row gy-2 gx-3 align-items-center">
                    <!-- sección de los filtros de búsqueda-->
                    <div class="col-md-12">
                        <label for="txtNombre">Nombre Completo</label>
                        <div class="input-group">
                            <span class="input-group-text" id="basic-addon1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="30" fill="currentColor" class="bi bi-card-heading" viewBox="0 0 16 16">
                                  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                  <path d="M3 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0-5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-1z"/>
                                </svg>
                            </span>
                            <input id="searchNombre" type="text" class="form-control"  placeholder="Nombre del Usuario">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="cboGenero">Genero</label>
                        <div class="input-group">
                            <span class="input-group-text" id="basic-addon1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="24" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                <path d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1ZM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1ZM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1Zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1ZM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1Zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1Z"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V1Zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3V1Z"/>
                                </svg>
                                </span>
                                <select id="searchGenero" class="form-control"   name="inTipoDocIden" >
                                    <option value="0">Seleccione</option>
                                    <option value="1">Femenino</option>
                                    <option value="2">Masculino</option>
                            </select>
                        </div>
                    </div>
                                <div class="col-md-4">
                        <label for="fecNacimiento">Fecha Nacimiento</label>
                        <div class="input-group">
                            <span class="input-group-text" id="basic-addon3">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="30" fill="currentColor" class="bi bi-calendar-date-fill" viewBox="0 0 16 16">
                                <path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zm5.402 9.746c.625 0 1.184-.484 1.184-1.18 0-.832-.527-1.23-1.16-1.23-.586 0-1.168.387-1.168 1.21 0 .817.543 1.2 1.144 1.2z"/>
                                <path d="M16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zm-6.664-1.21c-1.11 0-1.656-.767-1.703-1.407h.683c.043.37.387.82 1.051.82.844 0 1.301-.848 1.305-2.164h-.027c-.153.414-.637.79-1.383.79-.852 0-1.676-.61-1.676-1.77 0-1.137.871-1.809 1.797-1.809 1.172 0 1.953.734 1.953 2.668 0 1.805-.742 2.871-2 2.871zm-2.89-5.435v5.332H5.77V8.079h-.012c-.29.156-.883.52-1.258.777V8.16a12.6 12.6 0 0 1 1.313-.805h.632z"/>
                              </svg>
                            </span>
                            <input id="searchFecha" type="date" class="form-control"  placeholder="Fecha Nacimiento">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label for="btnBuscarOEC">&nbsp;</label>
                        <div class="input-group">
                            <button id="limpiar" type="button" class="btn btn-warning btn-lg">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-menu-button-fill" viewBox="0 0 16 16">
                                  <path d="M1.5 0A1.5 1.5 0 0 0 0 1.5v2A1.5 1.5 0 0 0 1.5 5h8A1.5 1.5 0 0 0 11 3.5v-2A1.5 1.5 0 0 0 9.5 0h-8zm5.927 2.427A.25.25 0 0 1 7.604 2h.792a.25.25 0 0 1 .177.427l-.396.396a.25.25 0 0 1-.354 0l-.396-.396zM0 8a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V8zm1 3v2a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2H1zm14-1V8a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2h14zM2 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"></path>
                                </svg>
                               Limpiar 
                            </button>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <fieldset class="fieldsetLeyenda">
                        <legend class="legendLeyenda">LEYENDA</legend>
                            Editar:&nbsp;<button type="button" class="btn btn-warning btn-sm"><i class="bi bi-pencil"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Habilitar:&nbsp;<button type="button" class="btn btn-success btn-sm"><i class="bi bi-check"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Deshabilitar:&nbsp;<button type="button" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></button>
                        </fieldset>
                    </div>
                    
                <div class="col-md-12">&nbsp;</div>
                    <div class="col-md-12">
                        <table id="table"
                          data-search="true"
                          data-pagination="true"
                          data-page-size="5"
                          data-show-custom-view="false"
                          data-show-custom-view-button="true">
                        </table>
                        <table data-toggle="table">
                            <thead>
                                <tr>
                                <th>Id</th>
                                <th>Nombres</th>
                                <th>Género</th>
                                <th>Correo</th>
                                <th>Fecha Nacimiento</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tablaEmp">
                            </tbody>
                            
                        </table>
                        <table>
                            <tbody id="datos">
                            </tbody>
                            </table>
                    </div>
            </form>
        </div>
    </body>
</html>

