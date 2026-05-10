<?php
require_once '../../recursos/session_helper.php';
require_once '../config/database.php';
require_once 'model/Estudiante.php';

verificarRol('Estudiante');

$db = new Database();
$estudianteModel = new Estudiante($db->getConnection());
$horarioData = $estudianteModel->obtenerHorarioDetallado($_SESSION['id_usuario_hex']);
$infoAcademica = $estudianteModel->obtenerInfoAcademica($_SESSION['id_usuario_hex']);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Horario de Clases</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
</head>
<body>
    <?php include '../../recursos/headerEstudiante.php'; ?>

    <main id="seccionContenido" class="container my-1">
        <h2 class="text-center mb-4">Horario de Clases</h2>
        
        <?php if ($infoAcademica): ?>
            <div class="text-center mb-4">
                <p class="mb-1"><strong>Facultad:</strong> <?php echo htmlspecialchars($infoAcademica['facultad']); ?></p>
                <p><strong>Periodo:</strong> <?php echo htmlspecialchars($infoAcademica['periodo']); ?></p>
            </div>
        <?php endif; ?>
        
        <table id="tablaHorario" class="table table-striped table-bordered shadow-sm">
            <thead class="thead-dark">
                <tr>
                    <th>Día</th>
                    <th>Hora</th>
                    <th>Materia</th>
                    <th>Aula</th>
                    <th>Docente</th>
                </tr>
            </thead>
            <tbody>
                </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="indexEstudiante.php" class="btn btn-secondary">Regresar al Dashboard</a>
        </div>
        
    </main>

    <?php include '../../recursos/footer.php'; ?>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    

</body>
</html>