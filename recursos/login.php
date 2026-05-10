<!--
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
-->
 
<?php

session_start();

// Incluir el archivo donde está definida la clase Database
require_once '../crud/config/Database.php';

// Instanciar la clase y obtener la conexión
$database = new Database();
$pdo = $database->getConnection();

// Verificar si la conexión fue exitosa
if (!$pdo) {
    die("No se pudo establecer la conexión a la base de datos.");
}

// Obtener los datos del formulario
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if (!empty($username) && !empty($password)) {
    
// Consulta usando PDO
    $stmt = $pdo->prepare("SELECT id_usuario, password, rol FROM usuario WHERE correo_electronico = ?");
    $stmt->execute([$username]);
    $user_data = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verificar credenciales
    if ($user_data && password_verify($password, $user_data['password'])) {
        // Guardar sesión
        $_SESSION['usuario'] = $username;
        $_SESSION['rol'] = $user_data['rol'];

        $_SESSION['id_usuario_hex'] = bin2hex($user_data['id_usuario']);
        
        // Redirección basada en el rol
        switch ($_SESSION['rol']) {
            case 'Docente':
                header("Location: ../crud/docente/indexDocente.php");
                break;
            case 'Estudiante':
                header("Location: ../crud/estudiante/indexEstudiante.php");
                break;
            default:
                session_destroy();
                echo "Rol no autorizado. <a href='../index.html'>Volver</a>";
                exit();
        }
        exit();
    } else {
        echo "<p>Usuario o contraseña incorrectos. <a href='../index.html'>Intentar de nuevo</a></p>";
    }
} else {
    echo "<p>Campos vacíos. <a href='../index.html'>Volver</a></p>";
}
?>