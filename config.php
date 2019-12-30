<?php
 //koneksi ke database mysql
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pegadaian";
$koneksi = mysqli_connect($servername, $username, $password, $dbname);

//cek jika koneksi ke mysql gagal
if (mysqli_connect_errno()){
        die("Gagal melakukan koneksi ke MySQL:".mysqli_connect_error());
    }
?>