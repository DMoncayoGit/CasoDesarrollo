<?php
/*
  Caso Práctico Desarrollo
  Nombre: Doménica Moncayo
  Fecha: 03/05/2026
  Ubicación: /docente/Docente.php
*/

// Subimos un nivel para encontrar la clase padre
require_once __DIR__ . '/../../modeloUsuarioTech.php';
require 'Curso.php';


class Docente extends UsuarioEduTech {

    // Atributos específicos del Docente
    private $facultad;
    private $periodo;
    private $cursos = [];

    // Constructor de Docente
    public function __construct($db) {
        parent::__construct($db);
        $this->cursos = [];
    }

    // --- GETTERS Y SETTERS ---
    public function setFacultad($facultad) { $this->facultad = $facultad; }
    public function getFacultad() { return $this->facultad; }
    public function setPeriodo($periodo) { $this->periodo = $periodo; }
    public function getPeriodo() { return $this->periodo; }

    // --- MÉTODOS  ---

    public function obtenerCursosPorDocente($id_docente_bin) {
        $stmt = $this->conn->prepare("
            SELECT c.id_curso, c.codigo, c.nombre_curso 
            FROM universidad_horario uh
            INNER JOIN curso c ON uh.id_curso = c.id_curso
            WHERE uh.id_docente = :id_docente
        ");
        
        $stmt->execute(['id_docente' => $id_docente_bin]);
        
        $this->cursos = []; 
        
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            
            $this->cursos[] = new Curso(
                $row['id_curso'], 
                $row['codigo'], 
                $row['nombre_curso']
            );
        }
        
        return $this->cursos;
    }

    public function getCursos() {
        return $this->cursos;
    }
}
?>