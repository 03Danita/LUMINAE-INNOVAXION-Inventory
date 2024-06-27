<?php
require_once 'conexion.php';

$data = json_decode(file_get_contents("php://input"));

$usuario = $data->Usuario;
$password = $data->password;

$sql = "SELECT * FROM usuarios WHERE Usuario='$usuario' AND password = '$password'";
$result = $conexion->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if (password_verify($password, $row['password'])) {
        echo json_encode(["message" => "Inicio de sesión exitoso"]);
    } else {
        echo json_encode(["message" => "Contraseña incorrecta"]);
    }
} else {
    echo json_encode(["message" => "Usuario no encontrado"]);
}

$conexion->close();
?>
