<?php
include "koneksi.php";

$nomor_nota = $_POST['nomor_nota'];
$nama_pelanggan = $_POST['nama_pelanggan'];
$detail_pesanan = $_POST['detail_pesanan'];
$total_harga = $_POST['total_harga'];
$metode_bayar = $_POST['metode_bayar'];
$staf_id = $_POST['staf_id'];

$sql = "INSERT INTO transaksi (nomor_nota, nama_pelanggan, detail_pesanan, total_harga, metode_bayar, staf_id) 
        VALUES ('$nomor_nota', '$nama_pelanggan', '$detail_pesanan', '$total_harga', '$metode_bayar', '$staf_id')";

if (mysqli_query($conn, $sql)) {
    echo json_encode(array("status" => "success", "message" => "Transaksi berhasil disimpan"));
} else {
    echo json_encode(array("status" => "error", "message" => "Gagal menyimpan transaksi"));
}
?>