<?php
	//memasukkan file config.php
	include('config.php');
?>

<!DOCTYPE html>
<html>
<head>
	<title>Pegadaian | Mengatasi masalah tanpa masalah</title>
	<link rel="stylesheet" href="http://localhost/basdat/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/ico" href="http://localhost/basdat/favicon.ico">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="http://localhost/basdat/js/bootstrap.min.js"></script>
	<style type="text/css">
		.navbar-brand {
			margin: 0 5px 0;
			padding: 0 10px 0;
			text-decoration: none;
			font-size: 20px;
			color: black;
		}
		.img-fluid {
			max-width: 200px;
			height: auto;
		}
		.carousel-inner img {
			width: 100%;
			height: 65%;
			right: unset;
			bottom: 0;
			left: unset;
			top: unset;
			text-align: left;
		}
		footer {
			background: #f8f8f8;
			padding: 40px 0px 5px 0px;
			margin: 0px;
		}
		p {
			font-family: 'Hind Vadodara', sans-serif;
			font-size: 16px;
			font-weight: 400;
			line-height: 22px;
			color: #707070;
			letter-spacing: -0.030em;
		}
		.title-footer-label h4 {
			letter-spacing: 2px;
			font-weight: normal!important;
		}
		.title-footer-label h4 {
			letter-spacing: 2px;
			font-weight: normal!important;
		}
		element.style {
		}
		.h-green span {
			color: green;
		}
		.h-green span {
			color: green;
		}
		footer h4 span {
		    color: #00ab4e;
		}
		.copyright center {
			font-size: 14px;
			font-family: "Hind Vadodara", sans-serif;
			letter-spacing: 0.2px;
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="Home.php">
				<img src="http://localhost/basdat/pegadaian-logo.png" class="img-fluid" alt="logo pegadaian">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="Home.php">Home</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link active dropdown" href="#" id="navbardrop" data-toggle="dropdown">Angsuran</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="tambah/Angsuran.php">Tambah Data</a>
						</div>
					</li>
					<li class="nav-item "><a class="nav-link" href="Barang.php">Barang</a></li>
					<li class="nav-item "><a class="nav-link" href="Customer.php">Customer</a></li>
					<li class="nav-item "><a class="nav-link" href="Pinjaman.php">Pinjaman</a></li>
					<li class="nav-item "><a class="nav-link" href="Pelunasan.php">Pelunasan</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Log</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="log/Log_History.php">Log History</a>
							<a class="dropdown-item" href="log/Log_Pegadaian.php">Log Pegadaian</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top:20px">
		<h2>Data Angsuran</h2>
		
		<hr>
		
		<table class="table table-striped table-hover table-sm table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>NO.</th>
					<th>ID Angsuran</th>
					<th>ID Pinjaman</th>
					<th>Tgl Angsuran</th>
					<th>AKSI</th>
				</tr>
			</thead>
			<tbody>
				<?php
				//query ke database SELECT tabel Customer urut berdasarkan id yang paling besar
				$sql = mysqli_query($koneksi, "SELECT * FROM angsuran ORDER BY id_angsuran ASC") or die(mysqli_error($koneksi));
				//jika query diatas menghasilkan nilai > 0 maka menjalankan script di bawah if...
				if(mysqli_num_rows($sql) > 0){
					//membuat variabel $no untuk menyimpan nomor urut
					$no = 1;
					//melakukan perulangan while dengan dari dari query $sql
					while($data = mysqli_fetch_array($sql)){
						//menampilkan data perulangan
						echo '
						<tr>
							<td>'.$no.'</td>
							<td>'.$data['id_angsuran'].'</td>
							<td>'.$data['id_pinjam'].'</td>
							<td>'.$data['tgl_angsuran'].'</td>
							<td>
								<a href="edit/Angsuran.php?id='.$data['id_angsuran'].'" class="badge badge-warning">
								Edit
								</a>
								<a href="hapus/Angsuran.php?id='.$data['id_angsuran'].'" class="badge badge-danger" onclick="return confirm(\'Yakin ingin menghapus data ini?\')">
								Delete
								</a>
							</td>
						</tr>
						';
						$no++;
					}
				//jika query menghasilkan nilai 0
				}else{
					echo '
					<tr>
						<td colspan="6">Tidak ada data.</td>
					</tr>
					';
				}
				?>
			<tbody>
		</table>
	<footer>
		<div class="container">
			<div class="row margin-bottom-40 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
				<div class="col-xl-8 col-lg-4 col-md-12 col-sm-12 col-12" style="font-weight: bold;">
					<h4 class="margin-bottom-10 h-green">HUBUNGI <span>KAMI</span></h4> 
					<div class="alamat">
						<i class="fa fa-map-marker" style="margin: 12px 0 0 0;"></i>
						<div style="margin-left: 30px;"><p>Tempat Bimbel: Rumah Afita, Jl. Swadaya Ujung RT.009/RW.017 No.114, Kemanggisan, Jakarta Barat <br>11480 INDONESIA</p></div>
					</div>		
				</div>
			</div>
			<hr>
			<div class="copyright">
				<p>
					<center>Copyright © 2019 Hadi Abdurrahman. All Rights Reserved. </center>
				</p>
			</div>
		</div>
	</footer>
</body>
</html>