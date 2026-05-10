const idiomaEspanol = {
    "sProcessing":     "Procesando...",
    "sLengthMenu":     "Mostrar _MENU_ registros",
    "sZeroRecords":    "No se encontraron resultados",
    "sEmptyTable":     "Ningún dato disponible en esta tabla",
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
    "sSearch":         "Buscar:",
    "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Siguiente",
        "sPrevious": "Anterior"
    }
};

function cargarModulo(modulo) {
    
    $('#menuDashboard').fadeOut();
    $('#contenedorDinamico').html('<div class="text-center mt-5"><h3>Cargando información...</h3></div>');

    $('#contenedorDinamico').load('view/' + modulo + 'View.php #seccionContenido', function() {
        inicializarDataTable(modulo);
    });
}

function inicializarDataTable(modulo) {

    if (modulo === 'cursos') {
        $('#tablaCursos').DataTable({
            "language": idiomaEspanol,
            "responsive": true,
            "autoWidth": false,
            "ajax": { 
                "url": "controller/DocenteController.php?action=listarCursos", 
                "dataSrc": "" 
            },
            "columns": [
                { "data": "nombre_curso" },
                { "data": "codigo" },
                {
                    "render": function(data, type, row) {
                        return `
                            <a class="btn btn-sm btn-info btn-cargar-asistencia" data-id="${row.id_curso}">Asistencia</a>
                            <a class="btn btn-sm btn-warning btn-cargar-calificacion" data-id="${row.id_curso}">Calificaciones</button>
                        `;
                    }
                }
            ]
        });
    }
       
    

    $(document).ready(function() {
        $(document).on('click', '.btn-cargar-asistencia', function() {
            let id_curso = $(this).data('id');
            // Cambia la ruta aquí si es necesario (asistenciaView vs asistenciasView)
            $('#contenedorDinamico').load('view/asistenciasView.php?id_curso=' + id_curso + ' #seccionContenido', function() {
                if (typeof inicializarDataTableAsistencia === 'function') {
                    inicializarDataTableAsistencia(id_curso);
                    
                }
            });
        });

        $(document).on('click', '.btn-cargar-calificacion', function() {
            let id_curso = $(this).data('id');
            
            $('#contenedorDinamico').load('view/calificacionesView.php?id_curso=' + id_curso + ' #seccionContenido', function() {
                
                if (typeof inicializarDataTableCalificaciones === 'function') {
                    inicializarDataTableCalificaciones(id_curso);
                }
               
            });
        });
    });
}
