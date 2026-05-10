<!--
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
-->

<?php
session_start();   // Iniciar la sesión
session_destroy(); // Destruir la sesión
header("Location: ../index.html"); // Redirigir al formulario de inicio de sesión
exit();
?>
