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

    $('#contenedorDinamico').load(modulo + 'Estudiante.php #seccionContenido', function() {
        inicializarDataTable(modulo);
    });
}

function inicializarDataTable(modulo) {
    if (modulo === 'horario') {
        $('#tablaHorario').DataTable({
            "language": idiomaEspanol,
            "responsive": true, 
            "autoWidth": false,
            "ajax": { "url": "controller/EstudianteController.php?action=obtenerHorario", "dataSrc": "" },
            "columns": [
                { "data": "dia" }, { "data": "hora" }, { "data": "materia" }, { "data": "aula" },
                { "render": function(data, type, row) { return row.nombres + ' ' + row.apellidos; } }
            ],
                  
        });
    } else if (modulo === 'calificaciones') {
        $('#tablaCalificaciones').DataTable({
            "language": idiomaEspanol,
            "responsive": true, 
            "autoWidth": false,
            "ajax": { "url": "controller/EstudianteController.php?action=obtenerCalificaciones", "dataSrc": "" },
            "columns": [
                { "data": "nombre_curso" }, { "data": "tipo_nota" }, { "data": "valor" }
            ],
            
        });
    }
}