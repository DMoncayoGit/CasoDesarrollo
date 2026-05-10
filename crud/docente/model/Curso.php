<?php
/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

class Curso {

    // Atributos específicos del Curso
    private $id_curso;
    private $codigo;
    private $nombre_curso;

    // Constructor de Estudiante
    public function __construct($id_curso = null, $codigo = null, $nombre_curso = null) {
        $this->id_curso = $id_curso;
        $this->codigo = $codigo;
        $this->nombre_curso = $nombre_curso;
    }

    // --- GETTERS ---
    public function getIdCurso() { return $this->id_curso; }
    public function getCodigo() { return $this->codigo; }
    public function getNombreCurso() { return $this->nombre_curso; }
}