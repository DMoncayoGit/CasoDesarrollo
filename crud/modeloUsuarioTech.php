<?php
/*
  Caso Práctico Desarrollo
  Nombre: Doménica Moncayo
  Fecha: 03/05/2026
*/

class UsuarioEduTech {

    // Atributos del UsuarioTech
    protected $conn;
    protected $id_usuario;
    protected $nombre;

    public function __construct($db) {
        $this->conn = $db;
    }

    // --- GETTERS Y SETTERS COMUNES ---

    public function setIdUsuario($id) { $this->id_usuario = $id;  }
    
    public function getIdUsuario() { return $this->id_usuario; }

    public function setNombre($nombre) { $this->nombre = $nombre; }
    
    public function getNombre() { return $this->nombre; }

    // --- MÉTODOS ---

    public function obtenerPerfil($id_hex) {
        $query = "SELECT p.nombres, p.apellidos, p.cedula, p.telefono, p.direccion, u.correo_electronico 
                  FROM usuario_perfil p
                  JOIN usuario u ON p.id_usuario = u.id_usuario
                  WHERE p.id_usuario = UNHEX(:id)";
        
        try {
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(":id", $id_hex);
            $stmt->execute();
            
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Error en obtenerPerfil: " . $e->getMessage());
            return false;
        }
    }

    public function estaConectado() {
        return $this->conn !== null;
    }
}
?>