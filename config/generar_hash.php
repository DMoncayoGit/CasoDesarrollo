<!--
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
-->

<?php

// Genera un hash para la contraseña 'hash_admin_2026'
$password = 'hash_admin_2026';
$hash = password_hash($password, PASSWORD_DEFAULT);

$text = "El hash generado para la contraseña 'hash_admin_2026' es: " . $hash . "\n";
echo nl2br($text);

// Genera un hash para la contraseña 'hash_docente_01'
$password1 = 'hash_docente_01';
$hash1 = password_hash($password1, PASSWORD_DEFAULT);

$text1 = "El hash generado para la contraseña 'hash_docente_01' es: " . $hash1 . "\n" ;
echo nl2br($text1);

// Genera un hash para la contraseña 'hash_docente_02'
$password2 = 'hash_docente_02';
$hash2 = password_hash($password2, PASSWORD_DEFAULT);

$text2 = "El hash generado para la contraseña 'hash_docente_02' es: " . $hash2 . "\n" ;
echo nl2br($text2);

// Genera un hash para la contraseña 'hash_estudiante_01'
$password3 = 'hash_estudiante_01';
$hash3 = password_hash($password3, PASSWORD_DEFAULT);

$text3 = "El hash generado para la contraseña 'hash_estudiante_01' es: " . $hash3 . "\n" ;
echo nl2br($text3);

// Genera un hash para la contraseña 'hash_estudiante_02'
$password4 = 'hash_estudiante_02';
$hash4 = password_hash($password4, PASSWORD_DEFAULT);

$text4 = "El hash generado para la contraseña 'hash_estudiante_02' es: " . $hash4 . "\n" ;
echo nl2br($text4);

// Genera un hash para la contraseña 'hash_inactivo_01'
$password5 = 'hash_inactivo_01';
$hash5 = password_hash($password5, PASSWORD_DEFAULT);

$text5 = "El hash generado para la contraseña 'hash_inactivo_01' es: " . $hash5 . "\n" ;
echo nl2br($text5);

// Genera un hash para la contraseña 'hash_inactivo_02'
$password6 = 'hash_inactivo_02';
$hash6 = password_hash($password6, PASSWORD_DEFAULT);

$text6 = "El hash generado para la contraseña 'hash_inactivo_02' es: " . $hash6 . "\n" ;
echo nl2br($text6);