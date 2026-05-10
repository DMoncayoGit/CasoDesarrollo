<?php
/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/


if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once "../../config/database.php";
require_once "../model/Estudiante.php"; 

class EstudianteController {

    private $db;
    private $estudiante;

    public function __construct() {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->estudiante = new Estudiante($this->db);
    }

    public function obtenerPerfil($id_hex) {
        echo json_encode($this->estudiante->obtenerPerfil($id_hex));
    }

    public function obtenerInfoAcademica($id_hex) {
        echo json_encode($this->estudiante->obtenerInfoAcademica($id_hex));
    }

    public function obtenerHorario($id_hex) {
        echo json_encode($this->estudiante->obtenerHorarioDetallado($id_hex));
    }

    public function obtenerCalificaciones($id_hex) {
        echo json_encode($this->estudiante->obtenerCalificaciones($id_hex));
    }
}


if (isset($_GET['action']) && isset($_SESSION['id_usuario_hex'])) {
    $controller = new EstudianteController();
    $id_hex = $_SESSION['id_usuario_hex'];

    switch ($_GET['action']) {
        case 'obtenerPerfil':
            $controller->obtenerPerfil($id_hex);
            break;
        case 'obtenerInfoAcademica':
            $controller->obtenerInfoAcademica($id_hex);
            break;
        case 'obtenerHorario':
            $controller->obtenerHorario($id_hex);
            break;
        case 'obtenerCalificaciones':
            $controller->obtenerCalificaciones($id_hex);
            break;
        default:
            echo json_encode(["error" => "Acción no válida"]);
            break;
    }
}
?>


