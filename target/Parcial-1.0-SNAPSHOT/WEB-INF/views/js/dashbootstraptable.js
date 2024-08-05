var arrData = [
            {
                'inId': 1,
                'nombre': 'Nombre',
                'genero': 'MASCULINO',
                'correo': 'correo@correo.com',
                'fechaNac': '19/01/2000',
                'estado':'Habilitado',
                'strAccion': '<button type="button" onclick="fnEditarUsuario(1)" class="btn btn-warning btn-sm" alt="Editar"><i class="bi bi-pencil"/></button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm"><i class="bi bi-trash"/></button>'
            },

            {
                'inId': 6,
                'nombre': 'Nombre',
                'genero': 'FEMENINO',
                'correo': 'correo@correo.com',
                'fechaNac': '19/01/2000',
                'estado':'Deshabilitado',
                'strAccion': '<button type="button" onclick="fnEditarUsuario(6)" class="btn btn-warning btn-sm" alt="Editar"><i class="bi bi-pencil"/></button>&nbsp;&nbsp;<button type="button" class="btn btn-success btn-sm"><i class="bi bi-check"/></button>'
            }

        ];

    //    var $table = $('#table')
    //    $(function () {
    //        $table.bootstrapTable({
    //            exportDataType: $(this).val(),
    //            exportTypes: ['csv'],
    //            columns: [
    //              {
    //                  field: 'state',
    //                  checkbox: true,
    //                  visible: $(this).val() === 'selected'
    //              },
    //              {
    //                  field: 'inId',
    //                  title: 'ID'
    //              }, {
    //                  field: 'nombre',
    //                  title: 'Nombre'
    //              }, {
    //                  field: 'genero',
    //                  title: 'Genero'
    //              }, {
    //                  field: 'correo',
    //                  title: 'Correo Electrónico'
    //              }, {
    //                  field: 'fechaNac',
    //                  title: 'Fecha Nacimiento'
    //              }, {
    //                  field: 'estado',
    //                  title: 'Estado'
    //              }, {
    //                  field: 'strAccion',
    //                  title: ''
    //              }
    //            ],
    //            data: arrData
    //        })
    //            document.getElementsByClassName("pagination-info")[0].innerHTML=
    //            document.getElementsByClassName("pagination-info")[0].innerText.replaceAll("Showing","Mostrando desde").replaceAll("to","hasta").replaceAll("of","de").replaceAll("rows","filas");
    //    })
