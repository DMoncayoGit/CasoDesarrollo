<?php
/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

require_once '../../recursos/session_helper.php';
require_once '../config/database.php';
require_once 'model/Docente.php';

verificarRol('Docente');

// Instanciamos el Modelo para obtener los datos
$db = new Database();
$docenteModel = new Docente($db->getConnection());
$perfil = $docenteModel->obtenerPerfil($_SESSION['id_usuario_hex']);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Perfil del Docente</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
    <link rel="stylesheet" href="../../css/index.css">
</head>

<body>

    <?php include '../../recursos/headerDocente.php'; ?>

    <main id="seccionContenido" class="container mt-4">
        <div class="row">
            
            <div class="col-md-4 mb-4">
                <div class="card shadow h-100 d-flex flex-column justify-content-center align-items-center p-3">
                    <img src="../../recursos/img/logoDocente.png" 
                        alt="Foto de Perfil" 
                        class="img-fluid rounded-circle shadow-sm" 
                        style="width: 150px; height: 150px; object-fit: cover;">
                    <h5 class="mt-3"><?php echo $perfil['nombres'], " ",  $perfil['apellidos'];; ?></h5>
                </div>
            </div>

            <div class="col-md-8 mb-4">
                <div class="card shadow h-100">
                    <div class="card-header bg-primary text-white">
                        <h5>Información Personal</h5>
                    </div>
                    <div class="card-body">
                        <?php if ($perfil): ?>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>Cédula:</strong> <?php echo $perfil['cedula']; ?></li>
                                <li class="list-group-item"><strong>Teléfono:</strong> <?php echo $perfil['telefono']; ?></li>
                                <li class="list-group-item"><strong>Correo:</strong> <?php echo $perfil['correo_electronico']; ?></li>
                                <li class="list-group-item"><strong>Dirección:</strong> <?php echo $perfil['direccion']; ?></li>
                            </ul>
                        <?php else: ?>
                            <div class="alert alert-danger">No se encontró información.</div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

        </div>

        <div class="row mt-2">
            <div class="col-12 text-center">
                <a href="indexDocente.php" class="btn btn-secondary px-4">Regresar al Dashboard</a>
            </div>
        </div>
    </main>

   <?php include '../../recursos/footer.php'; ?>

   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>