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
		table {
			text-align: center;
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
					<li class="nav-item active"><a class="nav-link" href="#home">Home</a></li>
					<li class="nav-item "><a class="nav-link" href="Angsuran.php">Angsuran</a></li>
					<li class="nav-item "><a class="nav-link" href="Barang.php">Barang</a></li>
					<li class="nav-item "><a class="nav-link" href="Customer.php">Customer</a></li>
					<li class="nav-item "><a class="nav-link" href="Pinjaman.php">Pinjaman</a></li>
					<li class="nav-item "><a class="nav-link" href="Pelunasan.php">Pelunasan</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Log</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="log/Log_History.php">Log History</a>
							<a class="dropdown-item" href="log/Log_Pegadaian.php">Log Pegadaian</a>
							<a class="dropdown-item" href="log/Log_Pinjaman.php">Log Pinjaman</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- carousel -->
	<div id="demo" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="http://localhost/basdat/img/slider-default.jpg" alt="Pegadaian mengatasi masalah tanpa masalah" width="1100" height="500">
				<div class="carousel-caption">
					<h3>Pegadaian</h3>
					<p>Mengatasi Masalah tanpa Masalah</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="http://localhost/basdat/img/gadaiaja.jpg" alt="Gadai Apa Saja" width="1100" height="500">
			</div>
			<div class="carousel-item">
				<img src="http://localhost/basdat/img/emas.jpg" alt="Emas" width="1100" height="500">
				<div class="carousel-caption">
					<h3 class="text-dark">Pegadaian Emas</h3>
					<p class="text-dark">Pilihan Tepat Untuk Investasi Abadi</p>
				</div>
			</div>
		</div>
		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	
	<div class="container" style="margin-top:20px">
		<h2>Biaya Administrasi</h2>
		<hr>
		<table class="table table-striped table-hover table-sm table-bordered">
			<thead class="thead-light">
				<tr>
					<th colspan="2" align="center">Pinjaman</th>
					<th>Biaya</th>
				</tr>
				<tr>
					<th width="50">Mulai Dari</th>
					<th width="50">Sampai Dengan</th>
					<th width="20">Administrasi</th>
				</tr>
			</thead>
			<tbody>
						<tr>
							<td>Rp 50.000</td>
							<td>Rp 500.000</td>
							<td>Rp 2.000</td>
						</tr>
						<tr>
							<td>Rp 500.000</td>
							<td>Rp 1.000.000</td>
							<td>Rp 10.000</td>
						</tr>
						<tr>
							<td>Rp 1.000.000</td>
							<td>Rp 2.500.000</td>
							<td>Rp 20.000</td>
						</tr>
						<tr>
							<td>Rp 2.500.000</td>
							<td>Rp 5.000.000</td>
							<td>Rp 35.000</td>
						</tr>
						<tr>
							<td>Rp 5.000.000</td>
							<td>Rp 10.000.000</td>
							<td>Rp 50.000</td>
						</tr>
						<tr>
							<td>Rp 10.000.000</td>
							<td>Rp 15.000.000</td>
							<td>Rp 75.000</td>
						</tr>
						<tr>
							<td>Rp 15.000.000</td>
							<td>Rp 20.000.000</td>
							<td>Rp 100.000</td>
						</tr>
						<tr>
							<td>Rp 20.000.000</td>
							<td>></td>
							<td>Rp 125.000</td>
						</tr>
</tbody>
</table>


	</div>
	<footer>
		<div class="container">
				<div class="row margin-bottom-40 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
			<div class="col-xl-8 col-lg-4 col-md-12 col-sm-12 col-12" style="font-weight: bold;">
				<h4 class="margin-bottom-10 h-green">HUBUNGI <span>KAMI</span></h4> 
				<div class="alamat">
					<i class="fa fa-map-marker" style="margin: 12px 0 0 0;"></i>
					<div style="margin-left: 30px;"><p>Tempat Bimbel: Rumah Afita, Jl. Swadaya Ujung No.114 rt.009 rw.017 Kemanggisan, Jakarta Barat <br>10430 INDONESIA</p></div>
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