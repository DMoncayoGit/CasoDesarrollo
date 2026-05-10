<?php

// Iniciar sesión si no está iniciada
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Función para verificar si el usuario tiene permiso (rol)
function verificarRol($rolRequerido) {
    if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== $rolRequerido) {
        header("Location: ../index.html");
        exit();
    }
}

// Función para obtener el ID en formato legible para SQL
function getUserIdForSQL() {
    return $_SESSION['id_usuario_hex'] ?? null;
}
?>