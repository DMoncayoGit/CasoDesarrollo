<?php
/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json');

require_once "../../config/database.php";
require_once "../model/Asistencia.php"; 


$database = new Database();
$db = $database->getConnection();
$action = $_GET['action'] ?? '';

switch ($action) {
    case 'listar':
        $id_curso = $_GET['id_curso'] ?? '';
        echo json_encode(Asistencia::obtenerPorCurso($db, $id_curso));
        break;

    case 'listarTodos':
        $id_curso = $_GET['id_curso'] ?? '';
        echo json_encode(Asistencia::obtenerEstudiantesPorCurso($db, $id_curso));
        break;

}