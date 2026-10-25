<?php
header('Content-Type: application/json');
include 'koneksi.php';

$sql = "SELECT nama_menu FROM menu";
$result = $conn->query($sql);
$menu = array();

while($row = $result->fetch_assoc()) {
    $menu[] = $row['nama_menu'];
}

echo json_encode(["status" => "success", "data_menu" => $menu]);
?>