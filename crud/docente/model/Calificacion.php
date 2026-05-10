<?php
/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

class Calificacion {
    private $id_universidad;
    private $id_facultad;
    private $id_periodo;
    private $id_estudiante;
    private $id_curso;
    private $nota; 
    private $valor;

    // Constructor de Estudiante
    public function __construct($id_univ=null, $id_fac=null, $id_per=null, $id_est=null, $id_cur=null, $nota=null, $valor=null) {
        $this->id_universidad = $id_univ;
        $this->id_facultad = $id_fac;
        $this->id_periodo = $id_per;
        $this->id_estudiante = $id_est;
        $this->id_curso = $id_cur;
        $this->nota = $nota;
        $this->valor = $valor;
    }

    // --- MÉTODOS  ---

    public static function obtenerPorCurso($db, $id_curso) {
        try {
            $query = "SELECT 
                        uc.id_universidad, 
                        uc.id_facultad, 
                        uc.id_periodo, 
                        HEX(uc.id_estudiante) as id_estudiante_hex, 
                        uc.id_curso, 
                        uc.valor,
                        up.nombres, 
                        up.apellidos, 
                        n.nombre as tipo_nota 
                    FROM universidad_calificacion uc
                    INNER JOIN usuario_perfil up ON uc.id_estudiante = up.id_usuario
                    INNER JOIN nota n ON uc.nota = n.codigo_nota
                    WHERE uc.id_curso = :id_curso";
            
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