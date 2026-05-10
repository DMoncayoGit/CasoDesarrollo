<!--
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
-->
<?php
require_once '../../recursos/session_helper.php';
require_once '../config/database.php';
verificarRol('Estudiante');

$db = new Database();
$pdo = $db->getConnection();
$sql = "SELECT nombres FROM usuario_perfil WHERE id_usuario = UNHEX(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_SESSION['id_usuario_hex']]);
$perfil = $stmt->fetch(PDO::FETCH_ASSOC);
$nombreUsuario = $perfil ? $perfil['nombres'] : $_SESSION['usuario'];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Estudiante</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
    <link rel="stylesheet" href="../../css/index.css">


</head>
<body>

    <?php include '../../recursos/headerEstudiante.php'; ?>

    <main class="main-content container " id="mainContent">
        
        <div id="menuDashboard">
            
            <div class="info-header text-center mb-5">
                <img src="../../recursos/img/logoEdutech.png" alt="Logo Edutech" class="img-fluid mb-3" style="max-height: 150px; max-width: 150px;">
                <h2>Bienvenido/a <?php echo htmlspecialchars($nombreUsuario); ?> al Portal Estudiantil</h2>
            </div>

            <div class="row text-center">
                <div class="col-md-4 mb-4">
                    <div class="card shadow p-4">
                        <h4>Horario</h4>
                        <p>Consulta tu horario de clases.</p>
                        <button class="btn btn-primary mt-3" onclick="cargarModulo('horario')">Ir al Horario</button>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card shadow p-4">
                        <h4>Calificaciones</h4>
                        <p>Revisa tus Calificaciones actuales.</p>
                        <button class="btn btn-primary mt-3" onclick="cargarModulo('calificaciones')">Ver Calificaciones</button>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card shadow p-4">
                        <h4>Mi Perfil</h4>
                        <p>Mira tus datos personales.</p>
                        <button class="btn btn-primary mt-3" onclick="cargarModulo('perfil')">Ir al Perfil</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="contenedorDinamico"></div>

    </main>

    <?php include '../../recursos/footer.php'; ?>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <script src="js/scriptEstudiante.js"></script>

</body>
</html>