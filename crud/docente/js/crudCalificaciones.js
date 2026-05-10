function gestionarCalificaciones(id_curso) {
    $('#contenedorDinamico').load('view/calificacionesView.php?id_curso=' + id_curso + ' #seccionContenido', function() {
        inicializarDataTableCalificaciones(id_curso);
    });
}

function inicializarDataTableCalificaciones(id_curso) {
    if ($.fn.DataTable.isDataTable('#tablaCalificacionesDetalle')) {
        $('#tablaCalificacionesDetalle').DataTable().destroy();
    }

    $('#tablaCalificacionesDetalle').DataTable({
        "language": idiomaEspanol,
        "ajax": {
            "url": "controller/CalificacionesController.php?action=listar&id_curso=" + id_curso,
            "dataSrc": ""
        },
        "columns": [
            { "data": "nombres" },
            { "data": "apellidos" },
            { "data": "tipo_nota" },
            { "data": "valor" }
        ]
    });
}