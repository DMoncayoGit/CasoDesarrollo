<?php
/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

session_start();

$id_u = $_SESSION['id_universidad'] ?? ''; 
$id_f = $_SESSION['id_facultad'] ?? '';
$id_p = $_SESSION['id_periodo'] ?? '';
$id_curso = $_GET['id_curso'] ?? '';

echo "<!-- Debug Sesion: u=$id_u, f=$id_f, p=$id_p -->";

if (!$id_u || !$id_curso) {
    echo "<div class='alert alert-danger'>Error: Sesión no válida o curso no especificado.</div>";
   
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Asistencia</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
</head>

<body>
    <?php include '../../recursos/headerDocente.php'; ?> 

    <main id="seccionContenido" class="container-fluid">
        
        <div class="info-header text-center mb-5">
            <h2 class="text-center mb-4">Control de Asistencias</h2>
        </div>

   
        <div class="card-body">
            <table id="tablaAsistenciasDetalle" class="table table-hover table-striped w-100">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Asistencia</th>
                    </tr>
                </thead>
            </table>
        </div>

        <div class="text-center mt-4">
            <a href="indexDocente.php" class="btn btn-secondary">Regresar al Dashboard</a>
        </div>
  

    </main>

    <?php include '../../recursos/footer.php'; ?>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script src="js/crudAsistencia.js"></script>
    
</body>
</html>




