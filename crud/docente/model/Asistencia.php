<?php
/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

class Asistencia {
    private $id_universidad;
    private $id_facultad;
    private $id_periodo;
    private $id_estudiante;
    private $id_curso;
    private $asistencia; 

    // Constructor de Estudiante
    public function __construct($id_univ=null, $id_fac=null, $id_per=null, $id_est=null, $id_cur=null, $asis=null) {
        $this->id_universidad = $id_univ;
        $this->id_facultad = $id_fac;
        $this->id_periodo = $id_per;
        $this->id_estudiante = $id_est;
        $this->id_curso = $id_cur;
        $this->asistencia = $asis;
    }

    // --- GETTERS Y SETTERS ---

    public function getIdEstudiante() { return $this->id_estudiante; }
    public function getAsistencia() { return $this->asistencia; }
    public function setAsistencia($asistencia) { $this->asistencia = $asistencia; }

    // --- MÉTODOS  ---

    public static function obtenerPorCurso($db, $id_curso) {
        try {
            $query = "SELECT 
                        ua.id_universidad, 
                        ua.id_facultad, 
                        ua.id_periodo, 
                        HEX(ua.id_estudiante) as id_estudiante_hex, 
                        ua.id_curso, 
                        ua.asistencia,
                        up.nombres, 
                        up.apellidos, 
                        a.nombre as asistencia 
                    FROM universidad_asistencia ua
                    INNER JOIN usuario_perfil up ON ua.id_estudiante = up.id_usuario
                    INNER JOIN asistencia a ON ua.asistencia = a.codigo_asistencia
                    WHERE ua.id_curso = :id_curso";
            
            $stmt = $db->prepare($query);
            $stmt->execute([':id_curso' => $id_curso]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return ["error" => $e->getMessage()];
        }
    }    

    public static function obtenerEstudiantesPorCurso($db, $id_curso) {
        
        $query = "SELECT 
                    HEX(um.id_estudiante) as id_hex, 
                    up.nombres, 
                    up.apellidos 
                FROM universidad_matricula um
                INNER JOIN usuario_perfil up ON um.id_estudiante = up.id_usuario
                WHERE um.id_curso = :id_curso
                ORDER BY up.apellidos, up.nombres ASC";
        
        $stmt = $db->prepare($query);
        $stmt->execute([':id_curso' => $id_curso]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    
}