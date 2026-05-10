<?php
/*
  Caso Práctico Desarrollo
  Nombre: Doménica Moncayo
  Fecha: 03/05/2026
*/

// Subimos un nivel para encontrar la clase padre
require_once __DIR__ . '/../../modeloUsuarioTech.php';

class Estudiante extends UsuarioEduTech {
    
    // Atributos específicos del estudiante
    private $facultad;
    private $periodo;
    private $infoAcademica = [];
    private $calificaciones = [];
    private $horario = [];

    // Constructor de Estudiante
    public function __construct($db) {
        // Inicializamos la conexión en la clase padre UsuarioEduTech
        parent::__construct($db);
        
        // Inicializamos todos los contenedores de datos como arrays vacíos
        $this->infoAcademica = [];
        $this->calificaciones = [];
        $this->horario = [];
    }

    // --- GETTERS Y SETTERS ---

    public function setFacultad($facultad) { $this->facultad = $facultad; }
    public function getFacultad() { return $this->facultad; }

    public function setPeriodo($periodo) { $this->periodo = $periodo; }
    public function getPeriodo() { return $this->periodo; }

    public function setInfoAcademica($data) { $this->infoAcademica = $data; }
    public function getInfoAcademica() { return $this->infoAcademica; }

    public function setCalificaciones($data) { $this->calificaciones = $data; }
    public function getCalificaciones() { return $this->calificaciones; }

    public function setHorario($data) { $this->horario = $data; }
    public function getHorario() { return $this->horario; }

    
    // --- MÉTODOS  ---

    public function obtenerInfoAcademica($id_usuario_bin) {
        $query = "SELECT f.nombre AS facultad, p.nombre_periodo AS periodo
                  FROM universidad_matricula um
                  JOIN universidad_facultad f ON um.id_facultad = f.id_facultad
                  JOIN periodo_academico p ON um.id_periodo = p.id_periodo
                  WHERE um.id_estudiante = UNHEX(?) LIMIT 1";
        
        $stmt = $this->conn->prepare($query);
        $stmt->execute([$id_usuario_bin]);
        
        $this->infoAcademica = $stmt->fetch(PDO::FETCH_ASSOC);
        return $this->infoAcademica;
    }

    public function obtenerHorarioDetallado($id_usuario_bin) {
        $query = "SELECT c.nombre_curso AS materia, h.dia, h.hora, a.codigo_aula AS aula, 
                         up.nombres, up.apellidos
                  FROM universidad_matricula um
                  JOIN universidad_horario uh ON um.id_universidad = uh.id_universidad 
                      AND um.id_facultad = uh.id_facultad 
                      AND um.id_periodo = uh.id_periodo 
                      AND um.id_curso = uh.id_curso
                  JOIN curso c ON um.id_curso = c.id_curso
                  JOIN horario h ON uh.horario = h.codigo_horario
                  JOIN aula a ON uh.id_aula = a.id_aula
                  JOIN usuario_perfil up ON uh.id_docente = up.id_usuario
                  WHERE um.id_estudiante = UNHEX(?) 
                  ORDER BY FIELD(h.dia, 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes'), h.hora";
        
        $stmt = $this->conn->prepare($query);
        $stmt->execute([$id_usuario_bin]);
        
        $this->horario = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $this->horario;
    }

    public function obtenerCalificaciones($id_hex) {
        $query = "SELECT c.nombre_curso, n.nombre AS tipo_nota, uc.valor 
                FROM universidad_calificacion uc
                JOIN curso c ON uc.id_curso = c.id_curso
                JOIN nota n ON uc.nota = n.codigo_nota
                WHERE uc.id_estudiante = UNHEX(:id)";
        
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":id", $id_hex);
        $stmt->execute();
        
        $this->calificaciones = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $this->calificaciones;
    }
}
?>