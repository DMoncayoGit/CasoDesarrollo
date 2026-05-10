
function gestionarAsistencia(id_curso) {
    $('#contenedorDinamico').load('view/asistenciaView.php?id_curso=' + id_curso + ' #seccionContenido', function() {
        inicializarDataTableAsistencia(id_curso);
        cargarEstadosAsistencia(); 
    });
}

function inicializarDataTableAsistencia(id_curso) {
    if ($.fn.DataTable.isDataTable('#tablaAsistenciasDetalle')) {
        $('#tablaAsistenciasDetalle').DataTable().destroy();
    }

    $('#tablaAsistenciasDetalle').DataTable({
        "language": idiomaEspanol,
        "ajax": {
            "url": "controller/AsistenciasController.php?action=listar&id_curso=" + id_curso,
            "dataSrc": ""
        },
        "columns": [
            { "data": "nombres" },
            { "data": "apellidos" },
            { "data": "asistencia" }
        ]
    });
}
