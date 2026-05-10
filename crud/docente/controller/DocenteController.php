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
require_once "../model/Docente.php"; 
require_once "../model/Curso.php"; 

class DocenteController {
    private $modelo;
    private $db;

    public function __construct($conexion) {
        $this->db = $conexion;
        $this->modelo = new Docente($this->db);
    }

    public function obtenerPerfil($id_hex) {
        $perfil = $this->modelo->obtenerPerfil($id_hex);
        echo json_encode($perfil);
    }

    public function consultarMisCursos($id_hex) {
        $id_binario = pack("H*", $id_hex);
        return $this->modelo->obtenerCursosPorDocente($id_binario);
    }

    public function listarCursosDocente($id_hex) {

        $id_bin = hex2bin($id_hex); 

        $cursosObjetos = $this->modelo->obtenerCursosPorDocente($id_bin);

        $data = [];
        if ($cursosObjetos) {
            foreach ($cursosObjetos as $curso) {
                $data[] = [
                    'id_curso'     => $curso->getIdCurso(),
                    'codigo'       => $curso->getCodigo(),
                    'nombre_curso' => $curso->getNombreCurso()
                ];
            }
        }

        echo json_encode($data);
    }
}


if (isset($_GET['action']) && isset($_SESSION['id_usuario_hex'])) {
    
    $database = new Database();
    $db = $database->getConnection();
    
    $controller = new DocenteController($db);
    $id_hex = $_SESSION['id_usuario_hex'];

    switch ($_GET['action']) {
        case 'obtenerPerfil':
            $controller->obtenerPerfil($id_hex);
            break;
        
        case 'listarCursos':
            $controller->listarCursosDocente($id_hex);
            break;
            
        default:
            echo json_encode(["error" => "Acción no válida"]);
            break;
    }
}

?>