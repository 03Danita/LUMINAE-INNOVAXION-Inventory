<?php
require_once 'conexion.php';

$data = json_decode(file_get_contents("php://input"));

$usuario = $data->Usuario;
$nombre = $data->Nombre;
$email = $data->Email;
$password = password_hash($data->password, PASSWORD_DEFAULT);

$sql = "INSERT INTO usuarios (Usuario, Nombre, Email, password) VALUES ('$usuario', '$nombre', '$email', '$password')";
$result = $conexion->query($sql);

if ($result) {
    echo json_encode(["message" => "Registro exitoso"]);
} else {
    echo json_encode(["message" => "Error al registrar usuario"]);
}

$conexion->close();
?>