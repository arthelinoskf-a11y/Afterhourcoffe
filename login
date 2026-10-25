<?php
header('Content-Type: application/json');
include 'koneksi.php';

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

$sql = "SELECT * FROM staf WHERE username = '$username' AND password = '$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode([
        "status" => "success",
        "staf_id" => $row['staf_id'],
        "nama_staf" => $row['nama_staf']
    ]);
} else {
    echo json_encode([
        "status" => "failed",
        "message" => "Username atau Password salah!"
    ]);
}
?>